From: Michael Schmitz <schmitzmic@googlemail.com>
Subject: Re: Atari TT (next)
Date: Mon, 9 Jan 2012 12:39:09 +1300
Message-ID: <CAOmrzkL45Tfs-t+BCoOTeKO4pb34gS9xeDh8-KyjnYETSfyNNA@mail.gmail.com>
References: <4F079F6B.8080502@fairlite.co.uk>
	<4F07EA66.6020603@gmail.com>
	<4F08E748.4020305@fairlite.co.uk>
	<4F0917E9.9090600@gmail.com>
	<CAMuHMdX2BaAp2N0e4aYPz7roaMFD14V1Y076geQQjpPw6-g-5Q@mail.gmail.com>
	<CAOmrzkJ6eCKCd0FRfYk7C5VvJeyhRT9Y7yy8m-mGPQeOaRScuQ@mail.gmail.com>
	<m2ipklluj4.fsf@igel.home>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pz0-f46.google.com ([209.85.210.46]:43471 "EHLO
	mail-pz0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754748Ab2AHXjJ (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 8 Jan 2012 18:39:09 -0500
Received: by dajs34 with SMTP id s34so1888409daj.19
        for <linux-m68k@vger.kernel.org>; Sun, 08 Jan 2012 15:39:09 -0800 (PST)
In-Reply-To: <m2ipklluj4.fsf@igel.home>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Andreas Schwab <schwab@linux-m68k.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Alan Hourihane <alanh@fairlite.co.uk>, Linux/m68k <linux-m68k@vger.kernel.org>

Hi Andreas,

>> support. Is there a strict requirement (from the kernel's early
>> startup and mem_init POV) that the kernel has to reside in the first
>> bootinfo memory chunk?
>
> It is a requirement that the kernel is mapped at virtual address zero
> since it is not relocatable.

That much I understand - but can we tweak the bootinfo to report the
chunks in physical address order? What I mean to say is - does the
first bootinfo chunk get mapped at virtual address zero always, or is
there some check to see what physical address corresponds to the
kernel segment?

Cheers,

  Michael
