From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH/RFC] m68k: Uninline strchr()
Date: Sun, 9 Jan 2011 19:42:57 +0100 (CET)
Message-ID: <alpine.DEB.2.00.1101091942230.26296__29973.5039393001$1294598607$gmane$org@ayla.of.borg>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Linux/m68k <linux-m68k@lists.linux-m68k.org>, Linux Kernel Development <linux-kernel@vger.kernel.org>

Some versions of gcc replace calls to strstr() with single-character
"needle" string parameters by calls to strchr() behind our back.

If strchr() is defined as an inline function, this causes linking errors
like

	ERROR: "strchr" [drivers/target/target_core_mod.ko] undefined!

As m68k is the only architecture that has an inline strchr() and this
inline version is not an optimized asm version, uninline strchr() and use
the standard out-of-line C version in lib/string.c instead.

This also decreases the defconfig/allmodconfig kernel image sizes by a few
hundred bytes.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>

diff --git a/arch/m68k/include/asm/string.h b/arch/m68k/include/asm/string.h
index 2936dda..65b1312 100644
--- a/arch/m68k/include/asm/string.h
+++ b/arch/m68k/include/asm/string.h
@@ -81,18 +81,6 @@ static inline char *strncpy(char *dest, const char *src, size_t n)
 	strcpy(__d + strlen(__d), (s));		\
 })
 
-#define __HAVE_ARCH_STRCHR
-static inline char *strchr(const char *s, int c)
-{
-	char sc, ch = c;
-
-	for (; (sc = *s++) != ch; ) {
-		if (!sc)
-			return NULL;
-	}
-	return (char *)s - 1;
-}
-
 #ifndef CONFIG_COLDFIRE
 #define __HAVE_ARCH_STRCMP
 static inline int strcmp(const char *cs, const char *ct)
-- 
1.7.0.4

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
