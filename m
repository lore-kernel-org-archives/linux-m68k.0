From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH] video: valkyriefb: Fix unused variable warning in set_valkyrie_clock()
Date: Sun, 14 Sep 2014 11:48:30 +0200
Message-ID: <1410688110-11042-1-git-send-email-geert@linux-m68k.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from baptiste.telenet-ops.be ([195.130.132.51]:37925 "EHLO
	baptiste.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752435AbaINJsb (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 14 Sep 2014 05:48:31 -0400
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>, Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc: linux-fbdev@vger.kernel.org, linux-m68k@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, Geert Uytterhoeven <geert@linux-m68k.org>

If CONFIG_ADB_CUDA=3Dn:

drivers/video/fbdev/valkyriefb.c: In function =E2=80=98set_valkyrie_clo=
ck=E2=80=99:
drivers/video/fbdev/valkyriefb.c:267: warning: unused variable =E2=80=98=
i=E2=80=99
drivers/video/fbdev/valkyriefb.c:266: warning: unused variable =E2=80=98=
req=E2=80=99

Move the variable declarations inside the existing #ifdef section to fi=
x
this.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 drivers/video/fbdev/valkyriefb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/video/fbdev/valkyriefb.c b/drivers/video/fbdev/val=
kyriefb.c
index 97cb9bd1d1dd..b6ed09f16355 100644
--- a/drivers/video/fbdev/valkyriefb.c
+++ b/drivers/video/fbdev/valkyriefb.c
@@ -263,10 +263,10 @@ static inline int valkyrie_vram_reqd(int video_mo=
de, int color_mode)
=20
 static void set_valkyrie_clock(unsigned char *params)
 {
+#ifdef CONFIG_ADB_CUDA
 	struct adb_request req;
 	int i;
=20
-#ifdef CONFIG_ADB_CUDA
 	for (i =3D 0; i < 3; ++i) {
 		cuda_request(&req, NULL, 5, CUDA_PACKET, CUDA_GET_SET_IIC,
 			     0x50, i + 1, params[i]);
--=20
1.9.1
