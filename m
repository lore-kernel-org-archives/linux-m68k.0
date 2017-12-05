From: Finn Thain <fthain@telegraphics.com.au>
Subject: [PATCH v3 03/14] nubus: Use static functions where possible
Date: Tue,  5 Dec 2017 01:20:01 -0500 (EST)
Message-ID: <5609e54a107c8ec9b42ecd9dbd8d33cca8f45901.1512454057.git.fthain@telegraphics.com.au>
References: <cover.1512454057.git.fthain@telegraphics.com.au>
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from kvm5.telegraphics.com.au ([98.124.60.144]:50850 "EHLO
        kvm5.telegraphics.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752138AbdLEGUC (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Tue, 5 Dec 2017 01:20:02 -0500
In-Reply-To: <cover.1512454057.git.fthain@telegraphics.com.au>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@vger.kernel.org, linux-kernel@vger.kernel.org

This fixes a couple of warnings from 'make W=1':
drivers/nubus/nubus.c:790: warning: no previous prototype for 'nubus_probe_slot'
drivers/nubus/nubus.c:824: warning: no previous prototype for 'nubus_scan_bus'

Tested-by: Stan Johnson <userm57@yahoo.com>
Signed-off-by: Finn Thain <fthain@telegraphics.com.au>
---
 drivers/nubus/nubus.c | 4 ++--
 include/linux/nubus.h | 1 -
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/nubus/nubus.c b/drivers/nubus/nubus.c
index 566dc563e7e8..3c1d386a4640 100644
--- a/drivers/nubus/nubus.c
+++ b/drivers/nubus/nubus.c
@@ -793,7 +793,7 @@ static struct nubus_board * __init nubus_add_board(int slot, int bytelanes)
 	return board;
 }
 
-void __init nubus_probe_slot(int slot)
+static void __init nubus_probe_slot(int slot)
 {
 	unsigned char dp;
 	unsigned char *rp;
@@ -827,7 +827,7 @@ void __init nubus_probe_slot(int slot)
 	}
 }
 
-void __init nubus_scan_bus(void)
+static void __init nubus_scan_bus(void)
 {
 	int slot;
 
diff --git a/include/linux/nubus.h b/include/linux/nubus.h
index a6edf7838e22..bffd09a07326 100644
--- a/include/linux/nubus.h
+++ b/include/linux/nubus.h
@@ -92,7 +92,6 @@ extern struct nubus_dev* nubus_devices;
 extern struct nubus_board* nubus_boards;
 
 /* Generic NuBus interface functions, modelled after the PCI interface */
-void nubus_scan_bus(void);
 #ifdef CONFIG_PROC_FS
 extern void nubus_proc_init(void);
 #else
-- 
2.13.6
