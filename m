From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH 08/22] m68k/mac: iop - Modernize printing of kernel messages
Date: Wed,  7 Dec 2016 16:09:06 +0100
Message-ID: <1481123360-10978-9-git-send-email-geert__39454.2733942673$1481123882$gmane$org@linux-m68k.org>
References: <1481123360-10978-1-git-send-email-geert@linux-m68k.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <1481123360-10978-1-git-send-email-geert@linux-m68k.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Greg Ungerer <gerg@linux-m68k.org>, Sam Creasey <sammy@sammy.net>, Joshua Thompson <funaho@jurai.org>, Finn Thain <fthain@telegraphics.com.au>
Cc: linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>

  - Introduce helpers for printing debug messages, incl. dummies for
    validating format strings when debugging is disabled,
  - Convert from printk() to pr_*(),
  - Add missing continuations,
  - Drop superfluous casts.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 arch/m68k/mac/iop.c | 69 ++++++++++++++++++++++-------------------------------
 1 file changed, 29 insertions(+), 40 deletions(-)

diff --git a/arch/m68k/mac/iop.c b/arch/m68k/mac/iop.c
index 7990b6f50105b19b..bbfeded6b270f950 100644
--- a/arch/m68k/mac/iop.c
+++ b/arch/m68k/mac/iop.c
@@ -116,6 +116,13 @@
 #include <asm/mac_iop.h>
 
 /*#define DEBUG_IOP*/
+#ifdef DEBUG_IOP
+#define pr_iop(fmt, ...) printk(KERN_DEBUG pr_fmt(fmt), ##__VA_ARGS__)
+#define pr_iop_cont(fmt, ...) pr_cont(fmt, ##__VA_ARGS__)
+#else
+#define pr_iop(fmt, ...) no_printk(KERN_DEBUG pr_fmt(fmt), ##__VA_ARGS__)
+#define pr_iop_cont(fmt, ...) no_printk(fmt, ##__VA_ARGS__)
+#endif
 
 /* Non-zero if the IOPs are present */
 
@@ -268,10 +275,10 @@ void __init iop_init(void)
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
@@ -310,9 +317,9 @@ void __init iop_register_interrupts(void)
 				pr_err("Couldn't register ISM IOP interrupt\n");
 		}
 		if (!iop_alive(iop_base[IOP_NUM_ISM])) {
-			printk("IOP: oh my god, they killed the ISM IOP!\n");
+			pr_warn("IOP: oh my god, they killed the ISM IOP!\n");
 		} else {
-			printk("IOP: the ISM IOP seems to be alive.\n");
+			pr_info("IOP: the ISM IOP seems to be alive.\n");
 		}
 	}
 }
@@ -349,9 +356,8 @@ void iop_complete_message(struct iop_msg *msg)
 	int chan = msg->channel;
 	int i,offset;
 
-#ifdef DEBUG_IOP
-	printk("iop_complete(%p): iop %d chan %d\n", msg, msg->iop_num, msg->channel);
-#endif
+	pr_iop("iop_complete(%p): iop %d chan %d\n", msg, msg->iop_num,
+	       msg->channel);
 
 	offset = IOP_ADDR_RECV_MSG + (msg->channel * IOP_MSG_LEN);
 
@@ -397,9 +403,7 @@ static void iop_handle_send(uint iop_num, uint chan)
 	struct iop_msg *msg,*msg2;
 	int i,offset;
 
-#ifdef DEBUG_IOP
-	printk("iop_handle_send: iop %d channel %d\n", iop_num, chan);
-#endif
+	pr_iop("iop_handle_send: iop %d channel %d\n", iop_num, chan);
 
 	iop_writeb(iop, IOP_ADDR_SEND_STATE + chan, IOP_MSG_IDLE);
 
@@ -430,9 +434,7 @@ static void iop_handle_recv(uint iop_num, uint chan)
 	int i,offset;
 	struct iop_msg *msg;
 
-#ifdef DEBUG_IOP
-	printk("iop_handle_recv: iop %d channel %d\n", iop_num, chan);
-#endif
+	pr_iop("iop_handle_recv: iop %d channel %d\n", iop_num, chan);
 
 	msg = iop_alloc_msg();
 	msg->iop_num = iop_num;
@@ -454,13 +456,14 @@ static void iop_handle_recv(uint iop_num, uint chan)
 	if (msg->handler) {
 		(*msg->handler)(msg);
 	} else {
+		pr_iop("iop_handle_recv: unclaimed message on iop %d channel %d\n",
+		       iop_num, chan);
 #ifdef DEBUG_IOP
-		printk("iop_handle_recv: unclaimed message on iop %d channel %d\n", iop_num, chan);
-		printk("iop_handle_recv:");
+		pr_iop("iop_handle_recv:");
 		for (i = 0 ; i < IOP_MSG_LEN ; i++) {
-			printk(" %02X", (uint) msg->message[i]);
+			pr_cont(" %02X", msg->message[i]);
 		}
-		printk("\n");
+		pr_iop_cont("\n");
 #endif
 		iop_complete_message(msg);
 	}
@@ -574,50 +577,36 @@ irqreturn_t iop_ism_irq(int irq, void *dev_id)
 	volatile struct mac_iop *iop = iop_base[iop_num];
 	int i,state;
 
-#ifdef DEBUG_IOP
-	printk("iop_ism_irq: status = %02X\n", (uint) iop->status_ctrl);
-#endif
+	pr_iop("iop_ism_irq: status = %02X\n", iop->status_ctrl);
 
 	/* INT0 indicates a state change on an outgoing message channel */
 
 	if (iop->status_ctrl & IOP_INT0) {
 		iop->status_ctrl = IOP_INT0 | IOP_RUN | IOP_AUTOINC;
-#ifdef DEBUG_IOP
-		printk("iop_ism_irq: new status = %02X, send states",
-			(uint) iop->status_ctrl);
-#endif
+		pr_iop("iop_ism_irq: new status = %02X, send states",
+		       iop->status_ctrl);
 		for (i = 0 ; i < NUM_IOP_CHAN  ; i++) {
 			state = iop_readb(iop, IOP_ADDR_SEND_STATE + i);
-#ifdef DEBUG_IOP
-			printk(" %02X", state);
-#endif
+			pr_iop_cont(" %02X", state);
 			if (state == IOP_MSG_COMPLETE) {
 				iop_handle_send(iop_num, i);
 			}
 		}
-#ifdef DEBUG_IOP
-		printk("\n");
-#endif
+		pr_iop_cont("\n");
 	}
 
 	if (iop->status_ctrl & IOP_INT1) {	/* INT1 for incoming msgs */
 		iop->status_ctrl = IOP_INT1 | IOP_RUN | IOP_AUTOINC;
-#ifdef DEBUG_IOP
-		printk("iop_ism_irq: new status = %02X, recv states",
-			(uint) iop->status_ctrl);
-#endif
+		pr_iop("iop_ism_irq: new status = %02X, recv states",
+		       iop->status_ctrl);
 		for (i = 0 ; i < NUM_IOP_CHAN ; i++) {
 			state = iop_readb(iop, IOP_ADDR_RECV_STATE + i);
-#ifdef DEBUG_IOP
-			printk(" %02X", state);
-#endif
+			pr_iop_cont(" %02X", state);
 			if (state == IOP_MSG_NEW) {
 				iop_handle_recv(iop_num, i);
 			}
 		}
-#ifdef DEBUG_IOP
-		printk("\n");
-#endif
+		pr_iop_cont("\n");
 	}
 	return IRQ_HANDLED;
 }
-- 
1.9.1
