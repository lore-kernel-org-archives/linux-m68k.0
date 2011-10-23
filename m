From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH 3/5] m68k/serial: Remove obsolete IRQ_FLG_* users
Date: Sun, 23 Oct 2011 23:18:04 +0200
Message-ID: <1319404686-10800-3-git-send-email-geert@linux-m68k.org>
References: <1319404686-10800-1-git-send-email-geert@linux-m68k.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devel-bounces@linuxdriverproject.org>
In-Reply-To: <1319404686-10800-1-git-send-email-geert@linux-m68k.org>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/devel>,
	<mailto:devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/devel>
List-Post: <mailto:devel@linuxdriverproject.org>
List-Help: <mailto:devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/devel>,
	<mailto:devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: devel-bounces@linuxdriverproject.org
Sender: devel-bounces@linuxdriverproject.org
To: linux-m68k@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: devel@driverdev.osuosl.org, Greg Kroah-Hartman <gregkh@suse.de>, Geert Uytterhoeven <geert@linux-m68k.org>
List-Id: linux-m68k@vger.kernel.org

The m68k core irq code stopped honoring these flags during the irq
restructuring in 2006.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Greg Kroah-Hartman <gregkh@suse.de>
Cc: devel@driverdev.osuosl.org
---
This is a split-up of "m68k/irq: Remove obsolete IRQ_FLG_* definitions and
users", to reduce conflicts and dependencies.

diff --git a/drivers/tty/serial/68360serial.c b/drivers/tty/serial/68360serial.c
index 0a3e878..daf0b1d 100644
--- a/drivers/staging/serial/68360serial.c
+++ b/drivers/staging/serial/68360serial.c
@@ -2771,8 +2771,8 @@ static int __init rs_360_init(void)
 			*/
 			/* cpm_install_handler(IRQ_MACHSPEC | state->irq, rs_360_interrupt, info);  */
 			/*request_irq(IRQ_MACHSPEC | state->irq, rs_360_interrupt, */
-			request_irq(state->irq, rs_360_interrupt,
-						IRQ_FLG_LOCK, "ttyS", (void *)info);
+			request_irq(state->irq, rs_360_interrupt, 0, "ttyS",
+				    (void *)info);
 
 			/* Set up the baud rate generator.
 			*/
-- 
1.7.0.4
