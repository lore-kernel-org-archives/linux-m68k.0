From: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH] m68k: pass endianness info to sparse
Date: Tue, 31 Oct 2017 18:22:15 +0100
Message-ID: <20171031172215.10088-1-luc.vanoostenryck@gmail.com>
Return-path: <linux-m68k-owner@vger.kernel.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>, linux-m68k@lists.linux-m68k.org

m68k is big-endian only but sparse assumes the same endianness
as the building machine.
This is problematic for code which expect __BYTE_ORDER__ being
correctly predefined by the compiler which sparse can then
pre-process differently from what gcc would, depending on the
building machine endianness.

Fix this by letting sparse know about the architecture endianness.

To: Geert Uytterhoeven <geert@linux-m68k.org>
CC: linux-m68k@lists.linux-m68k.org
Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---
 arch/m68k/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/m68k/Makefile b/arch/m68k/Makefile
index f0dd9fc84..74f05eb72 100644
--- a/arch/m68k/Makefile
+++ b/arch/m68k/Makefile
@@ -76,7 +76,7 @@ ifdef CONFIG_SUN3
 LDFLAGS_vmlinux = -N
 endif
 
-CHECKFLAGS += -D__mc68000__
+CHECKFLAGS += -D__mc68000__ -mbig-endian
 
 
 ifdef CONFIG_KGDB
-- 
2.14.0
