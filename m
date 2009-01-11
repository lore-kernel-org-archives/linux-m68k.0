From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH] m68k: atari_scc - Upstream updates
Date: Sun, 11 Jan 2009 12:15:43 +0100 (CET)
Message-ID: <Pine.LNX.4.64.0901111215140.15115@anakin>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from edna.telenet-ops.be ([195.130.132.58]:58809 "EHLO
	edna.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750938AbZAKLPu (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 11 Jan 2009 06:15:50 -0500
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitz@biophys.uni-duesseldorf.de>
Cc: Linux/m68k <linux-m68k@vger.kernel.org>

Port a few upstream updates from vme_scc.c to atari_scc.c:
  - commit 31f35939d1d9bcfb3099b32c67b896d2792603f9 ("tty_port: Add a port
    level carrier detect operation")
  - commit 36c621d82b956ff6ff72273f848af53e6c581aba ("tty: Introduce a tty_port
    generic block_til_ready")
  - commit c9f19e96a2f33cd56c2bd19f87a0c4982d011c2b ("tty: Remove some
    pointless casts")

The first 2 were needed to fix a compilation problem.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 drivers/char/atari_scc.c |   27 ++++++++++++++++-----------
 1 files changed, 16 insertions(+), 11 deletions(-)

diff --git a/drivers/char/atari_scc.c b/drivers/char/atari_scc.c
index fefff96..23fc4ed 100644
--- a/drivers/char/atari_scc.c
+++ b/drivers/char/atari_scc.c
@@ -74,7 +74,7 @@ static void scc_disable_tx_interrupts(void *ptr);
 static void scc_enable_tx_interrupts(void *ptr);
 static void scc_disable_rx_interrupts(void *ptr);
 static void scc_enable_rx_interrupts(void *ptr);
-static int scc_get_CD(void *ptr);
+static int scc_carrier_raised(struct tty_port *port);
 static void scc_shutdown_port(void *ptr);
 static int scc_set_real_termios(void *ptr);
 static void scc_hungup(void *ptr);
@@ -106,7 +106,6 @@ static struct real_driver scc_real_driver = {
 	.enable_tx_interrupts	= scc_enable_tx_interrupts,
 	.disable_rx_interrupts	= scc_disable_rx_interrupts,
 	.enable_rx_interrupts	= scc_enable_rx_interrupts,
-	.get_CD			= scc_get_CD,
 	.shutdown_port		= scc_shutdown_port,
 	.set_real_termios	= scc_set_real_termios,
 	.chars_in_buffer	= scc_chars_in_buffer,
@@ -133,6 +132,10 @@ static struct tty_operations scc_ops = {
 	.break_ctl		= scc_break_ctl,
 };
 
+static const struct tty_port_operations scc_port_ops = {
+	.carrier_raised = scc_carrier_raised,
+};
+
 /* BRG values for the standard speeds and the various clock sources */
 
 struct baud_entry {
@@ -263,6 +266,8 @@ static void scc_init_portstructs(void)
 
 	for (i = 0; i < 2; i++) {
 		port = scc_ports + i;
+		tty_port_init(&port->gs.port);
+		port->gs.port.ops = &scc_port_ops;
 		port->gs.magic = SCC_MAGIC;
 		port->gs.close_delay = HZ/2;
 		port->gs.closing_wait = 30 * HZ;
@@ -941,10 +946,10 @@ static void scc_enable_rx_interrupts(void *ptr)
 }
 
 
-static int scc_get_CD(void *ptr)
+static int scc_carrier_raised(struct tty_port *port)
 {
-	struct scc_port *port = ptr;
-	unsigned channel = port->channel;
+	struct scc_port *sc = container_of(port, struct scc_port, gs.port);
+	unsigned channel = sc->channel;
 
 	pr_debug("SCC: get_CD!\n");
 	return !!(scc_last_status_reg[channel] & SR_DCD);
@@ -1236,7 +1241,7 @@ static void scc_setsignals(struct scc_port *port, int dtr, int rts)
 
 static void scc_send_xchar(struct tty_struct *tty, char ch)
 {
-	struct scc_port *port = (struct scc_port *)tty->driver_data;
+	struct scc_port *port = tty->driver_data;
 
 	pr_debug("SCC: send_xchar ...\n");
 	port->x_char = ch;
@@ -1341,7 +1346,7 @@ static int scc_open(struct tty_struct *tty, struct file *filp)
 		return retval;
 	}
 
-	port->c_dcd = scc_get_CD(port);
+	port->c_dcd = tty_port_carrier_raised(&port->gs.port);
 
 	pr_debug(KERN_WARNING "SCC: enable rx ints ...\n");
 	scc_enable_rx_interrupts(port);
@@ -1353,7 +1358,7 @@ static int scc_open(struct tty_struct *tty, struct file *filp)
 
 static void scc_throttle(struct tty_struct *tty)
 {
-	struct scc_port *port = (struct scc_port *)tty->driver_data;
+	struct scc_port *port = tty->driver_data;
 	unsigned long flags;
 
 	SCC_ACCESS_INIT(port);
@@ -1371,7 +1376,7 @@ static void scc_throttle(struct tty_struct *tty)
 
 static void scc_unthrottle(struct tty_struct *tty)
 {
-	struct scc_port *port = (struct scc_port *)tty->driver_data;
+	struct scc_port *port = tty->driver_data;
 	unsigned long flags;
 
 	SCC_ACCESS_INIT(port);
@@ -1390,7 +1395,7 @@ static void scc_unthrottle(struct tty_struct *tty)
 static int scc_ioctl(struct tty_struct *tty, struct file *file,
 		     unsigned int cmd, unsigned long arg)
 {
-	struct scc_port *port = (struct scc_port *)tty->driver_data;
+	struct scc_port *port = tty->driver_data;
 	int retval;
 
 	pr_debug("SCC: ioctl! cmd %d, arg %lu\n", cmd, arg);
@@ -1476,7 +1481,7 @@ static int scc_ioctl(struct tty_struct *tty, struct file *file,
 
 static int scc_break_ctl(struct tty_struct *tty, int break_state)
 {
-	struct scc_port *port = (struct scc_port *)tty->driver_data;
+	struct scc_port *port = tty->driver_data;
 	unsigned long flags;
 
 	SCC_ACCESS_INIT(port);
-- 
1.5.6.5


Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
