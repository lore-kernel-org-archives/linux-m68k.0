From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH 3/4] m68k/atari: ARAnyM - Prepare nfcon for submission
Date: Sun, 23 Jan 2011 17:31:33 +0100
Message-ID: <1295800294-13216-3-git-send-email-geert@linux-m68k.org>
References: <1295800294-13216-1-git-send-email-geert@linux-m68k.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <1295800294-13216-1-git-send-email-geert@linux-m68k.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@lists.linux-m68k.org
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Petr Stehlik <pstehlik@sophics.cz>

  - Break too long lines,
  - Make needlessly global functions static,
  - Use pr_*(),
  - Extract nfputs(), to avoid code duplication in nfcon_write() and
    nfcon_tty_write().

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Petr Stehlik <pstehlik@sophics.cz>
---
 arch/m68k/emu/nfcon.c |   30 ++++++++++++------------------
 1 files changed, 12 insertions(+), 18 deletions(-)

diff --git a/arch/m68k/emu/nfcon.c b/arch/m68k/emu/nfcon.c
index f82af58..ab20dc0 100644
--- a/arch/m68k/emu/nfcon.c
+++ b/arch/m68k/emu/nfcon.c
@@ -21,7 +21,7 @@
 static int stderr_id;
 static struct tty_driver *nfcon_tty_driver;
 
-static void nfcon_write(struct console *con, const char *str, unsigned int count)
+static void nfputs(const char *str, unsigned int count)
 {
 	char buf[68];
 
@@ -37,7 +37,13 @@ static void nfcon_write(struct console *con, const char *str, unsigned int count
 	nf_call(stderr_id, buf);
 }
 
-struct tty_driver *nfcon_device(struct console *con, int *index)
+static void nfcon_write(struct console *con, const char *str,
+			unsigned int count)
+{
+	nfputs(str, count);
+}
+
+static struct tty_driver *nfcon_device(struct console *con, int *index)
 {
 	*index = 0;
 	return (con->flags & CON_ENABLED) ? nfcon_tty_driver : NULL;
@@ -61,22 +67,10 @@ static void nfcon_tty_close(struct tty_struct *tty, struct file *filp)
 {
 }
 
-static int nfcon_tty_write(struct tty_struct *tty, const unsigned char *buf, int count)
+static int nfcon_tty_write(struct tty_struct *tty, const unsigned char *buf,
+			   int count)
 {
-	char temp[68];
-	int i = count;
-
-	temp[64] = 0;
-	while (i > 64) {
-		memcpy(temp, buf, 64);
-		nf_call(stderr_id, temp);
-		buf += 64;
-		i -= 64;
-	}
-	memcpy(temp, buf, i);
-	temp[i] = 0;
-	nf_call(stderr_id, temp);
-
+	nfputs(buf, count);
 	return count;
 }
 
@@ -144,7 +138,7 @@ static int __init nfcon_init(void)
 	tty_set_operations(nfcon_tty_driver, &nfcon_tty_ops);
 	res = tty_register_driver(nfcon_tty_driver);
 	if (res) {
-		printk(KERN_ERR "failed to register nfcon tty driver\n");
+		pr_err("failed to register nfcon tty driver\n");
 		put_tty_driver(nfcon_tty_driver);
 		return res;
 	}
-- 
1.7.0.4
