From: Greg Ungerer <gerg@snapgear.com>
Subject: Re: [PATCH 24/36] m68k: compile appropriate mm arch files for ColdFire
 V4e MMU support
Date: Mon, 31 Oct 2011 15:39:40 +1000
Message-ID: <4EAE349C.6060601@snapgear.com>
References: <1319527168-11166-1-git-send-email-gerg@snapgear.com>	<1319527168-11166-25-git-send-email-gerg@snapgear.com> <CAMuHMdUZqddsHwWoBqnB+nLBRqHOGOVZwqzoZGC0FEByDwA8kw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from sncsmrelay2.nai.com ([67.97.80.206]:43328 "EHLO
	sncsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752555Ab1JaFif (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Mon, 31 Oct 2011 01:38:35 -0400
In-Reply-To: <CAMuHMdUZqddsHwWoBqnB+nLBRqHOGOVZwqzoZGC0FEByDwA8kw@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org, Greg Ungerer <gerg@uclinux.org>

Hi Geert,

On 30/10/11 23:46, Geert Uytterhoeven wrote:
> On Tue, Oct 25, 2011 at 09:19,<gerg@snapgear.com>  wrote:
>> From: Greg Ungerer<gerg@uclinux.org>
>>
>> Compile the mcfmmu.c code when the ColdFire V4e MMU is enabled.
>> And don't compile the unnecessary hwtest.c code for it.
>>
>> Signed-off-by: Greg Ungerer<gerg@uclinux.org>
>> ---
>> arch/m68k/mm/Makefile | 8 +++++++-
>> 1 files changed, 7 insertions(+), 1 deletions(-)
>>
>> diff --git a/arch/m68k/mm/Makefile b/arch/m68k/mm/Makefile
>> index 09cadf1..1732e31 100644
>> --- a/arch/m68k/mm/Makefile
>> +++ b/arch/m68k/mm/Makefile
>> @@ -4,6 +4,12 @@
>>
>>  obj-y := init.o
>>
>> -obj-$(CONFIG_MMU)		+= cache.o fault.o hwtest.o
>> +obj-$(CONFIG_MMU)		+= cache.o fault.o
>>  obj-$(CONFIG_MMU_MOTOROLA)	+= kmap.o memory.o motorola.o
>>  obj-$(CONFIG_MMU_SUN3)	+= sun3kmap.o sun3mmu.o
>> +
>> +ifdef CONFIG_COLDFIRE
>> +obj-$(CONFIG_MMU)		+= kmap.o memory.o mcfmmu.o
>
> What about introducing CONFIG_MMU_COLDFIRE and writing
>
> obj-$(CONFIG_MMU_MOTOROLA)	+= kmap.o memory.o mcfmmu.o
>
> instead?
>
> It could turn out to be useful in other places too, especially when considering
> merging more mm/no sources files.

Yep, that is much nice. I'll change it.

Thanks
Greg


------------------------------------------------------------------------
Greg Ungerer  --  Principal Engineer        EMAIL:     gerg@snapgear.com
SnapGear Group, McAfee                      PHONE:       +61 7 3435 2888
8 Gardner Close                             FAX:         +61 7 3217 5323
Milton, QLD, 4064, Australia                WEB: http://www.SnapGear.com
