import org.omnetpp.queueing.Dot;
import org.omnetpp.queueing.Fork;
import org.omnetpp.queueing.PassiveQueue;
import org.omnetpp.queueing.Queue;
import org.omnetpp.queueing.RideQueue;
import org.omnetpp.queueing.Router;
import org.omnetpp.queueing.Server;
import org.omnetpp.queueing.Sink;
import org.omnetpp.queueing.Source;


network AmusementAlt4
{
    @display("bgb=600.02997,424.5975");
    submodules:
        Source: Source {
            @display("p=38,199");
        }
        TicketQueue1: PassiveQueue {
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
        SecurityQueue1: PassiveQueue {
            @display("p=300,198");
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
        SecurityBooth1: Server {
            @display("p=399,94");
        }
        SecurityBooth4: Server {
            @display("p=399,291");
        }
    connections:
        TicketQueue1.out++ --> TicketBooth1.in++;
        TicketQueue1.out++ --> TicketBooth2.in++;
        TicketBooth2.out --> SecurityQueue1.in++;
        TicketBooth1.out --> SecurityQueue1.in++;
        SecurityQueue1.out++ --> SecurityBooth2.in++;
        SecurityBooth2.out --> EnterPark.in++;
        SecurityBooth3.out --> EnterPark.in++;
        Source.out --> TicketQueue1.in++;
        TicketQueue1.out++ --> TicketBooth3.in++;
        TicketQueue1.out++ --> TicketBooth4.in++;
        TicketBooth3.out --> SecurityQueue1.in++;
        TicketBooth4.out --> SecurityQueue1.in++;
        SecurityQueue1.out++ --> SecurityBooth3.in++;
        SecurityQueue1.out++ --> SecurityBooth1.in++;
        SecurityBooth1.out --> EnterPark.in++;
        SecurityQueue1.out++ --> SecurityBooth4.in++;
        SecurityBooth4.out --> EnterPark.in++;
}
