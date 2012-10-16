From: Philippe De Muyter <phdm@macqel.be>
Subject: Re: [PATCH 4/4 V2] Set ACR1 cache mode depending on kernel
	configuration.
Date: Tue, 16 Oct 2012 10:12:02 +0200
Message-ID: <20121016081202.GB8427@frolo.macqel>
References: <1350305680-5441-4-git-send-email-stany.marcel@novasys-ingenierie.com> <1350307377-7459-1-git-send-email-stany.marcel@novasys-ingenierie.com> <507CF03E.1000609@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from smtp2.macqel.be ([194.78.208.39]:23239 "EHLO smtp2.macqel.be"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754254Ab2JPIMI (ORCPT <rfc822;linux-m68k@vger.kernel.org>);
	Tue, 16 Oct 2012 04:12:08 -0400
Content-Disposition: inline
In-Reply-To: <507CF03E.1000609@snapgear.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Greg Ungerer <gerg@snapgear.com>
Cc: Stany MARCEL <stany.marcel@novasys-ingenierie.com>, linux-m68k@vger.kernel.org, gerg@uclinux.org

Hi Stany and Greg,

On Tue, Oct 16, 2012 at 03:27:26PM +1000, Greg Ungerer wrote:
> Hi Stany,
>
> On 15/10/12 23:22, Stany MARCEL wrote:
>> For coldfire with MMU enabled, data cache did not follow the configuration 
>> but
>> was configured in writethrough mode.
>>
>> Signed-off-by: Stany MARCEL <stany.marcel@novasys-ingenierie.com>
>
> Looks good, thanks. Applied without the white space changes.

Wouldn't it be better to move the test on CONFIG_CACHE_COPYBACK outside
of the test on CONFIG_MMU instead of duplicating it ?

Philippe

>
> Regards
> Greg
>
>
>> ---
>>
>> Changes:
>>    V2: This patch is now independant from the previous one
>>
>>   arch/m68k/include/asm/m54xxacr.h |   10 +++++++---
>>   1 file changed, 7 insertions(+), 3 deletions(-)
>>
>> diff --git a/arch/m68k/include/asm/m54xxacr.h 
>> b/arch/m68k/include/asm/m54xxacr.h
>> index 192bbfe..8f932be 100644
>> --- a/arch/m68k/include/asm/m54xxacr.h
>> +++ b/arch/m68k/include/asm/m54xxacr.h
>> @@ -94,14 +94,18 @@
>>    *	register region as non-cacheable. And then we map all our RAM as
>>    *	cacheable and supervisor access only.
>>    */
>> -#define ACR0_MODE	(ACR_BA(CONFIG_MBAR)+ACR_ADMSK(0x1000000)+ \
>> +#define ACR0_MODE	(ACR_BA(CONFIG_MBAR)+ACR_ADMSK(0x1000000)+	\
>>   			 ACR_ENABLE+ACR_SUPER+ACR_CM_OFF_PRE+ACR_SP)
>> +#if defined(CONFIG_CACHE_COPYBACK)
>>   #define ACR1_MODE	(ACR_BA(CONFIG_RAMBASE)+ACR_ADMSK(CONFIG_RAMSIZE)+ \
>> -			 ACR_ENABLE+ACR_SUPER+ACR_SP)
>> +			 ACR_ENABLE+ACR_SUPER+ACR_SP+ACR_CM_CP)
>> +#else
>> +#define ACR1_MODE	(ACR_BA(CONFIG_RAMBASE)+ACR_ADMSK(CONFIG_RAMSIZE)+ \
>> +			 ACR_ENABLE+ACR_SUPER+ACR_SP+ACR_CM_WT)
>> +#endif
>>   #define ACR2_MODE	0
>>   #define ACR3_MODE	(ACR_BA(CONFIG_RAMBASE)+ACR_ADMSK(CONFIG_RAMSIZE)+ \
>>   			 ACR_ENABLE+ACR_SUPER+ACR_SP)
>> -
>>   #else
>>
>>   /*
>> --
>> 1.7.9.5
