From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v3 2/4] m68k/atari - atafb: convert allocation of fb ram
 to new interface
Date: Mon, 31 Mar 2014 11:12:07 +0200
Message-ID: <CAMuHMdX+pZ_HAtODJ6zvxjxBHYpbmvG1QcBLwC-hYu_fW7HfXQ@mail.gmail.com>
References: <1396253168-25601-1-git-send-email-schmitz@debian.org>
	<1396253168-25601-3-git-send-email-schmitz@debian.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pd0-f169.google.com ([209.85.192.169]:63177 "EHLO
	mail-pd0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753766AbaCaJMH (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Mon, 31 Mar 2014 05:12:07 -0400
Received: by mail-pd0-f169.google.com with SMTP id fp1so7749622pdb.0
        for <linux-m68k@vger.kernel.org>; Mon, 31 Mar 2014 02:12:07 -0700 (PDT)
In-Reply-To: <1396253168-25601-3-git-send-email-schmitz@debian.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitzmic@gmail.com>
Cc: Linux/m68k <linux-m68k@vger.kernel.org>, Debian m68k <debian-68k@lists.debian.org>, Michael Schmitz <schmitz@debian.org>

Hi Michael,

On Mon, Mar 31, 2014 at 10:06 AM, Michael Schmitz <schmitzmic@gmail.com> wrote:
> The new atari_stram_alloc interface returns kernel virtual addresses
> even if the kernel runs in FastRAM. These addresses are not
> guaranteed to be identical with the physical addresses. Since ST-RAM
> mappings have not been set up by mem_init, virt_to_phys() and its
> cousin do not work and the atari_stram_to_phys() etc. helpers must
> be used to determine physical addresses.

Thanks!

> @@ -2213,7 +2214,7 @@ static int ext_encode_var(struct fb_var_screeninfo *var, struct atafb_par *par)
>
>  static void ext_get_par(struct atafb_par *par)
>  {
> -       par->screen_base = external_addr;
> +       par->screen_base =external_screen_base;

I'll add the missing space after "=".

> +               external_screen_base = ioremap_writethrough((unsigned long)external_addr,
>                                                      external_len);

I'll remove the now superfluous cast.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
