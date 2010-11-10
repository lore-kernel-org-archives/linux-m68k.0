From: Michael Schmitz <schmitzmic@googlemail.com>
Subject: Re: compile error on latest git m68k kernel
Date: Thu, 11 Nov 2010 08:41:09 +1300
Message-ID: <AANLkTinivf6JQsLDwG7xa_JYkqEsj85oP2g03Xqz3MXY@mail.gmail.com>
References: <AANLkTimA0ZOhNo=RO5ZhrQFNA6wWORekgj42dMNhnpGY@mail.gmail.com>
	<AANLkTi=pzN+7-wQMsVeV4AgVBYA-mGt42MwazaLPmVhg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-ey0-f174.google.com ([209.85.215.174]:58996 "EHLO
	mail-ey0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756635Ab0KJTlL convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 10 Nov 2010 14:41:11 -0500
Received: by eye27 with SMTP id 27so627719eye.19
        for <linux-m68k@vger.kernel.org>; Wed, 10 Nov 2010 11:41:10 -0800 (PST)
In-Reply-To: <AANLkTi=pzN+7-wQMsVeV4AgVBYA-mGt42MwazaLPmVhg@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linux/m68k <linux-m68k@vger.kernel.org>

Hi All,

On Wed, Nov 10, 2010 at 10:17 PM, Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
> Hi Michael,
>
> On Wed, Nov 10, 2010 at 08:08, Michael Schmitz
> <schmitzmic@googlemail.com> wrote:
>> seen this before?
>
> Not this particular one...
>
>> =A0LD =A0 =A0 =A0.tmp_vmlinux1
>> fs/built-in.o: In function `alignfile':
>> binfmt_elf.c:(.text+0x307bc): undefined reference to `__divdi3'
>> fs/built-in.o: In function `elf_core_dump':
>> binfmt_elf.c:(.text+0x3139c): undefined reference to `__divdi3'
>> make: *** [.tmp_vmlinux1] Error 1
>>
>> Apparently caused by the roundup macro in include/linux/kernel.h:
>>
>> #define roundup(x, y) ( =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 \
>> { =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 \
>> =A0 =A0 =A0 =A0typeof(y) __y =3D y; =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0\
>> =A0 =A0 =A0 =A0(((x) + (__y - 1)) / __y) * __y; =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0\
>> }
>>
>> Toolchain issue?
>
> ... but depending on the version of gcc, we sometimes need things lik=
e
> this, cfr.
> arch/m68k/lib/. The fix is to add a __divdi3 there.

Ah, missed adding it there. It is not provided for what reason exactly?

> Which version are you using?

gcc 3.3.6 and some matching binutils (gas reports version 2.16).

>
>> =A0MIchael (who just wanted to try out the genrtc driver on Atari :-=
( ...)
>
> Genrtc (which is obsolete) or rtc-generic (to be obsoleted by rtc-cmo=
s
> on Atari ;-)?

rtc-generic for now, with a view towards adding whatever is needed to
use rtc-cmos after.

Cheers,

  Michael
