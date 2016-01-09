From: Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH -next] m68k: Declare __pfn_to_phys() for nommu case to fix build errors
Date: Sat,  9 Jan 2016 13:38:02 -0800
Message-ID: <1452375482-23994-1-git-send-email-linux__27320.0140837163$1452375519$gmane$org@roeck-us.net>
Return-path: <linux-m68k-owner@vger.kernel.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Greg Ungerer <gerg@uclinux.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>, Dan Williams <dan.j.williams@intel.com>, Andrew Morton <akpm@linux-foundation.org>

__pfn_to_phys() was introduced with commit 8b79eb6f5b53e ("libnvdimm, pfn,
pmem: allocate memmap array in persistent memory") but not declared for
m68k in nommu configurations. This results in the following build error.

mm/page_alloc.c: In function 'memmap_init_zone':
mm/page_alloc.c:4610:9: error: implicit declaration of function '__pfn_to_phys'

Fixes: 8b79eb6f5b53e ("libnvdimm, pfn, pmem: allocate memmap array in persistent memory")
Cc: Dan Williams <dan.j.williams@intel.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 arch/m68k/include/asm/page_no.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/m68k/include/asm/page_no.h b/arch/m68k/include/asm/page_no.h
index fa7f32d9836b..f389f575b93f 100644
--- a/arch/m68k/include/asm/page_no.h
+++ b/arch/m68k/include/asm/page_no.h
@@ -19,6 +19,8 @@ extern unsigned long memory_end;
 #define __pa(vaddr)		((unsigned long)(vaddr))
 #define __va(paddr)		((void *)(paddr))
 
+#define __pfn_to_phys(pfn)	PFN_PHYS(pfn)
+
 #define virt_to_pfn(kaddr)	(__pa(kaddr) >> PAGE_SHIFT)
 #define pfn_to_virt(pfn)	__va((pfn) << PAGE_SHIFT)
 
-- 
2.1.4
