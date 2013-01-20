From: Thorsten Glaser <tg@mirbsd.de>
Subject: Re: Atari TT
Date: Sun, 20 Jan 2013 16:52:18 +0000 (UTC)
Message-ID: <Pine.BSM.4.64L.1301201648420.27441@herc.mirbsd.org>
References: <4F0488A9.5030100@fairlite.co.uk> <Pine.BSM.4.64L.1201041911580.19192@herc.mirbsd.org>
 <alpine.LNX.2.00.1201052128060.6601@nippy.intranet> <4F059460.5040305@fairlite.co.uk>
 <CAMuHMdUxQq_29g7yeaS2Ktz193CcHNX5FaP8PR9ijU0htnKbZg@mail.gmail.com>
 <4F059AE1.6070707@fairlite.co.uk> <4F059DB9.1050209@fairlite.co.uk>
 <CAMuHMdUK=2tkFtxQjua6LLGDJuEkrbK0W+mMVQ6PLBB9MfqPSw@mail.gmail.com>
 <4F05F3DB.3090801@fairlite.co.uk> <CAMuHMdXmfY5_9DTabGYeUJdSxz_bWCO+75052ZZJ+SMd70D1hQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <bounce-debian-68k=debian-68k=m.gmane.org@lists.debian.org>
In-Reply-To: <CAMuHMdXmfY5_9DTabGYeUJdSxz_bWCO+75052ZZJ+SMd70D1hQ@mail.gmail.com>
Resent-Message-ID: <qmXsyVuIiLE.A.ytB.gJC_QB@bendel>
List-URL: <http://lists.debian.org/debian-68k/>
List-Post: <mailto:debian-68k@lists.debian.org>
List-Help: <mailto:debian-68k-request@lists.debian.org?subject=help>
List-Subscribe: <mailto:debian-68k-request@lists.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:debian-68k-request@lists.debian.org?subject=unsubscribe>
To: debian-68k@lists.debian.org, linux-m68k@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org

Geert Uytterhoeven dixit:

>On Thu, Jan 5, 2012 at 20:02, Alan Hourihane <alanh@fairlite.co.uk> wrote:
>>>> unexpected interrupt from 112
>>> That's the vector number, so the actual IRQ number is 112 / 4 =3D 28, w=
hich is
>>> IRQ_TT_MFP_TIMD. Sorry, no clues.

>That's bad. So most probably it's been broken on TT for a long time.
>AFAIK Atari receives most testing on (emulated -- ARAnyM) Falcon.

Ouch. Nothing on this? gemini8 (Bcc=E2=80=99d) reported the same in IRC
using vmlinuz-3.8.0-rc3+m68k-queue+atari-84299-g3f4758a which I
cross-built earlier.

Does anyone have an idea how to help debugging that? I=E2=80=99m sure
gemini8 and, probably, Alan wouldn=E2=80=99t mind booting test kernels.

00:32 < gemini8> Ok, guys. I'm trying to run mirabilos' vmlinuz-3.8.0-rc3+m=
68k-queue+atari-84299-g3f4758a on my
                 TT. Bootstrap unpacks the kernel, kernel says something ab=
out booting, I'm getting loads of
                 colourful pixels on my screen, and the floppy starts to bl=
ink.
00:32 < gemini8> That's it.
00:32 < gemini8> Anything I can specify in bootargs to maybe get another re=
sult?
00:33 < gemini8> It's the same with resolution I adjust in bootargs btw.
00:38 < ij> do you have serial/null modem cable? then try to add debug=3Dse=
r to the kernel options
00:40 < gemini8> In theory yes.
00:40 < gemini8> Will have to find me a terminal though.
00:43 < ij> at least you can then see what's going wrong... I just did the =
same on my Amiga
00:58 < gemini8> https://dl.dropbox.com/u/32922157/linux-m68k/linux-m68k-on=
-tt030.txt

No idea whether adding (or not adding) -s makes a difference.
Another thing that could be tried (wrt. the video) is the
stram_reserve(IIRC?) option? Michael?

bye,
//mirabilos
--=20
=E2=80=9Enein: BerliOS und Sourceforge sind Plattformen f=C3=BCr Projekte, =
github ist
eine Plattform f=C3=BCr Einzelk=C3=A4mpfer=E2=80=9C
=09-- dieses Zitat ist ein Beweis daf=C3=BCr, da=C3=9F auch ein blindes Huh=
n
=09   mal ein Korn findet, bzw. =E2=80=93 in diesem Fall =E2=80=93 Recht ha=
ben kann
