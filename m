From: Richard Z <rz@linux-m68k.org>
Subject: Re: previous, a NeXT emulator
Date: Tue, 23 Dec 2014 13:04:13 +0100
Message-ID: <20141223120413.GA21792@rz.localhost.localdomain>
References: <Pine.BSM.4.64L.1412141632170.30407@herc.mirbsd.org>
 <CAMuHMdUDpHS+HU257Ai+XAXPJDDmqoOs3jtu5PC=JFhRbgi0og@mail.gmail.com>
 <20141222061532.GA24673@guido.earth.sol>
 <CAMuHMdX+R72SFq4JRGYoty3huRGo7=Wrv8AuUMtUTdEr9MY5cA@mail.gmail.com>
 <20141222190843.GA20866@lenny.home.zabbo.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20141222190843.GA20866@lenny.home.zabbo.net>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Zach Brown <zab@zabbo.net>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, "Christian T. Steigies" <cts@debian.org>, Thorsten Glaser <tg@mirbsd.de>, Lucas Holt <laffer1@midnightbsd.org>, linux-m68k <linux-m68k@lists.linux-m68k.org>, Debian m68k <debian-68k@lists.debian.org>

On Mon, Dec 22, 2014 at 11:08:43AM -0800, Zach Brown wrote:
> On Mon, Dec 22, 2014 at 09:00:52AM +0100, Geert Uytterhoeven wrote:
> > On Mon, Dec 22, 2014 at 7:15 AM, Christian T. Steigies <cts@debian.=
org> wrote:
> > > On Sun, Dec 14, 2014 at 07:40:47PM +0100, Geert Uytterhoeven wrot=
e:
> > >> On Sun, Dec 14, 2014 at 5:33 PM, Thorsten Glaser <tg@mirbsd.de> =
wrote:
> > >> > 16:26???=ABlaffer1:#midnightbsd=BB previous, a NeXT emulator. =
http://previous.alternative-system.com/
> > >> >
> > >> > Apparently based on Hatari. But its Docs say NetBSD/next68k wo=
rks,
> > >> > as do old NeXTstep versions.
> > >> >
> > >> > Maybe interesting.
> > >>
> > >> Who's gonna resurrect the Linux/m68k NeXT port?
> > >
> > > Please do! I would even dig out a NeXT cube to test it on real ha=
rdware.
> > > Last time I looked I did not find any kernels available?
> >=20
> > To be honest, I have no idea where you can find the (very very) old=
 patches
> > to run on NeXT. I had a quick look, but all old sites are dead.
> >=20
> > Zach, do you still have something?
>=20
> Hi Geert!  Long time no see.
>=20
> I poked around a bit and found a giant patch against 2.1.124.  It's..
> not pretty.  It's ~95k uncompressed so I didn't want to send it to th=
e
> list, but fpaste seemed to take it:


I have this on my hard-disk:

$ ll
total 13280
-rw----r--. 1 rz 500  509724 Feb 10  1999 linux-2.1.130.diff.bz2
-rw----r--. 1 rz 500   92714 Feb 10  1999 linux-2.1.131.diff.bz2
-rw----r--. 1 rz 500  953395 Feb 11  1999 linux-2.2.0pre4.diff.bz2
-rw----r--. 1 rz 500  315998 Feb 10  1999 linux-2.2.0pre6.diff.bz2
-rw----r--. 1 rz 500   86427 Feb 10  1999 linux-2.2.0pre7.diff.bz2
-rw-r--r--. 1 rz 500  361190 Jul 23  1999 linux-2.2.10.diff.gz~~.bz2
-rw-r--r--. 1 rz 500  362942 Jul 23  1999 linux-2.2.10.diff.gz.bz2
-rw-r--r--. 1 rz 500  382717 Feb 11  1999 linux-2.2.1pre1.diff.bz2
-rw-r--r--. 1 rz 500   22988 Feb 26  1999 linux-2.2.1pre2.diff.bz2
-rw-r--r--. 1 rz 500 1038972 May  3  1999 linux-2.2.6.diff.bz2
-rw-r--r--. 1 rz 500  621054 May 16  1999 linux-2.2.8.diff.bz2
-rw-r--r--. 1 rz 500 1514943 Feb  1  2000 linux-2.3.42.diff.bz2
-rw-r--r--. 1 rz 500 1877657 Mar  5  2000 linux-2.3.42.diff.gz.bz2
-rw-r--r--. 1 rz 500  191482 Feb  1  2000 linux-2.3.42-native.diff~.bz2
-rw-r--r--. 1 rz 500  190559 Feb  2  2000 linux-2.3.42-native.diff.bz2
-rw-r--r--. 1 rz 500 2058450 Mar  4  2000 linux-2.3.47.diff.bz2
-rw-r--r--. 1 rz 500 2791941 May 15  2000 linux-2.3.99pre2.diff.bz2
-rw-r--r--. 1 rz 500   22127 Oct 21  2000 lx-2.2.16-q40-2.2.16.diff.bz2
-rw-r--r--. 1 rz 500  165213 Oct  5  2000 lx-2.2.17-q40-2.2.17.diff.bz2

Those seem to be mostly mainline to m68k diffs with Q40 hacks included.
Let me know if I should look at some particular versions or upload them
somewhere.

Richard

---
Name and OpenPGP keys available from pgp key servers
