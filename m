From: Andreas Schwab <schwab@linux-m68k.org>
Subject: Re: compile error on latest git m68k kernel
Date: Wed, 10 Nov 2010 12:03:19 +0100
Message-ID: <m3fwv9sao8.fsf@linux-m68k.org>
References: <AANLkTimA0ZOhNo=RO5ZhrQFNA6wWORekgj42dMNhnpGY@mail.gmail.com>
	<AANLkTi=pzN+7-wQMsVeV4AgVBYA-mGt42MwazaLPmVhg@mail.gmail.com>
	<m3tyjpsdi3.fsf@linux-m68k.org>
	<AANLkTi=QcucNUPc6G+U-2MfeFrLDW_LocX1TuHKuMvJG@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-out.m-online.net ([212.18.0.9]:52718 "EHLO
	mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754258Ab0KJLDV (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 10 Nov 2010 06:03:21 -0500
In-Reply-To: <AANLkTi=QcucNUPc6G+U-2MfeFrLDW_LocX1TuHKuMvJG@mail.gmail.com>
	(Geert Uytterhoeven's message of "Wed, 10 Nov 2010 11:34:47 +0100")
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Michael Schmitz <schmitzmic@googlemail.com>, Linux/m68k <linux-m68k@vger.kernel.org>

Geert Uytterhoeven <geert@linux-m68k.org> writes:

> On Wed, Nov 10, 2010 at 11:02, Andreas Schwab <schwab@linux-m68k.org> wrote:
>> Geert Uytterhoeven <geert@linux-m68k.org> writes:
>>> On Wed, Nov 10, 2010 at 08:08, Michael Schmitz
>>> <schmitzmic@googlemail.com> wrote:
>>>> seen this before?
>>>
>>> Not this particular one...
>>>
>>>>  LD      .tmp_vmlinux1
>>>> fs/built-in.o: In function `alignfile':
>>>> binfmt_elf.c:(.text+0x307bc): undefined reference to `__divdi3'
>>>> fs/built-in.o: In function `elf_core_dump':
>>>> binfmt_elf.c:(.text+0x3139c): undefined reference to `__divdi3'
>>>> make: *** [.tmp_vmlinux1] Error 1
>>
>> Where is that called?  The right fix in most cases is to use do_div from
>> <asm/div64.h>.
>
> alignfile: roundup(*foffset, 4)
> elf_core_dump: roundup(offset, ELF_EXEC_PAGESIZE)
> (assumed it's caused by the roundup() calls, assembly output?)
>
> Both are divisions by a power-of-two, but the dividend is a (signed!) long long.

I cannot reproduce that.

Andreas.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 58CA 54C7 6D53 942B 1756  01D3 44D5 214B 8276 4ED5
"And now for something completely different."
