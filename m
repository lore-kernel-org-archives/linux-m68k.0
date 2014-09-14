From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH] m68k: Add missing ioport_unmap()
Date: Sun, 14 Sep 2014 11:45:25 +0200
Message-ID: <1410687925-10880-1-git-send-email-geert@linux-m68k.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@lists.linux-m68k.org
Cc: Greg Ungerer <gerg@uclinux.org>, uclinux-dev@uclinux.org, Geert Uytterhoeven <geert@linux-m68k.org>

drivers/net/ethernet/cirrus/cs89x0.c: In function =E2=80=98cs89x0_iopor=
t_probe=E2=80=99:
drivers/net/ethernet/cirrus/cs89x0.c:1629: error: implicit declaration =
of function =E2=80=98ioport_unmap=E2=80=99

Add the missing ioport_unmap() implementation, and convert ioport_map()
from a macro to a static inline function while we're at it (both copied
from asm-generic).

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 arch/m68k/include/asm/io_mm.h | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/arch/m68k/include/asm/io_mm.h b/arch/m68k/include/asm/io_m=
m.h
index ffdf54f44bc6..8955b40a5dc4 100644
--- a/arch/m68k/include/asm/io_mm.h
+++ b/arch/m68k/include/asm/io_mm.h
@@ -510,6 +510,13 @@ static inline void memcpy_toio(volatile void __iom=
em *dst, const void *src, int
  */
 #define xlate_dev_kmem_ptr(p)	p
=20
-#define ioport_map(port, nr)	((void __iomem *)(port))
+static inline void __iomem *ioport_map(unsigned long port, unsigned in=
t nr)
+{
+	return (void __iomem *) port;
+}
+
+static inline void ioport_unmap(void __iomem *p)
+{
+}
=20
 #endif /* _IO_H */
--=20
1.9.1
