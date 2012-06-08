From: <gerg@snapgear.com>
Subject: [PATCH] m68k: fix inclusion of arch_gettimeoffset for non-MMU 68k classic CPU types
Date: Fri, 8 Jun 2012 15:25:43 +1000
Message-ID: <1339133143-12984-1-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from sncsmrelay2.nai.com ([67.97.80.206]:39430 "EHLO
	sncsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1760272Ab2FHF1D convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Fri, 8 Jun 2012 01:27:03 -0400
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org
Cc: Greg Ungerer <gerg@uclinux.org>

=46rom: Greg Ungerer <gerg@uclinux.org>

When building for non-MMU based classic 68k CPU types (like the 68328 f=
or
example) you get a compilation error:

  CC      arch/m68k/kernel/time.o
arch/m68k/kernel/time.c:91:5: error: redefinition of =E2=80=98arch_gett=
imeoffset=E2=80=99
include/linux/time.h:145:19: note: previous definition of =E2=80=98arch=
_gettimeoffset=E2=80=99 was here

The arch_gettimeoffset() code is included when building for these CPU t=
ypes,
but it shouldn't be. Those machine types do not have
CONFIG_ARCH_USES_GETTIMEOFFSET set.

The fix is simply to conditionally include the arch_gettimeoffset() cod=
e on
that same config setting that specifies its use or not.

Signed-off-by: Greg Ungerer <gerg@uclinux.org>
---
 arch/m68k/kernel/time.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/m68k/kernel/time.c b/arch/m68k/kernel/time.c
index d7deb7f..707f057 100644
--- a/arch/m68k/kernel/time.c
+++ b/arch/m68k/kernel/time.c
@@ -85,7 +85,7 @@ void __init time_init(void)
 	mach_sched_init(timer_interrupt);
 }
=20
-#ifdef CONFIG_M68KCLASSIC
+#ifdef CONFIG_ARCH_USES_GETTIMEOFFSET
=20
 u32 arch_gettimeoffset(void)
 {
@@ -108,4 +108,4 @@ static int __init rtc_init(void)
=20
 module_init(rtc_init);
=20
-#endif /* CONFIG_M68KCLASSIC */
+#endif /* CONFIG_ARCH_USES_GETTIMEOFFSET */
--=20
1.7.0.4
