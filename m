From: Andreas Schwab <schwab@linux-m68k.org>
Subject: Re: compile error on latest git m68k kernel
Date: Wed, 10 Nov 2010 11:02:12 +0100
Message-ID: <m3tyjpsdi3.fsf@linux-m68k.org>
References: <AANLkTimA0ZOhNo=RO5ZhrQFNA6wWORekgj42dMNhnpGY@mail.gmail.com>
	<AANLkTi=pzN+7-wQMsVeV4AgVBYA-mGt42MwazaLPmVhg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-out.m-online.net ([212.18.0.10]:41473 "EHLO
	mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754183Ab0KJKCO convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 10 Nov 2010 05:02:14 -0500
In-Reply-To: <AANLkTi=pzN+7-wQMsVeV4AgVBYA-mGt42MwazaLPmVhg@mail.gmail.com>
	(Geert Uytterhoeven's message of "Wed, 10 Nov 2010 10:17:35 +0100")
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Michael Schmitz <schmitzmic@googlemail.com>, Linux/m68k <linux-m68k@vger.kernel.org>

Geert Uytterhoeven <geert@linux-m68k.org> writes:

> Hi Michael,
>
> On Wed, Nov 10, 2010 at 08:08, Michael Schmitz
> <schmitzmic@googlemail.com> wrote:
>> seen this before?
>
> Not this particular one...
>
>> =C2=A0LD =C2=A0 =C2=A0 =C2=A0.tmp_vmlinux1
>> fs/built-in.o: In function `alignfile':
>> binfmt_elf.c:(.text+0x307bc): undefined reference to `__divdi3'
>> fs/built-in.o: In function `elf_core_dump':
>> binfmt_elf.c:(.text+0x3139c): undefined reference to `__divdi3'
>> make: *** [.tmp_vmlinux1] Error 1

Where is that called?  The right fix in most cases is to use do_div fro=
m
<asm/div64.h>.

> ... but depending on the version of gcc, we sometimes need things lik=
e
> this, cfr.
> arch/m68k/lib/. The fix is to add a __divdi3 there.

It is not provided for a reason.

Andreas.

--=20
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint =3D 58CA 54C7 6D53 942B 1756  01D3 44D5 214B 8276 4=
ED5
"And now for something completely different."
