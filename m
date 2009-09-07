From: sfking@fdwdc.com
Subject: [RFC 09/31] proof of concept merge of m68k and m68knommu
Date: Sun,  6 Sep 2009 22:39:59 -0700
Message-ID: <1960838f2a4476b115b27420dcec29f81f0a15c1.1252222134.git.sfking@fdwdc.com>
References: <cover.1252222129.git.sfking@fdwdc.com>
 <cfdcab7374087d5279ec9a1269831e8159d98f2b.1252222133.git.sfking@fdwdc.com>
 <8cb57205150fb96915e9d12c936be301a5e1e1e1.1252222133.git.sfking@fdwdc.com>
 <44c52df23985288bc2f4a819b73b3cc6da0826b9.1252222133.git.sfking@fdwdc.com>
 <6db080fb352e20adab49ed7762d3200831160b0f.1252222133.git.sfking@fdwdc.com>
 <c2e845e94079ee2a24e19456666f571c687f93f7.1252222133.git.sfking@fdwdc.com>
 <afa7a198356e79718b7682ea33cdfeec1933ae3d.1252222133.git.sfking@fdwdc.com>
 <f6625c80e8b3246063209517cccc855c056b2b71.1252222133.git.sfking@fdwdc.com>
 <55335001e487bd208ef4801c9df7e2d38a842ad3.1252222134.git.sfking@fdwdc.com>
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from smtp109.biz.mail.mud.yahoo.com ([68.142.201.178]:34408 "HELO
	smtp109.biz.mail.mud.yahoo.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with SMTP id S1758946AbZIGFrI (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Mon, 7 Sep 2009 01:47:08 -0400
In-Reply-To: <55335001e487bd208ef4801c9df7e2d38a842ad3.1252222134.git.sfking@fdwdc.com>
In-Reply-To: <cover.1252222129.git.sfking@fdwdc.com>
References: <cover.1252222129.git.sfking@fdwdc.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: uclinux-dev@uclinux.org
Cc: gerg@snapgear.com, linux-m68k@lists.linux-m68k.org

---
 arch/m68k/kernel/module.c                          |  156 +-------------------
 arch/m68k/kernel/{module.c => module_mm.c}         |    0 
 .../kernel/module.c => m68k/kernel/module_no.c}    |    0 
 3 files changed, 3 insertions(+), 153 deletions(-)
 copy arch/m68k/kernel/{module.c => module_mm.c} (100%)
 copy arch/{m68knommu/kernel/module.c => m68k/kernel/module_no.c} (100%)

diff --git a/arch/m68k/kernel/module.c b/arch/m68k/kernel/module.c
index cd6bcb1..7ea203c 100644
--- a/arch/m68k/kernel/module.c
+++ b/arch/m68k/kernel/module.c
@@ -1,155 +1,5 @@
-/*
- * This file is subject to the terms and conditions of the GNU General Public
- * License.  See the file COPYING in the main directory of this archive
- * for more details.
- */
-
-#include <linux/moduleloader.h>
-#include <linux/elf.h>
-#include <linux/vmalloc.h>
-#include <linux/fs.h>
-#include <linux/string.h>
-#include <linux/kernel.h>
-
-#if 0
-#define DEBUGP printk
+#ifdef CONFIG_MMU
+#include "module_mm.c"
 #else
-#define DEBUGP(fmt...)
+#include "module_no.c"
 #endif
-
-#ifdef CONFIG_MODULES
-
-void *module_alloc(unsigned long size)
-{
-	if (size == 0)
-		return NULL;
-	return vmalloc(size);
-}
-
-
-/* Free memory returned from module_alloc */
-void module_free(struct module *mod, void *module_region)
-{
-	vfree(module_region);
-}
-
-/* We don't need anything special. */
-int module_frob_arch_sections(Elf_Ehdr *hdr,
-			      Elf_Shdr *sechdrs,
-			      char *secstrings,
-			      struct module *mod)
-{
-	return 0;
-}
-
-int apply_relocate(Elf32_Shdr *sechdrs,
-		   const char *strtab,
-		   unsigned int symindex,
-		   unsigned int relsec,
-		   struct module *me)
-{
-	unsigned int i;
-	Elf32_Rel *rel = (void *)sechdrs[relsec].sh_addr;
-	Elf32_Sym *sym;
-	uint32_t *location;
-
-	DEBUGP("Applying relocate section %u to %u\n", relsec,
-	       sechdrs[relsec].sh_info);
-	for (i = 0; i < sechdrs[relsec].sh_size / sizeof(*rel); i++) {
-		/* This is where to make the change */
-		location = (void *)sechdrs[sechdrs[relsec].sh_info].sh_addr
-			+ rel[i].r_offset;
-		/* This is the symbol it is referring to.  Note that all
-		   undefined symbols have been resolved.  */
-		sym = (Elf32_Sym *)sechdrs[symindex].sh_addr
-			+ ELF32_R_SYM(rel[i].r_info);
-
-		switch (ELF32_R_TYPE(rel[i].r_info)) {
-		case R_68K_32:
-			/* We add the value into the location given */
-			*location += sym->st_value;
-			break;
-		case R_68K_PC32:
-			/* Add the value, subtract its postition */
-			*location += sym->st_value - (uint32_t)location;
-			break;
-		default:
-			printk(KERN_ERR "module %s: Unknown relocation: %u\n",
-			       me->name, ELF32_R_TYPE(rel[i].r_info));
-			return -ENOEXEC;
-		}
-	}
-	return 0;
-}
-
-int apply_relocate_add(Elf32_Shdr *sechdrs,
-		       const char *strtab,
-		       unsigned int symindex,
-		       unsigned int relsec,
-		       struct module *me)
-{
-	unsigned int i;
-	Elf32_Rela *rel = (void *)sechdrs[relsec].sh_addr;
-	Elf32_Sym *sym;
-	uint32_t *location;
-
-	DEBUGP("Applying relocate_add section %u to %u\n", relsec,
-	       sechdrs[relsec].sh_info);
-	for (i = 0; i < sechdrs[relsec].sh_size / sizeof(*rel); i++) {
-		/* This is where to make the change */
-		location = (void *)sechdrs[sechdrs[relsec].sh_info].sh_addr
-			+ rel[i].r_offset;
-		/* This is the symbol it is referring to.  Note that all
-		   undefined symbols have been resolved.  */
-		sym = (Elf32_Sym *)sechdrs[symindex].sh_addr
-			+ ELF32_R_SYM(rel[i].r_info);
-
-		switch (ELF32_R_TYPE(rel[i].r_info)) {
-		case R_68K_32:
-			/* We add the value into the location given */
-			*location = rel[i].r_addend + sym->st_value;
-			break;
-		case R_68K_PC32:
-			/* Add the value, subtract its postition */
-			*location = rel[i].r_addend + sym->st_value - (uint32_t)location;
-			break;
-		default:
-			printk(KERN_ERR "module %s: Unknown relocation: %u\n",
-			       me->name, ELF32_R_TYPE(rel[i].r_info));
-			return -ENOEXEC;
-		}
-	}
-	return 0;
-}
-
-int module_finalize(const Elf_Ehdr *hdr,
-		    const Elf_Shdr *sechdrs,
-		    struct module *mod)
-{
-	module_fixup(mod, mod->arch.fixup_start, mod->arch.fixup_end);
-
-	return 0;
-}
-
-void module_arch_cleanup(struct module *mod)
-{
-}
-
-#endif /* CONFIG_MODULES */
-
-void module_fixup(struct module *mod, struct m68k_fixup_info *start,
-		  struct m68k_fixup_info *end)
-{
-	struct m68k_fixup_info *fixup;
-
-	for (fixup = start; fixup < end; fixup++) {
-		switch (fixup->type) {
-		case m68k_fixup_memoffset:
-			*(u32 *)fixup->addr = m68k_memoffset;
-			break;
-		case m68k_fixup_vnode_shift:
-			*(u16 *)fixup->addr += m68k_virt_to_node_shift;
-			break;
-		}
-	}
-}
diff --git a/arch/m68k/kernel/module.c b/arch/m68k/kernel/module_mm.c
similarity index 100%
copy from arch/m68k/kernel/module.c
copy to arch/m68k/kernel/module_mm.c
diff --git a/arch/m68knommu/kernel/module.c b/arch/m68k/kernel/module_no.c
similarity index 100%
copy from arch/m68knommu/kernel/module.c
copy to arch/m68k/kernel/module_no.c
-- 
1.5.6.5

