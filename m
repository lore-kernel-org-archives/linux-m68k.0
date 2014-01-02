From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Fwd: [PATCH, RFC 14/30] tty/amiserial: avoid interruptible_sleep_on
Date: Thu, 2 Jan 2014 13:27:25 +0100
Message-ID: <CAMuHMdVZtkW5LjJ8yTqdQ9xNigPP9V-qfHFCv56wJOa=6sfN4Q@mail.gmail.com>
References: <1388664474-1710039-1-git-send-email-arnd@arndb.de>
	<1388664474-1710039-15-git-send-email-arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pa0-f53.google.com ([209.85.220.53]:57027 "EHLO
	mail-pa0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750740AbaABM1Z (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Thu, 2 Jan 2014 07:27:25 -0500
Received: by mail-pa0-f53.google.com with SMTP id hz1so14394583pad.26
        for <linux-m68k@vger.kernel.org>; Thu, 02 Jan 2014 04:27:25 -0800 (PST)
In-Reply-To: <1388664474-1710039-15-git-send-email-arnd@arndb.de>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Linux/m68k <linux-m68k@vger.kernel.org>

---------- Forwarded message ----------
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, Jan 2, 2014 at 1:07 PM
Subject: [PATCH, RFC 14/30] tty/amiserial: avoid interruptible_sleep_on
To: linux-kernel@vger.kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>, Geert Uytterhoeven
<geert@linux-m68k.org>, Greg Kroah-Hartman
<gregkh@linuxfoundation.org>


interruptible_sleep_on is generally problematic and we want to get
rid of it. In case of TIOCMIWAIT, that race is actually in user
space and does not get fixed since we can only detect changes after
entering the ioctl handler, but it removes one more caller.

This instance can not be trivially replaced with wait_event, so
I chose to open-code the wait loop using prepare_to_wait/finish_wait.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/tty/amiserial.c | 26 ++++++++++++++++++--------
 1 file changed, 18 insertions(+), 8 deletions(-)

diff --git a/drivers/tty/amiserial.c b/drivers/tty/amiserial.c
index 71630a2..979e7c3 100644
--- a/drivers/tty/amiserial.c
+++ b/drivers/tty/amiserial.c
@@ -1248,6 +1248,8 @@ static int rs_ioctl(struct tty_struct *tty,
        struct async_icount cprev, cnow;        /* kernel counter temps */
        void __user *argp = (void __user *)arg;
        unsigned long flags;
+       DEFINE_WAIT(wait);
+       int ret;

        if (serial_paranoia_check(info, tty->name, "rs_ioctl"))
                return -ENODEV;
@@ -1288,25 +1290,33 @@ static int rs_ioctl(struct tty_struct *tty,
                        cprev = info->icount;
                        local_irq_restore(flags);
                        while (1) {
-
interruptible_sleep_on(&info->tport.delta_msr_wait);
-                               /* see if a signal did it */
-                               if (signal_pending(current))
-                                       return -ERESTARTSYS;
+                               prepare_to_wait(&info->tport.delta_msr_wait,
+                                               &wait, TASK_INTERRUPTIBLE);
                                local_irq_save(flags);
                                cnow = info->icount; /* atomic copy */
                                local_irq_restore(flags);
                                if (cnow.rng == cprev.rng && cnow.dsr
== cprev.dsr &&
-                                   cnow.dcd == cprev.dcd && cnow.cts
== cprev.cts)
-                                       return -EIO; /* no change => error */
+                                   cnow.dcd == cprev.dcd && cnow.cts
== cprev.cts) {
+                                       ret = -EIO; /* no change => error */
+                                       break;
+                               }
                                if ( ((arg & TIOCM_RNG) && (cnow.rng
!= cprev.rng)) ||
                                     ((arg & TIOCM_DSR) && (cnow.dsr
!= cprev.dsr)) ||
                                     ((arg & TIOCM_CD)  && (cnow.dcd
!= cprev.dcd)) ||
                                     ((arg & TIOCM_CTS) && (cnow.cts
!= cprev.cts)) ) {
-                                       return 0;
+                                       ret = 0;
+                                       break;
+                               }
+                               schedule();
+                               /* see if a signal did it */
+                               if (signal_pending(current)) {
+                                       ret = -ERESTARTSYS;
+                                       break;
                                }
                                cprev = cnow;
                        }
-                       /* NOTREACHED */
+                       finish_wait(&info->tport.delta_msr_wait, &wait);
+                       return ret;

                case TIOCSERGWILD:
                case TIOCSERSWILD:
--
1.8.3.2
