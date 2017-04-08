From: Finn Thain <fthain@telegraphics.com.au>
Subject: [PATCH 01/10] m68k/mac: IOP - Modernize printing of kernel messages
Date: Sat,  8 Apr 2017 19:51:15 -0400 (EDT)
Message-ID: <82778f2177d0ef7b25eecfcbf928c737c27c319c.1491695243.git.fthain@telegraphics.com.au>
References: <cover.1491695243.git.fthain@telegraphics.com.au>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1491695243.git.fthain@telegraphics.com.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org

From: Geert Uytterhoeven <geert@linux-m68k.org>

  - Introduce helpers for printing debug messages, incl. dummies for
    validating format strings when debugging is disabled,
  - Convert from printk() to pr_*(),
  - Add missing continuations,
  - Drop superfluous casts.

[Renamed pr_iop* macros, adjusted log message severity and
eliminated DEBUG_IOP. -- FT]

Signed-off-by: Finn Thain <fthain@telegraphics.com.au>
---
 arch/m68k/mac/iop.c | 74 +++++++++++++++++++++--------------------------------
 1 file changed, 29 insertions(+), 45 deletions(-)

diff --git a/arch/m68k/mac/iop.c b/arch/m68k/mac/iop.c
index 7990b6f..1746cfc 100644
--- a/arch/m68k/mac/iop.c
+++ b/arch/m68k/mac/iop.c
@@ -115,7 +115,17 @@
 #include <asm/macints.h>
 #include <asm/mac_iop.h>
 
-/*#define DEBUG_IOP*/
+#ifdef DEBUG
+#define iop_pr_debug(fmt, ...) \
+	printk(KERN_DEBUG "%s: " fmt, __func__, ##__VA_ARGS__)
+#define iop_pr_cont(fmt, ...) \
+	printk(KERN_CONT fmt, ##__VA_ARGS__)
+#else
+#define iop_pr_debug(fmt, ...) \
+	no_printk(KERN_DEBUG "%s: " fmt, __func__, ##__VA_ARGS__)
+#define iop_pr_cont(fmt, ...) \
+	no_printk(KERN_CONT fmt, ##__VA_ARGS__)
+#endif
 
 /* Non-zero if the IOPs are present */
 
@@ -268,10 +278,10 @@ void __init iop_init(void)
 	int i;
 
 	if (iop_scc_present) {
-		printk("IOP: detected SCC IOP at %p\n", iop_base[IOP_NUM_SCC]);
+		pr_info("IOP: detected SCC IOP at %p\n", iop_base[IOP_NUM_SCC]);
 	}
 	if (iop_ism_present) {
-		printk("IOP: detected ISM IOP at %p\n", iop_base[IOP_NUM_ISM]);
+		pr_info("IOP: detected ISM IOP at %p\n", iop_base[IOP_NUM_ISM]);
 		iop_start(iop_base[IOP_NUM_ISM]);
 		iop_alive(iop_base[IOP_NUM_ISM]); /* clears the alive flag */
 	}
@@ -310,9 +320,9 @@ void __init iop_register_interrupts(void)
 				pr_err("Couldn't register ISM IOP interrupt\n");
 		}
 		if (!iop_alive(iop_base[IOP_NUM_ISM])) {
-			printk("IOP: oh my god, they killed the ISM IOP!\n");
+			pr_warn("IOP: oh my god, they killed the ISM IOP!\n");
 		} else {
-			printk("IOP: the ISM IOP seems to be alive.\n");
+			pr_warn("IOP: the ISM IOP seems to be alive.\n");
 		}
 	}
 }
@@ -349,9 +359,8 @@ void iop_complete_message(struct iop_msg *msg)
 	int chan = msg->channel;
 	int i,offset;
 
-#ifdef DEBUG_IOP
-	printk("iop_complete(%p): iop %d chan %d\n", msg, msg->iop_num, msg->channel);
-#endif
+	iop_pr_debug("msg %p iop_num %d channel %d\n", msg, msg->iop_num,
+	             msg->channel);
 
 	offset = IOP_ADDR_RECV_MSG + (msg->channel * IOP_MSG_LEN);
 
@@ -397,9 +406,7 @@ static void iop_handle_send(uint iop_num, uint chan)
 	struct iop_msg *msg,*msg2;
 	int i,offset;
 
-#ifdef DEBUG_IOP
-	printk("iop_handle_send: iop %d channel %d\n", iop_num, chan);
-#endif
+	iop_pr_debug("iop_num %d chan %d\n", iop_num, chan);
 
 	iop_writeb(iop, IOP_ADDR_SEND_STATE + chan, IOP_MSG_IDLE);
 
@@ -430,9 +437,7 @@ static void iop_handle_recv(uint iop_num, uint chan)
 	int i,offset;
 	struct iop_msg *msg;
 
-#ifdef DEBUG_IOP
-	printk("iop_handle_recv: iop %d channel %d\n", iop_num, chan);
-#endif
+	iop_pr_debug("iop_num %d chan %d\n", iop_num, chan);
 
 	msg = iop_alloc_msg();
 	msg->iop_num = iop_num;
@@ -454,14 +459,9 @@ static void iop_handle_recv(uint iop_num, uint chan)
 	if (msg->handler) {
 		(*msg->handler)(msg);
 	} else {
-#ifdef DEBUG_IOP
-		printk("iop_handle_recv: unclaimed message on iop %d channel %d\n", iop_num, chan);
-		printk("iop_handle_recv:");
-		for (i = 0 ; i < IOP_MSG_LEN ; i++) {
-			printk(" %02X", (uint) msg->message[i]);
-		}
-		printk("\n");
-#endif
+		iop_pr_debug("unclaimed message on iop_num %d chan %d\n",
+		             iop_num, chan);
+		iop_pr_debug("%*ph\n", IOP_MSG_LEN, msg->message);
 		iop_complete_message(msg);
 	}
 }
@@ -574,50 +574,34 @@ irqreturn_t iop_ism_irq(int irq, void *dev_id)
 	volatile struct mac_iop *iop = iop_base[iop_num];
 	int i,state;
 
-#ifdef DEBUG_IOP
-	printk("iop_ism_irq: status = %02X\n", (uint) iop->status_ctrl);
-#endif
+	iop_pr_debug("status %02X\n", iop->status_ctrl);
 
 	/* INT0 indicates a state change on an outgoing message channel */
 
 	if (iop->status_ctrl & IOP_INT0) {
 		iop->status_ctrl = IOP_INT0 | IOP_RUN | IOP_AUTOINC;
-#ifdef DEBUG_IOP
-		printk("iop_ism_irq: new status = %02X, send states",
-			(uint) iop->status_ctrl);
-#endif
+		iop_pr_debug("new status %02X, send states", iop->status_ctrl);
 		for (i = 0 ; i < NUM_IOP_CHAN  ; i++) {
 			state = iop_readb(iop, IOP_ADDR_SEND_STATE + i);
-#ifdef DEBUG_IOP
-			printk(" %02X", state);
-#endif
+			iop_pr_cont(" %02X", state);
 			if (state == IOP_MSG_COMPLETE) {
 				iop_handle_send(iop_num, i);
 			}
 		}
-#ifdef DEBUG_IOP
-		printk("\n");
-#endif
+		iop_pr_cont("\n");
 	}
 
 	if (iop->status_ctrl & IOP_INT1) {	/* INT1 for incoming msgs */
 		iop->status_ctrl = IOP_INT1 | IOP_RUN | IOP_AUTOINC;
-#ifdef DEBUG_IOP
-		printk("iop_ism_irq: new status = %02X, recv states",
-			(uint) iop->status_ctrl);
-#endif
+		iop_pr_debug("new status %02X, recv states", iop->status_ctrl);
 		for (i = 0 ; i < NUM_IOP_CHAN ; i++) {
 			state = iop_readb(iop, IOP_ADDR_RECV_STATE + i);
-#ifdef DEBUG_IOP
-			printk(" %02X", state);
-#endif
+			iop_pr_cont(" %02X", state);
 			if (state == IOP_MSG_NEW) {
 				iop_handle_recv(iop_num, i);
 			}
 		}
-#ifdef DEBUG_IOP
-		printk("\n");
-#endif
+		iop_pr_cont("\n");
 	}
 	return IRQ_HANDLED;
 }
-- 
2.10.2
