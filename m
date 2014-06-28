From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] m68k: Increase initial mapping to 16MB if possible
Date: Sat, 28 Jun 2014 17:55:14 +0200
Message-ID: <CAMuHMdXz-ek=go9dV_rcDRKYYve3q80RASFjfJj4nTCe4aMVoQ@mail.gmail.com>
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
	<CAMuHMdV7QTMN+2C4OOf_zyKQ43oXec8g8T9g2qE+jNNU2HFW4w@mail.gmail.com>
	<87bntddrto.fsf@igel.home>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-lb0-f176.google.com ([209.85.217.176]:64049 "EHLO
	mail-lb0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751129AbaF1PzQ (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sat, 28 Jun 2014 11:55:16 -0400
Received: by mail-lb0-f176.google.com with SMTP id w7so4721145lbi.7
        for <linux-m68k@vger.kernel.org>; Sat, 28 Jun 2014 08:55:15 -0700 (PDT)
In-Reply-To: <87bntddrto.fsf@igel.home>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Andreas Schwab <schwab@linux-m68k.org>
Cc: Michael Schmitz <schmitzmic@gmail.com>, Thorsten Glaser <tg@debian.org>, Linux/m68k <linux-m68k@vger.kernel.org>

Hi Andreas,

On Sat, Jun 28, 2014 at 4:36 PM, Andreas Schwab <schwab@linux-m68k.org> wrote:
>> In what way doesn't it work?
>
> [    0.000000] bootmem alloc of 4096 bytes failed!

Interesting. I don't think there are any logical differences between my and
your version, if you have 16 MiB in the first chunk.

Perhaps my changes cause one of the sections to grow or shrink by one
page, leading to a shortage of one page in the bootmem for you?

Do you know where exactly it fails to allocate one page? Is this while mapping
the pages for the rest of RAM? If yes, I guess this failure can be
triggered with
some specific memory configuration with your original version, too.

Thanks!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
