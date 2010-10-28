From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH] amiserial: Remove unused variable icount
Date: Thu, 28 Oct 2010 20:29:53 +0200 (CEST)
Message-ID: <alpine.DEB.2.00.1010282027480.29737@ayla.of.borg>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=ISO-8859-7
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Alan Cox <alan@linux.intel.com>, Greg Kroah-Hartman <gregkh@suse.de>, Andrew Morton <akpm@linux-foundation.org>
Cc: Linux Kernel Development <linux-kernel@vger.kernel.org>, Linux/m68k <linux-m68k@lists.linux-m68k.org>

drivers/char/amiserial.c: In function =A1rs_ioctl=A2:
drivers/char/amiserial.c:1302: warning: unused variable =A1icount=A2

commit 0587102cf9f427c185bfdeb2cef41e13ee0264b1 ("tty: icount changeove=
r for
other main devices") removed the users, but not the actual variable.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 drivers/char/amiserial.c |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/drivers/char/amiserial.c b/drivers/char/amiserial.c
index b0a7046..c0bd6f4 100644
--- a/drivers/char/amiserial.c
+++ b/drivers/char/amiserial.c
@@ -1299,7 +1299,6 @@ static int rs_ioctl(struct tty_struct *tty, struc=
t file * file,
 {
 	struct async_struct * info =3D tty->driver_data;
 	struct async_icount cprev, cnow;	/* kernel counter temps */
-	struct serial_icounter_struct icount;
 	void __user *argp =3D (void __user *)arg;
 	unsigned long flags;
=20
--=20
1.7.0.4

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-=
m68k.org

In personal conversations with technical people, I call myself a hacker=
=2E But
when I'm talking to journalists I just say "programmer" or something li=
ke that.
							    -- Linus Torvalds
