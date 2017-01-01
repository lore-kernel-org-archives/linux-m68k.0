From: Finn Thain <fthain@telegraphics.com.au>
Subject: [PATCH RESEND 04/10] via-cuda: Prevent read buffer overflow
Date: Sat, 31 Dec 2016 19:56:26 -0500 (EST)
Message-ID: <0f17040d7530acb6f3ebd7b592cca8dfb21d2b64.1483055859.git.fthain@telegraphics.com.au>
References: <cover.1483055859.git.fthain@telegraphics.com.au>
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from kvm5.telegraphics.com.au ([98.124.60.144]:49586 "EHLO
        kvm5.telegraphics.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754890AbdAAA43 (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Sat, 31 Dec 2016 19:56:29 -0500
In-Reply-To: <cover.1483055859.git.fthain@telegraphics.com.au>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Michael Ellerman <mpe@ellerman.id.au>, Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org

If the Cuda driver does not enter the 'read_done' state for some
reason, it may continue in the 'reading' state until the buffer
overflows. Add a bounds check to prevent this.

Tested-by: Stan Johnson <userm57@yahoo.com>
Signed-off-by: Finn Thain <fthain@telegraphics.com.au>
---
 drivers/macintosh/via-cuda.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/macintosh/via-cuda.c b/drivers/macintosh/via-cuda.c
index 64a04af..1cf1467 100644
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
2.10.2
