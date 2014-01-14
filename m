From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] m68k/mac: Make SCC reset work more reliably
Date: Tue, 14 Jan 2014 09:52:29 +0100
Message-ID: <CAMuHMdWuGPjyU_7fQKzgFsjm2w5wH38rSi_8ct7OiskZkrz+ng@mail.gmail.com>
References: <alpine.LNX.2.00.1401122320210.21591@nippy.intranet>
	<CAMuHMdXtAzA_UPJS_OaMSSxGE493uqGGCNVwy_RMrNoPBxxmDw@mail.gmail.com>
	<alpine.LNX.2.00.1401141907220.12677@nippy.intranet>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pd0-f169.google.com ([209.85.192.169]:64077 "EHLO
	mail-pd0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750928AbaANIw3 (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 14 Jan 2014 03:52:29 -0500
Received: by mail-pd0-f169.google.com with SMTP id g10so2361879pdj.28
        for <linux-m68k@vger.kernel.org>; Tue, 14 Jan 2014 00:52:29 -0800 (PST)
In-Reply-To: <alpine.LNX.2.00.1401141907220.12677@nippy.intranet>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Finn Thain <fthain@telegraphics.com.au>
Cc: Linux/m68k <linux-m68k@vger.kernel.org>

On Tue, Jan 14, 2014 at 9:31 AM, Finn Thain <fthain@telegraphics.com.au> wrote:
> On Mon, 13 Jan 2014, Geert Uytterhoeven wrote:
>> On Sun, Jan 12, 2014 at 2:56 PM, Finn Thain <fthain@telegraphics.com.au>
>> wrote:
>> > For SCC initialization we cannot assume that the control register is
>> > in the correct state to accept a register pointer. So first read from
>> > the control register in order to "sync" up.
>> >
>> > Signed-off-by: Finn Thain <fthain@telegraphics.com.au>
>>
>> Thaks for your patch!
>>
>> > ---
>> >
>
>> > This patch fixes a boot failure (presumably caused by unhandled SCC
>> > interrupt) on PowerBook 180 with CONFIG_EARLY_PRINTK and with the
>> > bootloader not configured to wake up the serial ports.
>
>> > AFAIK this happens only on PowerBooks. Even with this fix, Penguin
>> > still has to wake the serial ports or else they don't function on
>> > PowerBooks like this one.
>
>> IMHO the above should be part of the patch description (i.e. above the
>> three dashes), as it contains valuable information. Is that OK for you?
>
> The first part is good information, especially if this were submitted to
> -stable.
>
> The rest, beginning with "AFAIK", is really guesswork based on anecdote
> (e.g. reports from users not affected). Even the mailing list archives are
> perhaps too permanent (e.g. the need for the wake-up workaround may go
> away one day).

OK.

> I'm unsure about submitting this to -stable. I don't like the idea that
> the first debian user to boot a powerbook might see a crash (depending on
> bootloader etc). But not all stable trees carry df66834a which is a
> prerequisite. This patch is only applicable to 3.4.y and >= 3.9.y. Can you
> nominate particular stable trees?

Sure, just add it to the comment, cfr. Documentation/stable_kernel_rules.txt:

 - If the patch requires other patches as prerequisites which can be
   cherry-picked than this can be specified in the following format in
   the sign-off area:

     Cc: <stable@vger.kernel.org> # 3.3.x: a1f84a3: sched: Check for idle
     Cc: <stable@vger.kernel.org> # 3.3.x: 1b9508f: sched: Rate-limit newidle
     Cc: <stable@vger.kernel.org> # 3.3.x: fd21073: sched: Fix affinity logic
     Cc: <stable@vger.kernel.org> # 3.3.x

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
