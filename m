From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [patch 3/2] m68k: Atari EtherNAT - add writew_be for data push
Date: Mon, 3 Nov 2008 22:28:22 +0100 (CET)
Message-ID: <Pine.LNX.4.64.0811032227090.8517@anakin>
References: <20080903073629.GD4104@cs181140183.pp.htv.fi> <48E3B617.4050904@freenet.de>
 <alpine.DEB.1.00.0810021020150.1527@zirkon.biophys.uni-duesseldorf.de>
 <48E7A5D6.3020903@freenet.de> <alpine.DEB.1.00.0810050511390.32397@zirkon.biophys.uni-duesseldorf.de>
 <48EB266E.3070708@freenet.de> <48ECE5DA.2090302@freenet.de>
 <alpine.DEB.1.00.0810090428170.19738@zirkon.biophys.uni-duesseldorf.de>
 <48EF9ECE.40505@freenet.de> <alpine.DEB.1.00.0810110330110.10175@zirkon.biophys.uni-duesseldorf.de>
 <48F0ECC9.6050902@freenet.de> <alpine.DEB.1.00.0810122141540.26363@zirkon.biophys.uni-duesseldorf.de>
 <48F679D1.60709@freenet.de> <alpine.DEB.1.00.0810281959240.8885@zirkon.biophys.uni-duesseldorf.de>
 <49085A7A.3030006@freenet.de> <alpine.DEB.1.00.0810292124320.22819@zirkon.biophys.uni-duesseldorf.de>
 <4909C12C.4020009@freenet.de> <Pine.LNX.4.64.0810301800270.30686@anakin>
 <alpine.DEB.1.00.0810302112230.572@zirkon.biophys.uni-duesseldorf.de>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <bounce-debian-68k=debian-68k=m.gmane.org@lists.debian.org>
Sender: geert@linux-m68k.org
In-Reply-To: <alpine.DEB.1.00.0810302112230.572@zirkon.biophys.uni-duesseldorf.de>
Resent-Message-ID: <DYPjpkcPeBC.A.DAD.K02DJB@liszt>
List-Post: <mailto:debian-68k@lists.debian.org>
List-Help: <mailto:debian-68k-request@lists.debian.org?subject=help>
List-Subscribe: <mailto:debian-68k-request@lists.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:debian-68k-request@lists.debian.org?subject=unsubscribe>
To: Michael Schmitz <schmitz@biophys.uni-duesseldorf.de>
Cc: "Frank P. Szymanski" <frank_peter.szymanski@freenet.de>, Debian GNU/Linux m68k <debian-68k@lists.debian.org>, smarenka@debian.org, Linux/m68k <linux-m68k@vger.kernel.org>
List-Id: linux-m68k@vger.kernel.org

On Fri, 31 Oct 2008, Michael Schmitz wrote:
> > > > Looking at the SCSI driver in 2.6.26, it's no surprise - the error handling 
> > > > update that I did for 2.6.18 is not included in Geert's current 2.6 patch 
> > > > series. Looks like I botched the patch submission way back when. 
> > > 
> > > It's a pity. You put so much work in it but none of your patches
> > > (EtherNEC, EtherNAT or SCSI) got it into a current kernel.
> > > 
> > > Is there a reason why?
> > 
> > When Michael thinks they're ready, he can submit them to netdev or linux-scsi
> > ;-)
> 
> I'm happy for them to live in linux-m68k :-)
> 
> EtherNEC and EtherNAT are 'ready' in the sense they are working reliably. They 
> are by no means 'ready in the sense that mainline kernel maintainers would be 
> happy to take my patches. 

Or should we get them into linux-staging?

http://kerneltrap.org/Linux/Introducing_the_Linux_Staging_Tree

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
