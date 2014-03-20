From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 2/2] m68k/atari - atafb: convert allocation of fb ram to
 new interface
Date: Thu, 20 Mar 2014 09:33:48 +0100
Message-ID: <CAMuHMdVq=XEW_aVnu=M8skWYbiAOxOjNyT9zoZqTLUM0HxiM-Q@mail.gmail.com>
References: <1395213784-3249-1-git-send-email-schmitz@debian.org>
	<1395213784-3249-2-git-send-email-schmitz@debian.org>
	<CAMuHMdVriMKQrNjxBnPDekVAzML5Np-ygvN57OTcTMxO97rsfQ@mail.gmail.com>
	<532AA422.8040208@biophys.uni-duesseldorf.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pd0-f177.google.com ([209.85.192.177]:63386 "EHLO
	mail-pd0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755560AbaCTIdt (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Thu, 20 Mar 2014 04:33:49 -0400
Received: by mail-pd0-f177.google.com with SMTP id y10so602324pdj.36
        for <linux-m68k@vger.kernel.org>; Thu, 20 Mar 2014 01:33:48 -0700 (PDT)
In-Reply-To: <532AA422.8040208@biophys.uni-duesseldorf.de>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: schmitz <schmitz@biophys.uni-duesseldorf.de>
Cc: Michael Schmitz <schmitzmic@gmail.com>, Linux/m68k <linux-m68k@vger.kernel.org>, Debian m68k <debian-68k@lists.debian.org>, Michael Schmitz <schmitz@debian.org>

Hi Michael,

On Thu, Mar 20, 2014 at 9:17 AM, schmitz
<schmitz@biophys.uni-duesseldorf.de> wrote:
>>         kernel_set_cachemode(screen_base, screen_len,
>>                                                      IOMAP_WRITETHROUGH);
>>
>> woops, that won't work with the virt_to_phys() above, nor with transparent
>> translation. I guess it writes to a non-existent pointer table,
>> causing the crash?
>
> You mean kernel_set_cachemode wants a physical address?

No, it wants memory mapped using the page tables. Probably it will
work only for System RAM, not for MMIO mapped in head.S.

> Not sure the mapping in head.S is actually per transparent translation for
> 040 or 060. But I'll try with that chunk of code disabled (the early mapping
> is done as NOCACHE_SER so we don't really need all of that if the kernel is
> not in ST-RAM).

it's using mmu_map, not mmu_map_tt, so no transparent translation.

> The last log line I get is:
>
> atafb_init: start
> atafb_init: initializing Falcon hw
> atafb: screen_base ff001000 real_screen_base 00001000 screen_len 69632
> Determined 640x400, depth 1
>   virtual 640x870
>
> which is a bit further down.
>
> I guess it dies in register_framebuffer() - the next log entry is missing:
>
>        fb_info(&fb_info, "frame buffer device, using %dK of video memory\n",
>                screen_len >> 10);

And register_framebuffer() will write to the frame buffer, I think.
So info->screen_base may be incorrect.

Yep:

static void atafb_set_disp(struct fb_info *info)
{
        atafb_get_var(&info->var, info);
        atafb_get_fix(&info->fix, info);

        info->screen_base = (void *)info->fix.smem_start;
}

Missing atari_stram_to_virt().

Any other casts that indicate bugs? ;-)

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
