From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] Platform code merge for 68000 core cpus
Date: Thu, 25 Oct 2012 20:40:47 +0200
Message-ID: <CAMuHMdV5TPLC+7mh8Xa6f=yds3mYG+neSiGY5WCx_qhrH3m4JQ@mail.gmail.com>
References: <1350953556-9759-1-git-send-email-ljalvs@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-la0-f46.google.com ([209.85.215.46]:44335 "EHLO
	mail-la0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1760027Ab2JYSkt (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Thu, 25 Oct 2012 14:40:49 -0400
Received: by mail-la0-f46.google.com with SMTP id h6so1828640lag.19
        for <linux-m68k@vger.kernel.org>; Thu, 25 Oct 2012 11:40:47 -0700 (PDT)
In-Reply-To: <1350953556-9759-1-git-send-email-ljalvs@gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Luis Alves <ljalvs@gmail.com>
Cc: uclinux-dev@uclinux.org, linux-m68k@vger.kernel.org, gerg@snapgear.com

On Tue, Oct 23, 2012 at 2:52 AM, Luis Alves <ljalvs@gmail.com> wrote:
> --- a/arch/m68k/Kconfig.cpu
> +++ b/arch/m68k/Kconfig.cpu
> @@ -35,7 +35,7 @@ endchoice
>  if M68KCLASSIC
>
>  config M68000
> -       bool
> +       bool "MC68000"
>         select CPU_HAS_NO_BITFIELDS
>         select CPU_HAS_NO_MULDIV64
>         select CPU_HAS_NO_UNALIGNED

This needs a "depends on !MMU".
Else allmodconfig will select it, causing -m68000 to be passed to the assembler,
which may break the build depending on your version of binutils, a.o.

arch/m68k/kernel/entry.S:186: Error: invalid instruction for this
architecture; needs 68020 or higher (68020 [68k, 68ec020], 68030
[68ec030], 68040 [68ec040], 68060 [68ec060]) -- statement `bfextu
%sp@(50){#0,#4},%d0' ignored
arch/m68k/kernel/entry.S:211: Error: invalid operand mode for this
architecture; needs 68020 or higher -- statement `jbsr
@(sys_call_table,%d0:l:4)@(0)' ignored

Cfr. http://kisskb.ellerman.id.au/kisskb/buildresult/7416877/

BTW, it didn't break the build on my ancient workhorse binutils, but that's no
guarantee it would boot...

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
