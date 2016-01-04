From: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Subject: [PATCH] m68k: fix build failure
Date: Mon,  4 Jan 2016 16:27:42 +0530
Message-ID: <1451905062-29561-1-git-send-email-sudipm.mukherjee@gmail.com>
Return-path: <linux-m68k-owner@vger.kernel.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org, Sudip Mukherjee <sudipm.mukherjee@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, Dan Williams <dan.j.williams@intel.com>

The defconfig build of m68k was failing with the error:
implicit declaration of function '__pfn_to_phys'

Other architectures have added <asm/memory.h>, but if we do so here then
we will also get redeclaration of some other functions. So it is better
to copy these macros into page_mm.h.

Fixes: 0a3c3bf11240 ("x86, mm: introduce vmem_altmap to augment vmemmap_populate()")
Cc: Dan Williams <dan.j.williams@intel.com>
Signed-off-by: Sudip Mukherjee <sudip@vectorindia.org>
---

m68k defconfig build log of next-20160104 is at:
https://travis-ci.org/sudipm-mukherjee/parport/jobs/100068521

 arch/m68k/include/asm/page_mm.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/m68k/include/asm/page_mm.h b/arch/m68k/include/asm/page_mm.h
index e7a1946..63aa14d 100644
--- a/arch/m68k/include/asm/page_mm.h
+++ b/arch/m68k/include/asm/page_mm.h
@@ -165,6 +165,9 @@ static inline __attribute_const__ int __virt_to_node_shift(void)
 	((__p) - pgdat->node_mem_map) + pgdat->node_start_pfn;		\
 })
 
+#define __phys_to_pfn(paddr)	((unsigned long)((paddr) >> PAGE_SHIFT))
+#define __pfn_to_phys(pfn)	PFN_PHYS(pfn)
+
 #define virt_addr_valid(kaddr)	((void *)(kaddr) >= (void *)PAGE_OFFSET && (void *)(kaddr) < high_memory)
 #define pfn_valid(pfn)		virt_addr_valid(pfn_to_virt(pfn))
 
-- 
1.9.1
