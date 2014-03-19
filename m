From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 2/2] m68k/atari - atafb: convert allocation of fb ram to
 new interface
Date: Wed, 19 Mar 2014 09:01:20 +0100
Message-ID: <CAMuHMdVriMKQrNjxBnPDekVAzML5Np-ygvN57OTcTMxO97rsfQ@mail.gmail.com>
References: <1395213784-3249-1-git-send-email-schmitz@debian.org>
	<1395213784-3249-2-git-send-email-schmitz@debian.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pd0-f175.google.com ([209.85.192.175]:38591 "EHLO
	mail-pd0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750758AbaCSIBV (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 19 Mar 2014 04:01:21 -0400
Received: by mail-pd0-f175.google.com with SMTP id x10so8297835pdj.34
        for <linux-m68k@vger.kernel.org>; Wed, 19 Mar 2014 01:01:20 -0700 (PDT)
In-Reply-To: <1395213784-3249-2-git-send-email-schmitz@debian.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitzmic@gmail.com>
Cc: Linux/m68k <linux-m68k@vger.kernel.org>, Debian m68k <debian-68k@lists.debian.org>, Michael Schmitz <schmitz@debian.org>

On Wed, Mar 19, 2014 at 8:23 AM, Michael Schmitz <schmitzmic@gmail.com> wrote:
> @@ -3166,7 +3166,7 @@ int __init atafb_init(void)
>                 memset(screen_base, 0, mem_req);
>                 pad = -(unsigned long)screen_base & (PAGE_SIZE - 1);
>                 screen_base += pad;
> -               real_screen_base = screen_base + ovsc_offset;
> +               real_screen_base = atari_stram_to_phys((unsigned long) (screen_base + ovsc_offset));

This triggered my eye, but it's actually correct, as it's stored in
fix->smem_start,
which should be the physical address.

But the external_addr case is wrong ;-)

>                 screen_len = (mem_req - pad - ovsc_offset) & PAGE_MASK;
>                 st_ovsc_switch();
>                 if (CPU_IS_040_OR_060) {

Starting here, you have:

        cache_push(virt_to_phys(screen_base), screen_len);

atari_stram_to_phys()

        kernel_set_cachemode(screen_base, screen_len,
                                                     IOMAP_WRITETHROUGH);

woops, that won't work with the virt_to_phys() above, nor with transparent
translation. I guess it writes to a non-existent pointer table,
causing the crash?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
