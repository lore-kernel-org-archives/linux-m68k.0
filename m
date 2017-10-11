From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: Status of the FB drivers on m68k
Date: Wed, 11 Oct 2017 09:24:57 +0200
Message-ID: <CAMuHMdWuJ=VWnvky0cpqbed2cQbr63MUijnbAcE-mk7PVpVN0A@mail.gmail.com>
References: <2fd42624-7128-81e5-db7b-e7eed3eaa50c@physik.fu-berlin.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <bounce-debian-68k=debian-68k=m.gmane.org@lists.debian.org>
Sender: geert.uytterhoeven@gmail.com
In-Reply-To: <2fd42624-7128-81e5-db7b-e7eed3eaa50c@physik.fu-berlin.de>
Resent-Message-ID: <-eaZNXeGjiP.A.zyH.bdc3ZB@bendel>
List-URL: <https://lists.debian.org/debian-68k/>
List-Post: <mailto:debian-68k@lists.debian.org>
List-Help: <mailto:debian-68k-request@lists.debian.org?subject=help>
List-Subscribe: <mailto:debian-68k-request@lists.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:debian-68k-request@lists.debian.org?subject=unsubscribe>
List-Archive: https://lists.debian.org/msgid-search/CAMuHMdWuJ=VWnvky0cpqbed2cQbr63MUijnbAcE-mk7PVpVN0A@mail.gmail.com
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc: Linux/m68k <linux-m68k@vger.kernel.org>, Debian m68k <debian-68k@lists.debian.org>
List-Id: linux-m68k@vger.kernel.org

Hi Adrian,

On Tue, Oct 10, 2017 at 8:32 PM, John Paul Adrian Glaubitz
<glaubitz@physik.fu-berlin.de> wrote:
> Does anyone of the kernel guys, especially Geert, know what the current status
> of the framebuffer drivers on m68k is?
>
> I am currently discussing the topic of usable graphics cards on Debian/m68k
> on the German Amiga forum a1k.org since one user asked me [1] and he told
> me that in the past, users could use CONFIG_FB_CYBER and CONFIG_FB_VIRGE
> which both seem gone, sadly.

CyberVision 64, CyberVision 64/3D, and Retina/Z3 support were removed in
commit e019630e78e3482c ("[PATCH] remove broken video drivers").

All of them were marked broken before because they needed an update
for the new fbdev framework, cfr. e.g full-history-linux
commit 6764ca1a7c58dc5f07bd730000a4c40be4ef9f00
Author: Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Sun Sep 28 20:02:47 2003 -0700

    [PATCH] Amiga Cybervision 64/3D frame buffer device is broken

    Amiga Cybervision 64/3D frame buffer device is broken (needs update to new
    fbdev framework)

> Also, the CONFIG_FB_PM2 driver is marked as broken [2].

>From full-history-linux:
commit a05cb1584100212ae8b20a8026dac1f814760158
Author: Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon Apr 12 17:29:57 2004 -0700

    [PATCH] Pm2fb is broken on Amiga

    Permedia2: Mark pm2fb broken on Amiga, until somebody fixes it (pm2fb.c
    explicitly tests for CONFIG_PCI right now)

> Is there a chance to bring the CYBER and VIRGE drivers back? And maybe
> get PM2 working on m68k?

There's always a chance ;-)
You "just" need someone with the hardware, programming skills, and a
strong desire to get it working again.

For CyberVision 64, CyberVision 64/3D, and Retina/Z3, the amount of work
shouldn't be that big. Just revert commit e019630e78e3482c, and look how
other fbdev driver were converted to the new framework.

However, in the mean time another S3 Trio / Virge driver was added, so it
may make more sense to add Amiga support to the latter.  But as I expect
that driver to contain many PC-isms, and rely on the BIOS having initialized
the graphics chip first, reviving FB_CYBER and FB_VIRGE as a first step,
may be the best approach.

I expect fixing Permedia2 to be much harder...

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
