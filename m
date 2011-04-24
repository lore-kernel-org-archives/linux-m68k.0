From: Steven King <sfking@fdwdc.com>
Subject: coldfire_qspi compile fix
Date: Sun, 24 Apr 2011 10:48:07 -0700
Message-ID: <201104241048.08412.sfking@fdwdc.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from nm22-vm0.bullet.mail.sp2.yahoo.com ([98.139.91.222]:39348 "HELO
	nm22-vm0.bullet.mail.sp2.yahoo.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with SMTP id S1753120Ab1DXRsS (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>);
	Sun, 24 Apr 2011 13:48:18 -0400
Content-Disposition: inline
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: uclinux-dev@uclinux.org
Cc: linux-m68k@vger.kernel.org, Greg Ungerer <gerg@uclinux.org>

The m68k/m68knommu merge broke the qspi build.

Signed-off-by: Steven King <sfking@fdwdc.com>
---
 drivers/spi/coldfire_qspi.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/drivers/spi/coldfire_qspi.c b/drivers/spi/coldfire_qspi.c
index 8856bcc..ae2cd1c 100644
--- a/drivers/spi/coldfire_qspi.c
+++ b/drivers/spi/coldfire_qspi.c
@@ -33,6 +33,7 @@
 #include <linux/spi/spi.h>
 
 #include <asm/coldfire.h>
+#include <asm/mcfsim.h>
 #include <asm/mcfqspi.h>
 
 #define	DRIVER_NAME "mcfqspi"
