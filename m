From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH] block/m68k: z2ram - correct printing of sector_t
Date: Mon, 30 Aug 2010 09:07:27 +0200 (CEST)
Message-ID: <alpine.DEB.2.00.1008300905290.28923__31604.7571752735$1283152086$gmane$org@ayla.of.borg>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=ISO-8859-7
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Jens Axboe <axboe@kernel.dk>
Cc: Andrew Morton <akpm@linux-foundation.org>, Linux Kernel Development <linux-kernel@vger.kernel.org>

If CONFIG_LBDAF=3Dy, `sector_t' becomes `u64' instead of `unsigned long=
':

drivers/block/z2ram.c: In function =A1do_z2_request=A2:
drivers/block/z2ram.c:83: warning: format =A1%lu=A2 expects type =A1lon=
g unsigned int=A2, but argument 2 has type =A1sector_t=A2

Hence always cast it to `unsigned long long' for printing.
Also do the pr_err() dance, while we're at it.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 drivers/block/z2ram.c |    6 ++++--
 1 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/block/z2ram.c b/drivers/block/z2ram.c
index d75b2bb..2dbcaaa 100644
--- a/drivers/block/z2ram.c
+++ b/drivers/block/z2ram.c
@@ -79,8 +79,10 @@ static void do_z2_request(struct request_queue *q)
 		int err =3D 0;
=20
 		if (start + len > z2ram_size) {
-			printk( KERN_ERR DEVICE_NAME ": bad access: block=3D%lu, count=3D%u=
\n",
-				blk_rq_pos(req), blk_rq_cur_sectors(req));
+			pr_err(DEVICE_NAME ": bad access: block=3D%llu, "
+			       "count=3D%u\n",
+			       (unsigned long long)blk_rq_pos(req),
+			       blk_rq_cur_sectors(req));
 			err =3D -EIO;
 			goto done;
 		}
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
