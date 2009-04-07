From: Michael Schmitz <schmitz@biophys.uni-duesseldorf.de>
Subject: Re: debian kernel m68k patches for 2.6.29
Date: Wed, 08 Apr 2009 01:23:18 +0200 (CEST)
Message-ID: <alpine.DEB.1.00.0904080049540.12771@zirkon.biophys.uni-duesseldorf.de>
References: <20090326123822.GD8081@marenka.net>
 <10f740e80903260610k29f73c4ci76594f46881e17a5@mail.gmail.com>
 <10f740e80903290607y743bada9w829754722e9f7d9f@mail.gmail.com>
 <alpine.DEB.1.00.0904062346180.32327@zirkon.biophys.uni-duesseldorf.de>
 <10f740e80904070014o479b9a45u45b2f9bb7a175b73@mail.gmail.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <bounce-debian-68k=debian-68k=m.gmane.org@lists.debian.org>
In-reply-to: <10f740e80904070014o479b9a45u45b2f9bb7a175b73@mail.gmail.com>
Resent-Message-ID: <MPr0FRkYsZF.A.l3.lQ-2JB@liszt>
List-Post: <mailto:debian-68k@lists.debian.org>
List-Help: <mailto:debian-68k-request@lists.debian.org?subject=help>
List-Subscribe: <mailto:debian-68k-request@lists.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:debian-68k-request@lists.debian.org?subject=unsubscribe>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Stephen R Marenka <stephen@marenka.net>, debian-68k@lists.debian.org, linux-m68k@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org

Hi Geert,

> > I had to fix a merge conflict in atari_defconfig and multi_defconfig
> > when pulling the m68k-v2.6.29 branch (EtherNEC builtin vs. module, which is the
> > correct setting?). Looks like I better restart from a fresh clone just for the
> > Debian stuff.
> 
> If you pulled from my master branch before, and now try to merge the
> m68k-v2.6.29 branch,
> then you will get conflicts.

Figured that when v2.6.29 or m68k-v2.6.29 would not show up no matter what...

> > There's a bit of Eiffel emulation code missing (mouse wheel IIRC) that I could
> > not test on ARAnyM at that time. My development tree has the necessary bits
> > already, I just need to test them. The mouse driver (input driver part) looks
> > incredibly messy as a result of all this, and could need a review.
> 
> IIRC, there were still some other problems with the version I have, when I last
> tried on ARAnyM. Don't remember the details, I'll have to dig into my
> mail archive.

I've updated ARAnyM on my devel system and we'll see about that shortly. My 
latest changes are stuck in my old git tree, should be trivial to merge over. 
 
> > Hint, hint ... what's the policy regarding driver duplication these days?
> 
> Avoid it. Extract the common part. I guess you mean for scc?

Nope, EtherNAT/EtherNEC. I've found some bits in the CTPCI docs regarding 
interrupt vectors used on the EtherNAT, that should make it possible to mostly 
use the common code there. 

Using the platform interface, it should be possible to use a specialized driver 
probe function while keeping the other code, right? 

Regarding SCC - there's three separate zilog drivers in drivers/serial already. 
The m68k SCC drivers should all move there eventually. What common code should 
we use there? (ip22 and sun drivers appear to be complicated by keyboard/mouse 
use, pmac is quirky...)

I cannot find the Mac serial driver anymore (in the m68k-v2.6.29 branch). Leaves 
VME and Atari SCC to be merged and ported to the serial core model. 

If further merge is intended, the ip22 seems the most generic, can anyone 
confirm this? 

	Michael
 
