From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [RFC 2/8] m68k: fix build issue in setup_arch() when no FPU
Date: Wed, 8 Jul 2015 16:04:43 +0200
Message-ID: <CAMuHMdUgsJvq_FGvwHsi2VwdqK3Ro93q7OPdBJYAKFLHifesqg@mail.gmail.com>
References: <1436349092-2214-1-git-send-email-yannick.gicquel@gmail.com>
	<1436349092-2214-3-git-send-email-yannick.gicquel@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-ob0-f169.google.com ([209.85.214.169]:36378 "EHLO
	mail-ob0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S934795AbbGHOEo (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 8 Jul 2015 10:04:44 -0400
Received: by obdbs4 with SMTP id bs4so151188929obd.3
        for <linux-m68k@vger.kernel.org>; Wed, 08 Jul 2015 07:04:43 -0700 (PDT)
In-Reply-To: <1436349092-2214-3-git-send-email-yannick.gicquel@gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Yannick GICQUEL <yannick.gicquel@open.eurogiciel.org>
Cc: Linux/m68k <linux-m68k@vger.kernel.org>

On Wed, Jul 8, 2015 at 11:51 AM, Yannick GICQUEL
<yannick.gicquel@open.eurogiciel.org> wrote:
> diff --git a/arch/m68k/kernel/setup_mm.c b/arch/m68k/kernel/setup_mm.c
> index 5b8ec4d..0bc6f77 100644
> --- a/arch/m68k/kernel/setup_mm.c
> +++ b/arch/m68k/kernel/setup_mm.c
> @@ -245,7 +245,7 @@ void __init setup_arch(char **cmdline_p)
>          * We should really do our own FPU check at startup.
>          * [what do we do with buggy 68LC040s? if we have problems
>          *  with them, we should add a test to check_bugs() below] */
> -#ifndef CONFIG_M68KFPU_EMU_ONLY
> +#if !defined(CONFIG_M68KFPU_EMU_ONLY) && defined(CONFIG_FPU)
>         /* clear the fpu if we have one */
>         if (m68k_fputype & (FPU_68881|FPU_68882|FPU_68040|FPU_68060|FPU_COLDFIRE)) {
>                 volatile int zero = 0;

Should we turn M68KFPU_EMU_ONLY into !FPU in general?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
