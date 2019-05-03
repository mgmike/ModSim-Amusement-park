import org.omnetpp.queueing.Dot;
import org.omnetpp.queueing.My_passive_queue;
import org.omnetpp.queueing.PassiveQueue;
import org.omnetpp.queueing.Queue;
import org.omnetpp.queueing.RideQueue;
import org.omnetpp.queueing.Router;
import org.omnetpp.queueing.Server;
import org.omnetpp.queueing.Sink;
import org.omnetpp.queueing.Source;


network AmusementNetwork
{
    @display("bgb=1015,415");
    submodules:
        Source: Source {
            @display("p=38,199");
        }
        TicketQueue: PassiveQueue {
            @display("p=107,199");
        }
        TicketBooth1: Server {
            @display("p=205,94");
        }
        TicketBooth2: Server {
            @display("p=205,160");
        }
        TicketBooth3: Server {
            @display("p=205,226");
        }
        TicketBooth4: Server {
            @display("p=205,291");
        }
        SecurityQueue: PassiveQueue {
            @display("p=299,199");
        }
        SecurityBooth1: Server {
            @display("p=399,94");
        }
        SecurityBooth2: Server {
            @display("p=399,160");
        }
        SecurityBooth3: Server {
            @display("p=399,226");
        }
        SecurityBooth4: Server {
            @display("p=399,291");
        }
        WalkingDelay: Queue {
            @display("p=504,199");
        }
        RideSelect: Router {
            @display("p=585,199");
        }
        Router: Router {
            @display("p=869,199");
        }
        Ride3Queue: Queue {
            @display("p=703,199");
        }
        Ride2Queue: Queue {
            @display("p=703,133");
        }
        Ride1Queue: Queue {
            @display("p=703,67");
        }
        Ride4Queue: Queue {
            @display("p=703,265");
        }
        Ride5Queue: Queue {
            @display("p=703,337");
        }
        Sink: Sink {
            @display("p=945,199");
        }
        Node4: Dot {
            @display("p=869,393");
        }
        Node3: Dot {
            @display("p=585,393");
        }
        Ride1: RideQueue {
            @display("p=784,67");
        }
        Ride2: RideQueue {
            @display("p=784,133");
        }
        Ride3: RideQueue {
            @display("p=784,199");
        }
        Ride4: RideQueue {
            @display("p=784,265");
        }
        Ride5: RideQueue {
            @display("p=784,337");
        }
        Node2: Dot {
            @display("p=869,23");
        }
        Node1: Dot {
            @display("p=585,23");
        }
    connections:
        Source.out --> TicketQueue.in++;
        TicketQueue.out++ --> TicketBooth1.in++;
        TicketQueue.out++ --> TicketBooth2.in++;
        TicketQueue.out++ --> TicketBooth3.in++;
        TicketQueue.out++ --> TicketBooth4.in++;
        TicketBooth4.out --> SecurityQueue.in++;
        TicketBooth3.out --> SecurityQueue.in++;
        TicketBooth2.out --> SecurityQueue.in++;
        TicketBooth1.out --> SecurityQueue.in++;
        SecurityQueue.out++ --> SecurityBooth1.in++;
        SecurityQueue.out++ --> SecurityBooth2.in++;
        SecurityQueue.out++ --> SecurityBooth3.in++;
        SecurityQueue.out++ --> SecurityBooth4.in++;
        SecurityBooth1.out --> WalkingDelay.in++;
        SecurityBooth2.out --> WalkingDelay.in++;
        SecurityBooth3.out --> WalkingDelay.in++;
        SecurityBooth4.out --> WalkingDelay.in++;
        WalkingDelay.out --> RideSelect.in++;
        RideSelect.out++ --> Ride1Queue.in++;
        RideSelect.out++ --> Ride2Queue.in++;
        RideSelect.out++ --> Ride3Queue.in++;
        RideSelect.out++ --> Ride4Queue.in++;
        RideSelect.out++ --> Ride5Queue.in++;
        Router.out++ --> Node4.in;
        Node4.out --> Node3.in;
        Router.out++ --> Sink.in++;
        Ride1Queue.out --> Ride1.in++;
        Ride1.out --> Router.in++;
        Ride2Queue.out --> Ride2.in++;
        Ride2.out --> Router.in++;
        Ride3Queue.out --> Ride3.in++;
        Ride3.out --> Router.in++;
        Ride4Queue.out --> Ride4.in++;
        Ride4.out --> Router.in++;
        Ride5Queue.out --> Ride5.in++;
        Ride5.out --> Router.in++;
        Router.out++ --> Node2.in;
        Node2.out --> Node1.in;
        Node1.out --> RideSelect.in++;
        Node3.out --> Ride3Queue.in++;
        Router.out++ --> Ride4Queue.in++;
        Router.out++ --> Ride2Queue.in++;
        Router.out++ --> Ride1Queue.in++;
        Router.out++ --> Ride5Queue.in++;
}
