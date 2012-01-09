From: Michael Schmitz <schmitzmic@googlemail.com>
Subject: Re: Atari TT (next)
Date: Mon, 9 Jan 2012 16:17:45 +1300
Message-ID: <CAOmrzk+oAirskzpbg0RK9HGS1wp0yqvR3E5z79060FhwMnNk9A@mail.gmail.com>
References: <4F079F6B.8080502@fairlite.co.uk>
	<4F07EA66.6020603@gmail.com>
	<4F08E748.4020305@fairlite.co.uk>
	<4F0917E9.9090600@gmail.com>
	<4F0964EC.2080505@fairlite.co.uk>
	<CAOmrzkLH18VCY0dzJPM14dn5ccWmSBkiPzq8EFqnCDHiM3bECQ@mail.gmail.com>
	<4F0A2DD0.4000707@fairlite.co.uk>
	<CAOmrzk+P3mPXu_Q_KxgEk_jx-JNhXY4ydrKoGM+43LpD5icTHw@mail.gmail.com>
	<m262gllo5h.fsf@igel.home>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pw0-f46.google.com ([209.85.160.46]:61746 "EHLO
	mail-pw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755164Ab2AIDRp (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 8 Jan 2012 22:17:45 -0500
Received: by pbdu13 with SMTP id u13so1963351pbd.19
        for <linux-m68k@vger.kernel.org>; Sun, 08 Jan 2012 19:17:45 -0800 (PST)
In-Reply-To: <m262gllo5h.fsf@igel.home>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Andreas Schwab <schwab@linux-m68k.org>
Cc: Alan Hourihane <alanh@fairlite.co.uk>, Linux/m68k <linux-m68k@vger.kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>

Andreas,

On Mon, Jan 9, 2012 at 1:23 PM, Andreas Schwab <schwab@linux-m68k.org> wrote:
> Michael Schmitz <schmitzmic@googlemail.com> writes:
>
>> Hi Alan,
>>
>>> I understand, but the STRAM allocator is broken. It gives out TT-RAM. It
>>> should never do that on a TT.
>>
>> The ST-RAM allocator is used by a number of drivers, some of those
>> could actually use TT-RAM fine.
>
> There is no point in calling atari_stram_alloc if you don't need ST-RAM.
> Of course, all uses are because they *can't* use TT-RAM.

I stand corrected - we should indeed make it fail by default if no
ST-RAM is available then.

Cheers,

  Michael
