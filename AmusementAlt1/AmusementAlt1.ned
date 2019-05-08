import org.omnetpp.queueing.Dot;
import org.omnetpp.queueing.PassiveQueue;
import org.omnetpp.queueing.Queue;
import org.omnetpp.queueing.RideQueue;
import org.omnetpp.queueing.Router;
import org.omnetpp.queueing.Server;
import org.omnetpp.queueing.Sink;
import org.omnetpp.queueing.Source;


network AmusementAlt1
{
    @display("bgb=600.02997,424.5975");
    submodules:
        Source: Source {
            @display("p=38,199");
        }
        TicketQueue: PassiveQueue {
            @display("p=107,199");
        }
        TicketBooth2: Server {
            @display("p=205,160");
        }
        TicketBooth3: Server {
            @display("p=205,226");
        }
        SecurityQueue1: PassiveQueue {
            @display("p=298,160");
        }
        SecurityBooth2: Server {
            @display("p=399,160");
        }
        SecurityBooth3: Server {
            @display("p=399,226");
        }
        EnterPark: Sink {
            @display("p=526.2975,198.315");
        }
        SecurityQueue2: PassiveQueue {
            @display("p=298,226");
        }
    connections:
        Source.out --> TicketQueue.in++;
        TicketQueue.out++ --> TicketBooth2.in++;
        TicketQueue.out++ --> TicketBooth3.in++;
        TicketBooth2.out --> SecurityQueue1.in++;
        SecurityQueue1.out++ --> SecurityBooth2.in++;
        SecurityBooth2.out --> EnterPark.in++;
        SecurityBooth3.out --> EnterPark.in++;
        TicketBooth3.out --> SecurityQueue2.in++;
        SecurityQueue2.out++ --> SecurityBooth3.in++;
}
