From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: [PATCH] m68k: don't export static inline functions
Date: Sat, 14 Nov 2009 18:20:28 +1100
Message-ID: <20091114182028.16b36c84.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: LKML <linux-kernel@vger.kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Rusty Russell <rusty@rustcorp.com.au>, Geert Uytterhoeven <geert@linux-m68k.org>, Roman Zippel <zippel@linux-m68k.org>, linux-m68k@lists.linux-m68k.org, Jochen Friedrich <jochen@scram.de>

These now cause errors due to changes present in linux-next:

(__ksymtab_sorted+0x1258): undefined reference to `dio_dev_driver'
(__ksymtab_sorted+0x4d48): undefined reference to `zorro_dev_driver'

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/dio/dio-driver.c     |    1 -
 drivers/zorro/zorro-driver.c |    1 -
 2 files changed, 0 insertions(+), 2 deletions(-)

Mind you, neither of these functions is used anywhere in the kernel
anyway.

diff --git a/drivers/dio/dio-driver.c b/drivers/dio/dio-driver.c
index 9c0c9af..a7b174e 100644
--- a/drivers/dio/dio-driver.c
+++ b/drivers/dio/dio-driver.c
@@ -140,5 +140,4 @@ postcore_initcall(dio_driver_init);
 EXPORT_SYMBOL(dio_match_device);
 EXPORT_SYMBOL(dio_register_driver);
 EXPORT_SYMBOL(dio_unregister_driver);
-EXPORT_SYMBOL(dio_dev_driver);
 EXPORT_SYMBOL(dio_bus_type);
diff --git a/drivers/zorro/zorro-driver.c b/drivers/zorro/zorro-driver.c
index e6c4390..53180a3 100644
--- a/drivers/zorro/zorro-driver.c
+++ b/drivers/zorro/zorro-driver.c
@@ -156,5 +156,4 @@ postcore_initcall(zorro_driver_init);
 EXPORT_SYMBOL(zorro_match_device);
 EXPORT_SYMBOL(zorro_register_driver);
 EXPORT_SYMBOL(zorro_unregister_driver);
-EXPORT_SYMBOL(zorro_dev_driver);
 EXPORT_SYMBOL(zorro_bus_type);
-- 
1.6.5.2

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/
