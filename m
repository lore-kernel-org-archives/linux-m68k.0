From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] m68k/m68knommu: merge MMU and non-MMU string.h
Date: Thu, 9 Sep 2010 21:14:31 +0200
Message-ID: <AANLkTikhxWgp6xLDqPSLMax6LS2zT71d+WLZnmo-WCyH@mail.gmail.com>
References: <201009070452.o874qqmg006794@goober.internal.moreton.com.au>
	<AANLkTim+jWjOKX_M52DWSKH2+oRWBXqc3TUFQp6esf3r@mail.gmail.com>
	<4C8776C5.9030205@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pv0-f174.google.com ([74.125.83.174]:57719 "EHLO
	mail-pv0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753671Ab0IITOb convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Thu, 9 Sep 2010 15:14:31 -0400
Received: by pvg2 with SMTP id 2so639865pvg.19
        for <linux-m68k@vger.kernel.org>; Thu, 09 Sep 2010 12:14:31 -0700 (PDT)
In-Reply-To: <4C8776C5.9030205@snapgear.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Greg Ungerer <gerg@snapgear.com>
Cc: linux-m68k@vger.kernel.org, gerg@uclinux.org

On Wed, Sep 8, 2010 at 13:43, Greg Ungerer <gerg@snapgear.com> wrote:
> On 08/09/10 06:35, Geert Uytterhoeven wrote:
>> Now I see:
>>
>> | arch/m68k/kernel/entry.S: Assembler messages:
>> | arch/m68k/kernel/entry.S:56: Error: can't resolve `0' {*ABS* secti=
on} - `THREAD_SIZE' {*UND* section}
>> | arch/m68k/kernel/entry.S:64: Error: can't resolve `0' {*UND* secti=
on} - `THREAD_SIZE' {*UND* section}
>> | arch/m68k/kernel/entry.S:119: Error: can't resolve `0' {*UND* sect=
ion} - `THREAD_SIZE' {*UND* section}
>> | arch/m68k/kernel/entry.S:203: Error: can't resolve `0' {*UND* sect=
ion} - `THREAD_SIZE' {*UND* section}
>> | arch/m68k/kernel/entry.S:236: Error: can't resolve `0' {*UND* sect=
ion} - `THREAD_SIZE' {*UND* section}
>> | arch/m68k/kernel/entry.S:257: Error: can't resolve `0' {*UND* sect=
ion} - `THREAD_SIZE' {*UND* section}
>>
>> this is expanded from `GET_CURRENT'.
>
> Just a thought, is it enough to include thread_info.h inside entry_mm=
=2Eh?

No, because <asm/thread_info.h> is no longer ASSEMBLY-clean, as it incl=
udes
<asm/current.h>, which is C-only.
The #include <asm/current.h> in there used to be protected by #ifndef A=
SSEMBLY.
If I move that include up just above the definition of struct thread_in=
fo,
<asm/thread_info.h> is ASSEMBLY-clean again.

However, just including <asm/thread_info.h> from <asm/entry_mm.h> cause=
s other
problems for the C part, as <asm/thread_info.h> needs the definition of=
 struct
restart_block in <linux/thread_info.h>. And <linux/thread_info.h> is de=
finitely
not ASSEMBLY-clean.

So I came up with the patch (white-space damaged due to the GMail web i=
nterface)
below. Note that this changes the behavior for m68knommu, which didn't =
include
<asm/current.h> from <asm/thread_info.h> before. I hope it doesn't hurt=
=2E..

diff --git a/arch/m68k/include/asm/entry_mm.h b/arch/m68k/include/asm/e=
ntry_mm.h
index 6f70823..73b8c8f 100644
--- a/arch/m68k/include/asm/entry_mm.h
+++ b/arch/m68k/include/asm/entry_mm.h
@@ -3,6 +3,9 @@

 #include <asm/setup.h>
 #include <asm/page.h>
+#ifdef __ASSEMBLY__
+#include <asm/thread_info.h>
+#endif

 /*
  * Stack layout in 'ret_from_exception':
diff --git a/arch/m68k/include/asm/thread_info.h
b/arch/m68k/include/asm/thread_info.h
index f28775e..aec5eff 100644
--- a/arch/m68k/include/asm/thread_info.h
+++ b/arch/m68k/include/asm/thread_info.h
@@ -22,6 +22,8 @@

 #ifndef __ASSEMBLY__

+#include <asm/current.h>
+
 struct thread_info {
 	struct task_struct	*task;		/* main task structure */
 	unsigned long		flags;
@@ -49,8 +51,6 @@ struct thread_info {

 #ifdef CONFIG_MMU

-#include <asm/current.h>
-
 #ifdef ASM_OFFSETS_C
 #define task_thread_info(tsk)	((struct thread_info *) NULL)
 #else

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
