From: Michael Schmitz <schmitzmic@googlemail.com>
Subject: Re: Atari TT (next)
Date: Mon, 9 Jan 2012 12:58:16 +1300
Message-ID: <CAOmrzkKnFqvwfueSpMGdHWkC2n=cMdaNbLL1Bms4ezaZhGa-7w@mail.gmail.com>
References: <4F079F6B.8080502@fairlite.co.uk>
	<4F07EA66.6020603@gmail.com>
	<4F08E748.4020305@fairlite.co.uk>
	<4F0917E9.9090600@gmail.com>
	<CAMuHMdX2BaAp2N0e4aYPz7roaMFD14V1Y076geQQjpPw6-g-5Q@mail.gmail.com>
	<CAOmrzkJ6eCKCd0FRfYk7C5VvJeyhRT9Y7yy8m-mGPQeOaRScuQ@mail.gmail.com>
	<m2ipklluj4.fsf@igel.home>
	<CAOmrzkL45Tfs-t+BCoOTeKO4pb34gS9xeDh8-KyjnYETSfyNNA@mail.gmail.com>
	<4F0A2B8B.5060802@fairlite.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pw0-f46.google.com ([209.85.160.46]:56017 "EHLO
	mail-pw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754738Ab2AHX6R (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 8 Jan 2012 18:58:17 -0500
Received: by pbdu13 with SMTP id u13so1907375pbd.19
        for <linux-m68k@vger.kernel.org>; Sun, 08 Jan 2012 15:58:17 -0800 (PST)
In-Reply-To: <4F0A2B8B.5060802@fairlite.co.uk>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Alan Hourihane <alanh@fairlite.co.uk>
Cc: Andreas Schwab <schwab@linux-m68k.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Linux/m68k <linux-m68k@vger.kernel.org>

Hi Alan,

>> That much I understand - but can we tweak the bootinfo to report the
>> chunks in physical address order? What I mean to say is - does the
>> first bootinfo chunk get mapped at virtual address zero always, or is
>> there some check to see what physical address corresponds to the
>> kernel segment?
>>
>
> From what I can see the first mem_info struct is always mapped at VA 0
> which is done in paging_init() in mm/motorola.c

Thanks - I've got no kernel tree in front of me (no m68k hacking while
at work) so I'm working from (fuzzy) memory only.

Meaning the kernel has to reside in the first chunk then. B*gger.

OK, let's assume we

1) reorder the mem chunks in PA order

2) keep note which was the first chunk initially, and map that one to
VA 0 (instead of the first reordered one)

Does this break any assumptions in paging_init?

Cheers,

  Michael
