#ifndef __QUEUEINGLIB_RIDEQUEUE_H_
#define __QUEUEINGLIB_RIDEQUEUE_H_

#include <omnetpp.h>
#include "QueueingDefs.h"

using namespace omnetpp;

namespace queueing {

class Job;

class QUEUEING_API RideQueue : public cSimpleModule
{
    private:
        simsignal_t droppedSignal;
        simsignal_t queueLengthSignal;
        simsignal_t queueingTimeSignal;
        simsignal_t busySignal;

        Job *jobServiced;
        cMessage *endServiceMsg;
        cQueue queue;
        int capacity;
        bool fifo;
        bool occupied;
        Job *getFromQueue();

    public:
        RideQueue();
        virtual ~RideQueue();
        int length();

    protected:
        virtual void initialize() override;
        virtual void handleMessage(cMessage *msg) override;
        virtual void refreshDisplay() const override;
        virtual void finish() override;
        virtual void arrival(Job *job);
        virtual simtime_t startService(Job *job);
        virtual void endService(Job *job);
};

}; //namespace

#endif
