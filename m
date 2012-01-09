From: Alan Hourihane <alanh@fairlite.co.uk>
Subject: Re: Atari TT (next)
Date: Mon, 09 Jan 2012 00:14:13 +0000
Message-ID: <4F0A3155.5010906@fairlite.co.uk>
References: <4F079F6B.8080502@fairlite.co.uk> <4F07EA66.6020603@gmail.com> <4F08E748.4020305@fairlite.co.uk> <4F0917E9.9090600@gmail.com> <4F0964EC.2080505@fairlite.co.uk> <CAOmrzkLH18VCY0dzJPM14dn5ccWmSBkiPzq8EFqnCDHiM3bECQ@mail.gmail.com> <4F0A2DD0.4000707@fairlite.co.uk> <CAOmrzk+P3mPXu_Q_KxgEk_jx-JNhXY4ydrKoGM+43LpD5icTHw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from fairlite.demon.co.uk ([80.176.228.186]:56172 "EHLO
	fairlite.demon.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754738Ab2AIAOV (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 8 Jan 2012 19:14:21 -0500
In-Reply-To: <CAOmrzk+P3mPXu_Q_KxgEk_jx-JNhXY4ydrKoGM+43LpD5icTHw@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitzmic@googlemail.com>
Cc: Linux/m68k <linux-m68k@vger.kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>

On 09/01/12 00:05, Michael Schmitz wrote:
> Hi Alan,
>
>> I understand, but the STRAM allocator is broken. It gives out TT-RAM. It
>> should never do that on a TT.
> The ST-RAM allocator is used by a number of drivers, some of those
> could actually use TT-RAM fine. But making the allocator fail instead
> of returning TT-RAM would be an option.

Yes, adding a flag to say ONLY_STRAM would work. But the function itself
is called atari_stram_alloc()/free(). And if that goes allocating TT-RAM
there's a function name problem there. Very confusing.

>>> You may have to pare the kernel down to the bare minimum (i.e.
>>> modularize about everything you don't need to boot to initrd). Not
>>> sure where the limit for this is these days.
>> Already tried that. Still too big, because we need buffers from STRAM too.
> What buffers? Filesystem buffers should be fine in TT-RAM. atafb
> buffer requirement could be reduced by using a low-res video mode
> perhaps (just to get past this point initially).
>

I'll try again as I probably didn't try after getting past the
unexpected interrupt issue.

Alan.
