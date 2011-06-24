From: Greg Ungerer <gerg@snapgear.com>
Subject: Re: [PATCH] m68k: merge mmu and non-mmu bitops.h
Date: Fri, 24 Jun 2011 15:12:05 +1000
Message-ID: <4E041CA5.1030302@snapgear.com>
References: <1308792524-22126-1-git-send-email-gerg@snapgear.com> <BANLkTimmPO3Vyt-rxD2_9B3rsS-DWtho8g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from sncsmrelay2.nai.com ([67.97.80.206]:43221 "EHLO
	sncsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751974Ab1FXFMv convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Fri, 24 Jun 2011 01:12:51 -0400
In-Reply-To: <BANLkTimmPO3Vyt-rxD2_9B3rsS-DWtho8g@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org, Greg Ungerer <gerg@uclinux.org>

Hi Geert,

On 24/06/11 03:30, Geert Uytterhoeven wrote:
> On Thu, Jun 23, 2011 at 03:28,<gerg@snapgear.com>  wrote:
>> @@ -10,6 +10,9 @@ config ARCH_MAY_HAVE_PC_FDC
>> =C3=A1config ARCH_USES_GETTIMEOFFSET
>> =C3=A1 =C3=A1 =C3=A1 =C3=A1def_bool y
>>
>> +config CPU_HAS_BITFIELDS
>> + =C3=A1 =C3=A1 =C3=A1 bool
>> +
>> =C3=A1config EISA
>> =C3=A1 =C3=A1 =C3=A1 =C3=A1bool
>> =C3=A1 =C3=A1 =C3=A1 =C3=A1---help---
>> @@ -223,6 +226,7 @@ comment "Processor type"
>>
>> =C3=A1config M68020
>> =C3=A1 =C3=A1 =C3=A1 =C3=A1bool "68020 support"
>> + =C3=A1 =C3=A1 =C3=A1 select CPU_HAS_BITFIELDS
>> =C3=A1 =C3=A1 =C3=A1 =C3=A1help
>> =C3=A1 =C3=A1 =C3=A1 =C3=A1 =C3=A1If you anticipate running this ker=
nel on a computer with a MC68020
>> =C3=A1 =C3=A1 =C3=A1 =C3=A1 =C3=A1processor, say Y. Otherwise, say N=
=2E Note that the 68020 requires a
>
> Upon second thought, this won't work for multi-CPU kernels, as there'=
s
> no runtime
> check. The logic needs to be reverted, like:
>
> config CPU_HAS_NO_BITFIELDS
>          bool
>
> config M680000
>          bool "68000 support"
>          select CPU_HAS_NO_BITFIELDS
>
> so a kernel built to run on both 68000 and 68020 will not use the
> bitfield instructions.
> Sorry I didn't realize that earlier.

Yep, good point. I'll rework this again and lets see what that
comes out like.

Regards
Greg


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
