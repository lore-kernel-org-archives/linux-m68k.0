From: Greg Ungerer <gerg@snapgear.com>
Subject: Re: [PATCH] m68k: switch to using asm-generic/hardirq.h
Date: Mon, 20 Sep 2010 15:58:48 +1000
Message-ID: <4C96F818.3030903@snapgear.com>
References: <201009070500.o8750l71006902@goober.internal.moreton.com.au> <AANLkTimx=kV5x2M3R34eUwTjAJU-F+PceZfvrhAJLQtx@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from dalsmrelay2.nai.com ([205.227.136.216]:63240 "HELO
	dalsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S1751370Ab0ITF77 (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Mon, 20 Sep 2010 01:59:59 -0400
In-Reply-To: <AANLkTimx=kV5x2M3R34eUwTjAJU-F+PceZfvrhAJLQtx@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@vger.kernel.org, gerg@uclinux.org


Hi Geert,

On 20/09/10 02:32, Geert Uytterhoeven wrote:
> On Tue, Sep 7, 2010 at 07:00, Greg Ungerer<gerg@snapgear.com>  wrote:
>>
>> Hi All,
>>
>> Is there any reason that the m68k arch cannot use the generic
>> hardirq.h support?
>>
>> It looks to be the same, unless I am missing something.
>
> Unfortunately it's not that simple: the m68k core doesn't use the
> generic hardirq
> code yet. Fixing header files it not enough.

Oh, yeah, I get that.

I did this based on visual inspection of the two files,
arch/m68k/include/asm/hardirq_mm.h and
include/asm-generic/hardirq.h.

They are almost the same (the irq_cpustat_t definition is identical).
Outside of a superfluous definition of ack_bad_irq the only difference
is the include of linux/irq.h. Is this enough to cause problems?


>> If it can then it is simple to merge the non-mmu and mmu
>> versions of hardirq.h.
>
> yeah, one more reason to migrate to generic hardirqs...

Indeed :-)

Regards
Greg


------------------------------------------------------------------------
Greg Ungerer  --  Principal Engineer        EMAIL:     gerg@snapgear.com
SnapGear Group, McAfee                      PHONE:       +61 7 3435 2888
8 Gardner Close                             FAX:         +61 7 3217 5323
Milton, QLD, 4064, Australia                WEB: http://www.SnapGear.com
