From: Greg Ungerer <gerg@snapgear.com>
Subject: Re: [PATCH] m68k: merge the mmu and non-mmu kernel/Makefiles
Date: Mon, 15 Aug 2011 12:07:50 +1000
Message-ID: <4E487F76.9060909@snapgear.com>
References: <1313038044-25522-1-git-send-email-gerg@snapgear.com> <CAMuHMdWKBP5waPOrOaHN2pbsUyrur07Ok2dHFiuZi2xzPmD2AQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from dalsmrelay2.nai.com ([205.227.136.216]:60548 "EHLO
	dalsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750869Ab1HOCEQ (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 14 Aug 2011 22:04:16 -0400
In-Reply-To: <CAMuHMdWKBP5waPOrOaHN2pbsUyrur07Ok2dHFiuZi2xzPmD2AQ@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org, Greg Ungerer <gerg@uclinux.org>

Hi Geert,

On 14/08/11 00:27, Geert Uytterhoeven wrote:
> On Thu, Aug 11, 2011 at 06:47,<gerg@snapgear.com>  wrote:
>> --- a/arch/m68k/kernel/Makefile
>> +++ b/arch/m68k/kernel/Makefile
>> @@ -1,5 +1,20 @@
>> -ifdef CONFIG_MMU
>> -include arch/m68k/kernel/Makefile_mm
>> -else
>> -include arch/m68k/kernel/Makefile_no
>> +#
>> +# Makefile for the linux kernel.
>> +#
>> +
>> +extra-$(CONFIG_MMU) := head.o
>> +extra-$(CONFIG_SUN3) := sun3-head.o
>> +extra-y += vmlinux.lds
>> +
>> +obj-y := entry.o m68k_ksyms.o process.o ptrace.o setup.o signal.o \
>> + sys_m68k.o syscalltable.o time.o traps.o
>> +
>> +obj-y$(CONFIG_MMU_SUN3) += dma.o  # no, it's not a typo
>> +obj-$(CONFIG_MMU) += ints.o module.o devres.o
>
> On MMU, we unconditionally build module.c.
>
>> +devres-$(CONFIG_MMU)  = ../../../kernel/irq/devres.o
>> +
>> +ifndef CONFIG_MMU
>> +obj-y += init_task.o irq.o
>> +obj-$(CONFIG_MODULES) += module.o
>
> On nommu, it depends on CONFIG_MODULES.
>
> However, most inside module.c is already protected by #ifdef CONFIG_MODULES.
> Except for module_fixup(), which is empty for nommu. After moving the whole
> module_fixup() inside #ifdef CONFIG_MMU, you can consolidate the module.o
> entry in the Makefile.

Actually you don't even need to modify module.c to always build
at the moment. I can move to always building module.o, it costs
an extra 2 bytes in the final non-MMU/no-modules case :-)

Regards
Greg


------------------------------------------------------------------------
Greg Ungerer  --  Principal Engineer        EMAIL:     gerg@snapgear.com
SnapGear Group, McAfee                      PHONE:       +61 7 3435 2888
8 Gardner Close                             FAX:         +61 7 3217 5323
Milton, QLD, 4064, Australia                WEB: http://www.SnapGear.com
