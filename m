From: Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>
Subject: [PATCH] gayle: set IDE_HFLAG_SERIALIZE explictly
Date: Mon, 27 Oct 2008 20:59:32 +0100
Message-ID: <200810272059.32694.bzolnier@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-ide-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-ide-owner@vger.kernel.org
To: linux-ide@vger.kernel.org
Cc: linux-m68k@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>
List-Id: linux-m68k@vger.kernel.org

If IDE doubler is used ports need to be serialized.  Currently
init_irq() handles it fine but lets also set IDE_HFLAG_SERIALIZE
host flag explicitly in preparation for future changes.

Also convert the driver to use struct ide_port_info while at it.

Cc: Geert Uytterhoeven <geert@linux-m68k.org>
Signed-off-by: Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>
---
 drivers/ide/gayle.c |    6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

Index: b/drivers/ide/gayle.c
===================================================================
--- a/drivers/ide/gayle.c
+++ b/drivers/ide/gayle.c
@@ -117,6 +117,10 @@ static void __init gayle_setup_ports(hw_
 	hw->chipset = ide_generic;
 }
 
+static const struct ide_port_info gayle_port_info = {
+	.host_flags		= IDE_HFLAG_SERIALIZE | IDE_HFLAG_NO_DMA,
+};
+
     /*
      *  Probe for a Gayle IDE interface (and optionally for an IDE doubler)
      */
@@ -178,7 +182,7 @@ found:
 	hws[i] = &hw[i];
     }
 
-    rc = ide_host_add(NULL, hws, NULL);
+    rc = ide_host_add(&gayle_port_info, hws, NULL);
     if (rc)
 	release_mem_region(res_start, res_n);
 
