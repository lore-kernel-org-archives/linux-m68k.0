From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH] m68k: Enable atomic64_t
Date: Sun, 23 May 2010 11:25:00 +0200 (CEST)
Message-ID: <alpine.DEB.2.00.1005231124380.1975__19712.1593905196$1274606759$gmane$org@ayla.of.borg>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Linux/m68k <linux-m68k@lists.linux-m68k.org>
Cc: Linux Kernel Development <linux-kernel@vger.kernel.org>

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 arch/m68k/Kconfig              |    1 +
 arch/m68k/include/asm/atomic.h |    2 ++
 2 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/arch/m68k/Kconfig b/arch/m68k/Kconfig
index 2921c86..40c31fa 100644
--- a/arch/m68k/Kconfig
+++ b/arch/m68k/Kconfig
@@ -7,6 +7,7 @@ config M68K
 	default y
 	select HAVE_AOUT
 	select HAVE_IDE
+	select GENERIC_ATOMIC64
 
 config MMU
 	bool
diff --git a/arch/m68k/include/asm/atomic.h b/arch/m68k/include/asm/atomic.h
index 8d29145..eab36dc 100644
--- a/arch/m68k/include/asm/atomic.h
+++ b/arch/m68k/include/asm/atomic.h
@@ -3,3 +3,5 @@
 #else
 #include "atomic_mm.h"
 #endif
+
+#include <asm-generic/atomic64.h>
-- 
1.7.0.4

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
