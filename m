From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH] mac/m68k: adb-iop - flags should be unsigned long
Date: Thu, 28 Oct 2010 20:30:51 +0200 (CEST)
Message-ID: <alpine.DEB.2.00.1010282029540.29755@ayla.of.borg>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=ISO-8859-7
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Linux/m68k <linux-m68k@lists.linux-m68k.org>, Linux Kernel Development <linux-kernel@vger.kernel.org>

drivers/macintosh/adb-iop.c: In function =A1adb_iop_complete=A2:
drivers/macintosh/adb-iop.c:85: warning: comparison of distinct pointer=
 types lacks a cast
drivers/macintosh/adb-iop.c:92: warning: comparison of distinct pointer=
 types lacks a cast
drivers/macintosh/adb-iop.c: In function =A1adb_iop_listen=A2:
drivers/macintosh/adb-iop.c:111: warning: comparison of distinct pointe=
r types lacks a cast
drivers/macintosh/adb-iop.c:151: warning: comparison of distinct pointe=
r types lacks a cast

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 drivers/macintosh/adb-iop.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/macintosh/adb-iop.c b/drivers/macintosh/adb-iop.c
index 4446966..f5f4da3 100644
--- a/drivers/macintosh/adb-iop.c
+++ b/drivers/macintosh/adb-iop.c
@@ -80,7 +80,7 @@ static void adb_iop_end_req(struct adb_request *req, =
int state)
 static void adb_iop_complete(struct iop_msg *msg)
 {
 	struct adb_request *req;
-	uint flags;
+	unsigned long flags;
=20
 	local_irq_save(flags);
=20
@@ -103,7 +103,7 @@ static void adb_iop_listen(struct iop_msg *msg)
 {
 	struct adb_iopmsg *amsg =3D (struct adb_iopmsg *) msg->message;
 	struct adb_request *req;
-	uint flags;
+	unsigned long flags;
 #ifdef DEBUG_ADB_IOP
 	int i;
 #endif
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
