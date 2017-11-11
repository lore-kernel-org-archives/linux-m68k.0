From: Finn Thain <fthain@telegraphics.com.au>
Subject: [PATCH 03/14] nubus: Use static functions where possible
Date: Sat, 11 Nov 2017 01:12:48 -0500 (EST)
Message-ID: <cf7e7593bb05083f1526f47de5f31fff9c832f4c.1510377368.git.fthain@telegraphics.com.au>
References: <cover.1510377368.git.fthain@telegraphics.com.au>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1510377368.git.fthain@telegraphics.com.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org

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
index afbea40512a3..8272d5a5d769 100644
--- a/drivers/nubus/nubus.c
+++ b/drivers/nubus/nubus.c
@@ -792,7 +792,7 @@ static struct nubus_board * __init nubus_add_board(int slot, int bytelanes)
 	return board;
 }
 
-void __init nubus_probe_slot(int slot)
+static void __init nubus_probe_slot(int slot)
 {
 	unsigned char dp;
 	unsigned char *rp;
@@ -826,7 +826,7 @@ void __init nubus_probe_slot(int slot)
 	}
 }
 
-void __init nubus_scan_bus(void)
+static void __init nubus_scan_bus(void)
 {
 	int slot;
 
diff --git a/include/linux/nubus.h b/include/linux/nubus.h
index b72340df081c..3b7d1d4860ef 100644
--- a/include/linux/nubus.h
+++ b/include/linux/nubus.h
@@ -91,7 +91,6 @@ extern struct nubus_dev* nubus_devices;
 extern struct nubus_board* nubus_boards;
 
 /* Generic NuBus interface functions, modelled after the PCI interface */
-void nubus_scan_bus(void);
 #ifdef CONFIG_PROC_FS
 extern void nubus_proc_init(void);
 #else
-- 
2.13.6
