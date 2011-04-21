From: <gerg@snapgear.com>
Subject: [PATCH] m68k: merge the non-mmu and mmu versions of module.c
Date: Thu, 21 Apr 2011 11:02:17 +1000
Message-ID: <1303347737-28615-1-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from sncsmrelay2.nai.com ([67.97.80.206]:22980 "EHLO
	sncsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754371Ab1DUBCZ (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 20 Apr 2011 21:02:25 -0400
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org
Cc: Greg Ungerer <gerg@uclinux.org>

From: Greg Ungerer <gerg@uclinux.org>

The non-mmu and mmu versions of the module loader module.c are
nearly identical. Merge them back to a single module.c. There is
a little bit of re-ordering of the struct and enum definitions in
module.h to keep the ifdefery to a minimum.

Signed-off-by: Greg Ungerer <gerg@uclinux.org>
---
 arch/m68k/include/asm/module.h |   31 ++++-----
 arch/m68k/kernel/module.c      |  157 +++++++++++++++++++++++++++++++++++++++-
 arch/m68k/kernel/module_mm.c   |  155 ---------------------------------------
 arch/m68k/kernel/module_no.c   |  126 --------------------------------
 4 files changed, 167 insertions(+), 302 deletions(-)
 delete mode 100644 arch/m68k/kernel/module_mm.c
 delete mode 100644 arch/m68k/kernel/module_no.c

diff --git a/arch/m68k/include/asm/module.h b/arch/m68k/include/asm/module.h
index 5f21e11..edffe66 100644
--- a/arch/m68k/include/asm/module.h
+++ b/arch/m68k/include/asm/module.h
@@ -1,46 +1,41 @@
 #ifndef _ASM_M68K_MODULE_H
 #define _ASM_M68K_MODULE_H
 
-#ifdef CONFIG_MMU
+enum m68k_fixup_type {
+	m68k_fixup_memoffset,
+	m68k_fixup_vnode_shift,
+};
+
+struct m68k_fixup_info {
+	enum m68k_fixup_type type;
+	void *addr;
+};
 
 struct mod_arch_specific {
 	struct m68k_fixup_info *fixup_start, *fixup_end;
 };
 
+#ifdef CONFIG_MMU
+
 #define MODULE_ARCH_INIT {				\
 	.fixup_start		= __start_fixup,	\
 	.fixup_end		= __stop_fixup,		\
 }
 
 
-enum m68k_fixup_type {
-	m68k_fixup_memoffset,
-	m68k_fixup_vnode_shift,
-};
-
-struct m68k_fixup_info {
-	enum m68k_fixup_type type;
-	void *addr;
-};
-
 #define m68k_fixup(type, addr)			\
 	"	.section \".m68k_fixup\",\"aw\"\n"	\
 	"	.long " #type "," #addr "\n"	\
 	"	.previous\n"
 
+#endif /* CONFIG_MMU */
+
 extern struct m68k_fixup_info __start_fixup[], __stop_fixup[];
 
 struct module;
 extern void module_fixup(struct module *mod, struct m68k_fixup_info *start,
 			 struct m68k_fixup_info *end);
 
-#else
-
-struct mod_arch_specific {
-};
-
-#endif /* CONFIG_MMU */
-
 #define Elf_Shdr Elf32_Shdr
 #define Elf_Sym Elf32_Sym
 #define Elf_Ehdr Elf32_Ehdr
diff --git a/arch/m68k/kernel/module.c b/arch/m68k/kernel/module.c
index 7ea203c..146d646 100644
--- a/arch/m68k/kernel/module.c
+++ b/arch/m68k/kernel/module.c
@@ -1,5 +1,156 @@
-#ifdef CONFIG_MMU
-#include "module_mm.c"
+/*
+ * This file is subject to the terms and conditions of the GNU General Public
+ * License.  See the file COPYING in the main directory of this archive
+ * for more details.
+ */
+
+#include <linux/moduleloader.h>
+#include <linux/elf.h>
+#include <linux/vmalloc.h>
+#include <linux/fs.h>
+#include <linux/string.h>
+#include <linux/kernel.h>
+
+#if 0
+#define DEBUGP printk
 #else
-#include "module_no.c"
+#define DEBUGP(fmt...)
+#endif
+
+#ifdef CONFIG_MODULES
+
+void *module_alloc(unsigned long size)
+{
+	if (size == 0)
+		return NULL;
+	return vmalloc(size);
+}
+
+
+/* Free memory returned from module_alloc */
+void module_free(struct module *mod, void *module_region)
+{
+	vfree(module_region);
+}
+
+/* We don't need anything special. */
+int module_frob_arch_sections(Elf_Ehdr *hdr,
+			      Elf_Shdr *sechdrs,
+			      char *secstrings,
+			      struct module *mod)
+{
+	return 0;
+}
+
+int apply_relocate(Elf32_Shdr *sechdrs,
+		   const char *strtab,
+		   unsigned int symindex,
+		   unsigned int relsec,
+		   struct module *me)
+{
+	unsigned int i;
+	Elf32_Rel *rel = (void *)sechdrs[relsec].sh_addr;
+	Elf32_Sym *sym;
+	uint32_t *location;
+
+	DEBUGP("Applying relocate section %u to %u\n", relsec,
+	       sechdrs[relsec].sh_info);
+	for (i = 0; i < sechdrs[relsec].sh_size / sizeof(*rel); i++) {
+		/* This is where to make the change */
+		location = (void *)sechdrs[sechdrs[relsec].sh_info].sh_addr
+			+ rel[i].r_offset;
+		/* This is the symbol it is referring to.  Note that all
+		   undefined symbols have been resolved.  */
+		sym = (Elf32_Sym *)sechdrs[symindex].sh_addr
+			+ ELF32_R_SYM(rel[i].r_info);
+
+		switch (ELF32_R_TYPE(rel[i].r_info)) {
+		case R_68K_32:
+			/* We add the value into the location given */
+			*location += sym->st_value;
+			break;
+		case R_68K_PC32:
+			/* Add the value, subtract its postition */
+			*location += sym->st_value - (uint32_t)location;
+			break;
+		default:
+			printk(KERN_ERR "module %s: Unknown relocation: %u\n",
+			       me->name, ELF32_R_TYPE(rel[i].r_info));
+			return -ENOEXEC;
+		}
+	}
+	return 0;
+}
+
+int apply_relocate_add(Elf32_Shdr *sechdrs,
+		       const char *strtab,
+		       unsigned int symindex,
+		       unsigned int relsec,
+		       struct module *me)
+{
+	unsigned int i;
+	Elf32_Rela *rel = (void *)sechdrs[relsec].sh_addr;
+	Elf32_Sym *sym;
+	uint32_t *location;
+
+	DEBUGP("Applying relocate_add section %u to %u\n", relsec,
+	       sechdrs[relsec].sh_info);
+	for (i = 0; i < sechdrs[relsec].sh_size / sizeof(*rel); i++) {
+		/* This is where to make the change */
+		location = (void *)sechdrs[sechdrs[relsec].sh_info].sh_addr
+			+ rel[i].r_offset;
+		/* This is the symbol it is referring to.  Note that all
+		   undefined symbols have been resolved.  */
+		sym = (Elf32_Sym *)sechdrs[symindex].sh_addr
+			+ ELF32_R_SYM(rel[i].r_info);
+
+		switch (ELF32_R_TYPE(rel[i].r_info)) {
+		case R_68K_32:
+			/* We add the value into the location given */
+			*location = rel[i].r_addend + sym->st_value;
+			break;
+		case R_68K_PC32:
+			/* Add the value, subtract its postition */
+			*location = rel[i].r_addend + sym->st_value - (uint32_t)location;
+			break;
+		default:
+			printk(KERN_ERR "module %s: Unknown relocation: %u\n",
+			       me->name, ELF32_R_TYPE(rel[i].r_info));
+			return -ENOEXEC;
+		}
+	}
+	return 0;
+}
+
+int module_finalize(const Elf_Ehdr *hdr,
+		    const Elf_Shdr *sechdrs,
+		    struct module *mod)
+{
+	module_fixup(mod, mod->arch.fixup_start, mod->arch.fixup_end);
+	return 0;
+}
+
+void module_arch_cleanup(struct module *mod)
+{
+}
+
+#endif /* CONFIG_MODULES */
+
+void module_fixup(struct module *mod, struct m68k_fixup_info *start,
+		  struct m68k_fixup_info *end)
+{
+#ifdef CONFIG_MMU
+	struct m68k_fixup_info *fixup;
+
+	for (fixup = start; fixup < end; fixup++) {
+		switch (fixup->type) {
+		case m68k_fixup_memoffset:
+			*(u32 *)fixup->addr = m68k_memoffset;
+			break;
+		case m68k_fixup_vnode_shift:
+			*(u16 *)fixup->addr += m68k_virt_to_node_shift;
+			break;
+		}
+	}
 #endif
+}
diff --git a/arch/m68k/kernel/module_mm.c b/arch/m68k/kernel/module_mm.c
deleted file mode 100644
index cd6bcb1..0000000
--- a/arch/m68k/kernel/module_mm.c
+++ /dev/null
@@ -1,155 +0,0 @@
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
-#else
-#define DEBUGP(fmt...)
-#endif
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
diff --git a/arch/m68k/kernel/module_no.c b/arch/m68k/kernel/module_no.c
deleted file mode 100644
index d11ffae..0000000
--- a/arch/m68k/kernel/module_no.c
+++ /dev/null
@@ -1,126 +0,0 @@
-#include <linux/moduleloader.h>
-#include <linux/elf.h>
-#include <linux/vmalloc.h>
-#include <linux/fs.h>
-#include <linux/string.h>
-#include <linux/kernel.h>
-
-#if 0
-#define DEBUGP printk
-#else
-#define DEBUGP(fmt...)
-#endif
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
-		    struct module *me)
-{
-	return 0;
-}
-
-void module_arch_cleanup(struct module *mod)
-{
-}
-- 
1.7.0.4
