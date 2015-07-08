From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [RFC 1/8] m68k: coldfire: unlink FPU presence from MMU activation
Date: Wed, 8 Jul 2015 16:20:16 +0200
Message-ID: <CAMuHMdX7w+WkTomHWY5DDCnHArnJHJbLocw3zOrHXvywEBOhpg@mail.gmail.com>
References: <1436349092-2214-1-git-send-email-yannick.gicquel@gmail.com>
	<1436349092-2214-2-git-send-email-yannick.gicquel@gmail.com>
	<CAMuHMdXUh0JdQGzrzedskVhAHiBGvXMwJ7=44kDN5Qagj92icA@mail.gmail.com>
	<559D2FD2.5030206@westnet.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-ob0-f179.google.com ([209.85.214.179]:35827 "EHLO
	mail-ob0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758247AbbGHOUQ (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 8 Jul 2015 10:20:16 -0400
Received: by obbop1 with SMTP id op1so151426500obb.2
        for <linux-m68k@vger.kernel.org>; Wed, 08 Jul 2015 07:20:16 -0700 (PDT)
In-Reply-To: <559D2FD2.5030206@westnet.com.au>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Greg Ungerer <gregungerer@westnet.com.au>
Cc: Yannick GICQUEL <yannick.gicquel@open.eurogiciel.org>, Linux/m68k <linux-m68k@vger.kernel.org>

On Wed, Jul 8, 2015 at 4:12 PM, Greg Ungerer <gregungerer@westnet.com.au> wrote:
>>> --- a/arch/m68k/Kconfig.cpu
>>> +++ b/arch/m68k/Kconfig.cpu
>>> @@ -257,6 +257,7 @@ config M54xx
>>>   config M547x
>>>          bool "MCF547x"
>>>          select M54xx
>>> +       select FPU
>>
>>
>> ... perhaps the "select FPU" should be added to M68KCLASSIC, too,
>> so we can get rid of the top one?
>
>
> We use M68KCLASSIC for the non-MMU 68k families as well, and none
> of those have FPU either. Maybe should we select FPU for each of
> M68020, M68030, M68040 and M68060 in their configs?

Yep, makes sense.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
