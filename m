From: Jiri Slaby <jslaby@suse.cz>
Subject: [PATCH 54/69] TTY: 68328serial, use ulong flags for interrupts status
Date: Mon,  2 Apr 2012 13:54:38 +0200
Message-ID: <1333367693-3244-55-git-send-email-jslaby__33326.4698776931$1333368425$gmane$org@suse.cz>
References: <1333367693-3244-1-git-send-email-jslaby@suse.cz>
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <1333367693-3244-1-git-send-email-jslaby@suse.cz>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: gregkh@linuxfoundation.org
Cc: alan@linux.intel.com, linux-kernel@vger.kernel.org, jirislaby@gmail.com, Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k@lists.linux-m68k.org

flags passed to local_irq_save/restore should be ulong. Switch tehem
to that. Otherwise we get compilation warnings:
.../68328serial.c:248:9: warning: comparison of distinct pointer types lacks a cast [enabled by default]
.../68328serial.c:257:9: warning: comparison of distinct pointer types lacks a cast [enabled by default]

Signed-off-by: Jiri Slaby <jslaby@suse.cz>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org
---
 drivers/tty/serial/68328serial.c |    6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/tty/serial/68328serial.c b/drivers/tty/serial/68328serial.c
index 81ed91e..f0d5039 100644
--- a/drivers/tty/serial/68328serial.c
+++ b/drivers/tty/serial/68328serial.c
@@ -162,7 +162,8 @@ static void rs_stop(struct tty_struct *tty)
 
 static int rs_put_char(char ch)
 {
-        int flags, loops = 0;
+	unsigned long flags;
+	int loops = 0;
 
         local_irq_save(flags);
 
@@ -1182,7 +1183,8 @@ static const struct tty_operations rs_ops = {
 static int __init
 rs68328_init(void)
 {
-	int flags, i;
+	unsigned long flags;
+	int i;
 	struct m68k_serial *info;
 
 	serial_driver = alloc_tty_driver(NR_PORTS);
-- 
1.7.9.2
