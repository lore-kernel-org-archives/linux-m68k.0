From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Subject: Re: m68k v3.16 status update
Date: Tue, 5 Aug 2014 22:29:04 +0200
Message-ID: <20140805202904.GA23676@physik.fu-berlin.de>
References: <CAMuHMdXodxq=Z8rQAZ7UUdzUzoPfQLFCSTkJziVeAsq8MMQxmQ@mail.gmail.com>
 <06A072CC-7C42-47C2-A877-9012C3DE6585@2014.bluespice.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <06A072CC-7C42-47C2-A877-9012C3DE6585@2014.bluespice.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Ingo =?iso-8859-1?Q?J=FCrgensmann?= <ij@2014.bluespice.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k <linux-m68k@lists.linux-m68k.org>, Debian m68k <debian-68k@lists.debian.org>, karcher@physik.fu-berlin.de

On Tue, Aug 05, 2014 at 09:52:58PM +0200, Ingo J=FCrgensmann wrote:
> Am 05.08.2014 um 21:40 schrieb Geert Uytterhoeven <geert@linux-m68k.o=
rg>:
>=20
> > m68k v3.16 is out!
> > git://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git
> > m68k-queue is getting smaller, but there are still a few commits le=
ft:
>=20
> Hmm, what about the Blizzard 2060 SCSI driver from Michael & Tuomas? =
It runs since then on Akire...=20

Add to that the X-Surf100 driver that Michael Karcher wrote [1] but
unfortunately he hasn't cleaned up the code yet and submitted it for
inclusion in the mainline kernel.

I'll put Michael in the CC to try to ping him again :).

Cheers,
Adrian

> [1] git://z6.physik.fu-berlin.de/xsurf100.git

--=20
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer - glaubitz@debian.org
`. `'   Freie Universitaet Berlin - glaubitz@physik.fu-berlin.de
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
