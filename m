From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] m68k: Increase initial mapping to 16MB if possible
Date: Tue, 8 Jul 2014 09:23:05 +0200
Message-ID: <CAMuHMdVG3K=oQLCf_Dz7gBT6t2UVHtjHetz=hsyxs2JLQf5cNQ@mail.gmail.com>
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
	<CAMuHMdXz-ek=go9dV_rcDRKYYve3q80RASFjfJj4nTCe4aMVoQ@mail.gmail.com>
	<877g41dmoa.fsf@igel.home>
	<CAMuHMdWKSWeW61Xh5-e6y7MwsXDQMipeYz4+-CLJWommZkncqQ@mail.gmail.com>
	<87k37o4y4y.fsf@igel.home>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-la0-f42.google.com ([209.85.215.42]:57931 "EHLO
	mail-la0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750927AbaGHHXH (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 8 Jul 2014 03:23:07 -0400
Received: by mail-la0-f42.google.com with SMTP id pn19so3697719lab.1
        for <linux-m68k@vger.kernel.org>; Tue, 08 Jul 2014 00:23:05 -0700 (PDT)
In-Reply-To: <87k37o4y4y.fsf@igel.home>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Andreas Schwab <schwab@linux-m68k.org>
Cc: Michael Schmitz <schmitzmic@gmail.com>, Thorsten Glaser <tg@debian.org>, Linux/m68k <linux-m68k@vger.kernel.org>

Hi Andreas,

On Tue, Jul 8, 2014 at 12:11 AM, Andreas Schwab <schwab@linux-m68k.org> wrote:
>> Does this (whitespace-damaged) patch help?
>
> Yes, that helps.

Thanks for testing!

Sorry for breaking your patch.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
