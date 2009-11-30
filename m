From: Brad Boyer <flar@allandria.com>
Subject: Re: First steps towards PCMCIA support on the PB190
Date: Mon, 30 Nov 2009 00:26:46 -0800
Message-ID: <20091130082646.GB5156@cynthia.pants.nu>
References: <309140AF-1076-4BF1-8E6E-B3FF4E75B4A4@pvco.net> <alpine.OSX.2.00.0910101349200.377@silk.local> <10f740e80910110713r6af8ec5co6ea97b340e6d33a5@mail.gmail.com> <2905206F-BAC4-408F-83FD-288065B17B8D@pvco.net> <20091011210237.GA14381@cynthia.pants.nu> <E9A8CEA5-19D7-4A25-830D-3EFE354FC789@pvco.net> <20091128034828.GB816@cynthia.pants.nu> <alpine.OSX.2.00.0911301345130.373@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <bounce-debian-68k=debian-68k=m.gmane.org@lists.debian.org>
Content-Disposition: inline
In-Reply-To: <alpine.OSX.2.00.0911301345130.373@localhost>
Resent-Message-ID: <jNo9a22pYtM.A.vTD.TI4ELB@liszt>
List-Post: <mailto:debian-68k@lists.debian.org>
List-Help: <mailto:debian-68k-request@lists.debian.org?subject=help>
List-Subscribe: <mailto:debian-68k-request@lists.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:debian-68k-request@lists.debian.org?subject=unsubscribe>
To: Finn Thain <fthain@telegraphics.com.au>
Cc: diego <diego@pvco.net>, Geert Uytterhoeven <geert@linux-m68k.org>, debian-68k@lists.debian.org, linux-m68k@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org

On Mon, Nov 30, 2009 at 02:10:29PM +1100, Finn Thain wrote:
> On Fri, 27 Nov 2009, Brad Boyer wrote:
> > Just as a note, I never saw the original message come across the mailing 
> > list. Also, you might want to include linux-m68k@lists.linux-m68k.org on 
> > this sort of topic.
> 
> I think that is an alias for linux-m68k@vger.kernel.org
> I've added the CC.

Yes, it should be the same. I just copied that from some other email
that made it to the list.

> > On Tue, Nov 24, 2009 at 07:01:30PM -0200, diego wrote:
> > 
> > ...
> > > There are mainly three problems l'm facing here.... The first two 
> > > should be fairly easy to work out, whereas the 3rd represents a major 
> > > roadblock at the moment:
> > > 
> > > 1. Proper mac specific definitions that wrap around ISA bus access.
> > > 
> > > 2. If you look at the patches to the orinoco driver, you will see that 
> > > there's another enemy hiding, his name is ioport_map.
> > 
> > These should be relatively simple. We need to clean up some of that 
> > stuff anyway. It's just a matter of taking the time to do it right. This 
> > is the sort of thing that ought to be handled better in the common code 
> > anyway.
> 
> Any suggestions on what needs to be done here, i.e. what needs clean up 
> and what is the right way to do it? How much code is affected?
> 
> I know that the inb/outb/etc routines have come up often WRT m68k drivers, 
> e.g. byteswapping on atari and so on. But I never really understood the 
> issues.

I think the right way to do it is to actually register ranges into a
generic framework with their properties (byte swap needed, real base
address for MMIO mappings) to allocate the in/out ranges. Then have
the macros in io.h call into the functions to lookup the entry in
the table and pass through to the right real range. I'm sure that
somebody will disagree, but it seems reasonable to me.

> It appears that my Farallon Etherwave card has issues with byte ordering 
> (smc91c92_cs driver) when used with Diego's TRex patch.

I have a Macsense MPC-10, but I haven't actually tried it with the Linux
PCMCIA stack to know what driver could use it. Most likely the byte
order issues are generic, and the card being used originally wasn't
sensitive to byte order. I haven't looked at either driver. It's
possible that one or the other driver doesn't use the byte swap
operations it should be using. I'm not 100% sure what the proper usage
is for the APIs of the PCMCIA core.

> > > 3. This has already been haunting the driver in the nubus-ppc project, 
> > > and I couldn't come up with anything better either: I can't figure out 
> > > how to make the TREX chip use IO memory and attribute memory 
> > > simultaneously. From the little docs provided by apple it appears that 
> > > it would be possible, then again they don't provide any documentation 
> > > on how this chip works at the register level. The original author of 
> > > the driver did find out how to switch between the two modes, but this 
> > > requires the ugly patches to pcmcia_resource.c to, which in turn makes 
> > > it impossible to merge this into an all-arch kernel tree. This wasn't 
> > > a problem for the nubus-ppc port since they maintained their own 
> > > development tree, but obviously in the case of m68k this would 
> > > represent a major problem. Another thing is that it breaks some 
> > > drivers that implement more exotic features like requesting card 
> > > configuration changes etc.. If anyone happens to know how to program 
> > > the TREX chip to use both attribute and IO mem simultaneously then 
> > > this wouldn['t be an issue anymore. The alternative would be to 
> > > convince the pcmcia core maintainers to have mercy with cards that 
> > > need switching between these modes, but I doubt that this is a 
> > > realistic alternative.
> 
> Can the switch be done with a fault handler? That is, does I/O generate an 
> exception that can be used to switch the memory to I/O mode so that the 
> access can be restarted? Can all attribute accesses explicitly switch to 
> attribute mode within the constraints of the pcmcia core?

I'm not sure I understand enough of the PCMCIA core code to comment on
this. I'll have to read some more code to be useful there.

	Brad Boyer
	flar@allandria.com
