From: Greg Ungerer <gerg@snapgear.com>
Subject: Re: [PATCH] m68k: selection of GENERIC_IRQ_SHOW is not MMU specific
Date: Sat, 22 Oct 2011 07:38:45 +1000
Message-ID: <4EA1E665.9040205@snapgear.com>
References: <1319180663-11010-1-git-send-email-gerg@snapgear.com> <CAMuHMdVj5_vueByF9qostZ7TJFUG8nV+55aggZvhCBeHZnQhhQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from sncsmrelay2.nai.com ([67.97.80.206]:14255 "EHLO
	sncsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752770Ab1JUVkG convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Fri, 21 Oct 2011 17:40:06 -0400
In-Reply-To: <CAMuHMdVj5_vueByF9qostZ7TJFUG8nV+55aggZvhCBeHZnQhhQ@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org, Greg Ungerer <gerg@uclinux.org>

Hi Geert,

On 10/22/2011 01:01 AM, Geert Uytterhoeven wrote:
> On Fri, Oct 21, 2011 at 09:04,<gerg@snapgear.com>  wrote:
>> The selection of the CONFIG_GENERIC_IRQ_SHOW option is not specific
>> to the MMU being present and enabled. It is dependant on what CPU we=
 are
>> compiling for. The non-MMU 68000 and ColdFire family CPUs use generi=
c
>> interrupts, and can use the generic irq show code.
>>
>> Signed-off-by: Greg Ungerer<gerg@uclinux.org>
>> ---
>> =C3=A1arch/m68k/Kconfig =C3=A1 =C3=A1 | =C3=A1 =C3=A11 -
>> =C3=A1arch/m68k/Kconfig.cpu | =C3=A1 =C3=A13 +++
>> =C3=A12 files changed, 3 insertions(+), 1 deletions(-)
>>
>> diff --git a/arch/m68k/Kconfig b/arch/m68k/Kconfig
>> index 9829235..663d1f4 100644
>> --- a/arch/m68k/Kconfig
>> +++ b/arch/m68k/Kconfig
>> @@ -3,7 +3,6 @@ config M68K
>> =C3=A1 =C3=A1 =C3=A1 =C3=A1default y
>> =C3=A1 =C3=A1 =C3=A1 =C3=A1select HAVE_IDE
>> =C3=A1 =C3=A1 =C3=A1 =C3=A1select HAVE_AOUT if MMU
>> - =C3=A1 =C3=A1 =C3=A1 select GENERIC_IRQ_SHOW if !MMU
>> =C3=A1 =C3=A1 =C3=A1 =C3=A1select ARCH_HAVE_NMI_SAFE_CMPXCHG if RMW_=
INSNS
>
> This will be fixed Really Soon Now (TM).

Yep, I expected I would be able to drop this very soon :-)

It is really from completeness. I will be posting a patch set
next week that codes support for running MMU enabled ColdFire.
And I needed these few little cleanups to make that work.

Thanks
Greg


-----------------------------------------------------------------------=
-
Greg Ungerer  --  Principal Engineer        EMAIL:     gerg@snapgear.co=
m
SnapGear Group, McAfee                      PHONE:       +61 7 3435 288=
8
8 Gardner Close,                            FAX:         +61 7 3891 363=
0
Milton, QLD, 4064, Australia                WEB: http://www.SnapGear.co=
m
