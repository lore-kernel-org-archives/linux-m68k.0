From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH] serial167: Kill unused variables
Date: Thu, 15 Apr 2010 21:31:26 +0200
Message-ID: <y2h10f740e81004151231x19995990y60bbab2aa389026b__30256.1140423224$1271360343$gmane$org@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Alan Cox <alan@linux.intel.com>
Cc: linux-kernel@vger.kernel.org, linux-m68k <linux-m68k@lists.linux-m68k.org>

commits 638157bc1461f6718eeca06bedd9a09cf1f35c36 ("serial167: prepare to push
BKL down into drivers") and 4165fe4ef7305609a96c7f248cefb9c414d0ede5 ("tty:
Fix up char drivers request_room usage") removed code without removing the
corresponding variables:

| drivers/char/serial167.c: In function 'cd2401_rx_interrupt':
| drivers/char/serial167.c:630: warning: unused variable 'len'
| drivers/char/serial167.c: In function 'cy_ioctl':
| drivers/char/serial167.c:1531: warning: unused variable 'val'

Remove the variables to kill the warnings.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 drivers/char/serial167.c |    2 --
 1 files changed, 0 insertions(+), 2 deletions(-)

diff --git a/drivers/char/serial167.c b/drivers/char/serial167.c
index 8dfd247..78a62eb 100644
--- a/drivers/char/serial167.c
+++ b/drivers/char/serial167.c
@@ -627,7 +627,6 @@ static irqreturn_t cd2401_rx_interrupt(int irq,
void *dev_id)
 	char data;
 	int char_count;
 	int save_cnt;
-	int len;

 	/* determine the channel and change to that context */
 	channel = (u_short) (base_addr[CyLICR] >> 2);
@@ -1528,7 +1527,6 @@ static int
 cy_ioctl(struct tty_struct *tty, struct file *file,
 	 unsigned int cmd, unsigned long arg)
 {
-	unsigned long val;
 	struct cyclades_port *info = tty->driver_data;
 	int ret_val = 0;
 	void __user *argp = (void __user *)arg;
-- 
1.6.0.4

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
