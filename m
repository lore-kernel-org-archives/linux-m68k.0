From: Finn Thain <fthain@telegraphics.com.au>
Subject: [PATCH 04/10] m68k/mac: Clarify IOP message alloc/free confusion
Date: Sat,  8 Apr 2017 19:51:15 -0400 (EDT)
Message-ID: <ed01cdf0ea5583cc03d2b5477286820848389434.1491695243.git.fthain@telegraphics.com.au>
References: <cover.1491695243.git.fthain@telegraphics.com.au>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1491695243.git.fthain@telegraphics.com.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org

The alloc/free metaphor used for IOP messages is misleading and can
cause mistakes like the pointless msg2 temporary variable. Use a more
meaningful name to help simplify the code.

Signed-off-by: Finn Thain <fthain@telegraphics.com.au>
---
 arch/m68k/mac/iop.c | 19 ++++++-------------
 1 file changed, 6 insertions(+), 13 deletions(-)

diff --git a/arch/m68k/mac/iop.c b/arch/m68k/mac/iop.c
index 1746cfc..4c1e606 100644
--- a/arch/m68k/mac/iop.c
+++ b/arch/m68k/mac/iop.c
@@ -210,7 +210,7 @@ static int iop_alive(volatile struct mac_iop *iop)
 	return retval;
 }
 
-static struct iop_msg *iop_alloc_msg(void)
+static struct iop_msg *iop_get_unused_msg(void)
 {
 	int i;
 	unsigned long flags;
@@ -229,11 +229,6 @@ static struct iop_msg *iop_alloc_msg(void)
 	return NULL;
 }
 
-static void iop_free_msg(struct iop_msg *msg)
-{
-	msg->status = IOP_MSGSTATUS_UNUSED;
-}
-
 /*
  * This is called by the startup code before anything else. Its purpose
  * is to find and initialize the IOPs early in the boot sequence, so that
@@ -372,7 +367,7 @@ void iop_complete_message(struct iop_msg *msg)
 		   IOP_ADDR_RECV_STATE + chan, IOP_MSG_COMPLETE);
 	iop_interrupt(iop_base[msg->iop_num]);
 
-	iop_free_msg(msg);
+	msg->status = IOP_MSGSTATUS_UNUSED;
 }
 
 /*
@@ -403,7 +398,7 @@ static void iop_do_send(struct iop_msg *msg)
 static void iop_handle_send(uint iop_num, uint chan)
 {
 	volatile struct mac_iop *iop = iop_base[iop_num];
-	struct iop_msg *msg,*msg2;
+	struct iop_msg *msg;
 	int i,offset;
 
 	iop_pr_debug("iop_num %d chan %d\n", iop_num, chan);
@@ -418,10 +413,8 @@ static void iop_handle_send(uint iop_num, uint chan)
 		msg->reply[i] = iop_readb(iop, offset);
 	}
 	if (msg->handler) (*msg->handler)(msg);
-	msg2 = msg;
+	msg->status = IOP_MSGSTATUS_UNUSED;
 	msg = msg->next;
-	iop_free_msg(msg2);
-
 	iop_send_queue[iop_num][chan] = msg;
 	if (msg) iop_do_send(msg);
 }
@@ -439,7 +432,7 @@ static void iop_handle_recv(uint iop_num, uint chan)
 
 	iop_pr_debug("iop_num %d chan %d\n", iop_num, chan);
 
-	msg = iop_alloc_msg();
+	msg = iop_get_unused_msg();
 	msg->iop_num = iop_num;
 	msg->channel = chan;
 	msg->status = IOP_MSGSTATUS_UNSOL;
@@ -484,7 +477,7 @@ int iop_send_message(uint iop_num, uint chan, void *privdata,
 	if (chan >= NUM_IOP_CHAN) return -EINVAL;
 	if (msg_len > IOP_MSG_LEN) return -EINVAL;
 
-	msg = iop_alloc_msg();
+	msg = iop_get_unused_msg();
 	if (!msg) return -ENOMEM;
 
 	msg->next = NULL;
-- 
2.10.2
