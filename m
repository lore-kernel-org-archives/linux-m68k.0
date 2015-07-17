From: Yannick GICQUEL <yannick.gicquel@open.eurogiciel.org>
Subject: Re: [RFC 6/8] m68k: m5441x: set rambar to end of SRAM physical addr
 space
Date: Fri, 17 Jul 2015 12:47:06 +0200
Message-ID: <55A8DD2A.5030506@open.eurogiciel.org>
References: <1436349092-2214-1-git-send-email-yannick.gicquel@gmail.com> <1436349092-2214-7-git-send-email-yannick.gicquel@gmail.com> <559D2B63.2000007@westnet.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-wg0-f52.google.com ([74.125.82.52]:33973 "EHLO
	mail-wg0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1946106AbbGQKrK (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Fri, 17 Jul 2015 06:47:10 -0400
Received: by wgkl9 with SMTP id l9so79046281wgk.1
        for <linux-m68k@vger.kernel.org>; Fri, 17 Jul 2015 03:47:08 -0700 (PDT)
In-Reply-To: <559D2B63.2000007@westnet.com.au>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Greg Ungerer <gregungerer@westnet.com.au>, linux-m68k@vger.kernel.org
Cc: yannick.gicquel@open.eurogiciel.org

Hi Greg,

Le 08/07/2015 15:53, Greg Ungerer a =E9crit :
> Hi Yannick,
>
> On 08/07/15 19:51, Yannick GICQUEL wrote:
>> Even if SRAM is not used, this is required to avoid inconsistency at=
=20
>> runtime.
>> Otherwise, an assertion failed in ld.so during init process executio=
n:
>>
>> Inconsistency detected by ld.so: rtld.c: 1290: dl_main: Assertion=20
>> `_rtld_local._dl_rtld_map.l_libname' failed!
>
> Can you explain further?
> Is this really the underlying problem?
> Surely the presence of the SRAM block mapped in shouldn't
> have any impact on running applications.

I think this is due to SRAM backdoor default activation on m5441x.

cf. reference manual (p.190):
(...)By default, the RAMBAR is invalid, but the backdoor is enabled. In=
=20
this state, any core accesses to the SRAM are routed through the=20
backdoor(...)

Also, i think this backdoor must be disabled. In section 4.3.1.2.3, its=
=20
explained the "the address mode for normal accesses is determined by th=
e=20
MMUBAR, RAMBARs, and ACRs in the priority order listed(...)", before=20
handling these accesses as virtual addresses.

Thus, when the backdoor is enable, the virtual address translation is=20
not performed for the SRAM 64Kb range.


I just realized that i didn't simply try disabling the backdoor by=20
setting RAMBAR to 0.
I have just done this test and this seems sufficient to fix the=20
assertion failed at ld.so
execution.

> Where does CONFIG_SRAM_BASE come from?
> I didn't see in this series anywhere.
Old "artifact" from initial FSL BSP ; agreed : it should not be=20
delivered as is.
Also, may be this code could be moved outside head.S and put in a m5441=
=20
related file... it need a try before patch update.

> Regards
> Greg
>
>
>
>> Signed-off-by: Yannick GICQUEL <yannick.gicquel@gmail.com>
>> ---
>>   arch/m68k/coldfire/head.S | 9 +++++++++
>>   1 file changed, 9 insertions(+)
>>
>> diff --git a/arch/m68k/coldfire/head.S b/arch/m68k/coldfire/head.S
>> index fa31be2..bf39885 100644
>> --- a/arch/m68k/coldfire/head.S
>> +++ b/arch/m68k/coldfire/head.S
>> @@ -151,6 +151,15 @@ _start0:
>>
>>   _start:
>>       nop                    /* filler */
>> +#if defined(CONFIG_M5441x)
>> +#if defined(CONFIG_SRAM_BASE)
>> +    movel    #(CONFIG_SRAM_BASE+0x221), %d0
>> +#else
>> +    movel    #(0x8ff00000+0x221), %d0
>> +#endif
>> +    movec    %d0, %rambar1
>> +#endif
>> +
>>       movew    #0x2700, %sr            /* no interrupts */
>>       movel    #CACHE_INIT,%d0            /* disable cache */
>>       movec    %d0,%CACR
>>
>
