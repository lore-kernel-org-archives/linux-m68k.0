From: <gerg@snapgear.com>
Subject: [PATCH] m68knommu: add missing make rule for Palm/Pilot bitmap boot logo
Date: Thu, 22 Dec 2011 17:03:03 +1000
Message-ID: <1324537383-16741-1-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from dalsmrelay2.nai.com ([205.227.136.216]:35434 "EHLO
	dalsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752639Ab1LVHCq (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Thu, 22 Dec 2011 02:02:46 -0500
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org
Cc: Greg Ungerer <gerg@uclinux.org>

From: Greg Ungerer <gerg@uclinux.org>

Compiling for the m68knommu/68328 Palm/Pilot target you get:

  AS      arch/m68k/platform/68328/head-pilot.o
arch/m68k/platform/68328/head-pilot.S:37:23: fatal error: bootlogo.rh: No such file or directory

The Makefile contains rules to make the bootlogo.rh file from the C source
bootlogo.h. But it is missing a dependency that compiling head-pilot.S needs
bootlogo.rh.

Signed-off-by: Greg Ungerer <gerg@uclinux.org>
---
 arch/m68k/platform/68328/Makefile |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/arch/m68k/platform/68328/Makefile b/arch/m68k/platform/68328/Makefile
index e4dfd8f..704e36d 100644
--- a/arch/m68k/platform/68328/Makefile
+++ b/arch/m68k/platform/68328/Makefile
@@ -16,6 +16,9 @@ obj-$(CONFIG_ROM)	+= romvec.o
 extra-y			:= head.o
 extra-$(CONFIG_M68328)	+= bootlogo.rh head.o
 
+$(obj)/head-pilot.o: $(obj)/bootlogo.rh
+$(obj)/head-rom.o: $(obj)/bootlogo.rh
+
 $(obj)/bootlogo.rh: $(src)/bootlogo.h
 	perl $(src)/bootlogo.pl < $(src)/bootlogo.h > $(obj)/bootlogo.rh
 
-- 
1.7.0.4
