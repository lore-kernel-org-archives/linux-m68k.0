From: Luis Alves <ljalvs@gmail.com>
Subject: [PATCH] unaligned.h fix for M68000 core
Date: Sun, 13 May 2012 17:40:51 +0100
Message-ID: <1336927251-3550-1-git-send-email-ljalvs@gmail.com>
References: <68000 unaligned.h>
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-wg0-f44.google.com ([74.125.82.44]:33306 "EHLO
	mail-wg0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753132Ab2EMVss (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 13 May 2012 17:48:48 -0400
Received: by wgbdr13 with SMTP id dr13so4040627wgb.1
        for <linux-m68k@vger.kernel.org>; Sun, 13 May 2012 14:48:47 -0700 (PDT)
In-Reply-To: <68000 unaligned.h>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org
Cc: Luis Alves <ljalvs@gmail.com>


Hi all,

This patch fixes unaligned memory access for the 68000 core based cpu's.

Some time ago, my cpu (68000) was raising address/bus error's when mounting cifs shares (didn't bother to debug it at the time).
After developing the MMC/SD card driver I was having the same issue when mounting the vfat fs.

I've traced the issue down to the 'unaligned.h' file. (I guess nobody has ever used unaligned.h back in the 68328 'era'.


Regards,
Luis Alves


Signed-off-by: Luis Alves <ljalvs@gmail.com>
---
 arch/m68k/include/asm/unaligned.h |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/arch/m68k/include/asm/unaligned.h b/arch/m68k/include/asm/unaligned.h
index 019caa7..f4043ae 100644
--- a/arch/m68k/include/asm/unaligned.h
+++ b/arch/m68k/include/asm/unaligned.h
@@ -2,7 +2,7 @@
 #define _ASM_M68K_UNALIGNED_H
 
 
-#ifdef CONFIG_COLDFIRE
+#if defined(CONFIG_COLDFIRE) || defined(CONFIG_M68000)
 #include <linux/unaligned/be_struct.h>
 #include <linux/unaligned/le_byteshift.h>
 #include <linux/unaligned/generic.h>
-- 
1.7.5.4
