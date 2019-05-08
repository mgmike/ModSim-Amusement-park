import org.omnetpp.queueing.Dot;
import org.omnetpp.queueing.Fork;
import org.omnetpp.queueing.PassiveQueue;
import org.omnetpp.queueing.Queue;
import org.omnetpp.queueing.RideQueue;
import org.omnetpp.queueing.Router;
import org.omnetpp.queueing.Server;
import org.omnetpp.queueing.Sink;
import org.omnetpp.queueing.Source;


network AmusementAlt2
{
    @display("bgb=600.02997,424.5975");
    submodules:
        Source: Source {
            @display("p=38,199");
        }
        TicketQueue1: PassiveQueue {
            @display("p=107,133");
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
        SecurityQueue1: PassiveQueue {
            @display("p=299,160");
        }
        SecurityBooth1: Server {
            @display("p=399,160");
        }
        SecurityBooth2: Server {
            @display("p=399,226");
        }
        EnterPark: Sink {
            @display("p=526.2975,198.315");
        }
        TicketQueue2: PassiveQueue {
            @display("p=107,252");
        }
        SecurityQueue2: PassiveQueue {
            @display("p=299,226");
        }
        Router: Router {
            @display("p=94,199");
        }
    connections:
        TicketQueue1.out++ --> TicketBooth1.in++;
        TicketQueue1.out++ --> TicketBooth2.in++;
        TicketBooth2.out --> SecurityQueue1.in++;
        TicketBooth1.out --> SecurityQueue1.in++;
        SecurityQueue1.out++ --> SecurityBooth1.in++;
        SecurityBooth1.out --> EnterPark.in++;
        SecurityBooth2.out --> EnterPark.in++;
        TicketQueue2.out++ --> TicketBooth3.in++;
        TicketQueue2.out++ --> TicketBooth4.in++;
        TicketBooth3.out --> SecurityQueue2.in++;
        TicketBooth4.out --> SecurityQueue2.in++;
        SecurityQueue2.out++ --> SecurityBooth2.in++;
        Source.out --> Router.in++;
        Router.out++ --> TicketQueue1.in++;
        Router.out++ --> TicketQueue2.in++;
}
