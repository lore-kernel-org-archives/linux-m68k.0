From: Vivek Goyal <vgoyal@redhat.com>
Subject: [PATCH] fix amiga and atari floppy driver compile warning
Date: Thu, 28 Oct 2010 14:42:24 -0400
Message-ID: <20101028184223.GG30148@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: Jens Axboe <jaxboe@fusionio.com>, linux kernel mailing list <linux-kernel@vger.kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@vger.kernel.org, hch@lst.de
List-Id: linux-m68k@vger.kernel.org

Geert, my crosstool don't produce warning below. I guess this has to do
something with compiler version.

- Geert noticed following warning during compilation.

  drivers/block/amiflop.c:1344: warning: =E2=80=98rq=E2=80=99 may be us=
ed uninitialized in
  this function
  drivers/block/ataflop.c:1402: warning: =E2=80=98rq=E2=80=99 may be us=
ed uninitialized in
  this function

- Initialize rq to NULL to fix the warning. If we can't find a suitable=
 request
  to dispatch, this function should return NULL instead of a possibly g=
arbage
  pointer.

- Cross compile tested only. Don't have hardware to test it.

Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
Signed-off-by: Vivek Goyal <vgoyal@redhat.com>
---
 drivers/block/amiflop.c |    2 +-
 drivers/block/ataflop.c |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

Index: linux-2.6/drivers/block/amiflop.c
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
--- linux-2.6.orig/drivers/block/amiflop.c	2010-10-28 14:32:25.00000000=
0 -0400
+++ linux-2.6/drivers/block/amiflop.c	2010-10-28 14:34:11.000000000 -04=
00
@@ -1341,7 +1341,7 @@ static struct request *set_next_request(
 {
 	struct request_queue *q;
 	int cnt =3D FD_MAX_UNITS;
-	struct request *rq;
+	struct request *rq =3D NULL;
=20
 	/* Find next queue we can dispatch from */
 	fdc_queue =3D fdc_queue + 1;
Index: linux-2.6/drivers/block/ataflop.c
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
--- linux-2.6.orig/drivers/block/ataflop.c	2010-10-28 14:31:21.00000000=
0 -0400
+++ linux-2.6/drivers/block/ataflop.c	2010-10-28 14:33:58.000000000 -04=
00
@@ -1399,7 +1399,7 @@ static struct request *set_next_request(
 {
 	struct request_queue *q;
 	int old_pos =3D fdc_queue;
-	struct request *rq;
+	struct request *rq =3D NULL;
=20
 	do {
 		q =3D unit[fdc_queue].disk->queue;
