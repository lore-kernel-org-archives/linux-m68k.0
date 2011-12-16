From: <gerg@snapgear.com>
Subject: [PATCH 30/35] m68k: use non-MMU linker script for ColdFire MMU builds
Date: Fri, 16 Dec 2011 22:36:27 +1000
Message-ID: <1324038992-31222-31-git-send-email-gerg@snapgear.com>
References: <1324038992-31222-1-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from sncsmrelay2.nai.com ([67.97.80.206]:49433 "EHLO
	sncsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1759098Ab1LPMhL (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Fri, 16 Dec 2011 07:37:11 -0500
In-Reply-To: <1324038992-31222-1-git-send-email-gerg@snapgear.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org
Cc: Greg Ungerer <gerg@uclinux.org>

From: Greg Ungerer <gerg@uclinux.org>

Use the non-MMU linker script for ColdFire builds when we are building
for MMU enabled. The image layout is correct for loading on existing
ColdFire dev boards. The only addition required to the current non-MMU
linker script is to add support for the fixup section.

Signed-off-by: Greg Ungerer <gerg@uclinux.org>
Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>
Acked-by: Matt Waddel <mwaddel@yahoo.com>
Acked-by: Kurt Mahan <kmahan@xmission.com>
---
 arch/m68k/kernel/vmlinux-nommu.lds |    8 ++++++++
 arch/m68k/kernel/vmlinux.lds.S     |    2 +-
 2 files changed, 9 insertions(+), 1 deletions(-)

diff --git a/arch/m68k/kernel/vmlinux-nommu.lds b/arch/m68k/kernel/vmlinux-nommu.lds
index 4e23893..8e66ccb 100644
--- a/arch/m68k/kernel/vmlinux-nommu.lds
+++ b/arch/m68k/kernel/vmlinux-nommu.lds
@@ -69,6 +69,7 @@ SECTIONS {
 		SCHED_TEXT
 		LOCK_TEXT
 		*(.text..lock)
+		*(.fixup)
 
 		. = ALIGN(16);          /* Exception table              */
 		__start___ex_table = .;
@@ -161,6 +162,13 @@ SECTIONS {
 		_edata = . ;
 	} > DATA
 
+	.m68k_fixup : {
+		__start_fixup = .;
+		*(.m68k_fixup)
+		__stop_fixup = .;
+	} > DATA
+	NOTES > DATA
+
 	.init.text : {
 		. = ALIGN(PAGE_SIZE);
 		__init_begin = .;
diff --git a/arch/m68k/kernel/vmlinux.lds.S b/arch/m68k/kernel/vmlinux.lds.S
index 3d99a04..69ec796 100644
--- a/arch/m68k/kernel/vmlinux.lds.S
+++ b/arch/m68k/kernel/vmlinux.lds.S
@@ -1,4 +1,4 @@
-#ifdef CONFIG_MMU
+#if defined(CONFIG_MMU) && !defined(CONFIG_COLDFIRE)
 PHDRS
 {
   text PT_LOAD FILEHDR PHDRS FLAGS (7);
-- 
1.7.0.4
