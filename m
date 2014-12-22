From: Zach Brown <zab@zabbo.net>
Subject: Re: previous, a NeXT emulator
Date: Mon, 22 Dec 2014 11:08:43 -0800
Message-ID: <20141222190843.GA20866@lenny.home.zabbo.net>
References: <Pine.BSM.4.64L.1412141632170.30407@herc.mirbsd.org>
 <CAMuHMdUDpHS+HU257Ai+XAXPJDDmqoOs3jtu5PC=JFhRbgi0og@mail.gmail.com>
 <20141222061532.GA24673@guido.earth.sol>
 <CAMuHMdX+R72SFq4JRGYoty3huRGo7=Wrv8AuUMtUTdEr9MY5cA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAMuHMdX+R72SFq4JRGYoty3huRGo7=Wrv8AuUMtUTdEr9MY5cA@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: "Christian T. Steigies" <cts@debian.org>, Thorsten Glaser <tg@mirbsd.de>, Lucas Holt <laffer1@midnightbsd.org>, linux-m68k <linux-m68k@lists.linux-m68k.org>, Debian m68k <debian-68k@lists.debian.org>

On Mon, Dec 22, 2014 at 09:00:52AM +0100, Geert Uytterhoeven wrote:
> On Mon, Dec 22, 2014 at 7:15 AM, Christian T. Steigies <cts@debian.or=
g> wrote:
> > On Sun, Dec 14, 2014 at 07:40:47PM +0100, Geert Uytterhoeven wrote:
> >> On Sun, Dec 14, 2014 at 5:33 PM, Thorsten Glaser <tg@mirbsd.de> wr=
ote:
> >> > 16:26???=ABlaffer1:#midnightbsd=BB previous, a NeXT emulator. ht=
tp://previous.alternative-system.com/
> >> >
> >> > Apparently based on Hatari. But its Docs say NetBSD/next68k work=
s,
> >> > as do old NeXTstep versions.
> >> >
> >> > Maybe interesting.
> >>
> >> Who's gonna resurrect the Linux/m68k NeXT port?
> >
> > Please do! I would even dig out a NeXT cube to test it on real hard=
ware.
> > Last time I looked I did not find any kernels available?
>=20
> To be honest, I have no idea where you can find the (very very) old p=
atches
> to run on NeXT. I had a quick look, but all old sites are dead.
>=20
> Zach, do you still have something?

Hi Geert!  Long time no see.

I poked around a bit and found a giant patch against 2.1.124.  It's..
not pretty.  It's ~95k uncompressed so I didn't want to send it to the
list, but fpaste seemed to take it:

  curl -o linux-next-2.1.124jes-18101998.patch \
	http://paste.fedoraproject.org/162196/27497714/raw/

I'm struggling to remember those few months that I spent hacking on the
NeXTs :).  I think most of it was blind stabbing in the dark while
comparing with open code sample and header files.. netbsd, some boot
loaders maybe, that kind of thing.  It got to a point where interrupts
and dma were working enough to tftpboot from the network.  But then I
got to the scsi part and.. I think it had endian flipping in the busses
somewhere?  That's when I moved on to some other weird project
(beboxes?).

I'm happy to try and help if anyone actually works on this.  I probably
wouldn't succeed, but I'd try.

- z
