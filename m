From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 1/3] m68k/mac: Improve NMI handler
Date: Mon, 2 Jan 2017 11:29:40 +0100
Message-ID: <CAMuHMdWK1n9kyLhtNY8OKK6Yzo70QLsmAUc1TRLCdHNKWWdD7g@mail.gmail.com>
References: <cover.1483350483.git.fthain@telegraphics.com.au> <0cb5e92b377bea6699f8af8f5c5a97081a217f74.1483350483.git.fthain@telegraphics.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-io0-f193.google.com ([209.85.223.193]:35875 "EHLO
        mail-io0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932074AbdABK3l (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Mon, 2 Jan 2017 05:29:41 -0500
In-Reply-To: <0cb5e92b377bea6699f8af8f5c5a97081a217f74.1483350483.git.fthain@telegraphics.com.au>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Finn Thain <fthain@telegraphics.com.au>
Cc: Linux/m68k <linux-m68k@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

Hi Finn,

On Mon, Jan 2, 2017 at 10:53 AM, Finn Thain <fthain@telegraphics.com.au> wrote:
> mac_nmi_handler() is useless in its present form and locks up my PowerBook
> 180. Let's throw out the dead code and make it do something useful: print
> a register dump and a stack trace.
>
> mac_debug_handler() is also dead code. Remove it along with its static
> data.

Thanks for your patch!

> --- a/arch/m68k/mac/macints.c
> +++ b/arch/m68k/mac/macints.c
> @@ -127,12 +127,9 @@
>
>  #define SHUTUP_SONIC
>
> -/*
> - * console_loglevel determines NMI handler function
> - */
> +extern void show_registers(struct pt_regs *);

Seems like we do have a declaration in ... <linux/kprobes.h>.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
