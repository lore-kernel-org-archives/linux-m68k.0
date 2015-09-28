From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] m68k: define asmlinkage_protect
Date: Mon, 28 Sep 2015 10:07:27 +0200
Message-ID: <CAMuHMdUbeiN4u3aU2FHP81tBDBVJKa3WSd0g13+eA_ayt-NKWQ@mail.gmail.com>
References: <876130j0wm.fsf@igel.home>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-ob0-f173.google.com ([209.85.214.173]:33890 "EHLO
	mail-ob0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756469AbbI1IH2 (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Mon, 28 Sep 2015 04:07:28 -0400
Received: by obbda8 with SMTP id da8so121929773obb.1
        for <linux-m68k@vger.kernel.org>; Mon, 28 Sep 2015 01:07:27 -0700 (PDT)
In-Reply-To: <876130j0wm.fsf@igel.home>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Andreas Schwab <schwab@linux-m68k.org>
Cc: Linux/m68k <linux-m68k@vger.kernel.org>

Hi Andreas,

On Wed, Sep 23, 2015 at 11:12 PM, Andreas Schwab <schwab@linux-m68k.org> wrote:
> Make sure the compiler does not modify arguments of syscall functions.
> This can happen if the compiler generates a tailcall to another
> function.  For example, without asmlinkage_protect sys_openat is compiled
> into this function:
>
> sys_openat:
>         clr.l %d0
>         move.w 18(%sp),%d0
>         move.l %d0,16(%sp)
>         jbra do_sys_open
>
> Note how the fourth argument is modified in place, modifying the register
> %d4 that gets restored from this stack slot when the function returns to
> user-space.  The caller may expect the register to be unmodified across
> system calls.
>
> Signed-off-by: Andreas Schwab <schwab@linux-m68k.org>

Thanks, applied and queued for v4.3 and stable.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
