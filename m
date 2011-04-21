From: Greg Ungerer <gerg@snapgear.com>
Subject: Re: [uClinux-dev] Re: [PATCH 5/5] m68k: merge non-mmu and mmu	versions
 of m68k_ksyms.c
Date: Thu, 21 Apr 2011 19:28:38 +1000
Message-ID: <4DAFF8C6.6080305@snapgear.com>
References: <1303346890-28249-1-git-send-email-gerg@snapgear.com> <1303346890-28249-2-git-send-email-gerg@snapgear.com> <1303346890-28249-3-git-send-email-gerg@snapgear.com> <1303346890-28249-4-git-send-email-gerg@snapgear.com> <1303346890-28249-5-git-send-email-gerg@snapgear.com> <1303346890-28249-6-git-send-email-gerg@snapgear.com> <BANLkTikwQZXjzXEZma41+Z0x4JRjZ1c6Dg@mail.gmail.com> <20110421083234.GC23491@frolo.macqel>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from sncsmrelay2.nai.com ([67.97.80.206]:24196 "EHLO
	sncsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752233Ab1DUJaf convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Thu, 21 Apr 2011 05:30:35 -0400
In-Reply-To: <20110421083234.GC23491@frolo.macqel>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Philippe De Muyter <phdm@macqel.be>
Cc: uClinux development list <uclinux-dev@uclinux.org>, linux-m68k@vger.kernel.org, Greg Ungerer <gerg@uclinux.org>

On 21/04/11 18:32, Philippe De Muyter wrote:
> On Thu, Apr 21, 2011 at 10:16:01AM +0200, Geert Uytterhoeven wrote:
>> On Thu, Apr 21, 2011 at 02:48,<gerg@snapgear.com>  wrote:
>>> +#ifndef CONFIG_MMU
>>
>> While we're at it, that should also be a test for not '020-'060/CPU3=
2?
>
> You beat me on this :)
>
> You're abolutely right, we may not test on CONFIG_MMU for mmu-capable
> coldfires, but which do lack 32x32->64 mulu and friends.

Yep, this should be the same. And I was trying to be careful
and get these right :-(

I'll fix it.

Thanks
Greg



>>> +/*
>>> + * Simpler 68k and ColdFire parts also need a few other gcc functi=
ons.
>>> + */
>>> +extern long long __divsi3(long long, long long);
>>> +extern long long __modsi3(long long, long long);
>>> +extern long long __mulsi3(long long, long long);
>>> +extern long long __udivsi3(long long, long long);
>>> +extern long long __umodsi3(long long, long long);
>>> +
>>> +EXPORT_SYMBOL(__divsi3);
>>> +EXPORT_SYMBOL(__modsi3);
>>> +EXPORT_SYMBOL(__mulsi3);
>>> +EXPORT_SYMBOL(__udivsi3);
>>> +EXPORT_SYMBOL(__umodsi3);
>>> =C3=A1#endif
>
> Philippe
>
>
>


--=20
-----------------------------------------------------------------------=
-
Greg Ungerer  --  Principal Engineer        EMAIL:     gerg@snapgear.co=
m
SnapGear Group, McAfee                      PHONE:       +61 7 3435 288=
8
8 Gardner Close                             FAX:         +61 7 3217 532=
3
Milton, QLD, 4064, Australia                WEB: http://www.SnapGear.co=
m
