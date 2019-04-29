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
    @display("bgb=1043.7137,577.6962");
    submodules:
        source: Source {
            @display("p=31,250");
        }
        TicketQueue: Queue {
            @display("p=122.70875,249.55376");
        }
        TicketBooth1: Server {
            @display("p=279.88626,151.6625");
        }
        TicketBooth2: Server {
            @display("p=279.88626,354.33875");
        }
        SecurityQ1: Queue {
            @display("p=388.8075,151.6625");
        }
        SecurityQ2: Queue {
            @display("p=388.8075,354.33875");
        }
        Security1: Server {
            @display("p=500.48624,151.6625");
        }
        Security2: Server {
            @display("p=500.48624,354.33875");
        }
        router: Router {
            @display("p=573.56,249.55376");
        }
        RideQ1: Queue {
            @display("p=682.48126,68.9375");
        }
        RideQ2: Queue {
            @display("p=682.48126,159.935");
        }
        RideQ3: Queue {
            @display("p=682.48126,249.55376");
        }
        RideQ4: Queue {
            @display("p=682.48126,341.93");
        }
        RideQ5: Queue {
            @display("p=682.48126,431.54874");
        }
        queue: Queue {
            @display("p=809.32623,68.9375");
        }
        queue1: Queue {
            @display("p=809.32623,159.935");
        }
        queue2: Queue {
            @display("p=809.32623,249.55376");
        }
        queue3: Queue {
            @display("p=809.32623,341.93");
        }
        queue4: Queue {
            @display("p=809.32623,431.54874");
        }
        router1: Router {
            @display("p=963.7463,249.55376");
        }
        router2: Router {
            @display("p=963.7463,492.21375");
        }
        router3: Router {
            @display("p=573.56,492.21375");
        }
        classifier: Classifier {
            @display("p=215.94376,249.97125");
        }
    connections:
        source.out --> TicketQueue.in++;
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
        classifier.out++ --> TicketBooth1.in++;
        classifier.rest --> TicketBooth2.in++;
        TicketQueue.out --> classifier.in++;
}
