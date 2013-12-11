From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH/RFC] futex: Switch to USER_DS for futex test
Date: Wed, 11 Dec 2013 10:04:24 +0100
Message-ID: <CAMuHMdXiAF6sZAZiUpRU7WvzVXM0QLqs50OS037UvQWVapL7Ug@mail.gmail.com>
References: <1386706216-17764-1-git-send-email-geert@linux-m68k.org>
	<alpine.LNX.2.00.1312110830200.19724@nippy.intranet>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pb0-f53.google.com ([209.85.160.53]:53938 "EHLO
	mail-pb0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751278Ab3LKJEZ (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 11 Dec 2013 04:04:25 -0500
Received: by mail-pb0-f53.google.com with SMTP id ma3so9541718pbc.12
        for <linux-m68k@vger.kernel.org>; Wed, 11 Dec 2013 01:04:25 -0800 (PST)
In-Reply-To: <alpine.LNX.2.00.1312110830200.19724@nippy.intranet>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Finn Thain <fthain@telegraphics.com.au>
Cc: Tuxist <tuxist@tuxist.de>, Patrick McCarthy <patrickjmc@gmail.com>, Andreas Schwab <schwab@linux-m68k.org>, Linux/m68k <linux-m68k@vger.kernel.org>

On Tue, Dec 10, 2013 at 11:08 PM, Finn Thain <fthain@telegraphics.com.au> wrote:
> On Tue, 10 Dec 2013, Geert Uytterhoeven wrote:
>
>> Fix this by switching to USER_DS before running the test, and restoring
>> the old address space afterwards.
>
> Yep, that fixed it. Thankyou Geert and Andreas.
>
> I tested your patch by booting to busybox from initramfs. Please ignore
> the PMU driver and RTC errors in the log below; I've never seen the PMU
> driver work on PowerBook 1XX series hardware. Hence no RTC or ADB and
> hence the serial console. The "Bus error in macscsi_pread" message is also
> normal.

Thanks!

I'll add your Tested-by and submit for upstream/stable.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
