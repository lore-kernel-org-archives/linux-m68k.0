From: Joe Perches <joe@perches.com>
Subject: [PATCH] swim: Release memory region after incorrect return/goto
Date: Tue, 04 Jun 2013 11:34:35 -0700
Message-ID: <1370370875.2385.48.camel@joe-AO722>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k <linux-m68k@lists.linux-m68k.org>, Laurent Vivier <Laurent@Vivier.EU>

The code uses

	return foo;
	goto err_type;

when instead the form should have been

	ret = foo;
	goto err_type;

Here this causes a useful release_mem_region to be skipped.

Signed-off-by: Joe Perches <joe@perches.com>
Reviewed-by: Laurent Vivier <Laurent@Vivier.EU>
---

Hey Geert.

Just in case you don't see this on lkml.
I presume this has to go through you.

 drivers/block/swim.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/block/swim.c b/drivers/block/swim.c
index 2f445b7..8ed6ccb 100644
--- a/drivers/block/swim.c
+++ b/drivers/block/swim.c
@@ -893,7 +893,7 @@ static int swim_probe(struct platform_device *dev)
 
 	swim_base = ioremap(res->start, resource_size(res));
 	if (!swim_base) {
-		return -ENOMEM;
+		ret = -ENOMEM;
 		goto out_release_io;
 	}
 
