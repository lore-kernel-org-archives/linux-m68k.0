From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] m68k: Increase initial mapping to 16MB if possible
Date: Tue, 29 Apr 2014 18:29:27 +0200
Message-ID: <CAMuHMdU50FnSD0K896b7aJN-RPXWpUoW46oiOFy-9AsYP2LGGQ@mail.gmail.com>
References: <87ppk7m3db.fsf@igel.home>
	<loom.20140429T121132-254@post.gmane.org>
	<8738gwxw53.fsf@igel.home>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pa0-f43.google.com ([209.85.220.43]:58055 "EHLO
	mail-pa0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751379AbaD2Q3c (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 29 Apr 2014 12:29:32 -0400
Received: by mail-pa0-f43.google.com with SMTP id rd3so465668pab.2
        for <linux-m68k@vger.kernel.org>; Tue, 29 Apr 2014 09:29:28 -0700 (PDT)
In-Reply-To: <8738gwxw53.fsf@igel.home>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Andreas Schwab <schwab@linux-m68k.org>
Cc: Thorsten Glaser <tg@debian.org>, Linux/m68k <linux-m68k@vger.kernel.org>

On Tue, Apr 29, 2014 at 12:33 PM, Andreas Schwab <schwab@linux-m68k.org> wrote:
> Thorsten Glaser <tg@debian.org> writes:
>
>> Andreas Schwab <schwab <at> linux-m68k.org> writes:
>>
>>> If the size of the first memory chunk is at least 16MB increase the
>>> initial mapping to 16MB instead of 4MB.  This makes it possible to map
>>
>> Why not always?
>
> Always what?

Always increases the initial mapping to 16 MiB.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
