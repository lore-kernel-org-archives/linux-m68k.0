From: Greg Ungerer <gerg@snapgear.com>
Subject: Re: [PATCH] m68k/m68knommu: merge MMU and non-MMU atomic.h
Date: Wed, 8 Sep 2010 10:25:08 +1000
Message-ID: <4C86D7E4.5040907@snapgear.com>
References: <201009070549.o875nKHX008042@goober.internal.moreton.com.au> <AANLkTikp0W54UDhrtxEiWMtUJ8adQMt1tMd3ckRrE=55@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from dalsmrelay2.nai.com ([205.227.136.216]:54282 "HELO
	dalsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S1753136Ab0IHAaq (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 7 Sep 2010 20:30:46 -0400
In-Reply-To: <AANLkTikp0W54UDhrtxEiWMtUJ8adQMt1tMd3ckRrE=55@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@vger.kernel.org, gerg@uclinux.org

Geert Uytterhoeven wrote:
> On Tue, Sep 7, 2010 at 07:49, Greg Ungerer <gerg@snapgear.com> wrote:
>> m68k/m68knommu: merge MMU and non-MMU atomic.h
>>
>> The only difference between the MMU and non-MMU versions of atomic.h
>> is in the extra support ColdFire family processors. So merge this into
>> the MMU version of atomic.h.
>>
>> Signed-off-by: Greg Ungerer <gerg@uclinux.org>
>> ---
>>  arch/m68k/include/asm/{atomic_mm.h => atomic.h} |   16 ++-
>>  arch/m68k/include/asm/atomic_no.h               |  155 -----------------------
>>  2 files changed, 13 insertions(+), 158 deletions(-)
>>  rename arch/m68k/include/asm/{atomic_mm.h => atomic.h} (92%)
>>  delete mode 100644 arch/m68k/include/asm/atomic_no.h
>>
>> diff --git a/arch/m68k/include/asm/atomic_mm.h b/arch/m68k/include/asm/atomic.h
>> similarity index 92%
>> rename from arch/m68k/include/asm/atomic_mm.h
>> rename to arch/m68k/include/asm/atomic.h
>> index 6a223b3..3db3c93 100644
>> --- a/arch/m68k/include/asm/atomic_mm.h
>> +++ b/arch/m68k/include/asm/atomic.h
> 
> arch/m68k/include/asm/atomic.h had a line
> 
> | #include <asm-generic/atomic64.h>
> 
> before, which is now gone? This break lib/atomic64.c.

Oops. Missed that when I copied over atomic_mm.h. I'll fix this,
and rename DI and send an updated patch.

Thanks
Greg


------------------------------------------------------------------------
Greg Ungerer  --  Principal Engineer        EMAIL:     gerg@snapgear.com
SnapGear Group, McAfee                      PHONE:       +61 7 3435 2888
8 Gardner Close                             FAX:         +61 7 3217 5323
Milton, QLD, 4064, Australia                WEB: http://www.SnapGear.com
