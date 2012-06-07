From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH 3/5] m68k: delay, muldi3 - Use CONFIG_CPU_HAS_NO_MULDIV64
Date: Thu,  7 Jun 2012 20:47:05 +0200
Message-ID: <1339094827-12349-3-git-send-email-geert__22542.6499419429$1339094943$gmane$org@linux-m68k.org>
References: <1339094827-12349-1-git-send-email-geert@linux-m68k.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <1339094827-12349-1-git-send-email-geert@linux-m68k.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@lists.linux-m68k.org
Cc: Greg Ungerer <gerg@uclinux.org>, Philippe De Muyter <phdm@macqel.be>, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>

instead of open coding CONFIG_M68000 || CONFIG_COLDFIRE

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 arch/m68k/include/asm/delay.h |    2 +-
 arch/m68k/lib/muldi3.c        |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/m68k/include/asm/delay.h b/arch/m68k/include/asm/delay.h
index 9c09bec..12d8fe4 100644
--- a/arch/m68k/include/asm/delay.h
+++ b/arch/m68k/include/asm/delay.h
@@ -43,7 +43,7 @@ static inline void __delay(unsigned long loops)
 extern void __bad_udelay(void);
 
 
-#if defined(CONFIG_M68000) || defined(CONFIG_COLDFIRE)
+#ifdef CONFIG_CPU_HAS_NO_MULDIV64
 /*
  * The simpler m68k and ColdFire processors do not have a 32*32->64
  * multiply instruction. So we need to handle them a little differently.
diff --git a/arch/m68k/lib/muldi3.c b/arch/m68k/lib/muldi3.c
index 79e928a..ee5f0b1 100644
--- a/arch/m68k/lib/muldi3.c
+++ b/arch/m68k/lib/muldi3.c
@@ -19,7 +19,7 @@ along with GNU CC; see the file COPYING.  If not, write to
 the Free Software Foundation, 59 Temple Place - Suite 330,
 Boston, MA 02111-1307, USA.  */
 
-#if defined(CONFIG_M68000) || defined(CONFIG_COLDFIRE)
+#ifdef CONFIG_CPU_HAS_NO_MULDIV64
 
 #define SI_TYPE_SIZE 32
 #define __BITS4 (SI_TYPE_SIZE / 4)
-- 
1.7.0.4
