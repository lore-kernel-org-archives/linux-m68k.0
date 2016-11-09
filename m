From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: gcc-4.6.3, was Re: Debian on mac68k
Date: Wed, 9 Nov 2016 09:39:25 +0100
Message-ID: <CAMuHMdXJUb_e+7J1cTpPQdzR3Zaj7P9nhP9_1vedRUcRA3PnvA@mail.gmail.com>
References: <574C132F.3070404@abbuc.de> <574C15C2.90908@abbuc.de>
 <ec5ded9d-b3c0-0bba-65b7-1e4d2cc063a2@physik.fu-berlin.de>
 <574C1792.4030403@abbuc.de> <57557722.5040808@yahoo.com> <alpine.LNX.2.00.1610251358330.443@nippy.intranet>
 <5810FA8D.4060702@yahoo.com> <58114F74.40408@yahoo.com> <alpine.LNX.2.00.1610271244020.21780@nippy.intranet>
 <5811F96F.3090602@yahoo.com> <58121D46.8060506@yahoo.com> <alpine.LNX.2.00.1611052134280.2870@nippy.intranet>
 <fbb16cf0-6fe1-8231-c85a-8c65b3d8f50d@physik.fu-berlin.de>
 <alpine.LNX.2.00.1611070917240.29060@nippy.intranet> <b731fd59-03b7-a443-650b-c023c1190385@gmail.com>
 <alpine.LNX.2.00.1611091759180.16562@nippy.intranet>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <bounce-debian-68k=debian-68k=m.gmane.org@lists.debian.org>
Sender: geert.uytterhoeven@gmail.com
In-Reply-To: <alpine.LNX.2.00.1611091759180.16562@nippy.intranet>
Resent-Message-ID: <q2kwXaYDXSM.A.dxB.ODuIYB@bendel>
List-URL: <https://lists.debian.org/debian-68k/>
List-Post: <mailto:debian-68k@lists.debian.org>
List-Help: <mailto:debian-68k-request@lists.debian.org?subject=help>
List-Subscribe: <mailto:debian-68k-request@lists.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:debian-68k-request@lists.debian.org?subject=unsubscribe>
List-Archive: https://lists.debian.org/msgid-search/CAMuHMdXJUb_e+7J1cTpPQdzR3Zaj7P9nhP9_1vedRUcRA3PnvA@mail.gmail.com
To: Finn Thain <fthain@telegraphics.com.au>
Cc: Michael Schmitz <schmitzmic@gmail.com>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Debian m68k <debian-68k@lists.debian.org>, Linux/m68k <linux-m68k@vger.kernel.org>
List-Id: linux-m68k@vger.kernel.org

On Wed, Nov 9, 2016 at 8:08 AM, Finn Thain <fthain@telegraphics.com.au> wrote:
> On Wed, 9 Nov 2016, Michael Schmitz wrote:
>> Not for Mac, but Geert usually boots kernels using ARAnyM. Pretty basic,
>> for sure, but it's been good enough so have something to work from.
>
> I thought Geert still used gcc-4.1 (?)

Indeed.

Gcc-4.1 has issues with some bitfields, e.g. to compile gfs2 I need
workarounds like:

-       struct gfs2_rbm rbm = { .rgd = rgd, .bii = 0, .offset = 0 };
+       // FIXME Avoid gcc 4.1.2 20061115 (prerelease) (Ubuntu 4.1.1-21) ICE
+       // struct gfs2_rbm rbm = { .rgd = rgd, .bii = 0, .offset = 0 };
+       struct gfs2_rbm rbm = { .bii = 0, .offset = 0 };
+       rbm.rgd = rgd;

I also have a 4.9.0 from kernel.org, if needed.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
