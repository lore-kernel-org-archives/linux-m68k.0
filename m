From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH] m68k: Fix asm constraints for atomic_sub_and_test() and
	atomic_add_negative() (was: Re: atomic_sub_and_test() asm constraints)
Date: Sun, 21 Mar 2010 11:01:24 +0100
Message-ID: <10f740e81003210301m5886c85dwd20eb0991657fc8d@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-wy0-f174.google.com ([74.125.82.174]:32924 "EHLO
	mail-wy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752077Ab0CUKBZ convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 21 Mar 2010 06:01:25 -0400
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Andreas Schwab <schwab@linux-m68k.org>
Cc: Linux/m68k <linux-m68k@vger.kernel.org>, linux-kernel@vger.kernel.org

On Sun, Mar 14, 2010 at 15:30, Andreas Schwab <schwab@linux-m68k.org> w=
rote:
> Geert Uytterhoeven <geert@linux-m68k.org> writes:
>
>> | =C2=A0 CC =C2=A0 =C2=A0 =C2=A0mm/memcontrol.o
>> | {standard input}: Assembler messages:
>> | {standard input}:4076: Error: operands mismatch -- statement `subl
>> 12(%fp),170(%a0)' ignored
>>
>> Seems like we have bad asm constraints in
>>
>> static inline int atomic_sub_and_test(int i, atomic_t *v)
>> {
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 char c;
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 __asm__ __volatile__("subl %2,%1; seq %0=
" : "=3Dd" (c), "+m"
>> (*v): "g" (i));
>
> Surely "g" is wrong, sub only accepts a data register as source opera=
nd
> when the destination is in memory.

=46rom cd2b57976949934df61c4406af344294011d5c16 Mon Sep 17 00:00:00 200=
1
=46rom: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Sun, 21 Mar 2010 10:52:21 +0100
Subject: [PATCH] m68k: Fix asm constraints for atomic_sub_and_test()
and atomic_add_negative()

Recently, we started seeing this on allmodconfig builds:

  CC      mm/memcontrol.o
{standard input}: Assembler messages:
{standard input}:4076: Error: operands mismatch -- statement `subl
12(%fp),170(%a0)' ignored

Correct the asm constraint, like done for m68knommu.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 arch/m68k/include/asm/atomic_mm.h |    8 ++++++--
 1 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/arch/m68k/include/asm/atomic_mm.h
b/arch/m68k/include/asm/atomic_mm.h
index 88b7af2..d9d2ed6 100644
--- a/arch/m68k/include/asm/atomic_mm.h
+++ b/arch/m68k/include/asm/atomic_mm.h
@@ -148,14 +148,18 @@ static inline int atomic_xchg(atomic_t *v, int ne=
w)
 static inline int atomic_sub_and_test(int i, atomic_t *v)
 {
 	char c;
-	__asm__ __volatile__("subl %2,%1; seq %0" : "=3Dd" (c), "+m" (*v): "g=
" (i));
+	__asm__ __volatile__("subl %2,%1; seq %0"
+			     : "=3Dd" (c), "+m" (*v)
+			     : "id" (i));
 	return c !=3D 0;
 }

 static inline int atomic_add_negative(int i, atomic_t *v)
 {
 	char c;
-	__asm__ __volatile__("addl %2,%1; smi %0" : "=3Dd" (c), "+m" (*v): "g=
" (i));
+	__asm__ __volatile__("addl %2,%1; smi %0"
+			     : "=3Dd" (c), "+m" (*v)
+			     : "id" (i));
 	return c !=3D 0;
 }

--=20
1.6.0.4

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-=
m68k.org

In personal conversations with technical people, I call myself a hacker=
=2E But
when I'm talking to journalists I just say "programmer" or something li=
ke that.
							    -- Linus Torvalds
