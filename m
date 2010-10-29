From: Greg Ungerer <gerg@snapgear.com>
Subject: [PATCH][resend] m68k,m68knommu: Do not include linux/hardirq.h in
 asm/irqflags.h
Date: Sat, 30 Oct 2010 00:06:32 +1000
Message-ID: <4CCAD4E8.8040801@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from dalsmrelay2.nai.com ([205.227.136.216]:13700 "EHLO
	dalsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757785Ab0J2OId convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Fri, 29 Oct 2010 10:08:33 -0400
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org
Cc: dhowells@redhat.com, gerg@uclinux.org, phdm@macqel.be


(Note: this bounced back to me from the m68k-linux list,
not sure why... resending)


Hi David, m68kers,

Philippe DeMuyter noticed this build failure with Linus' current git
tree. I think it is m68k clean too. If all are ok with it I'll
pass it directly to Linus.

Regards
Greg

---------------------------------------------------------------------

m68k,m68knommu: Do not include linux/hardirq.h in asm/irqflags.h

Recent changes to header files made kernel compilation for m68k/m68knom=
mu
fail with :
   CC      arch/m68knommu/kernel/asm-offsets.s
In file included from /archives/linux/git/arch/m68k/include/asm/system.=
h:2,
                  from include/linux/wait.h:25,
                  from include/linux/mmzone.h:9,
                  from include/linux/gfp.h:4,
                  from include/linux/irq.h:20,
                  from include/asm-generic/hardirq.h:12,
                  from=20
/archives/linux/git/arch/m68k/include/asm/hardirq_no.h:17,
                  from=20
/archives/linux/git/arch/m68k/include/asm/hardirq.h:2,
                  from include/linux/hardirq.h:10,
                  from=20
/archives/linux/git/arch/m68k/include/asm/irqflags.h:5,
                  from include/linux/irqflags.h:15,
                  from include/linux/spinlock.h:53,
                  from include/linux/seqlock.h:29,
                  from include/linux/time.h:8,
                  from include/linux/timex.h:56,
                  from include/linux/sched.h:56,
                  from arch/m68knommu/kernel/asm-offsets.c:12:
/archives/linux/git/arch/m68k/include/asm/system_no.h: In=20
function =C3=A2=C2=80=C2=98__xchg=C3=A2=C2=80=C2=99:
/archives/linux/git/arch/m68k/include/asm/system_no.h:79: error:=20
implicit declaration of function =C3=A2=C2=80=C2=98local_irq_save=C3=A2=
=C2=80=C2=99
/archives/linux/git/arch/m68k/include/asm/system_no.h:101: error:=20
implicit declaration of function =C3=A2=C2=80=C2=98local_irq_restore=C3=
=A2=C2=80=C2=99

=46ix that

Signed-off-by: Philippe De Muyter <phdm@macqel.be>

---
diff --git a/arch/m68k/include/asm/irqflags.h=20
b/arch/m68k/include/asm/irqflags.h
index 4a5b284..38b414d 100644
--- a/arch/m68k/include/asm/irqflags.h
+++ b/arch/m68k/include/asm/irqflags.h
@@ -2,7 +2,6 @@
  #define _M68K_IRQFLAGS_H
   #include <linux/types.h>
-#include <linux/hardirq.h>
  #include <linux/preempt.h>
  #include <asm/thread_info.h>
  #include <asm/entry.h>
