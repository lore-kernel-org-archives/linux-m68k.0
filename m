From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: compile error on latest git m68k kernel
Date: Wed, 10 Nov 2010 11:34:47 +0100
Message-ID: <AANLkTi=QcucNUPc6G+U-2MfeFrLDW_LocX1TuHKuMvJG@mail.gmail.com>
References: <AANLkTimA0ZOhNo=RO5ZhrQFNA6wWORekgj42dMNhnpGY@mail.gmail.com>
	<AANLkTi=pzN+7-wQMsVeV4AgVBYA-mGt42MwazaLPmVhg@mail.gmail.com>
	<m3tyjpsdi3.fsf@linux-m68k.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-fx0-f46.google.com ([209.85.161.46]:54198 "EHLO
	mail-fx0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752563Ab0KJKet convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 10 Nov 2010 05:34:49 -0500
Received: by fxm16 with SMTP id 16so226525fxm.19
        for <linux-m68k@vger.kernel.org>; Wed, 10 Nov 2010 02:34:47 -0800 (PST)
In-Reply-To: <m3tyjpsdi3.fsf@linux-m68k.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Andreas Schwab <schwab@linux-m68k.org>
Cc: Michael Schmitz <schmitzmic@googlemail.com>, Linux/m68k <linux-m68k@vger.kernel.org>

On Wed, Nov 10, 2010 at 11:02, Andreas Schwab <schwab@linux-m68k.org> w=
rote:
> Geert Uytterhoeven <geert@linux-m68k.org> writes:
>> On Wed, Nov 10, 2010 at 08:08, Michael Schmitz
>> <schmitzmic@googlemail.com> wrote:
>>> seen this before?
>>
>> Not this particular one...
>>
>>> =C2=A0LD =C2=A0 =C2=A0 =C2=A0.tmp_vmlinux1
>>> fs/built-in.o: In function `alignfile':
>>> binfmt_elf.c:(.text+0x307bc): undefined reference to `__divdi3'
>>> fs/built-in.o: In function `elf_core_dump':
>>> binfmt_elf.c:(.text+0x3139c): undefined reference to `__divdi3'
>>> make: *** [.tmp_vmlinux1] Error 1
>
> Where is that called? =C2=A0The right fix in most cases is to use do_=
div from
> <asm/div64.h>.

alignfile: roundup(*foffset, 4)
elf_core_dump: roundup(offset, ELF_EXEC_PAGESIZE)
(assumed it's caused by the roundup() calls, assembly output?)

Both are divisions by a power-of-two, but the dividend is a (signed!) l=
ong long.

>> ... but depending on the version of gcc, we sometimes need things li=
ke
>> this, cfr.
>> arch/m68k/lib/. The fix is to add a __divdi3 there.
>
> It is not provided for a reason.

Gr{oetje,eeting}s,

=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-=
m68k.org

In personal conversations with technical people, I call myself a hacker=
=2E But
when I'm talking to journalists I just say "programmer" or something li=
ke that.
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0=C2=A0 -- Linus Torvalds
