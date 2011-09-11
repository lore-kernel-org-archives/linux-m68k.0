From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH 03/28] keyboard: Do not include <linux/irq.>
Date: Sun, 11 Sep 2011 13:59:29 +0200
Message-ID: <1315742394-16036-4-git-send-email-geert@linux-m68k.org>
References: <1315742394-16036-1-git-send-email-geert@linux-m68k.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <1315742394-16036-1-git-send-email-geert@linux-m68k.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@lists.linux-m68k.org
Cc: linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>, Greg Kroah-Hartman <gregkh@suse.de>

The top of <linux/irq.h> has this comment:

 * Please do not include this file in generic code.  There is currently
 * no requirement for any architecture to implement anything held
 * within this file.
 *
 * Thanks. --rmk

Remove inclusion of <linux/irq.>, to prevent the following compile erro=
r
from happening soon:

| include/linux/irq.h:132: error: redefinition of =E2=80=98struct irq_d=
ata=E2=80=99
| include/linux/irq.h:286: error: redefinition of =E2=80=98struct irq_c=
hip=E2=80=99

drivers/tty/vt/keyboard.c needs to include <asm/irq_regs.h> for get_irq=
_regs():

| drivers/tty/vt/keyboard.c:497: error: implicit declaration of functio=
n =E2=80=98get_irq_regs=E2=80=99
| drivers/tty/vt/keyboard.c:497: warning: initialization makes pointer =
from integer without a cast

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
Acked-by: Thomas Gleixner <tglx@linutronix.de>
Cc: Greg Kroah-Hartman <gregkh@suse.de>
---
 drivers/tty/vt/keyboard.c |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/drivers/tty/vt/keyboard.c b/drivers/tty/vt/keyboard.c
index 3761ccf..a605549 100644
--- a/drivers/tty/vt/keyboard.c
+++ b/drivers/tty/vt/keyboard.c
@@ -33,7 +33,6 @@
 #include <linux/string.h>
 #include <linux/init.h>
 #include <linux/slab.h>
-#include <linux/irq.h>
=20
 #include <linux/kbd_kern.h>
 #include <linux/kbd_diacr.h>
@@ -43,6 +42,8 @@
 #include <linux/notifier.h>
 #include <linux/jiffies.h>
=20
+#include <asm/irq_regs.h>
+
 extern void ctrl_alt_del(void);
=20
 /*
--=20
1.7.0.4
