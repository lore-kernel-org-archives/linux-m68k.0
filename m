From: Luis Alves <ljalvs@gmail.com>
Subject: [PATCH] unaligned.h fix for M68000 core
Date: Sun, 13 May 2012 17:39:42 +0100
Message-ID: <1336927182-3505-1-git-send-email-ljalvs__41782.992918934$1336947304$gmane$org@gmail.com>
References: <68000 unaligned.h>
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <68000 unaligned.h>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@lists.linux-m68k.org, uclinux-dev@uclinux.org
Cc: gerg@snapgear.com, Luis Alves <ljalvs@gmail.com>


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
