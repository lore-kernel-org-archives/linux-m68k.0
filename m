From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH 3/3] h8300: Add missing closing parenthesis in flat_get_addr_from_rp()
Date: Sun, 16 Jul 2017 13:57:29 +0200
Message-ID: <1500206249-16670-3-git-send-email-geert__7423.57462081618$1500206298$gmane$org@linux-m68k.org>
References: <1500206249-16670-1-git-send-email-geert@linux-m68k.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <1500206249-16670-1-git-send-email-geert@linux-m68k.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Alexander Viro <viro@zeniv.linux.org.uk>, Linus Torvalds <torvalds@linux-foundation.org>
Cc: Steven Miao <realmz6@gmail.com>, Yoshinori Sato <ysato@users.sourceforge.jp>, Greg Ungerer <gerg@linux-m68k.org>, adi-buildroot-devel@lists.sourceforge.net, uclinux-h8-devel@lists.sourceforge.jp, linux-m68k@lists.linux-m68k.org, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>

In file included from include/linux/flat.h:13:0,
                 from fs/binfmt_flat.c:36:
arch/h8300/include/asm/flat.h: In function 'flat_get_addr_from_rp':
arch/h8300/include/asm/flat.h:28:3: error: expected ')' before 'val'
   val &= 0x00ffffff;
   ^
arch/h8300/include/asm/flat.h:31:1: error: expected expression before '}' token
 }
 ^
In file included from include/linux/flat.h:13:0,
                 from fs/binfmt_flat.c:36:
arch/h8300/include/asm/flat.h:26:6: warning: unused variable 'val' [-Wunused-variable]
  u32 val = get_unaligned((__force u32 *)rp);
      ^
In file included from include/linux/flat.h:13:0,
                 from fs/binfmt_flat.c:36:
arch/h8300/include/asm/flat.h:31:1: warning: no return statement in function returning non-void [-Wreturn-type]
 }
 ^

Reported-by: kbuild test robot <fengguang.wu@intel.com>
Fixes: 468138d78510688f ("binfmt_flat: flat_{get,put}_addr_from_rp() should be able to fail")
Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 arch/h8300/include/asm/flat.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/h8300/include/asm/flat.h b/arch/h8300/include/asm/flat.h
index 18d024251738dd4e..7e0bd6fa15324495 100644
--- a/arch/h8300/include/asm/flat.h
+++ b/arch/h8300/include/asm/flat.h
@@ -24,7 +24,7 @@ static inline int flat_get_addr_from_rp(u32 __user *rp, u32 relval, u32 flags,
 					u32 *addr, u32 *persistent)
 {
 	u32 val = get_unaligned((__force u32 *)rp);
-	if (!(flags & FLAT_FLAG_GOTPIC)
+	if (!(flags & FLAT_FLAG_GOTPIC))
 		val &= 0x00ffffff;
 	*addr = val;
 	return 0;
-- 
2.7.4
