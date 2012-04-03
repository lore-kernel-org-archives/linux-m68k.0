From: <gerg@snapgear.com>
Subject: [PATCH 1/2] m68knommu: remove the unused bootlogo.h processing for 68EZ328 and 68VZ328
Date: Tue, 3 Apr 2012 14:18:27 +1000
Message-ID: <1333426708-16514-1-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from dalsmrelay2.nai.com ([205.227.136.216]:48238 "EHLO
	dalsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750985Ab2DCESQ (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 3 Apr 2012 00:18:16 -0400
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org
Cc: Greg Ungerer <gerg@uclinux.org>

From: Greg Ungerer <gerg@uclinux.org>

The 68EZ328 and 68VZ328 platforms currently try to process their bootlogo.h
to make it clean to include in asm files. This is no longer used, the
bootlogo.h file is now included only in C code, so remove all the processing
code in the 68EZ328 and 68VZ328 Makefiles.

Signed-off-by: Greg Ungerer <gerg@uclinux.org>
---
 arch/m68k/platform/68EZ328/Makefile |    6 ------
 arch/m68k/platform/68VZ328/Makefile |    9 ++-------
 2 files changed, 2 insertions(+), 13 deletions(-)

diff --git a/arch/m68k/platform/68EZ328/Makefile b/arch/m68k/platform/68EZ328/Makefile
index ee97735..b44d799 100644
--- a/arch/m68k/platform/68EZ328/Makefile
+++ b/arch/m68k/platform/68EZ328/Makefile
@@ -3,9 +3,3 @@
 #
 
 obj-y := config.o
-
-extra-y := bootlogo.rh
-
-$(obj)/bootlogo.rh: $(src)/bootlogo.h
-	perl $(src)/../68328/bootlogo.pl < $(src)/bootlogo.h \
-		> $(obj)/bootlogo.rh
diff --git a/arch/m68k/platform/68VZ328/Makefile b/arch/m68k/platform/68VZ328/Makefile
index 447ffa0..a49d75e 100644
--- a/arch/m68k/platform/68VZ328/Makefile
+++ b/arch/m68k/platform/68VZ328/Makefile
@@ -3,14 +3,9 @@
 #
 
 obj-y		:= config.o
-logo-$(UCDIMM)	:= bootlogo.rh
-logo-$(DRAGEN2)	:= screen.h
-extra-y		:= $(logo-y)
-
-$(obj)/bootlogo.rh: $(src)/../68EZ328/bootlogo.h
-	perl $(src)/bootlogo.pl < $(src)/../68328/bootlogo.h > $(obj)/bootlogo.rh
+extra-$(DRAGEN2):= screen.h
 
 $(obj)/screen.h: $(src)/screen.xbm $(src)/xbm2lcd.pl
 	perl $(src)/xbm2lcd.pl < $(src)/screen.xbm > $(obj)/screen.h
 
-clean-files := $(obj)/screen.h $(obj)/bootlogo.rh
+clean-files := $(obj)/screen.h
-- 
1.7.0.4
