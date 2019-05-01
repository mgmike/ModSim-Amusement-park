//
// This file is part of an OMNeT++/OMNEST simulation example.
//
// Copyright (C) 2006-2015 OpenSim Ltd.
//
// This file is distributed WITHOUT ANY WARRANTY. See the file
// `license' for details on this and other legal matters.
//

#include "MyQueue.h"
#include "Job.h"

namespace queueing {

Define_Module(MyQueue);

MyQueue::MyQueue()
{
    jobServiced = nullptr;
    endServiceMsg = nullptr;
}

MyQueue::~MyQueue()
{
    delete jobServiced;
    cancelAndDelete(endServiceMsg);
}

void MyQueue::initialize()
{
    droppedSignal = registerSignal("dropped");
    queueingTimeSignal = registerSignal("queueingTime");
    queueLengthSignal = registerSignal("queueLength");
    emit(queueLengthSignal, 0);
    busySignal = registerSignal("busy");
    emit(busySignal, false);

    endServiceMsg = new cMessage("end-service");
    fifo = par("fifo");
    capacity = par("capacity");
    occupied = false;
    scheduleAt(simTime()+par("serviceTime").doubleValue(), endServiceMsg);
}

void MyQueue::handleMessage(cMessage *msg)
{
    if (msg == endServiceMsg) {
        if(occupied){
            endService(jobServiced);
        }
        if (queue.isEmpty()) {
            jobServiced = nullptr;
            emit(busySignal, false);
            //add another boolean variable to say that the server will
            //still be busy for the service time but not processing a job
            occupied = false;
            scheduleAt(simTime()+par("serviceTime").doubleValue(),endServiceMsg);
            //service time - server will be blocked for the next service time
            EV<<"Queue was empty, server starting an empty service time";
        }


        else {//if queue is not empty, gets the next message from the queu
            jobServiced = getFromQueue();
            occupied = true;
            emit(queueLengthSignal, length());
            EV<<"Next message from the queue is processed:";
            simtime_t serviceTime = startService(jobServiced);
            scheduleAt(simTime()+serviceTime, endServiceMsg);
        }
    }
    else {//new job arriving at queue
        Job *job = check_and_cast<Job *>(msg);
        arrival(job);
        // check for container capacity
        if (capacity >= 0 && queue.getLength() >= capacity) {
            EV << "Capacity full! Job dropped.\n";
            if (hasGUI())
                bubble("Dropped!");
            emit(droppedSignal, 1);
            delete job;
            return;
        }
        queue.insert(job);
        emit(queueLengthSignal, length());
        job->setQueueCount(job->getQueueCount() + 1);
    }
}

void MyQueue::refreshDisplay() const
{
    getDisplayString().setTagArg("i2", 0, jobServiced ? "status/execute" : "");
    getDisplayString().setTagArg("i", 1, queue.isEmpty() ? "" : "cyan");
}

Job *MyQueue::getFromQueue()
{
    Job *job;
    if (fifo) {
        job = (Job *)queue.pop();
    }
    else {
        job = (Job *)queue.back();
        // FIXME this may have bad performance as remove uses linear search
        queue.remove(job);
    }
    return job;
}

int MyQueue::length()
{
    return queue.getLength();
}

void MyQueue::arrival(Job *job)
{
    job->setTimestamp();
}

simtime_t MyQueue::startService(Job *job)
{
    // gather queueing time statistics
    simtime_t d = simTime() - job->getTimestamp();
    emit(queueingTimeSignal, d);
    job->setTotalQueueingTime(job->getTotalQueueingTime() + d);
    EV << "Starting service of " << job->getName() << endl;
    job->setTimestamp();
    return par("serviceTime").doubleValue();
}

void MyQueue::endService(Job *job)
{
    EV << "Finishing service of " << job->getName() << endl;
    simtime_t d = simTime() - job->getTimestamp();
    job->setTotalServiceTime(job->getTotalServiceTime() + d);
    send(job, "out");
}

void MyQueue::finish()
{
}

}; //namespace

