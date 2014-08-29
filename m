From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH] m68k/atari - stram: Add missing #include <linux/ioport.h>
Date: Fri, 29 Aug 2014 18:13:20 +0200
Message-ID: <1409328800-25539-1-git-send-email-geert@linux-m68k.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitzmic@gmail.com>
Cc: linux-m68k@lists.linux-m68k.org, Geert Uytterhoeven <geert@linux-m68k.org>

If CONFIG_BLOCK=3Dn:

arch/m68k/atari/stram.c:44: error: variable =E2=80=98stram_pool=E2=80=99=
 has initializer but incomplete type
arch/m68k/atari/stram.c:45: error: unknown field =E2=80=98name=E2=80=99=
 specified in initializer
arch/m68k/atari/stram.c:46: warning: excess elements in struct initiali=
zer
arch/m68k/atari/stram.c:46: warning: (near initialization for =E2=80=98=
stram_pool=E2=80=99)
arch/m68k/atari/stram.c: In function =E2=80=98atari_stram_reserve_pages=
=E2=80=99:
arch/m68k/atari/stram.c:97: error: invalid use of undefined type =E2=80=
=98struct resource=E2=80=99
=2E..

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 arch/m68k/atari/stram.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/m68k/atari/stram.c b/arch/m68k/atari/stram.c
index 5f8cb5a234d9..c83d66442612 100644
--- a/arch/m68k/atari/stram.c
+++ b/arch/m68k/atari/stram.c
@@ -21,6 +21,7 @@
 #include <linux/mount.h>
 #include <linux/blkdev.h>
 #include <linux/module.h>
+#include <linux/ioport.h>
=20
 #include <asm/setup.h>
 #include <asm/machdep.h>
--=20
1.9.1
