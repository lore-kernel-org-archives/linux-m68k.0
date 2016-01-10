From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH] m68k: Provide __phys_to_pfn() and __pfn_to_phys()
Date: Sun, 10 Jan 2016 14:07:23 +0100
Message-ID: <1452431243-2586-1-git-send-email-geert@linux-m68k.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Andrew Morton <akpm@linux-foundation.org>, linux-m68k@lists.linux-m68k.org
Cc: Guenter Roeck <linux@roeck-us.net>, linux-kernel@vger.kernel.org, Sudip Mukherjee <sudipm.mukherjee@gmail.com>, Sudip Mukherjee <sudip@vectorindia.org>, Dan Williams <dan.j.williams@intel.com>, Geert Uytterhoeven <geert@linux-m68k.org>

From: Sudip Mukherjee <sudipm.mukherjee@gmail.com>

The defconfig build of m68k was failing with the error:
implicit declaration of function '__pfn_to_phys'

Other architectures have added <asm/memory.h>, but if we do so here then
we will also get redeclaration of some other functions. So it is better
to copy these macros into page.h.

Fixes: 0a3c3bf11240 ("x86, mm: introduce vmem_altmap to augment vmemmap_populate()")
Signed-off-by: Sudip Mukherjee <sudip@vectorindia.org>
Cc: Dan Williams <dan.j.williams@intel.com>
Reported-by: Guenter Roeck <linux@roeck-us.net> (m68knommu)
[geert: Apply to page.h instead of page_mm.h to cover nommu, reword]
Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
I've applied and queued this for v4.5, to replace commit
7a6101c076fa6ae6 ("m68k: fix build failure") in Andrew's mm tree.

 arch/m68k/include/asm/page.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/m68k/include/asm/page.h b/arch/m68k/include/asm/page.h
index 38b024a0b0451ba7..430d4d54c88383a9 100644
--- a/arch/m68k/include/asm/page.h
+++ b/arch/m68k/include/asm/page.h
@@ -48,6 +48,9 @@ extern unsigned long _ramend;
 #include <asm/page_no.h>
 #endif
 
+#define __phys_to_pfn(paddr)	((unsigned long)((paddr) >> PAGE_SHIFT))
+#define __pfn_to_phys(pfn)	PFN_PHYS(pfn)
+
 #define VM_DATA_DEFAULT_FLAGS	(VM_READ | VM_WRITE | VM_EXEC | \
 				 VM_MAYREAD | VM_MAYWRITE | VM_MAYEXEC)
 
-- 
1.9.1
