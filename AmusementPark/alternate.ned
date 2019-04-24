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
import org.omnetpp.queueing.Queue;
import org.omnetpp.queueing.Router;
import org.omnetpp.queueing.Server;
import org.omnetpp.queueing.Source;


network Alternate
{
    @display("bgb=1099,531");
    submodules:
        source: Source {
            @display("p=31,250");
        }
        TicketQueue: Queue {
            @display("p=99,250");
        }
        classifier: Classifier {
            @display("p=168,250");
        }
        TicketBooth1: Server {
            @display("p=213,161");
        }
        TicketBooth2: Server {
            @display("p=213,330");
        }
        SecurityQ1: Queue {
            @display("p=294,161");
        }
        SecurityQ2: Queue {
            @display("p=294,330");
        }
        Security1: Server {
            @display("p=360,161");
        }
        Security2: Server {
            @display("p=360,330");
        }
        router: Router {
            @display("p=424,250");
        }
        RideQ1: Queue {
            @display("p=512,69");
        }
        RideQ2: Queue {
            @display("p=510,161");
        }
        RideQ3: Queue {
            @display("p=512,250");
        }
        RideQ4: Queue {
            @display("p=510,342");
        }
        RideQ5: Queue {
            @display("p=510,432");
        }
        queue: Queue {
            @display("p=606,69");
        }
        queue1: Queue {
            @display("p=606,161");
        }
        queue2: Queue {
            @display("p=606,250");
        }
        queue3: Queue {
            @display("p=606,342");
        }
        queue4: Queue {
            @display("p=606,432");
        }
        router1: Router {
            @display("p=714,250");
        }
        router2: Router {
            @display("p=714,493");
        }
        router3: Router {
            @display("p=424,493");
        }
    connections:
        source.out --> TicketQueue.in++;
        TicketQueue.out --> classifier.in++;
        classifier.out++ --> TicketBooth1.in++;
        classifier.out++ --> TicketBooth2.in++;
        TicketBooth1.out --> SecurityQ1.in++;
        SecurityQ1.out --> Security1.in++;
        TicketBooth2.out --> SecurityQ2.in++;
        SecurityQ2.out --> Security2.in++;
        Security1.out --> router.in++;
        Security2.out --> router.in++;
        router.out++ --> RideQ1.in++;
        router.out++ --> RideQ2.in++;
        router.out++ --> RideQ3.in++;
        router.out++ --> RideQ4.in++;
        router.out++ --> RideQ5.in++;
        RideQ1.out --> queue.in++;
        RideQ2.out --> queue1.in++;
        RideQ3.out --> queue2.in++;
        RideQ4.out --> queue3.in++;
        RideQ5.out --> queue4.in++;
        queue.out --> router1.in++;
        queue1.out --> router1.in++;
        queue2.out --> router1.in++;
        queue3.out --> router1.in++;
        queue4.out --> router1.in++;
        router1.out++ --> router2.in++;
        router2.out++ --> router3.in++;
        router3.out++ --> router.in++;
}
