From: Himangi Saraogi <himangi774@gmail.com>
Subject: [PATCH] zorro: use ARRAY_SIZE
Date: Tue, 17 Jun 2014 01:40:04 +0530
Message-ID: <20140616201004.GA18240__25767.5105393448$1402949452$gmane$org@himangi-Dell>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-m68k-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org
Cc: julia.lawall@lip6.fr

ARRAY_SIZE is more concise to use when the size of an array is divided
by the size of its type or the size of its first element.

The Coccinelle semantic patch that makes this change is as follows:

// <smpl>
@@
type T;
T[] E;
@@

- (sizeof(E)/sizeof(T))
+ ARRAY_SIZE(E)
// </smpl>


Signed-off-by: Himangi Saraogi <himangi774@gmail.com>
---
 drivers/zorro/names.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/zorro/names.c b/drivers/zorro/names.c
index 6f3fd99..4ccbcc9 100644
--- a/drivers/zorro/names.c
+++ b/drivers/zorro/names.c
@@ -52,7 +52,7 @@ static struct zorro_manuf_info __initdata zorro_manuf_list[] = {
 #include "devlist.h"
 };
 
-#define MANUFS (sizeof(zorro_manuf_list)/sizeof(struct zorro_manuf_info))
+#define MANUFS ARRAY_SIZE(zorro_manuf_list)
 
 void __init zorro_name_device(struct zorro_dev *dev)
 {
-- 
1.9.1
