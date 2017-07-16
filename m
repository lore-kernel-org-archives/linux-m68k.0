From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH 2/3] blackfin, m68k: Fix flat_set_persistent() for unsigned long to u32 changes
Date: Sun, 16 Jul 2017 13:57:28 +0200
Message-ID: <1500206249-16670-2-git-send-email-geert__609.174479223107$1500206281$gmane$org@linux-m68k.org>
References: <1500206249-16670-1-git-send-email-geert@linux-m68k.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <1500206249-16670-1-git-send-email-geert@linux-m68k.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Alexander Viro <viro@zeniv.linux.org.uk>, Linus Torvalds <torvalds@linux-foundation.org>
Cc: Steven Miao <realmz6@gmail.com>, Yoshinori Sato <ysato@users.sourceforge.jp>, Greg Ungerer <gerg@linux-m68k.org>, adi-buildroot-devel@lists.sourceforge.net, uclinux-h8-devel@lists.sourceforge.jp, linux-m68k@lists.linux-m68k.org, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>

Several variables had their types changed from unsigned long to u32, but
the arch-specific implementations of flat_set_persistent() weren't
updated, leading to compiler warnings on blackfin and m68k:

    fs/binfmt_flat.c: In function ‘load_flat_file’:
    fs/binfmt_flat.c:799: warning: passing argument 2 of ‘flat_set_persistent’ from incompatible pointer type

Fixes: 468138d78510688f ("binfmt_flat: flat_{get,put}_addr_from_rp() should be able to fail")
Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 arch/blackfin/include/asm/flat.h | 3 +--
 arch/m68k/include/asm/flat.h     | 3 +--
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/arch/blackfin/include/asm/flat.h b/arch/blackfin/include/asm/flat.h
index 296d7f56fbfd005b..f1d6ba7afbf245a0 100644
--- a/arch/blackfin/include/asm/flat.h
+++ b/arch/blackfin/include/asm/flat.h
@@ -44,8 +44,7 @@ flat_get_relocate_addr (unsigned long relval)
 	return relval & 0x03ffffff; /* Mask out top 6 bits */
 }
 
-static inline int flat_set_persistent(unsigned long relval,
-				      unsigned long *persistent)
+static inline int flat_set_persistent(u32 relval, u32 *persistent)
 {
 	int type = (relval >> 26) & 7;
 	if (type == 3) {
diff --git a/arch/m68k/include/asm/flat.h b/arch/m68k/include/asm/flat.h
index 48b62790fe70f1a6..b2a41f5b3890a524 100644
--- a/arch/m68k/include/asm/flat.h
+++ b/arch/m68k/include/asm/flat.h
@@ -30,8 +30,7 @@ static inline int flat_put_addr_at_rp(u32 __user *rp, u32 addr, u32 rel)
 }
 #define	flat_get_relocate_addr(rel)		(rel)
 
-static inline int flat_set_persistent(unsigned long relval,
-				      unsigned long *persistent)
+static inline int flat_set_persistent(u32 relval, u32 *persistent)
 {
 	return 0;
 }
-- 
2.7.4
