From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH/RFC] m68k/sun3: Kill pte_unmap() warnings
Date: Sun, 31 Oct 2010 21:38:35 +0100 (CET)
Message-ID: <alpine.DEB.2.00.1010312135110.22279__49557.6625144624$1288557531$gmane$org@ayla.of.borg>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=ISO-8859-7
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Sam Creasey <sammy@sammy.net>, Andrew Morton <akpm@linux-foundation.org>
Cc: Linux/m68k <linux-m68k@lists.linux-m68k.org>, Linux Kernel Development <linux-kernel@vger.kernel.org>, linux-mm@kvack.org

Which one is preferable?

-----------------------------------------------------------------------=
--------
Since commit 31c911329e048b715a1dfeaaf617be9430fd7f4e ("mm: check the a=
rgument
of kunmap on architectures without highmem"), we get lots of warnings l=
ike

arch/m68k/kernel/sys_m68k.c:508: warning: passing argument 1 of =A1kunm=
ap=A2 from incompatible pointer type

As m68k doesn't support highmem anyway, open code the calls to kmap() a=
nd
kunmap() (the latter is a no-op) to kill the warnings.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 arch/m68k/include/asm/sun3_pgtable.h |    5 ++---
 1 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/arch/m68k/include/asm/sun3_pgtable.h b/arch/m68k/include/a=
sm/sun3_pgtable.h
index cf5fad9..f55aa04 100644
--- a/arch/m68k/include/asm/sun3_pgtable.h
+++ b/arch/m68k/include/asm/sun3_pgtable.h
@@ -217,9 +217,8 @@ static inline pte_t pgoff_to_pte(unsigned off)
 /* Find an entry in the third-level pagetable. */
 #define pte_index(address) ((address >> PAGE_SHIFT) & (PTRS_PER_PTE-1)=
)
 #define pte_offset_kernel(pmd, address) ((pte_t *) __pmd_page(*pmd) + =
pte_index(address))
-/* FIXME: should we bother with kmap() here? */
-#define pte_offset_map(pmd, address) ((pte_t *)kmap(pmd_page(*pmd)) + =
pte_index(address))
-#define pte_unmap(pte) kunmap(pte)
+#define pte_offset_map(pmd, address) ((pte_t *)page_address(pmd_page(*=
pmd)) + pte_index(address))
+#define pte_unmap(pte) do { } while (0)
=20
 /* Macros to (de)construct the fake PTEs representing swap pages. */
 #define __swp_type(x)		((x).val & 0x7F)
--=20
1.7.0.4
-----------------------------------------------------------------------=
--------
Since commit 31c911329e048b715a1dfeaaf617be9430fd7f4e ("mm: check the a=
rgument
of kunmap on architectures without highmem"), we get lots of warnings l=
ike

arch/m68k/kernel/sys_m68k.c:508: warning: passing argument 1 of =A1kunm=
ap=A2 from incompatible pointer type

M68k doesn't support highmem, so kunmap() is a no-op anyway, but replac=
e the
calls to k{,un}map() by calls to k{,un}map_atomic() to kill the warning=
s.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 arch/m68k/include/asm/sun3_pgtable.h |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/m68k/include/asm/sun3_pgtable.h b/arch/m68k/include/a=
sm/sun3_pgtable.h
index cf5fad9..637dda4 100644
--- a/arch/m68k/include/asm/sun3_pgtable.h
+++ b/arch/m68k/include/asm/sun3_pgtable.h
@@ -218,8 +218,8 @@ static inline pte_t pgoff_to_pte(unsigned off)
 #define pte_index(address) ((address >> PAGE_SHIFT) & (PTRS_PER_PTE-1)=
)
 #define pte_offset_kernel(pmd, address) ((pte_t *) __pmd_page(*pmd) + =
pte_index(address))
 /* FIXME: should we bother with kmap() here? */
-#define pte_offset_map(pmd, address) ((pte_t *)kmap(pmd_page(*pmd)) + =
pte_index(address))
-#define pte_unmap(pte) kunmap(pte)
+#define pte_offset_map(pmd, address) ((pte_t *)kmap_atomic(pmd_page(*p=
md)) + pte_index(address))
+#define pte_unmap(pte) kunmap_atomic(pte)
=20
 /* Macros to (de)construct the fake PTEs representing swap pages. */
 #define __swp_type(x)		((x).val & 0x7F)
--=20
1.7.0.4

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-=
m68k.org

In personal conversations with technical people, I call myself a hacker=
=2E But
when I'm talking to journalists I just say "programmer" or something li=
ke that.
							    -- Linus Torvalds
