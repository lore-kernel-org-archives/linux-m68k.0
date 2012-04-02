From: Jiri Slaby <jslaby@suse.cz>
Subject: [PATCH 61/69] TTY: 68328serial, use tty from tty_port
Date: Mon,  2 Apr 2012 13:54:45 +0200
Message-ID: <1333367693-3244-62-git-send-email-jslaby__16542.4939165407$1333368455$gmane$org@suse.cz>
References: <1333367693-3244-1-git-send-email-jslaby@suse.cz>
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <1333367693-3244-1-git-send-email-jslaby@suse.cz>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: gregkh@linuxfoundation.org
Cc: alan@linux.intel.com, linux-kernel@vger.kernel.org, jirislaby@gmail.com, Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k@lists.linux-m68k.org

And refcount that properly.

Signed-off-by: Jiri Slaby <jslaby@suse.cz>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org
---
 drivers/tty/serial/68328serial.c |   12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/tty/serial/68328serial.c b/drivers/tty/serial/68328serial.c
index fde573b..77e10bb 100644
--- a/drivers/tty/serial/68328serial.c
+++ b/drivers/tty/serial/68328serial.c
@@ -114,7 +114,6 @@ struct m68k_serial {
 	int			port;
 	int			irq;
 	int			type;		/* UART type */
-	struct tty_struct	*tty;
 	int			custom_divisor;
 	int			x_char;		/* xon/xoff character */
 	int			line;
@@ -356,7 +355,7 @@ clear_and_return:
 irqreturn_t rs_interrupt(int irq, void *dev_id)
 {
 	struct m68k_serial *info = dev_id;
-	struct tty_struct *tty = info->tty;
+	struct tty_struct *tty = tty_port_tty_get(&info->tport);
 	m68328_uart *uart;
 	unsigned short rx;
 	unsigned short tx;
@@ -374,6 +373,8 @@ irqreturn_t rs_interrupt(int irq, void *dev_id)
 #else
 	receive_chars(info, tty, rx);
 #endif
+	tty_kref_put(tty);
+
 	return IRQ_HANDLED;
 }
 
@@ -1062,7 +1063,7 @@ static void rs_close(struct tty_struct *tty, struct file * filp)
 		
 	tty_ldisc_flush(tty);
 	tty->closing = 0;
-	info->tty = NULL;
+	tty_port_tty_set(&info->tport, NULL);
 #warning "This is not and has never been valid so fix it"	
 #if 0
 	if (tty->ldisc.num != ldiscs[N_TTY].num) {
@@ -1098,7 +1099,7 @@ void rs_hangup(struct tty_struct *tty)
 	shutdown(info, tty);
 	info->tport.count = 0;
 	info->tport.flags &= ~ASYNC_NORMAL_ACTIVE;
-	info->tty = NULL;
+	tty_port_tty_set(&info->tport, NULL);
 	wake_up_interruptible(&info->tport.open_wait);
 }
 
@@ -1210,7 +1211,7 @@ int rs_open(struct tty_struct *tty, struct file * filp)
 
 	info->tport.count++;
 	tty->driver_data = info;
-	info->tty = tty;
+	tty_port_tty_set(&info->tport, tty);
 
 	/*
 	 * Start up serial port
@@ -1289,7 +1290,6 @@ rs68328_init(void)
 	    tty_port_init(&info->tport);
 	    info->magic = SERIAL_MAGIC;
 	    info->port = (int) &uart_addr[i];
-	    info->tty = NULL;
 	    info->irq = uart_irqs[i];
 	    info->custom_divisor = 16;
 	    info->x_char = 0;
-- 
1.7.9.2
