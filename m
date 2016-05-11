From: "George Spelvin" <linux@horizon.com>
Subject: [RFC PATCH 2/2] arch/m68k: Add CONFIG_CPU_HAS_NO_MULDIV32
Date: 11 May 2016 06:25:35 -0400
Message-ID: <20160511102535.5858.qmail@ns.horizon.com>
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from ns.horizon.com ([71.41.210.147]:53476 "HELO ns.horizon.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with SMTP
	id S1751462AbcEKKbB (ORCPT <rfc822;linux-m68k@vger.kernel.org>);
	Wed, 11 May 2016 06:31:01 -0400
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: geert@linux-m68k.org, linux-m68k@lists.linux-m68k.org
Cc: linux@horizon.com

Assembly of 32-bit multiply/divide helpers was dependent on
CONFIG_CPU_HAS_NO_MULDIV64, which is not necessary.

Signed-off-by: George Spelvin <linux@horizon.com>
---
This also turns out to be a very useful symbol for some other work
I'm doing to <linux/hash.h>.

 arch/m68k/Kconfig.cpu  | 11 +++++++++++
 arch/m68k/lib/Makefile |  4 ++--
 2 files changed, 13 insertions(+), 2 deletions(-)

diff --git a/arch/m68k/Kconfig.cpu b/arch/m68k/Kconfig.cpu
index 0dfcf12..3fce7bf 100644
--- a/arch/m68k/Kconfig.cpu
+++ b/arch/m68k/Kconfig.cpu
@@ -37,6 +37,7 @@ config M68000
 	bool "MC68000"
 	depends on !MMU
 	select CPU_HAS_NO_BITFIELDS
+	select CPU_HAS_NO_MULDIV32
 	select CPU_HAS_NO_MULDIV64
 	select CPU_HAS_NO_UNALIGNED
 	select GENERIC_CSUM
@@ -391,8 +392,18 @@ config NODES_SHIFT
 config CPU_HAS_NO_BITFIELDS
 	bool
 
+config CPU_HAS_NO_MULDIV32
+	bool
+	help
+	  This option indicates the CPU lacks 32x32->32-bit multiply
+	  and divide instructions, and thus requires the GCC helper
+	  functions __mulsi3, __divsi3 __modsi3, etc.
+
 config CPU_HAS_NO_MULDIV64
 	bool
+	help
+	  This option indicates the CPU lacks "widening" 32x32->64-bit
+	  multiply and 64/32->(32,32)-bit divide instructions.
 
 config CPU_HAS_NO_UNALIGNED
 	bool
diff --git a/arch/m68k/lib/Makefile b/arch/m68k/lib/Makefile
index fcd8eb1..e6553db 100644
--- a/arch/m68k/lib/Makefile
+++ b/arch/m68k/lib/Makefile
@@ -7,8 +7,8 @@ lib-y	:= ashldi3.o ashrdi3.o lshrdi3.o muldi3.o \
 	   memcpy.o memset.o memmove.o
 
 lib-$(CONFIG_MMU) += uaccess.o
-lib-$(CONFIG_CPU_HAS_NO_MULDIV64) += mulsi3.o divsi3.o udivsi3.o
-lib-$(CONFIG_CPU_HAS_NO_MULDIV64) += modsi3.o umodsi3.o
+lib-$(CONFIG_CPU_HAS_NO_MULDIV32) += mulsi3.o divsi3.o udivsi3.o
+lib-$(CONFIG_CPU_HAS_NO_MULDIV32) += modsi3.o umodsi3.o
 
 ifndef CONFIG_GENERIC_CSUM
 lib-y	+= checksum.o
-- 
2.8.1
