From: Michael Schmitz <schmitzmic@googlemail.com>
Subject: Re: Atari TT (next)
Date: Mon, 9 Jan 2012 12:42:24 +1300
Message-ID: <CAOmrzkJ03kc0ysyZx1uFqOhBGVScSaS5ZuG3oP9qzTkLWFXUQA@mail.gmail.com>
References: <4F079F6B.8080502@fairlite.co.uk>
	<4F07EA66.6020603@gmail.com>
	<4F08E748.4020305@fairlite.co.uk>
	<4F0917E9.9090600@gmail.com>
	<CAMuHMdX2BaAp2N0e4aYPz7roaMFD14V1Y076geQQjpPw6-g-5Q@mail.gmail.com>
	<CAOmrzkJ6eCKCd0FRfYk7C5VvJeyhRT9Y7yy8m-mGPQeOaRScuQ@mail.gmail.com>
	<CAMuHMdWDYC7v+QZ-jv0gjjcYfNCR8FOn+XCUBGhnRQ6zuQo2VQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pw0-f46.google.com ([209.85.160.46]:41289 "EHLO
	mail-pw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754655Ab2AHXmZ (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 8 Jan 2012 18:42:25 -0500
Received: by pbdu13 with SMTP id u13so1903746pbd.19
        for <linux-m68k@vger.kernel.org>; Sun, 08 Jan 2012 15:42:25 -0800 (PST)
In-Reply-To: <CAMuHMdWDYC7v+QZ-jv0gjjcYfNCR8FOn+XCUBGhnRQ6zuQo2VQ@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Alan Hourihane <alanh@fairlite.co.uk>, Linux/m68k <linux-m68k@vger.kernel.org>

Hi Geert,

>>> Being on the Zorro II bus (first 16 MiB), it's slow on most machines and doesn't
>>> support RMW cycles (needed for page tables) on Zorro III-capable machines.
>>> In general, we don't use Z2 RAM as system memory on Z3 capable machines.
>>
>> But is its physical address lower than the kernel segment's, as in this case?
>
> Yes, Zorro II space is the first 16 MiB.

Thanks, so there would be a similar situation where Z2 RAM would not
be accessible to mem_init on Amiga.

> But it's handled completely separately from system RAM.
> Its mapping is set up in mmu_init_amiga() in head.S.

Looks like we may need to do the same for the TT then.

Cheers,

  Michael
