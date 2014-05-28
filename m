From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: Where to call platform_device_register()
Date: Wed, 28 May 2014 16:51:49 +0200
Message-ID: <CAMuHMdVFwe0aarqA+QROogY5CAw7yQf4CVK9TdCwJSwAR9Rgig@mail.gmail.com>
References: <CAO64nm5BR5Y15PB-9=S1+JNSMRgK0n1X=UqvLzw80nmtubjN7g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <CAO64nm5BR5Y15PB-9=S1+JNSMRgK0n1X=UqvLzw80nmtubjN7g@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Daniel Palmer <danieruru@gmail.com>
Cc: linux-m68k <linux-m68k@lists.linux-m68k.org>

Hi Daniel,

On Wed, May 28, 2014 at 4:38 PM, Daniel Palmer <danieruru@gmail.com> wrote:
> So I have a MC68VZ328 machine and I want to add an external RTC +
> NVRAM chip to it. The chip itself is working as I can see it ticking
> over from my serial bootloader I use to load the kernel. I'm trying to
> register it via platform_device_register() in
> platform/68000/m68VZ328.c in config_BSP(). I'm getting an ENOMEM error
> in return.
> From some printk()'s I've added I can see that my call to
> platform_device_register() is coming really early and before any of
> the built in devices like platform, cpu etc. I'm wondering if I should
> be calling platform_device_register() later and the issue I'm seeing
> is because my call is before the kernel is really ready for it.
> I can't see anywhere else obvious in the m68k tree to put it.
>
> Any advice would be greatly appreciated.

config_BSP() is indeed way too early.

Take a look at e.g. arch/m68k/platform/coldfire/firebee.c.

For an RTC device, using device_initcall() instead of arch_initcall()
should be OK.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
