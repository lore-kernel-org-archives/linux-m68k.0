From: gerg@uclinux.org
Subject: [PATCH 2/2] m68k: fix crufty ColdFire intro comments
Date: Thu, 21 Aug 2014 13:04:07 +1000
Message-ID: <1408590247-10875-3-git-send-email-gerg@uclinux.org>
References: <1408590247-10875-1-git-send-email-gerg@uclinux.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from nschwqsrv01p.mx.bigpond.com ([61.9.189.231]:56213 "EHLO
	nschwqsrv01p.mx.bigpond.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751898AbaHUDJQ (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>);
	Wed, 20 Aug 2014 23:09:16 -0400
In-Reply-To: <1408590247-10875-1-git-send-email-gerg@uclinux.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org
Cc: Greg Ungerer <gerg@uclinux.org>

From: Greg Ungerer <gerg@uclinux.org>

Quite a few of the ColdFire specific support files have a pathname in the
title comments of the file. These files have moved around a bit over the
years, and most are no longer accurate. Remove the pathname and fix the
comments to include at least a short description of the files contents.

Signed-off-by: Greg Ungerer <gerg@uclinux.org>
---
 arch/m68k/coldfire/entry.S   | 2 +-
 arch/m68k/coldfire/m5206.c   | 2 +-
 arch/m68k/coldfire/m520x.c   | 2 +-
 arch/m68k/coldfire/m523x.c   | 2 +-
 arch/m68k/coldfire/m5249.c   | 2 +-
 arch/m68k/coldfire/m525x.c   | 2 +-
 arch/m68k/coldfire/m5272.c   | 2 +-
 arch/m68k/coldfire/m527x.c   | 4 ++--
 arch/m68k/coldfire/m528x.c   | 2 +-
 arch/m68k/coldfire/m5307.c   | 2 +-
 arch/m68k/coldfire/m5407.c   | 2 +-
 arch/m68k/coldfire/m54xx.c   | 2 +-
 arch/m68k/coldfire/vectors.c | 2 +-
 13 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/arch/m68k/coldfire/entry.S b/arch/m68k/coldfire/entry.S
index 881ab8e..52d312d 100644
--- a/arch/m68k/coldfire/entry.S
+++ b/arch/m68k/coldfire/entry.S
@@ -1,5 +1,5 @@
 /*
- *  linux/arch/m68knommu/platform/5307/entry.S
+ *  entry.S  -- interrupt and exception processing for ColdFire
  *
  *  Copyright (C) 1999-2007, Greg Ungerer (gerg@snapgear.com)
  *  Copyright (C) 1998  D. Jeff Dionne <jeff@lineo.ca>,
diff --git a/arch/m68k/coldfire/m5206.c b/arch/m68k/coldfire/m5206.c
index 0e55f44..8945f5e 100644
--- a/arch/m68k/coldfire/m5206.c
+++ b/arch/m68k/coldfire/m5206.c
@@ -1,7 +1,7 @@
 /***************************************************************************/
 
 /*
- *	linux/arch/m68knommu/platform/5206/config.c
+ *	m5206.c  -- platform support for ColdFire 5206 based boards
  *
  *	Copyright (C) 1999-2002, Greg Ungerer (gerg@snapgear.com)
  * 	Copyright (C) 2000-2001, Lineo Inc. (www.lineo.com) 
diff --git a/arch/m68k/coldfire/m520x.c b/arch/m68k/coldfire/m520x.c
index 4040a3c..173834f 100644
--- a/arch/m68k/coldfire/m520x.c
+++ b/arch/m68k/coldfire/m520x.c
@@ -1,7 +1,7 @@
 /***************************************************************************/
 
 /*
- *  linux/arch/m68knommu/platform/520x/config.c
+ *  m520x.c  -- platform support for ColdFire 520x based boards
  *
  *  Copyright (C) 2005,      Freescale (www.freescale.com)
  *  Copyright (C) 2005,      Intec Automation (mike@steroidmicros.com)
diff --git a/arch/m68k/coldfire/m523x.c b/arch/m68k/coldfire/m523x.c
index 6b7135e..a191a46 100644
--- a/arch/m68k/coldfire/m523x.c
+++ b/arch/m68k/coldfire/m523x.c
@@ -1,7 +1,7 @@
 /***************************************************************************/
 
 /*
- *	linux/arch/m68knommu/platform/523x/config.c
+ *	m523x.c  -- platform support for ColdFire 523x based boards
  *
  *	Sub-architcture dependent initialization code for the Freescale
  *	523x CPUs.
diff --git a/arch/m68k/coldfire/m5249.c b/arch/m68k/coldfire/m5249.c
index f6253a3..e48f55a 100644
--- a/arch/m68k/coldfire/m5249.c
+++ b/arch/m68k/coldfire/m5249.c
@@ -1,7 +1,7 @@
 /***************************************************************************/
 
 /*
- *	linux/arch/m68knommu/platform/5249/config.c
+ *	m5249.c  -- platform support for ColdFire 5249 based boards
  *
  *	Copyright (C) 2002, Greg Ungerer (gerg@snapgear.com)
  */
diff --git a/arch/m68k/coldfire/m525x.c b/arch/m68k/coldfire/m525x.c
index 1adba39..3d8583e 100644
--- a/arch/m68k/coldfire/m525x.c
+++ b/arch/m68k/coldfire/m525x.c
@@ -1,7 +1,7 @@
 /***************************************************************************/
 
 /*
- *	525x.c
+ *	525x.c  -- platform support for ColdFire 525x based boards
  *
  *	Copyright (C) 2012, Steven King <sfking@fdwdc.com>
  */
diff --git a/arch/m68k/coldfire/m5272.c b/arch/m68k/coldfire/m5272.c
index 8a4d3cc..b15219e 100644
--- a/arch/m68k/coldfire/m5272.c
+++ b/arch/m68k/coldfire/m5272.c
@@ -1,7 +1,7 @@
 /***************************************************************************/
 
 /*
- *	linux/arch/m68knommu/platform/5272/config.c
+ *	m5272.c  -- platform support for ColdFire 5272 based boards
  *
  *	Copyright (C) 1999-2002, Greg Ungerer (gerg@snapgear.com)
  *	Copyright (C) 2001-2002, SnapGear Inc. (www.snapgear.com)
diff --git a/arch/m68k/coldfire/m527x.c b/arch/m68k/coldfire/m527x.c
index 62d81ef..2ba4707 100644
--- a/arch/m68k/coldfire/m527x.c
+++ b/arch/m68k/coldfire/m527x.c
@@ -1,10 +1,10 @@
 /***************************************************************************/
 
 /*
- *	linux/arch/m68knommu/platform/527x/config.c
+ *	m527x.c  -- platform support for ColdFire 527x based boards
  *
  *	Sub-architcture dependent initialization code for the Freescale
- *	5270/5271 CPUs.
+ *	5270/5271 and 5274/5275 CPUs.
  *
  *	Copyright (C) 1999-2004, Greg Ungerer (gerg@snapgear.com)
  *	Copyright (C) 2001-2004, SnapGear Inc. (www.snapgear.com)
diff --git a/arch/m68k/coldfire/m528x.c b/arch/m68k/coldfire/m528x.c
index 21cd161..45e947a 100644
--- a/arch/m68k/coldfire/m528x.c
+++ b/arch/m68k/coldfire/m528x.c
@@ -1,7 +1,7 @@
 /***************************************************************************/
 
 /*
- *	linux/arch/m68knommu/platform/528x/config.c
+ *	m528x.c  -- platform support for ColdFire 528x based boards
  *
  *	Sub-architcture dependent initialization code for the Freescale
  *	5280, 5281 and 5282 CPUs.
diff --git a/arch/m68k/coldfire/m5307.c b/arch/m68k/coldfire/m5307.c
index 8874353..2da1d14 100644
--- a/arch/m68k/coldfire/m5307.c
+++ b/arch/m68k/coldfire/m5307.c
@@ -1,7 +1,7 @@
 /***************************************************************************/
 
 /*
- *	linux/arch/m68knommu/platform/5307/config.c
+ *	m5307.c  -- platform support for ColdFire 5307 based boards
  *
  *	Copyright (C) 1999-2002, Greg Ungerer (gerg@snapgear.com)
  *	Copyright (C) 2000, Lineo (www.lineo.com)
diff --git a/arch/m68k/coldfire/m5407.c b/arch/m68k/coldfire/m5407.c
index 2fb3cdb..738eba6 100644
--- a/arch/m68k/coldfire/m5407.c
+++ b/arch/m68k/coldfire/m5407.c
@@ -1,7 +1,7 @@
 /***************************************************************************/
 
 /*
- *	linux/arch/m68knommu/platform/5407/config.c
+ *	m5407.c  -- platform support for ColdFire 5407 based boards
  *
  *	Copyright (C) 1999-2002, Greg Ungerer (gerg@snapgear.com)
  *	Copyright (C) 2000, Lineo (www.lineo.com)
diff --git a/arch/m68k/coldfire/m54xx.c b/arch/m68k/coldfire/m54xx.c
index 952da53..eec7f71 100644
--- a/arch/m68k/coldfire/m54xx.c
+++ b/arch/m68k/coldfire/m54xx.c
@@ -1,7 +1,7 @@
 /***************************************************************************/
 
 /*
- *	linux/arch/m68knommu/platform/54xx/config.c
+ *	m54xx.c  -- platform support for ColdFire 54xx based boards
  *
  *	Copyright (C) 2010, Philippe De Muyter <phdm@macqel.be>
  */
diff --git a/arch/m68k/coldfire/vectors.c b/arch/m68k/coldfire/vectors.c
index a4dbdec..08923fe6 100644
--- a/arch/m68k/coldfire/vectors.c
+++ b/arch/m68k/coldfire/vectors.c
@@ -1,7 +1,7 @@
 /***************************************************************************/
 
 /*
- *	linux/arch/m68knommu/platform/coldfire/vectors.c
+ *	vectors.c  -- high level trap setup for ColdFire
  *
  *	Copyright (C) 1999-2007, Greg Ungerer <gerg@snapgear.com>
  */
-- 
1.9.1
