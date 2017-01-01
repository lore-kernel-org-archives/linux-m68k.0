From: Finn Thain <fthain@telegraphics.com.au>
Subject: [PATCH RESEND 05/10] via-cuda: Fix re-initialization of reply_ptr and
 reading_reply
Date: Sat, 31 Dec 2016 19:56:26 -0500 (EST)
Message-ID: <8ede5ed39315f7113b58ec5468ba6fe6c2274181.1483055859.git.fthain@telegraphics.com.au>
References: <cover.1483055859.git.fthain@telegraphics.com.au>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1483055859.git.fthain@telegraphics.com.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Michael Ellerman <mpe@ellerman.id.au>, Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org

When reading_reply is set, reply_ptr points into an adb_request struct.
Conversely, when reply_ptr instead points into the global cuda_rbuf,
reading_reply must be false.

Unfortunately, this rule can be violated because re-initialization
of reply_ptr and reading_reply presently depends on the TREQ input.

Fix this by re-initializing reply_ptr and reading_reply as soon as they
are known to be invalid.

Tested-by: Stan Johnson <userm57@yahoo.com>
Signed-off-by: Finn Thain <fthain@telegraphics.com.au>
---
 drivers/macintosh/via-cuda.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/macintosh/via-cuda.c b/drivers/macintosh/via-cuda.c
index 1cf1467..ae3da6b 100644
--- a/drivers/macintosh/via-cuda.c
+++ b/drivers/macintosh/via-cuda.c
@@ -592,6 +592,7 @@ cuda_interrupt(int irq, void *arg)
 	    }
 	    current_req = req->next;
 	    complete = 1;
+	    reading_reply = 0;
 	} else {
 	    /* This is tricky. We must break the spinlock to call
 	     * cuda_input. However, doing so means we might get
@@ -603,11 +604,10 @@ cuda_interrupt(int irq, void *arg)
 	    ibuf_len = reply_ptr - cuda_rbuf;
 	    memcpy(ibuf, cuda_rbuf, ibuf_len);
 	}
+	reply_ptr = cuda_rbuf;
 	if (TREQ_asserted(status)) {
 	    assert_TIP();
 	    cuda_state = reading;
-	    reply_ptr = cuda_rbuf;
-	    reading_reply = 0;
 	} else {
 	    cuda_state = idle;
 	    cuda_start();
-- 
2.10.2
