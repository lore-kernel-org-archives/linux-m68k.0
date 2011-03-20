From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: m68k/atari: SCC - Now phase out the ioctl file pointer for good
Date: Sun, 20 Mar 2011 10:40:31 +0100 (CET)
Message-ID: <alpine.DEB.2.00.1103201039330.15406@ayla.of.borg>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitzmic@googlemail.com>
Cc: Linux/m68k <linux-m68k@lists.linux-m68k.org>

Cfr. commit 6caa76b7786891b42b66a0e61e2c2fff2c884620 ("tty: now phase out the
ioctl file pointer for good")

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 drivers/staging/generic_serial/atari_scc.c |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/generic_serial/atari_scc.c b/drivers/staging/generic_serial/atari_scc.c
index e442fb4..99cee16 100644
--- a/drivers/staging/generic_serial/atari_scc.c
+++ b/drivers/staging/generic_serial/atari_scc.c
@@ -81,8 +81,8 @@ static void scc_hungup(void *ptr);
 static void scc_close(void *ptr);
 static int scc_chars_in_buffer(void *ptr);
 static int scc_open(struct tty_struct *tty, struct file *filp);
-static int scc_ioctl(struct tty_struct *tty, struct file *filp,
-		     unsigned int cmd, unsigned long arg);
+static int scc_ioctl(struct tty_struct *tty, unsigned int cmd,
+		     unsigned long arg);
 static void scc_throttle(struct tty_struct *tty);
 static void scc_unthrottle(struct tty_struct *tty);
 static irqreturn_t scc_tx_int(int irq, void *data);
@@ -1392,8 +1392,8 @@ static void scc_unthrottle(struct tty_struct *tty)
 }
 
 
-static int scc_ioctl(struct tty_struct *tty, struct file *file,
-		     unsigned int cmd, unsigned long arg)
+static int scc_ioctl(struct tty_struct *tty, unsigned int cmd,
+		     unsigned long arg)
 {
 	struct scc_port *port = tty->driver_data;
 	int retval;
-- 
1.7.0.4

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
