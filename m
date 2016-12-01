From: Finn Thain <fthain@telegraphics.com.au>
Subject: [PATCH 04/10] via-cuda: Prevent read buffer overflow
Date: Thu,  1 Dec 2016 01:09:33 -0500 (EST)
Message-ID: <99a2b46bcc2885ee9ad790bb2fc3305ac1bbc81c.1480572271.git.fthain@telegraphics.com.au>
References: <cover.1480572271.git.fthain@telegraphics.com.au>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1480572271.git.fthain@telegraphics.com.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org

If the Cuda driver does not enter the 'read_done' state for some
reason, it may continue in the 'reading' state until the buffer
overflows. Add a bounds check to prevent this.

Tested-by: Stan Johnson <userm57@yahoo.com>
Signed-off-by: Finn Thain <fthain@telegraphics.com.au>
---
 drivers/macintosh/via-cuda.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/macintosh/via-cuda.c b/drivers/macintosh/via-cuda.c
index 64626d2..acf3a95 100644
--- a/drivers/macintosh/via-cuda.c
+++ b/drivers/macintosh/via-cuda.c
@@ -470,6 +470,8 @@ cuda_poll(void)
 }
 EXPORT_SYMBOL(cuda_poll);
 
+#define ARRAY_FULL(a, p)	((p) - (a) == ARRAY_SIZE(a))
+
 static irqreturn_t
 cuda_interrupt(int irq, void *arg)
 {
@@ -558,7 +560,11 @@ cuda_interrupt(int irq, void *arg)
 	break;
 
     case reading:
-	*reply_ptr++ = in_8(&via[SR]);
+	if (reading_reply ? ARRAY_FULL(current_req->reply, reply_ptr)
+	                  : ARRAY_FULL(cuda_rbuf, reply_ptr))
+	    (void)in_8(&via[SR]);
+	else
+	    *reply_ptr++ = in_8(&via[SR]);
 	if (!TREQ_asserted(status)) {
 	    /* that's all folks */
 	    negate_TIP_and_TACK();
-- 
2.7.3
