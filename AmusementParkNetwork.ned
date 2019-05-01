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
    @display("bgb=1695.3612,800.26373");
    submodules:
        TicketQueue1: Queue {
            @display("p=203,319");
        }
        Pathway: Router {
            @display("p=910.0712,319.43997");
        }
        Ride1Queue: Queue {
            @display("p=1073.1187,181.34874");
        }
        Ride2Queue: Queue {
            @display("p=1073.1187,247.89874");
        }
        Ride3Queue: Queue {
            @display("p=1073.1187,319.43997");
        }
        Ride4Queue: Queue {
            @display("p=1073.1187,392.645;b=17,5");
        }
        Ride5Queue: Queue {
            @display("p=1073.1187,470.84122");
        }
        TicketBooth1: Server {
            @display("p=454.20374,171.36624");
        }
        TicketBooth2: Server {
            @display("p=454.20374,259.54498");
        }
        Ride1: Queue {
            @display("p=1201.2274,181.34874");
        }
        Ride2: Queue {
            @display("p=1201.2274,247.89874");
        }
        Ride3: Queue {
            @display("p=1201.2274,319.43997");
        }
        Ride4: Queue {
            @display("p=1201.2274,392.645");
        }
        Ride5: Queue {
            @display("p=1201.2274,470.84122");
        }
        SecurityQueue1: Queue {
            @display("p=570.6662,319.43997");
        }
        Security1: Server {
            @display("p=805.25494,171.36624");
        }
        Security2: Server {
            @display("p=805.25494,259.54498");
        }
        Security3: Server {
            @display("p=805.25494,344.39624");
        }
        Security4: Server {
            @display("p=805.25494,432.57498");
        }
        TicketBooth3: Server {
            @display("p=454.20374,344.39624");
        }
        TicketBooth4: Server {
            @display("p=454.20374,432.57498");
        }
        classifier: Classifier {
            @display("p=321.10373,319.43997");
        }
        classifier1: Classifier {
            @display("p=650.52625,319.43997");
        }
        Pathway1: Router {
            @display("p=1332.6637,319.43997");
        }
        Pathway3: Router {
            @display("p=910.0712,529.07245");
        }
        Pathway2: Router {
            @display("p=1332.6637,530.7362");
        }
        Exit: Sink {
            @display("p=1414.1874,319.43997");
        }
        source: Source {
            @display("p=83,319");
        }
    connections:
        Pathway.out++ --> Ride1Queue.in++;
        Pathway.out++ --> Ride2Queue.in++;
        Pathway.out++ --> Ride3Queue.in++;
        Pathway.out++ --> Ride4Queue.in++;
        Pathway.out++ --> Ride5Queue.in++;
        Ride1Queue.out --> Ride1.in++;
        Ride2Queue.out --> Ride2.in++;
        Ride3Queue.out --> Ride3.in++;
        Ride4Queue.out --> Ride4.in++;
        Ride5Queue.out --> Ride5.in++;
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
        Security1.out --> Pathway.in++;
        Security2.out --> Pathway.in++;
        Security3.out --> Pathway.in++;
        Security4.out --> Pathway.in++;
        Ride1.out --> Pathway1.in++;
        Ride2.out --> Pathway1.in++;
        Ride3.out --> Pathway1.in++;
        Ride4.out --> Pathway1.in++;
        Ride5.out --> Pathway1.in++;
        Pathway3.out++ --> Pathway.in++;
        Pathway1.out++ --> Pathway2.in++;
        Pathway2.out++ --> Pathway3.in++;
        Pathway1.out++ --> Exit.in++;
        source.out --> TicketQueue1.in++;
}
