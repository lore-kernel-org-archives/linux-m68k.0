From: SF Markus Elfring <elfring@users.sourceforge.net>
Subject: [PATCH 3/3] m68k: Add some spaces for better code readability in
 sys_cacheflush()
Date: Wed, 18 Jan 2017 17:50:40 +0100
Message-ID: <bbebee4e-b726-348e-66f9-dc4657c4f8df__7416.2833662287$1484758360$gmane$org@users.sourceforge.net>
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
Date: Wed, 18 Jan 2017 17:34:29 +0100

* Use space characters at some source code places according to
  the Linux coding style convention.

* Adjust indentation a bit.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 arch/m68k/kernel/sys_m68k.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/arch/m68k/kernel/sys_m68k.c b/arch/m68k/kernel/sys_m68k.c
index 9870d00d2215..5b351f7a6c11 100644
--- a/arch/m68k/kernel/sys_m68k.c
+++ b/arch/m68k/kernel/sys_m68k.c
@@ -436,11 +436,10 @@ sys_cacheflush (unsigned long addr, int scope, int cache, unsigned long len)
 	     * 040 or 060: don't blindly trust 'scope', someone could
 	     * try to flush a few megs of memory.
 	     */
-
-	    if (len>=3*PAGE_SIZE && scope<FLUSH_SCOPE_PAGE)
-	        scope=FLUSH_SCOPE_PAGE;
-	    if (len>=10*PAGE_SIZE && scope<FLUSH_SCOPE_ALL)
-	        scope=FLUSH_SCOPE_ALL;
+		if (len >= 3 * PAGE_SIZE && scope < FLUSH_SCOPE_PAGE)
+			scope = FLUSH_SCOPE_PAGE;
+		if (len >= 10 * PAGE_SIZE && scope < FLUSH_SCOPE_ALL)
+			scope = FLUSH_SCOPE_ALL;
 	    if (CPU_IS_040) {
 		ret = cache_flush_040 (addr, scope, cache, len);
 	    } else if (CPU_IS_060) {
-- 
2.11.0
