From: Greg Ungerer <gerg@snapgear.com>
Subject: Re: [PATCH 32/35] m68k: add ColdFire FPU support for the V4e ColdFire
 CPU's
Date: Wed, 28 Dec 2011 22:57:00 +1000
Message-ID: <4EFB121C.9010005@snapgear.com>
References: <1324610148-20666-1-git-send-email-gerg@snapgear.com>	<1324610148-20666-33-git-send-email-gerg@snapgear.com> <CAMuHMdVBGR9p1f_dnk8abYwosvBm9n7j1foaGd+gMESKXm8+Vw@mail.gmail.com> <4EFAAEF3.6010709@snapgear.com> <11354AB9-D311-41E8-9009-CF2DC3F9FA7A@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from dalsmrelay2.nai.com ([205.227.136.216]:28789 "EHLO
	dalsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752437Ab1L1M6h (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 28 Dec 2011 07:58:37 -0500
In-Reply-To: <11354AB9-D311-41E8-9009-CF2DC3F9FA7A@gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Joshua Juran <jjuran@gmail.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org, Greg Ungerer <gerg@uclinux.org>

Hi Joshua,

On 12/28/2011 09:17 PM, Joshua Juran wrote:
> On Dec 27, 2011, at 9:53 PM, Greg Ungerer wrote:
>
>>          if (CPU_IS_COLDFIRE) {
>>                  __asm__ volatile ("fsave %0"
>>                                    : : "m" (*sc->sc_fpstate) :
>> "memory");
>>          } else {
>>                  __asm__ volatile (".chip 68k/68881\n\t"
>>                                    "fsave %0\n\t"
>>                                    ".chip 68k"
>>                                    : : "m" (*sc->sc_fpstate) :
>> "memory");
>>          }
>>
>> I am still concerned about the use of ".chip 68k" in general though.
>> Just not sure how we can avoid it. I guess there is no way to jus
>> t revert to the original CPU choice?
>
> #define CPU "68040"
>
> _asm__ volatile (".chip 68k/68881\n\t"
>                    "fsave %0\n\t"
>                    ".chip " CPU
>                    : : "m" (*sc->sc_fpstate) : "memory");

Possibly.

Regards
Greg


------------------------------------------------------------------------
Greg Ungerer  --  Principal Engineer        EMAIL:     gerg@snapgear.com
SnapGear Group, McAfee                      PHONE:       +61 7 3435 2888
8 Gardner Close,                            FAX:         +61 7 3891 3630
Milton, QLD, 4064, Australia                WEB: http://www.SnapGear.com
