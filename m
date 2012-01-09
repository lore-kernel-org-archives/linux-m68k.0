From: Michael Schmitz <schmitzmic@googlemail.com>
Subject: Re: Atari TT (next)
Date: Mon, 9 Jan 2012 13:05:38 +1300
Message-ID: <CAOmrzk+P3mPXu_Q_KxgEk_jx-JNhXY4ydrKoGM+43LpD5icTHw@mail.gmail.com>
References: <4F079F6B.8080502@fairlite.co.uk>
	<4F07EA66.6020603@gmail.com>
	<4F08E748.4020305@fairlite.co.uk>
	<4F0917E9.9090600@gmail.com>
	<4F0964EC.2080505@fairlite.co.uk>
	<CAOmrzkLH18VCY0dzJPM14dn5ccWmSBkiPzq8EFqnCDHiM3bECQ@mail.gmail.com>
	<4F0A2DD0.4000707@fairlite.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pw0-f46.google.com ([209.85.160.46]:33595 "EHLO
	mail-pw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754603Ab2AIAFi (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 8 Jan 2012 19:05:38 -0500
Received: by pbdu13 with SMTP id u13so1909197pbd.19
        for <linux-m68k@vger.kernel.org>; Sun, 08 Jan 2012 16:05:38 -0800 (PST)
In-Reply-To: <4F0A2DD0.4000707@fairlite.co.uk>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Alan Hourihane <alanh@fairlite.co.uk>
Cc: Linux/m68k <linux-m68k@vger.kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>

Hi Alan,

> I understand, but the STRAM allocator is broken. It gives out TT-RAM. It
> should never do that on a TT.

The ST-RAM allocator is used by a number of drivers, some of those
could actually use TT-RAM fine. But making the allocator fail instead
of returning TT-RAM would be an option.

>> You may have to pare the kernel down to the bare minimum (i.e.
>> modularize about everything you don't need to boot to initrd). Not
>> sure where the limit for this is these days.
>
> Already tried that. Still too big, because we need buffers from STRAM too.

What buffers? Filesystem buffers should be fine in TT-RAM. atafb
buffer requirement could be reduced by using a low-res video mode
perhaps (just to get past this point initially).

Cheers,

  Michael
