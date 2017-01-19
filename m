From: Gideon Israel Dsouza <gidisrael@gmail.com>
Subject: [PATCH 2/2] m68k: replaced gcc specific macros with ones from compiler.h
Date: Thu, 19 Jan 2017 19:05:30 +0530
Message-ID: <1484832930-7373-1-git-send-email-gidisrael@gmail.com>
Return-path: <linux-m68k-owner@vger.kernel.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: akpm@linux-foundation.org, linux-kernel@vger.kernel.org, gerg@linux-m68k.org, geert@linux-m68k.org, linux-m68k@lists.linux-m68k.org
Cc: Gideon Israel Dsouza <gidisrael@gmail.com>

There is <linux/compiler.h> which provides macros for various gcc specific
constructs. Eg: __weak for __attribute__((weak)). I've cleaned all
instances of gcc specific attributes with the right macros for all files
under /arch/m68k

This patch depends on the previous with changes in
/include/linux/compiler-gcc.h

Signed-off-by: Gideon Israel Dsouza <gidisrael@gmail.com>
---
 arch/m68k/68000/bootlogo-vz.h     | 4 +++-
 arch/m68k/68000/bootlogo.h        | 4 +++-
 arch/m68k/include/asm/MC68328.h   | 3 ++-
 arch/m68k/include/asm/MC68EZ328.h | 3 ++-
 arch/m68k/include/asm/MC68VZ328.h | 2 +-
 arch/m68k/include/asm/natfeat.h   | 3 ++-
 arch/m68k/lib/ashldi3.c           | 8 ++++----
 arch/m68k/lib/ashrdi3.c           | 8 ++++----
 arch/m68k/lib/lshrdi3.c           | 8 ++++----
 arch/m68k/lib/muldi3.c            | 8 ++++----
 10 files changed, 29 insertions(+), 22 deletions(-)

diff --git a/arch/m68k/68000/bootlogo-vz.h b/arch/m68k/68000/bootlogo-vz.h
index b38e2b2..6ff09be 100644
--- a/arch/m68k/68000/bootlogo-vz.h
+++ b/arch/m68k/68000/bootlogo-vz.h
@@ -1,6 +1,8 @@
+#include <linux/compiler.h>
+
 #define splash_width 640
 #define splash_height 480
-unsigned char __attribute__ ((aligned(16))) bootlogo_bits[] = {
+unsigned char __aligned(16) bootlogo_bits[] = {
   0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
   0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
   0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
diff --git a/arch/m68k/68000/bootlogo.h b/arch/m68k/68000/bootlogo.h
index b896c93..c466db3 100644
--- a/arch/m68k/68000/bootlogo.h
+++ b/arch/m68k/68000/bootlogo.h
@@ -1,6 +1,8 @@
+#include <linux/compiler.h>
+
 #define bootlogo_width 160
 #define bootlogo_height 160
-unsigned char __attribute__ ((aligned(16))) bootlogo_bits[] = {
+unsigned char __aligned(16) bootlogo_bits[] = {
   0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x55, 0x01, 0x00, 0x00, 0x00,
   0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
   0x00, 0x00, 0x40, 0x55, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
diff --git a/arch/m68k/include/asm/MC68328.h b/arch/m68k/include/asm/MC68328.h
index 1a8080c..b61230e 100644
--- a/arch/m68k/include/asm/MC68328.h
+++ b/arch/m68k/include/asm/MC68328.h
@@ -8,6 +8,7 @@
  * Copyright (C) 1998  Kenneth Albanowski <kjahds@kjahds.com>,
  *
  */
+#include <linux/compiler.h>
 
 #ifndef _MC68328_H_
 #define _MC68328_H_
@@ -993,7 +994,7 @@ typedef volatile struct {
   volatile unsigned short int pad1;
   volatile unsigned short int pad2;
   volatile unsigned short int pad3;
-} __attribute__((packed)) m68328_uart;
+} __packed m68328_uart;
 
 
 /**********
diff --git a/arch/m68k/include/asm/MC68EZ328.h b/arch/m68k/include/asm/MC68EZ328.h
index fedac87..703331e 100644
--- a/arch/m68k/include/asm/MC68EZ328.h
+++ b/arch/m68k/include/asm/MC68EZ328.h
@@ -9,6 +9,7 @@
  *                     The Silver Hammer Group, Ltd.
  *
  */
+#include <linux/compiler.h>
 
 #ifndef _MC68EZ328_H_
 #define _MC68EZ328_H_
@@ -815,7 +816,7 @@ typedef volatile struct {
   volatile unsigned short int nipr;
   volatile unsigned short int pad1;
   volatile unsigned short int pad2;
-} __attribute__((packed)) m68328_uart;
+} __packed m68328_uart;
 
 
 /**********
diff --git a/arch/m68k/include/asm/MC68VZ328.h b/arch/m68k/include/asm/MC68VZ328.h
index 34a51b2..fbaed7d 100644
--- a/arch/m68k/include/asm/MC68VZ328.h
+++ b/arch/m68k/include/asm/MC68VZ328.h
@@ -909,7 +909,7 @@ typedef struct {
   volatile unsigned short int nipr;
   volatile unsigned short int hmark;
   volatile unsigned short int unused;
-} __attribute__((packed)) m68328_uart;
+} __packed m68328_uart;
 
 
 
diff --git a/arch/m68k/include/asm/natfeat.h b/arch/m68k/include/asm/natfeat.h
index a3521b8..1feceb3 100644
--- a/arch/m68k/include/asm/natfeat.h
+++ b/arch/m68k/include/asm/natfeat.h
@@ -6,6 +6,7 @@
  * This software may be used and distributed according to the terms of
  * the GNU General Public License (GPL), incorporated herein by reference.
  */
+#include <linux/compiler.h>
 
 #ifndef _NATFEAT_H
 #define _NATFEAT_H
@@ -17,6 +18,6 @@ void nf_init(void);
 void nf_shutdown(void);
 
 void nfprint(const char *fmt, ...)
-	__attribute__ ((format (printf, 1, 2)));
+	__print(1, 2);
 
 # endif /* _NATFEAT_H */
diff --git a/arch/m68k/lib/ashldi3.c b/arch/m68k/lib/ashldi3.c
index 8dffd36..ac08f81 100644
--- a/arch/m68k/lib/ashldi3.c
+++ b/arch/m68k/lib/ashldi3.c
@@ -18,10 +18,10 @@ GNU General Public License for more details. */
 
 #define BITS_PER_UNIT 8
 
-typedef		 int SItype	__attribute__ ((mode (SI)));
-typedef unsigned int USItype	__attribute__ ((mode (SI)));
-typedef		 int DItype	__attribute__ ((mode (DI)));
-typedef int word_type __attribute__ ((mode (__word__)));
+typedef		 int SItype	__mode(SI);
+typedef unsigned int USItype	__mode(SI);
+typedef		 int DItype	__mode(DI);
+typedef int word_type           __mode(__word__);
 
 struct DIstruct {SItype high, low;};
 
diff --git a/arch/m68k/lib/ashrdi3.c b/arch/m68k/lib/ashrdi3.c
index e6565a3..5837b1d 100644
--- a/arch/m68k/lib/ashrdi3.c
+++ b/arch/m68k/lib/ashrdi3.c
@@ -18,10 +18,10 @@ GNU General Public License for more details. */
 
 #define BITS_PER_UNIT 8
 
-typedef		 int SItype	__attribute__ ((mode (SI)));
-typedef unsigned int USItype	__attribute__ ((mode (SI)));
-typedef		 int DItype	__attribute__ ((mode (DI)));
-typedef int word_type __attribute__ ((mode (__word__)));
+typedef		 int SItype	__mode(SI);
+typedef unsigned int USItype	__mode(SI);
+typedef		 int DItype	__mode(DI);
+typedef int word_type           __mode(__word__);
 
 struct DIstruct {SItype high, low;};
 
diff --git a/arch/m68k/lib/lshrdi3.c b/arch/m68k/lib/lshrdi3.c
index 0397797..7f40566 100644
--- a/arch/m68k/lib/lshrdi3.c
+++ b/arch/m68k/lib/lshrdi3.c
@@ -18,10 +18,10 @@ GNU General Public License for more details. */
 
 #define BITS_PER_UNIT 8
 
-typedef		 int SItype	__attribute__ ((mode (SI)));
-typedef unsigned int USItype	__attribute__ ((mode (SI)));
-typedef		 int DItype	__attribute__ ((mode (DI)));
-typedef int word_type __attribute__ ((mode (__word__)));
+typedef		 int SItype	__mode(SI);
+typedef unsigned int USItype	__mode(SI);
+typedef		 int DItype	__mode(DI);
+typedef int word_type           __mode(__word__);
 
 struct DIstruct {SItype high, low;};
 
diff --git a/arch/m68k/lib/muldi3.c b/arch/m68k/lib/muldi3.c
index 6459af5..3fb05c6 100644
--- a/arch/m68k/lib/muldi3.c
+++ b/arch/m68k/lib/muldi3.c
@@ -65,10 +65,10 @@ GNU General Public License for more details. */
     umul_ppmm (__w.s.high, __w.s.low, u, v);				\
     __w.ll; })
 
-typedef 	 int SItype	__attribute__ ((mode (SI)));
-typedef unsigned int USItype	__attribute__ ((mode (SI)));
-typedef		 int DItype	__attribute__ ((mode (DI)));
-typedef int word_type __attribute__ ((mode (__word__)));
+typedef 	 int SItype	__mode(SI);
+typedef unsigned int USItype	__mode(SI);
+typedef		 int DItype	__mode(DI);
+typedef int word_type           __mode(__word__);
 
 struct DIstruct {SItype high, low;};
 
-- 
2.7.4
