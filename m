From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH] mac: Make cuda_init_via() __init
Date: Sun, 30 Jun 2013 12:03:23 +0200
Message-ID: <1372586603-1373-1-git-send-email-geert@linux-m68k.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: linux-m68k@lists.linux-m68k.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>

cuda_init_via() is called from find_via_cuda() only, which is __init.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 drivers/macintosh/via-cuda.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/macintosh/via-cuda.c b/drivers/macintosh/via-cuda.c
index 86511c5..d61f271 100644
--- a/drivers/macintosh/via-cuda.c
+++ b/drivers/macintosh/via-cuda.c
@@ -259,7 +259,7 @@ cuda_probe(void)
     } while (0)
 
 static int
-cuda_init_via(void)
+__init cuda_init_via(void)
 {
     out_8(&via[DIRB], (in_8(&via[DIRB]) | TACK | TIP) & ~TREQ);	/* TACK & TIP out */
     out_8(&via[B], in_8(&via[B]) | TACK | TIP);			/* negate them */
-- 
1.7.9.5
