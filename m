From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] m68k: Increase initial mapping to 16MB if possible
Date: Sat, 28 Jun 2014 16:29:07 +0200
Message-ID: <CAMuHMdV7QTMN+2C4OOf_zyKQ43oXec8g8T9g2qE+jNNU2HFW4w@mail.gmail.com>
References: <87ppk7m3db.fsf@igel.home>
	<loom.20140429T121132-254@post.gmane.org>
	<8738gwxw53.fsf@igel.home>
	<CAMuHMdU50FnSD0K896b7aJN-RPXWpUoW46oiOFy-9AsYP2LGGQ@mail.gmail.com>
	<87sioww0gb.fsf@igel.home>
	<5360A881.7040107@gmail.com>
	<alpine.DEB.2.02.1405251846540.6045@ayla.of.borg>
	<87k381dwwj.fsf@igel.home>
	<CAMuHMdXseK3HydzVyQdSFQg93bOa1Uo29mg=EEHpT_9A3A1+pQ@mail.gmail.com>
	<87fvipdtz8.fsf@igel.home>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-lb0-f182.google.com ([209.85.217.182]:32872 "EHLO
	mail-lb0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752534AbaF1O3K (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sat, 28 Jun 2014 10:29:10 -0400
Received: by mail-lb0-f182.google.com with SMTP id c11so4662336lbj.41
        for <linux-m68k@vger.kernel.org>; Sat, 28 Jun 2014 07:29:08 -0700 (PDT)
In-Reply-To: <87fvipdtz8.fsf@igel.home>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Andreas Schwab <schwab@linux-m68k.org>
Cc: Michael Schmitz <schmitzmic@gmail.com>, Thorsten Glaser <tg@debian.org>, Linux/m68k <linux-m68k@vger.kernel.org>

Hi Andreas,

On Sat, Jun 28, 2014 at 3:49 PM, Andreas Schwab <schwab@linux-m68k.org> wrote:
> Geert Uytterhoeven <geert@linux-m68k.org> writes:
>> On Sat, Jun 28, 2014 at 2:46 PM, Andreas Schwab <schwab@linux-m68k.org> wrote:
>>> Geert Uytterhoeven <geert@linux-m68k.org> writes:
>>>> Andreas, I amended your patch like below, and plan to queue it for 3.16.
>>>
>>> That doesn't work.
>>
>> What doesn't work?
>
> Your amendment.

In what way doesn't it work?
Can you please be a bit clearer? Thanks!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
