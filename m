From: Thorsten Glaser <tg@mirbsd.de>
Subject: Re: [PATCH] m68k: handle Atari interrupts in multi-platform kernels
Date: Mon, 26 Aug 2013 11:12:38 +0000 (UTC)
Message-ID: <Pine.BSM.4.64L.1308261107520.19888@herc.mirbsd.org>
References: <201308092135.r79LZwL1013105@herc.mirbsd.org>
 <Pine.BSM.4.64L.1308092147300.28970@herc.mirbsd.org>
 <f853f42622f9fd3b1f832a3b2b1d04ae@biophys.uni-duesseldorf.de>
 <CAMuHMdWNHyTUYrcn9M2wn5-1+KYi+momBKHE2t9y4zXAEvygrw@mail.gmail.com>
 <Pine.BSM.4.64L.1308221903570.2722@herc.mirbsd.org>
 <162721916.231588.1377514666818.open-xchange@ox-webdesk.1and1.fr>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <bounce-debian-68k=debian-68k=m.gmane.org@lists.debian.org>
In-Reply-To: <162721916.231588.1377514666818.open-xchange@ox-webdesk.1and1.fr>
Resent-Message-ID: <PRaj1NZ-6nF.A.EoG.slzGSB@bendel>
List-URL: <http://lists.debian.org/debian-68k/>
List-Post: <mailto:debian-68k@lists.debian.org>
List-Help: <mailto:debian-68k-request@lists.debian.org?subject=help>
List-Subscribe: <mailto:debian-68k-request@lists.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:debian-68k-request@lists.debian.org?subject=unsubscribe>
To: Laurent Vivier <laurent@vivier.eu>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Debian m68k <debian-68k@lists.debian.org>, Linux/m68k <linux-m68k@vger.kernel.org>
List-Id: linux-m68k@vger.kernel.org

Laurent Vivier dixit:

>I'd like to test this on my Quadra 800, where can I find the .deb ?

In Debian unstable: apt-get install linux-image-3.10-2-m68k
(or better linux-image-m68k which is the metapackage).

The .deb is not usable outside of a running unstable installation.

If you =E2=80=9Cjust=E2=80=9D want to test the kernel:
http://www.freewrt.org/~tg/f/vmlinux-3.10-2-m68k.gz

Maybe this initrd (generated on the Atari VM buildd) can
work for you somewhat (but this is totally unsupported,
and you really must install the kernel in an up-to-date
Debian unstable system for reliable operation):
http://zigo.mirbsd.org:8080/t/initrd.img-3.10-2-m68k

bye,
//mirabilos
--=20
13:37=E2=8E=9C=C2=ABNatureshadow=C2=BB Deep inside, I hate mirabilos. I mea=
n, he's a good
guy. But he's always right! In every fsckin' situation, he's right. Even
with his deeply perverted taste in software and borked ambition towards
broken OSes - in the end, he's damn right about it :(! [=E2=80=A6] works in=
 mksh
