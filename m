From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Fwd: [PATCH 11/23] Make register values available to M68K panic
	notifiers
Date: Mon, 12 Apr 2010 09:59:54 +0200
Message-ID: <r2q10f740e81004120059t17339423re0e7fe3ee0d58a33@mail.gmail.com>
References: <20100412060411.GA24636@dvomlehn-lnx2.corp.sa.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-wy0-f174.google.com ([74.125.82.174]:52511 "EHLO
	mail-wy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751739Ab0DLH74 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Mon, 12 Apr 2010 03:59:56 -0400
Received: by wyb39 with SMTP id 39so1176248wyb.19
        for <linux-m68k@vger.kernel.org>; Mon, 12 Apr 2010 00:59:54 -0700 (PDT)
In-Reply-To: <20100412060411.GA24636@dvomlehn-lnx2.corp.sa.net>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Linux/m68k <linux-m68k@vger.kernel.org>

---------- Forwarded message ----------
=46rom: David VomLehn <dvomlehn@cisco.com>
Date: Mon, Apr 12, 2010 at 08:04
Subject: [PATCH 11/23] Make register values available to M68K panic not=
ifiers
To: to@dvomlehn-lnx2.corp.sa.net,
"linux_arch"@dvomlehn-lnx2.corp.sa.net,
linux_arch@dvomlehn-lnx2.corp.sa.net
Cc: akpm@linux-foundation.org, linux-kernel@vger.kernel.org,
maint_arch@dvomlehn-lnx2.corp.sa.net


The save_ptregs() function has not been tested or even built. I will ne=
ed
help to complete this.

This appeared to require a Makefile change in order to compile kernel/e=
ntry.S.
The problem was that it was complaining about having an "invalid instru=
ction
for this architecture; needs 68000 or higher". Choosing a processor did=
n't
seem to help, but adding the processor to KBUILD_AFLAGS in appropriate =
places
resolved the problem. Has bit rot set in to the m68k tree?

Signed-off-by: David VomLehn <dvomlehn@cisco.com>
---
=C2=A0arch/m68k/Makefile =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=
=A0 =C2=A02 +
=C2=A0arch/m68k/include/asm/ptrace.h | =C2=A0 74 ++++++++++++++++++++++=
++++++++++++++++++
=C2=A02 files changed, 76 insertions(+), 0 deletions(-)

diff --git a/arch/m68k/Makefile b/arch/m68k/Makefile
index 570d85c..bab0202 100644
--- a/arch/m68k/Makefile
+++ b/arch/m68k/Makefile
@@ -41,10 +41,12 @@ ifndef CONFIG_M68030

=C2=A0ifndef CONFIG_M68060
=C2=A0KBUILD_CFLAGS +=3D -m68040
+KBUILD_AFLAGS +=3D -m68040
=C2=A0endif

=C2=A0ifndef CONFIG_M68040
=C2=A0KBUILD_CFLAGS +=3D -m68060
+KBUILD_AFLAGS +=3D -m68060
=C2=A0endif

=C2=A0endif
diff --git a/arch/m68k/include/asm/ptrace.h b/arch/m68k/include/asm/ptr=
ace.h
index ee4011c..2786ea4 100644
--- a/arch/m68k/include/asm/ptrace.h
+++ b/arch/m68k/include/asm/ptrace.h
@@ -85,6 +85,80 @@ struct switch_stack {
=C2=A0#define profile_pc(regs) instruction_pointer(regs)
=C2=A0extern void show_regs(struct pt_regs *);

+/* Macros for saving the contents of registers and for the output cons=
traint
+ * for those registers */
+
+#include <linux/ptreg.h>
+
+#define PTREG_SAVE(r, name) =C2=A0 =C2=A0"movel =C2=A0%" #r ", %[" #na=
me "]\n"
+#define PTREG_SAVE_D(i) =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0_PTREG_SAVE_I(d, d, i)
+#define PTREG_SAVE_A(i) =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0_PTREG_SAVE_I(a, a, i)
+
+#define PTREG_OUT_D(regs, i) =C2=A0 _PTREG_OUT_I(regs, d, d, i)
+#define PTREG_OUT_A(regs, i) =C2=A0 _PTREG_OUT_I(regs, a, a, i)
+
+#define arch_has_save_ptregs =C2=A0 1
+
+/**
+ * save_ptregs - save processor registers for backtracing
+ * @regs: =C2=A0 =C2=A0 =C2=A0Pointer to &struct pt_regs structure in =
which to save the
+ * =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 registers
+ *
+ * Returns a constant pointer to @regs.
+ *
+ * This function must be called first in a function. There must be no
+ * auto variables defined that are initialized before calling this fun=
ction.
+ */
+static __always_inline
+const struct pt_regs *save_ptregs(struct pt_regs *regs)
+{
+ =C2=A0 =C2=A0 =C2=A0 __asm__ __volatile__ (
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 PTREG_SAVE_D(1)
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 PTREG_SAVE_D(2)
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 PTREG_SAVE_D(3)
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 PTREG_SAVE_D(4)
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 PTREG_SAVE_D(5)
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 PTREG_SAVE_A(0)
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 PTREG_SAVE_A(1)
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 PTREG_SAVE_A(2)
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 PTREG_SAVE_D(0)
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 PTREG_SAVE(orig_d0, orig_d0)
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 PTREG_SAVE(stkadj, stkadj)
+#if 0
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 PTREG_SAVE(format, format)
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 PTREG_SAVE(vector, vector)
+#endif
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 PTREG_SAVE(sr, sr)
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 "1:\n"
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 "lea =C2=A0 =C2=A01b, %a0"
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 PTREG_SAVE(a0, pc)
+ =C2=A0 =C2=A0 =C2=A0 :
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 PTREG_OUT_D(regs, 0)=
,
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 PTREG_OUT_D(regs, 1)=
,
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 PTREG_OUT_D(regs, 2)=
,
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 PTREG_OUT_D(regs, 3)=
,
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 PTREG_OUT_D(regs, 4)=
,
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 PTREG_OUT_D(regs, 5)=
,
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 PTREG_OUT_A(regs, 0)=
,
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 PTREG_OUT_A(regs, 1)=
,
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 PTREG_OUT_A(regs, 2)=
,
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 PTREG_OUT(regs, orig=
_d0, orig_d0),
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 PTREG_OUT(regs, stka=
dj, stkadj),
+#if 0
+/* Are these registers that must be saved? */
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 PTREG_OUT(regs, form=
at, format),
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 PTREG_OUT(regs, vect=
or, vector),
+#endif
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 PTREG_OUT(regs, sr, =
sr),
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 PTREG_OUT(regs, pc, =
pc)
+ =C2=A0 =C2=A0 =C2=A0 :
+ =C2=A0 =C2=A0 =C2=A0 :
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 "a0"
+ =C2=A0 =C2=A0 =C2=A0 );
+
+ =C2=A0 =C2=A0 =C2=A0 return regs;
+}
+
=C2=A0/*
=C2=A0* These are defined as per linux/ptrace.h.
=C2=A0*/
--
To unsubscribe from this list: send the line "unsubscribe linux-kernel"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at =C2=A0http://vger.kernel.org/majordomo-info.html
Please read the FAQ at =C2=A0http://www.tux.org/lkml/



--=20
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
