From: Arnaud Lacombe <lacombar@gmail.com>
Subject: [PATCH 01/11] arch/m68k: do not use EXTRA_{A,C,LD}FLAGS
Date: Mon, 15 Aug 2011 01:07:04 -0400
Message-ID: <1313384834-24433-2-git-send-email-lacombar__33284.0878204026$1313388151$gmane$org@gmail.com>
References: <1313384834-24433-1-git-send-email-lacombar@gmail.com>
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <1313384834-24433-1-git-send-email-lacombar@gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Arnaud Lacombe <lacombar@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, linux-m68k@lists.linux-m68k.org

Usage of these flags has been deprecated for nearly 4 years by:

    commit f77bf01425b11947eeb3b5b54685212c302741b8
    Author: Sam Ravnborg <sam@neptun.(none)>
    Date:   Mon Oct 15 22:25:06 2007 +0200

        kbuild: introduce ccflags-y, asflags-y and ldflags-y

Moreover, these flags (at least EXTRA_CFLAGS) have been documented for command
line use. By default, gmake(1) do not override command line setting, so this is
likely to result in build failure or unexpected behavior.

Replace their usage by Kbuild's `{as,cc,ld}flags-y'.

Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: linux-m68k@lists.linux-m68k.org
---
 arch/m68k/fpsp040/Makefile       |    2 +-
 arch/m68k/ifpsp060/Makefile      |    2 +-
 arch/m68k/platform/54xx/Makefile |    4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/m68k/fpsp040/Makefile b/arch/m68k/fpsp040/Makefile
index 9506d88..628a351 100644
--- a/arch/m68k/fpsp040/Makefile
+++ b/arch/m68k/fpsp040/Makefile
@@ -10,6 +10,6 @@ obj-y    := bindec.o binstr.o decbin.o do_func.o gen_except.o get_op.o \
 	    x_bsun.o x_fline.o x_operr.o x_ovfl.o x_snan.o x_store.o \
 	    x_unfl.o x_unimp.o x_unsupp.o bugfix.o skeleton.o
 
-EXTRA_LDFLAGS := -x
+ldflags-y := -x
 
 $(OS_OBJS): fpsp.h
diff --git a/arch/m68k/ifpsp060/Makefile b/arch/m68k/ifpsp060/Makefile
index 43b4350..5ba2d1e 100644
--- a/arch/m68k/ifpsp060/Makefile
+++ b/arch/m68k/ifpsp060/Makefile
@@ -6,4 +6,4 @@
 
 obj-y := fskeleton.o iskeleton.o os.o
 
-EXTRA_LDFLAGS := -x
+ldflags-y := -x
diff --git a/arch/m68k/platform/54xx/Makefile b/arch/m68k/platform/54xx/Makefile
index 6cfd090..967b51d 100644
--- a/arch/m68k/platform/54xx/Makefile
+++ b/arch/m68k/platform/54xx/Makefile
@@ -8,8 +8,8 @@
 # on the console port whenever a DBG interrupt occurs. You have to
 # set up you HW breakpoints to trigger a DBG interrupt:
 #
-# EXTRA_CFLAGS += -DTRAP_DBG_INTERRUPT
-# EXTRA_AFLAGS += -DTRAP_DBG_INTERRUPT
+# ccflags-y += -DTRAP_DBG_INTERRUPT
+# ccflags-y += -DTRAP_DBG_INTERRUPT
 #
 
 asflags-$(CONFIG_FULLDEBUG) := -DDEBUGGER_COMPATIBLE_CACHE=1
-- 
1.7.6.153.g78432
