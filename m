From: SF Markus Elfring <elfring@users.sourceforge.net>
Subject: [PATCH 1/3] m68k: Return directly after a failed capable() in
 sys_cacheflush()
Date: Wed, 18 Jan 2017 17:47:33 +0100
Message-ID: <71513091-bc01-ce70-893f-3f376062d833__29580.8643255898$1484758513$gmane$org@users.sourceforge.net>
References: <558ff501-7440-a97f-4494-f48591644092@users.sourceforge.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <558ff501-7440-a97f-4494-f48591644092@users.sourceforge.net>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@lists.linux-m68k.org, Geert Uytterhoeven <geert@linux-m68k.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 18 Jan 2017 16:30:36 +0100

Return directly after a call of the function "capable" failed
at the beginning.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 arch/m68k/kernel/sys_m68k.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/m68k/kernel/sys_m68k.c b/arch/m68k/kernel/sys_m68k.c
index 9aa01adb407f..62bfeb3716a7 100644
--- a/arch/m68k/kernel/sys_m68k.c
+++ b/arch/m68k/kernel/sys_m68k.c
@@ -384,9 +384,8 @@ sys_cacheflush (unsigned long addr, int scope, int cache, unsigned long len)
 
 	if (scope == FLUSH_SCOPE_ALL) {
 		/* Only the superuser may explicitly flush the whole cache. */
-		ret = -EPERM;
 		if (!capable(CAP_SYS_ADMIN))
-			goto out;
+			return -EPERM;
 	} else {
 		struct vm_area_struct *vma;
 
-- 
2.11.0
