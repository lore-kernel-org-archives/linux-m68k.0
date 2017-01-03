From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 1/3] m68k/mac: Improve NMI handler
Date: Tue, 3 Jan 2017 09:17:18 +0100
Message-ID: <CAMuHMdWsOk0_mj=MBXi_p8Ks5YsTa+6y8t6qM=ZWJQWWpJTuRA@mail.gmail.com>
References: <cover.1483350483.git.fthain@telegraphics.com.au>
 <0cb5e92b377bea6699f8af8f5c5a97081a217f74.1483350483.git.fthain@telegraphics.com.au>
 <CAMuHMdWK1n9kyLhtNY8OKK6Yzo70QLsmAUc1TRLCdHNKWWdD7g@mail.gmail.com> <alpine.LNX.2.00.1701031310520.24826@nippy.intranet>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-it0-f67.google.com ([209.85.214.67]:36828 "EHLO
        mail-it0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933986AbdACIRU (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Tue, 3 Jan 2017 03:17:20 -0500
In-Reply-To: <alpine.LNX.2.00.1701031310520.24826@nippy.intranet>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Finn Thain <fthain@telegraphics.com.au>
Cc: Linux/m68k <linux-m68k@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

Hi Finn,

On Tue, Jan 3, 2017 at 5:31 AM, Finn Thain <fthain@telegraphics.com.au> wrote:
> On Mon, 2 Jan 2017, Geert Uytterhoeven wrote:
>> >
>> > -/*
>> > - * console_loglevel determines NMI handler function
>> > - */
>> > +extern void show_registers(struct pt_regs *);
>>
>> Seems like we do have a declaration in ... <linux/kprobes.h>.
>
> Yes, and it would have to be moved outside of the #ifdef CONFIG_KPROBES
> portion before it could be used by m68k, openrisc, cris or mn10300, which
> all lack HAVE_KPROBES.

Right, seems my manual cpp made a mistake here. It's indeed inside.

> Or we could just leave the patch as it is, because thus far m68k has no
> need for any declaration except a sole call site in macints.c.

Fine for me. Sorry for the noise.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
