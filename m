From: SF Markus Elfring <elfring@users.sourceforge.net>
Subject: [PATCH 2/3] m68k: Delete an unnecessary variable assignment in
 sys_cacheflush()
Date: Wed, 18 Jan 2017 17:49:31 +0100
Message-ID: <f33b64d8-5572-c8e5-f06d-bb84cfc4b8b5__40651.4056645848$1484758703$gmane$org@users.sourceforge.net>
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
Date: Wed, 18 Jan 2017 17:07:52 +0100

Delete an assignment for the local variable "ret" in an if branch
because it was initialised by the same value.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 arch/m68k/kernel/sys_m68k.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/m68k/kernel/sys_m68k.c b/arch/m68k/kernel/sys_m68k.c
index 62bfeb3716a7..9870d00d2215 100644
--- a/arch/m68k/kernel/sys_m68k.c
+++ b/arch/m68k/kernel/sys_m68k.c
@@ -397,7 +397,6 @@ sys_cacheflush (unsigned long addr, int scope, int cache, unsigned long len)
 		 * Verify that the specified address region actually belongs
 		 * to this process.
 		 */
-		ret = -EINVAL;
 		down_read(&current->mm->mmap_sem);
 		vma = find_vma(current->mm, addr);
 		if (!vma || addr < vma->vm_start || addr + len > vma->vm_end)
-- 
2.11.0
