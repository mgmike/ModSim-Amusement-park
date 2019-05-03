import org.omnetpp.queueing.Allocate;
import org.omnetpp.queueing.Classifier;
import org.omnetpp.queueing.Dot;
import org.omnetpp.queueing.PassiveQueue;
import org.omnetpp.queueing.Queue;
import org.omnetpp.queueing.RideQueue;
import org.omnetpp.queueing.Router;
import org.omnetpp.queueing.Server;
import org.omnetpp.queueing.Sink;
import org.omnetpp.queueing.Source;


network ParkNetworkAlt
{
    @display("bgb=1255.0913,577.15875");
    submodules:
        Source: Source {
            @display("p=44.4975,249.97125");
        }
        TicketBooth1: Server {
            @display("p=263.05875,150.50626");
        }
        TicketBooth2: Server {
            @display("p=263.05875,341.58377");
        }
        Security1: Server {
            @display("p=479.0025,150.50626");
        }
        Security2: Server {
            @display("p=479.0025,341.58377");
        }
        RideQ1: Queue {
            @display("p=808.8075,88.995");
        }
        RideQ2: Queue {
            @display("p=808.8075,167.52");
        }
        RideQ3: Queue {
            @display("p=808.8075,249.97125");
        }
        RideQ4: Queue {
            @display("p=808.8075,332.42252");
        }
        RideQ5: Queue {
            @display("p=808.8075,421.4175");
        }
        TicketQueue: PassiveQueue {
            @display("p=151.815,249.97125");
        }
        WalkingDelay: Queue {
            @display("p=587.6288,249.97125");
        }
        RideSelect: Router {
            @display("p=697.5638,249.97125");
        }
        Ride1: RideQueue {
            @display("p=893.8763,88.995");
        }
        Ride2: RideQueue {
            @display("p=893.8763,167.52");
        }
        Ride3: RideQueue {
            @display("p=893.8763,249.97125");
        }
        Ride4: RideQueue {
            @display("p=893.8763,332.42252");
        }
        Ride5: RideQueue {
            @display("p=893.8763,421.4175");
        }
        Router: Router {
            @display("p=992.03253,249.97125");
        }
        Sink: Sink {
            @display("p=1104.585,249.97125");
        }
        Node1: Dot {
            @display("p=696.255,40.57125");
        }
        Node2: Dot {
            @display("p=990.72375,40.57125");
        }
        Node3: Dot {
            @display("p=696.255,505.17752");
        }
        Node4: Dot {
            @display("p=990.72375,505.17752");
        }
        SecurityQ1: PassiveQueue {
            @display("p=376.12628,149.50626");
        }
        SecurityQ2: PassiveQueue {
            @display("p=376.12628,341.50375");
        }
    connections:
        Source.out --> TicketQueue.in++;
        TicketQueue.out++ --> TicketBooth1.in++;
        TicketQueue.out++ --> TicketBooth2.in++;
        Security1.out --> WalkingDelay.in++;
        Security2.out --> WalkingDelay.in++;
        WalkingDelay.out --> RideSelect.in++;
        RideSelect.out++ --> RideQ1.in++;
        RideSelect.out++ --> RideQ2.in++;
        RideSelect.out++ --> RideQ3.in++;
        RideSelect.out++ --> RideQ4.in++;
        RideSelect.out++ --> RideQ5.in++;
        RideQ1.out --> Ride1.in++;
        Ride1.out --> Router.in++;
        Router.out++ --> Sink.in++;
        Router.out++ --> RideQ1.in++;
        RideQ2.out --> Ride2.in++;
        Ride2.out --> Router.in++;
        Router.out++ --> RideQ2.in++;
        Router.out++ --> RideQ4.in++;
        RideQ4.out --> Ride4.in++;
        Ride4.out --> Router.in++;
        RideQ3.out --> Ride3.in++;
        Ride3.out --> Router.in++;
        RideQ5.out --> Ride5.in++;
        Ride5.out --> Router.in++;
        Router.out++ --> RideQ5.in++;
        Router.out++ --> Node2.in;
        Node2.out --> Node1.in;
        Node1.out --> RideSelect.in++;
        Router.out++ --> Node4.in;
        Node4.out --> Node3.in;
        Node3.out --> RideQ3.in++;
        TicketBooth2.out --> SecurityQ2.in++;
        SecurityQ2.out++ --> Security2.in++;
        TicketBooth1.out --> SecurityQ1.in++;
        SecurityQ1.out++ --> Security1.in++;
}
