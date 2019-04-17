//
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU Lesser General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
// 
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU Lesser General Public License for more details.
// 
// You should have received a copy of the GNU Lesser General Public License
// along with this program.  If not, see http://www.gnu.org/licenses/.
// 

import org.omnetpp.queueing.Classifier;
import org.omnetpp.queueing.PassiveQueue;
import org.omnetpp.queueing.Queue;
import org.omnetpp.queueing.Router;
import org.omnetpp.queueing.Server;
import org.omnetpp.queueing.Sink;
import org.omnetpp.queueing.Source;


//
// TODO auto-generated type
//
network AmusementParkNetwork
{
    @display("bgb=1327,692");
    submodules:
        TicketSink1: Source {
            @display("p=44,320");
        }
        TicketQueue1: Queue {
            @display("p=129,320");
        }
        router: Router {
            @display("p=791,320");
        }
        Ride1Queue: Queue {
            @display("p=962,39");
        }
        Ride2Queue: Queue {
            @display("p=962,147");
        }
        Ride3Queue: Queue {
            @display("p=962,293");
        }
        Ride4Queue: Queue {
            @display("p=962,412;b=17,5");
        }
        Ride5Queue: Queue {
            @display("p=962,526");
        }
        TicketBooth1: Server {
            @display("p=335,172");
        }
        TicketBooth2: Server {
            @display("p=335,261");
        }
        Ride1: Queue {
            @display("p=1091,39");
        }
        Ride2: Queue {
            @display("p=1091,147");
        }
        Ride3: Queue {
            @display("p=1091,293");
        }
        Ride4: Queue {
            @display("p=1091,412");
        }
        Ride5: Queue {
            @display("p=1091,526");
        }
        SecurityQueue1: Queue {
            @display("p=451,320");
        }
        Security1: Server {
            @display("p=686,172");
        }
        Security2: Server {
            @display("p=686,261");
        }
        Security3: Server {
            @display("p=686,345");
        }
        Security4: Server {
            @display("p=686,434");
        }
        TicketBooth3: Server {
            @display("p=335,345");
        }
        TicketBooth4: Server {
            @display("p=335,434");
        }
        classifier: Classifier {
            @display("p=200,323");
        }
        classifier1: Classifier {
            @display("p=516,320");
        }
        router1: Router {
            @display("p=1222,345");
        }
        router2: Router {
            @display("p=791,619");
        }
        router3: Router {
            @display("p=1213,621");
        }
    connections:
        router.out++ --> Ride1Queue.in++;
        router.out++ --> Ride2Queue.in++;
        router.out++ --> Ride3Queue.in++;
        router.out++ --> Ride4Queue.in++;
        router.out++ --> Ride5Queue.in++;
        Ride1Queue.out --> Ride1.in++;
        Ride2Queue.out --> Ride2.in++;
        Ride3Queue.out --> Ride3.in++;
        Ride4Queue.out --> Ride4.in++;
        Ride5Queue.out --> Ride5.in++;
        TicketSink1.out --> TicketQueue1.in++;
        TicketQueue1.out --> classifier.in++;
        classifier.out++ --> TicketBooth1.in++;
        classifier.out++ --> TicketBooth2.in++;
        classifier.out++ --> TicketBooth3.in++;
        TicketBooth4.out --> SecurityQueue1.in++;
        TicketBooth3.out --> SecurityQueue1.in++;
        TicketBooth2.out --> SecurityQueue1.in++;
        TicketBooth1.out --> SecurityQueue1.in++;
        classifier.rest --> TicketBooth4.in++;
        SecurityQueue1.out --> classifier1.in++;
        classifier1.out++ --> Security1.in++;
        classifier1.out++ --> Security2.in++;
        classifier1.out++ --> Security3.in++;
        classifier1.rest --> Security4.in++;
        Security1.out --> router.in++;
        Security2.out --> router.in++;
        Security3.out --> router.in++;
        Security4.out --> router.in++;
        Ride1.out --> router1.in++;
        Ride2.out --> router1.in++;
        Ride3.out --> router1.in++;
        Ride4.out --> router1.in++;
        Ride5.out --> router1.in++;
        router2.out++ --> router.in++;
        router1.out++ --> router3.in++;
        router3.out++ --> router2.in++;
}
