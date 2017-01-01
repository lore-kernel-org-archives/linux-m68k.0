From: Finn Thain <fthain@telegraphics.com.au>
Subject: [PATCH RESEND 08/10] via-cuda: Initialize data_index early and
 increment consistently
Date: Sat, 31 Dec 2016 19:56:26 -0500 (EST)
Message-ID: <cd02acbee18651e275a4bd8a5fdbf967b7abdd38.1483055859.git.fthain@telegraphics.com.au>
References: <cover.1483055859.git.fthain@telegraphics.com.au>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1483055859.git.fthain@telegraphics.com.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Michael Ellerman <mpe@ellerman.id.au>, Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org

Initialize data_index where appropriate to improve readability and
assist debugging. This change doesn't affect driver behaviour.

I prefer to see
	current_req->data[data_index++]
in place of
	current_req->data[0]
or
	current_req->data[1]
inasmuchas it becomes obvious what the data_index variable does.

Moreover, the actual value of data_index when examined at any given moment
tells me something about prior events, which did prove helpful.

Tested-by: Stan Johnson <userm57@yahoo.com>
Signed-off-by: Finn Thain <fthain@telegraphics.com.au>
---
 drivers/macintosh/via-cuda.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/macintosh/via-cuda.c b/drivers/macintosh/via-cuda.c
index e3763cb..57fb20d 100644
--- a/drivers/macintosh/via-cuda.c
+++ b/drivers/macintosh/via-cuda.c
@@ -446,12 +446,13 @@ cuda_start(void)
     /* assert cuda_state == idle */
     if (current_req == NULL)
 	return;
+    data_index = 0;
     if (TREQ_asserted(in_8(&via[B])))
 	return;			/* a byte is coming in from the CUDA */
 
     /* set the shift register to shift out and send a byte */
     out_8(&via[ACR], in_8(&via[ACR]) | SR_OUT);
-    out_8(&via[SR], current_req->data[0]);
+    out_8(&via[SR], current_req->data[data_index++]);
     assert_TIP();
     cuda_state = sent_first_byte;
 }
@@ -524,9 +525,8 @@ cuda_interrupt(int irq, void *arg)
 	    negate_TIP_and_TACK();
 	    cuda_state = idle;
 	} else {
-	    out_8(&via[SR], current_req->data[1]);
+	    out_8(&via[SR], current_req->data[data_index++]);
 	    toggle_TACK();
-	    data_index = 2;
 	    cuda_state = sending;
 	}
 	break;
-- 
2.10.2
