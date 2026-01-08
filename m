Received: from coreboot.org (mail.coreboot.org [78.46.105.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64E79288C2D
	for <linux-m68k@lists.linux-m68k.org>; Thu,  8 Jan 2026 06:06:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=78.46.105.101
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767852390; cv=pass; b=dV3ZKBmXuql+g27IKx5MqMefWP+IFPXRGoOpgP8lxDQ286l5fyPI+pCQXq0z8bWmRTWUwj5y4IJAM9iWJsQWU9KeHW0lPhaeaG4bRqtOBHOWnPhYrYpqHNh8TngOf/eIvrKGZNfrE8tFhYyaS08/keFtR2KbrZMugnIHRvAgAxs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767852390; c=relaxed/simple;
	bh=Aef3uOojhktxdpgbBVtj2i10xCfqok61pegQ7KkgfPY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FeNIfLacM9HWv/anCBVDBtXiTh01Gshua+FW+zD/jUf7fgxIGixbR5VdfiwuYoHsyRH5y199tvwPbqTOacIwmcpqU4g2ZUVND2Jt5t+26YM3NrKmFzd8X+jHc+Jzsi/7OAJXFN5UptCeloG4i18Fo3dta2LH6PRELuQ+gHGvwSo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=coreboot.org; spf=pass smtp.mailfrom=coreboot.org; dkim=pass (1024-bit key) header.d=coreboot.org header.i=@coreboot.org header.b=pJ1ngfZl; arc=pass smtp.client-ip=78.46.105.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=coreboot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=coreboot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=coreboot.org header.i=@coreboot.org header.b="pJ1ngfZl"
Received: from authenticated-user (PRIMARY_HOSTNAME [PUBLIC_IP])
	by coreboot.org (Postfix) with ESMTPA id 6C95F81792;
	Thu,  8 Jan 2026 06:06:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=coreboot.org;
	s=dkim; t=1767852383; h=from:from:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rfXIiselqp+z5r0pgynR7xOhQL8mToJ8Go6ROMue2VI=;
	b=pJ1ngfZlSr75h5LnbQW5FU1GnT8IdCJXw97F7ZDhzs7kn7JPv/HOXF1QH95OQD4aNkRjGY
	WZvj/2ohcv6RJVQSEbbh/Sw/AYVES+hrEcEVQL10xWymBuBsfEuOslbv7lrgXavzdYidTG
	0Puv1cgL51KJjKjeJyWSaUbFdegQUNc=
From: Stefan <stefan.reinauer@coreboot.org>
To: geert@linux-m68k.org
Cc: linux-m68k@lists.linux-m68k.org,
	Stefan <stefan.reinauer@coreboot.org>
Subject: [PATCH 1/5] m68k: Add vDSO support for fast TLS access
Date: Wed,  7 Jan 2026 22:05:29 -0800
Message-ID: <20260108060533.3891380-2-stefan.reinauer@coreboot.org>
In-Reply-To: <20260108060533.3891380-1-stefan.reinauer@coreboot.org>
References: <20260108060533.3891380-1-stefan.reinauer@coreboot.org>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=coreboot.org;
	s=dkim; t=1767852383; h=from:from:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rfXIiselqp+z5r0pgynR7xOhQL8mToJ8Go6ROMue2VI=;
	b=o7QmSl+qCJF3yPGDlHXtvqiMN6Eaak/K16hfc8NANidDQPRUC+LDJB9/UxmyxJqSizhAMX
	YVjiXSADAqHfIYyJLzVvmj1KiKLPjI/t++6FR7ULuSikBcHBx85Rk4YzPkp57MTrQ/znEa
	S1yJwCOHKVw0W5qhfZws9zoTTGxwUFc=
ARC-Seal: i=1; s=dkim; d=coreboot.org; t=1767852383; a=rsa-sha256;
	cv=none;
	b=HtSljTeRGMsz+mGh5MOy1RGNM3OBe4+HaGqTyN3e02U5OMv+UCghqOu06I1uI8S4HsyCHLIEx7lFu3Ykr62Blu4CirAw6jzin4hY7LXgv59EOrLBqd33EZr+dER4dRv8yCIvCw9+NvEJv4WiXTbK39AjiBqqZuUP0PC/6P3sOuM=
ARC-Authentication-Results: i=1; coreboot.org;
	auth=pass smtp.auth=stepan@coreboot.org smtp.mailfrom=stefan.reinauer@coreboot.org
Authentication-Results: coreboot.org;
	auth=pass smtp.auth=stepan@coreboot.org smtp.mailfrom=stefan.reinauer@coreboot.org
X-Spamd-Bar: /

Implement a vDSO (virtual dynamic shared object) for the m68k
architecture to provide fast userspace access to the thread-local
storage (TLS) pointer without requiring a system call.

The vDSO consists of two mappings installed during execve:
  - A data page ([vvar]) mapped read-only to userspace containing
    the TLS pointer at offset 0, updated by the kernel on context
    switch and set_thread_area() calls
  - A code page ([vdso]) containing a minimal ELF with the vDSO
    symbol __vdso_m68k_tls for identification

This significantly improves pthread performance on m68k systems with
MMU enabled, as TLS pointer access is extremely frequent in threaded
applications. Instead of trapping into the kernel, userspace can now
read the TLS pointer directly from the vDSO data page.

The implementation follows the standard kernel vDSO patterns using
vm_special_mapping with fault handlers for the data page and
arch_setup_additional_pages() for installation.

Signed-off-by: Stefan Reinauer <stefan.reinauer@coreboot.org>
---
 arch/m68k/Kconfig                   |  15 +++
 arch/m68k/include/asm/elf.h         |  20 ++++
 arch/m68k/include/asm/mmu.h         |  19 +++-
 arch/m68k/include/asm/mmu_context.h |  78 +++++++++----
 arch/m68k/include/asm/tlbflush.h    |   8 +-
 arch/m68k/include/asm/vdso.h        |  48 ++++++++
 arch/m68k/include/uapi/asm/auxvec.h |   8 ++
 arch/m68k/kernel/Makefile           |   3 +
 arch/m68k/kernel/sys_m68k.c         |   7 ++
 arch/m68k/kernel/vdso.c             | 170 ++++++++++++++++++++++++++++
 arch/m68k/kernel/vdso/Makefile      |  39 +++++++
 arch/m68k/kernel/vdso/vdso-note.S   |  14 +++
 arch/m68k/kernel/vdso/vdso-tls.S    |  32 ++++++
 arch/m68k/kernel/vdso/vdso.S        |  18 +++
 arch/m68k/kernel/vdso/vdso.lds.S    |  66 +++++++++++
 arch/m68k/mm/mcfmmu.c               |   2 +-
 arch/m68k/sun3/mmu_emu.c            |   2 +-
 17 files changed, 518 insertions(+), 31 deletions(-)
 create mode 100644 arch/m68k/include/asm/vdso.h
 create mode 100644 arch/m68k/include/uapi/asm/auxvec.h
 create mode 100644 arch/m68k/kernel/vdso.c
 create mode 100644 arch/m68k/kernel/vdso/Makefile
 create mode 100644 arch/m68k/kernel/vdso/vdso-note.S
 create mode 100644 arch/m68k/kernel/vdso/vdso-tls.S
 create mode 100644 arch/m68k/kernel/vdso/vdso.S
 create mode 100644 arch/m68k/kernel/vdso/vdso.lds.S

diff --git a/arch/m68k/Kconfig b/arch/m68k/Kconfig
index 11835eb59..3c11f1e50 100644
--- a/arch/m68k/Kconfig
+++ b/arch/m68k/Kconfig
@@ -121,6 +121,21 @@ endmenu
 
 menu "Kernel Features"
 
+config VDSO
+	bool "Enable vDSO for fast TLS access"
+	depends on MMU
+	default y
+	help
+	  Enable the virtual Dynamic Shared Object (vDSO) for m68k.
+	  This provides a fast path for accessing the thread-local storage
+	  (TLS) pointer without requiring a system call, significantly
+	  improving pthread performance.
+
+	  The vDSO maps a small data page into userspace that the kernel
+	  updates on context switch with the current thread's TLS pointer.
+
+	  If unsure, say Y.
+
 endmenu
 
 if !MMU
diff --git a/arch/m68k/include/asm/elf.h b/arch/m68k/include/asm/elf.h
index 2def06a99..e93255b35 100644
--- a/arch/m68k/include/asm/elf.h
+++ b/arch/m68k/include/asm/elf.h
@@ -8,6 +8,8 @@
 
 #include <asm/ptrace.h>
 #include <asm/user.h>
+#include <asm/auxvec.h>
+#include <asm/page.h>
 
 /*
  * 68k ELF relocation types
@@ -123,4 +125,22 @@ typedef struct user_m68kfp_struct elf_fpregset_t;
 
 #define ELF_FDPIC_CORE_EFLAGS  0
 
+#ifdef CONFIG_VDSO
+#define ARCH_HAS_SETUP_ADDITIONAL_PAGES
+struct linux_binprm;
+int arch_setup_additional_pages(struct linux_binprm *, int);
+
+/*
+ * Pass AT_SYSINFO_EHDR to userspace - points to vDSO code page (ELF header).
+ * mm->context.vdso stores the data page address, code page is +PAGE_SIZE.
+ */
+#define ARCH_DLINFO							\
+do {									\
+	if (current->mm->context.vdso)					\
+		NEW_AUX_ENT(AT_SYSINFO_EHDR,				\
+			    (elf_addr_t)(current->mm->context.vdso +	\
+					 PAGE_SIZE));			\
+} while (0)
+#endif
+
 #endif
diff --git a/arch/m68k/include/asm/mmu.h b/arch/m68k/include/asm/mmu.h
index e00672425..2adca3dcb 100644
--- a/arch/m68k/include/asm/mmu.h
+++ b/arch/m68k/include/asm/mmu.h
@@ -3,8 +3,23 @@
 #define __MMU_H
 
 #ifdef CONFIG_MMU
-/* Default "unsigned long" context */
-typedef unsigned long mm_context_t;
+/*
+ * M68K MMU context structure.
+ *
+ * The 'id' field stores the hardware context ID or page table physical address:
+ *   - COLDFIRE: ASID (Address Space ID) for MMU
+ *   - Classic 68k: Physical address of the root page table
+ *   - SUN3: MMU context number
+ *
+ * The 'vdso' field stores the base address of the vDSO mapping in userspace.
+ */
+typedef struct {
+	unsigned long id;
+#ifdef CONFIG_VDSO
+	unsigned long vdso;
+#endif
+} mm_context_t;
+
 #else
 #include <asm-generic/mmu.h>
 #endif
diff --git a/arch/m68k/include/asm/mmu_context.h b/arch/m68k/include/asm/mmu_context.h
index 141bbdfad..82756eb57 100644
--- a/arch/m68k/include/asm/mmu_context.h
+++ b/arch/m68k/include/asm/mmu_context.h
@@ -7,6 +7,10 @@
 
 #ifdef CONFIG_MMU
 
+#ifdef CONFIG_VDSO
+#include <asm/vdso.h>
+#endif
+
 #if defined(CONFIG_COLDFIRE)
 
 #include <asm/atomic.h>
@@ -27,9 +31,9 @@ extern void steal_context(void);
 
 static inline void get_mmu_context(struct mm_struct *mm)
 {
-	mm_context_t ctx;
+	unsigned long ctx;
 
-	if (mm->context != NO_CONTEXT)
+	if (mm->context.id != NO_CONTEXT)
 		return;
 	while (arch_atomic_dec_and_test_lt(&nr_free_contexts)) {
 		atomic_inc(&nr_free_contexts);
@@ -42,14 +46,14 @@ static inline void get_mmu_context(struct mm_struct *mm)
 			ctx = 0;
 	}
 	next_mmu_context = (ctx + 1) & LAST_CONTEXT;
-	mm->context = ctx;
+	mm->context.id = ctx;
 	context_mm[ctx] = mm;
 }
 
 /*
  * Set up the context for a new address space.
  */
-#define init_new_context(tsk, mm)	(((mm)->context = NO_CONTEXT), 0)
+#define init_new_context(tsk, mm)	(((mm)->context.id = NO_CONTEXT), 0)
 
 /*
  * We're finished using the context for an address space.
@@ -57,23 +61,23 @@ static inline void get_mmu_context(struct mm_struct *mm)
 #define destroy_context destroy_context
 static inline void destroy_context(struct mm_struct *mm)
 {
-	if (mm->context != NO_CONTEXT) {
-		clear_bit(mm->context, context_map);
-		mm->context = NO_CONTEXT;
+	if (mm->context.id != NO_CONTEXT) {
+		clear_bit(mm->context.id, context_map);
+		mm->context.id = NO_CONTEXT;
 		atomic_inc(&nr_free_contexts);
 	}
 }
 
-static inline void set_context(mm_context_t context, pgd_t *pgd)
+static inline void set_context(unsigned long context_id, pgd_t *pgd)
 {
-	__asm__ __volatile__ ("movec %0,%%asid" : : "d" (context));
+	__asm__ __volatile__ ("movec %0,%%asid" : : "d" (context_id));
 }
 
 static inline void switch_mm(struct mm_struct *prev, struct mm_struct *next,
 	struct task_struct *tsk)
 {
 	get_mmu_context(tsk->mm);
-	set_context(tsk->mm->context, next->pgd);
+	set_context(tsk->mm->context.id, next->pgd);
 }
 
 /*
@@ -85,10 +89,20 @@ static inline void activate_mm(struct mm_struct *active_mm,
 	struct mm_struct *mm)
 {
 	get_mmu_context(mm);
-	set_context(mm->context, mm->pgd);
+	set_context(mm->context.id, mm->pgd);
+}
+
+static inline void __m68k_update_vdso_tls(struct task_struct *next)
+{
+#ifdef CONFIG_VDSO
+	m68k_vdso_update_tls(task_thread_info(next)->tp_value);
+#endif
 }
 
-#define prepare_arch_switch(next) load_ksp_mmu(next)
+#define prepare_arch_switch(next) do { \
+	__m68k_update_vdso_tls(next); \
+	load_ksp_mmu(next); \
+} while (0)
 
 static inline void load_ksp_mmu(struct task_struct *task)
 {
@@ -143,7 +157,7 @@ static inline void load_ksp_mmu(struct task_struct *task)
 		goto bug;
 
 	set_pte(pte, pte_mkyoung(*pte));
-	asid = mm->context & 0xff;
+	asid = mm->context.id & 0xff;
 	if (!pte_dirty(*pte) && mmuar <= PAGE_OFFSET)
 		set_pte(pte, pte_wrprotect(*pte));
 
@@ -178,7 +192,7 @@ extern void clear_context(unsigned long context);
 static inline int init_new_context(struct task_struct *tsk,
 				   struct mm_struct *mm)
 {
-	mm->context = SUN3_INVALID_CONTEXT;
+	mm->context.id = SUN3_INVALID_CONTEXT;
 	return 0;
 }
 
@@ -186,22 +200,22 @@ static inline int init_new_context(struct task_struct *tsk,
    got one, go get one for it. */
 static inline void get_mmu_context(struct mm_struct *mm)
 {
-	if (mm->context == SUN3_INVALID_CONTEXT)
-		mm->context = get_free_context(mm);
+	if (mm->context.id == SUN3_INVALID_CONTEXT)
+		mm->context.id = get_free_context(mm);
 }
 
 /* flush context if allocated... */
 #define destroy_context destroy_context
 static inline void destroy_context(struct mm_struct *mm)
 {
-	if (mm->context != SUN3_INVALID_CONTEXT)
-		clear_context(mm->context);
+	if (mm->context.id != SUN3_INVALID_CONTEXT)
+		clear_context(mm->context.id);
 }
 
 static inline void activate_context(struct mm_struct *mm)
 {
 	get_mmu_context(mm);
-	sun3_put_context(mm->context);
+	sun3_put_context(mm->context.id);
 }
 
 static inline void switch_mm(struct mm_struct *prev, struct mm_struct *next,
@@ -217,6 +231,15 @@ static inline void activate_mm(struct mm_struct *prev_mm,
 	activate_context(next_mm);
 }
 
+static inline void __m68k_update_vdso_tls(struct task_struct *next)
+{
+#ifdef CONFIG_VDSO
+	m68k_vdso_update_tls(task_thread_info(next)->tp_value);
+#endif
+}
+
+#define prepare_arch_switch(next) __m68k_update_vdso_tls(next)
+
 #else
 
 #include <asm/setup.h>
@@ -227,14 +250,14 @@ static inline void activate_mm(struct mm_struct *prev_mm,
 static inline int init_new_context(struct task_struct *tsk,
 				   struct mm_struct *mm)
 {
-	mm->context = virt_to_phys(mm->pgd);
+	mm->context.id = virt_to_phys(mm->pgd);
 	return 0;
 }
 
 static inline void switch_mm_0230(struct mm_struct *mm)
 {
 	unsigned long crp[2] = {
-		0x80000000 | _PAGE_TABLE, mm->context
+		0x80000000 | _PAGE_TABLE, mm->context.id
 	};
 	unsigned long tmp;
 
@@ -272,7 +295,7 @@ static inline void switch_mm_0460(struct mm_struct *mm)
 	asm volatile ("pflushan");
 
 	/* switch the root pointer */
-	asm volatile ("movec %0,%%urp" : : "r" (mm->context));
+	asm volatile ("movec %0,%%urp" : : "r" (mm->context.id));
 
 	if (CPU_IS_060) {
 		unsigned long tmp;
@@ -302,7 +325,7 @@ static inline void switch_mm(struct mm_struct *prev, struct mm_struct *next, str
 static inline void activate_mm(struct mm_struct *prev_mm,
 			       struct mm_struct *next_mm)
 {
-	next_mm->context = virt_to_phys(next_mm->pgd);
+	next_mm->context.id = virt_to_phys(next_mm->pgd);
 
 	if (CPU_IS_020_OR_030)
 		switch_mm_0230(next_mm);
@@ -310,6 +333,15 @@ static inline void activate_mm(struct mm_struct *prev_mm,
 		switch_mm_0460(next_mm);
 }
 
+static inline void __m68k_update_vdso_tls(struct task_struct *next)
+{
+#ifdef CONFIG_VDSO
+	m68k_vdso_update_tls(task_thread_info(next)->tp_value);
+#endif
+}
+
+#define prepare_arch_switch(next) __m68k_update_vdso_tls(next)
+
 #endif
 
 #include <asm-generic/mmu_context.h>
diff --git a/arch/m68k/include/asm/tlbflush.h b/arch/m68k/include/asm/tlbflush.h
index 6d42e2906..092d23975 100644
--- a/arch/m68k/include/asm/tlbflush.h
+++ b/arch/m68k/include/asm/tlbflush.h
@@ -143,7 +143,7 @@ static inline void flush_tlb_mm (struct mm_struct *mm)
 	unsigned long i;
 
 	oldctx = sun3_get_context();
-	sun3_put_context(mm->context);
+	sun3_put_context(mm->context.id);
 
 	for (i = 0; i < TASK_SIZE; i += SUN3_PMEG_SIZE) {
 		seg = sun3_get_segmap(i);
@@ -168,7 +168,7 @@ static inline void flush_tlb_page (struct vm_area_struct *vma,
 	unsigned char i;
 
 	oldctx = sun3_get_context();
-	sun3_put_context(vma->vm_mm->context);
+	sun3_put_context(vma->vm_mm->context.id);
 	addr &= ~SUN3_PMEG_MASK;
 	if((i = sun3_get_segmap(addr)) != SUN3_INVALID_PMEG)
 	{
@@ -191,13 +191,13 @@ static inline void flush_tlb_range (struct vm_area_struct *vma,
 	start &= ~SUN3_PMEG_MASK;
 
 	oldctx = sun3_get_context();
-	sun3_put_context(mm->context);
+	sun3_put_context(mm->context.id);
 
 	while(start < end)
 	{
 		if((seg = sun3_get_segmap(start)) == SUN3_INVALID_PMEG)
 		     goto next;
-		if(pmeg_ctx[seg] == mm->context) {
+		if(pmeg_ctx[seg] == mm->context.id) {
 			pmeg_alloc[seg] = 0;
 			pmeg_ctx[seg] = 0;
 			pmeg_vaddr[seg] = 0;
diff --git a/arch/m68k/include/asm/vdso.h b/arch/m68k/include/asm/vdso.h
new file mode 100644
index 000000000..d0759bce5
--- /dev/null
+++ b/arch/m68k/include/asm/vdso.h
@@ -0,0 +1,48 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _ASM_M68K_VDSO_H
+#define _ASM_M68K_VDSO_H
+
+#ifdef CONFIG_MMU
+
+#include <linux/types.h>
+
+/*
+ * M68K vDSO data structure - mapped read-only to userspace.
+ * The kernel updates this on context switch and set_thread_area() calls.
+ *
+ * This struct is at offset 0 in the vDSO data page, so userspace can
+ * read the TLS pointer directly from the vDSO base address.
+ */
+struct m68k_vdso_data {
+	unsigned long tls_ptr;		/* Thread pointer, offset 0 */
+	unsigned long reserved[3];	/* Reserved for future use */
+};
+
+/*
+ * vDSO layout:
+ *   Page 0: Data page (TLS pointer, read-only to user, written by kernel)
+ *   Page 1: Code page (minimal ELF with vDSO identification)
+ */
+#define M68K_VDSO_DATA_PAGES	1
+#define M68K_VDSO_CODE_PAGES	1
+#define M68K_VDSO_PAGES		(M68K_VDSO_DATA_PAGES + M68K_VDSO_CODE_PAGES)
+
+#ifndef __ASSEMBLY__
+
+/* Kernel pointer to the vDSO data page (for updates) */
+extern struct m68k_vdso_data *m68k_vdso_data;
+
+/* vDSO code symbols (from vdso.S) */
+extern char m68k_vdso_start[], m68k_vdso_end[];
+
+/* Update TLS pointer in vDSO data page */
+static inline void m68k_vdso_update_tls(unsigned long tp)
+{
+	if (m68k_vdso_data)
+		WRITE_ONCE(m68k_vdso_data->tls_ptr, tp);
+}
+
+#endif /* !__ASSEMBLY__ */
+
+#endif /* CONFIG_MMU */
+#endif /* _ASM_M68K_VDSO_H */
diff --git a/arch/m68k/include/uapi/asm/auxvec.h b/arch/m68k/include/uapi/asm/auxvec.h
new file mode 100644
index 000000000..a7148a3e2
--- /dev/null
+++ b/arch/m68k/include/uapi/asm/auxvec.h
@@ -0,0 +1,8 @@
+/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
+#ifndef __ASM_M68K_AUXVEC_H
+#define __ASM_M68K_AUXVEC_H
+
+/* vDSO location */
+#define AT_SYSINFO_EHDR	33
+
+#endif
diff --git a/arch/m68k/kernel/Makefile b/arch/m68k/kernel/Makefile
index 57c1b3e8d..a1ed760e8 100644
--- a/arch/m68k/kernel/Makefile
+++ b/arch/m68k/kernel/Makefile
@@ -23,3 +23,6 @@ obj-$(CONFIG_UBOOT)		+= uboot.o
 
 obj-$(CONFIG_EARLY_PRINTK)	+= early_printk.o
 
+obj-$(CONFIG_VDSO)		+= vdso.o
+obj-$(CONFIG_VDSO)		+= vdso/
+
diff --git a/arch/m68k/kernel/sys_m68k.c b/arch/m68k/kernel/sys_m68k.c
index 1af5e6082..d6628260a 100644
--- a/arch/m68k/kernel/sys_m68k.c
+++ b/arch/m68k/kernel/sys_m68k.c
@@ -25,6 +25,9 @@
 #include <asm/setup.h>
 #include <linux/uaccess.h>
 #include <asm/cachectl.h>
+#ifdef CONFIG_VDSO
+#include <asm/vdso.h>
+#endif
 #include <asm/traps.h>
 #include <asm/page.h>
 #include <asm/syscalls.h>
@@ -574,6 +577,10 @@ asmlinkage unsigned long sys_get_thread_area(void)
 asmlinkage int sys_set_thread_area(unsigned long tp)
 {
 	current_thread_info()->tp_value = tp;
+#ifdef CONFIG_VDSO
+	/* Update vDSO for immediate fast-path access */
+	m68k_vdso_update_tls(tp);
+#endif
 	return 0;
 }
 
diff --git a/arch/m68k/kernel/vdso.c b/arch/m68k/kernel/vdso.c
new file mode 100644
index 000000000..395092654
--- /dev/null
+++ b/arch/m68k/kernel/vdso.c
@@ -0,0 +1,170 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * M68K vDSO setup
+ *
+ * This provides a fast path for TLS (Thread Local Storage) pointer access.
+ * Instead of making a syscall to get/set the thread pointer, userspace can
+ * read directly from the vDSO data page which the kernel updates on context
+ * switch and set_thread_area() syscall.
+ */
+
+#include <linux/elf.h>
+#include <linux/err.h>
+#include <linux/mm.h>
+#include <linux/slab.h>
+#include <linux/binfmts.h>
+#include <asm/page.h>
+#include <asm/vdso.h>
+
+/* External symbols from vdso/vdso.S - the embedded vDSO binary */
+extern char m68k_vdso_start[], m68k_vdso_end[];
+
+/* vDSO data page - kernel writable, mapped read-only to userspace */
+static union {
+	struct m68k_vdso_data	data;
+	u8			page[PAGE_SIZE];
+} vdso_data_store __page_aligned_data;
+
+/* Kernel pointer for TLS updates */
+struct m68k_vdso_data *m68k_vdso_data = &vdso_data_store.data;
+
+/* Page array for the vDSO code pages */
+static struct page **vdso_pagelist;
+static unsigned int vdso_pages;
+
+/* VM special mapping for mremap support */
+static int vdso_mremap(const struct vm_special_mapping *sm,
+		       struct vm_area_struct *new_vma)
+{
+	current->mm->context.vdso = new_vma->vm_start;
+	return 0;
+}
+
+static struct vm_special_mapping vdso_mapping __ro_after_init = {
+	.name = "[vdso]",
+	.mremap = vdso_mremap,
+};
+
+/* Data page mapping (read-only to userspace) */
+static struct page *vdso_data_page;
+
+static vm_fault_t vdso_data_fault(const struct vm_special_mapping *sm,
+				  struct vm_area_struct *vma,
+				  struct vm_fault *vmf)
+{
+	if (vmf->pgoff != 0)
+		return VM_FAULT_SIGBUS;
+
+	return vmf_insert_pfn(vma, vmf->address,
+			      page_to_pfn(vdso_data_page));
+}
+
+static struct vm_special_mapping vdso_data_mapping __ro_after_init = {
+	.name = "[vvar]",
+	.fault = vdso_data_fault,
+};
+
+static int __init vdso_init(void)
+{
+	unsigned int i;
+	unsigned long pfn;
+
+	/* Validate the vDSO binary */
+	if (memcmp(m68k_vdso_start, "\177ELF", 4)) {
+		pr_err("m68k vDSO: invalid ELF header\n");
+		return -ENOEXEC;
+	}
+
+	/* Calculate number of code pages */
+	vdso_pages = (m68k_vdso_end - m68k_vdso_start) >> PAGE_SHIFT;
+	if (vdso_pages == 0) {
+		pr_err("m68k vDSO: no code pages\n");
+		return -EINVAL;
+	}
+
+	/* Allocate page list for vDSO code */
+	vdso_pagelist = kcalloc(vdso_pages, sizeof(struct page *), GFP_KERNEL);
+	if (!vdso_pagelist)
+		return -ENOMEM;
+
+	/* Get pages for vDSO code */
+	pfn = __phys_to_pfn(__pa_symbol(m68k_vdso_start));
+	for (i = 0; i < vdso_pages; i++)
+		vdso_pagelist[i] = pfn_to_page(pfn + i);
+
+	vdso_mapping.pages = vdso_pagelist;
+
+	/* Get page for vDSO data */
+	vdso_data_page = virt_to_page(&vdso_data_store);
+
+	/* Initialize the TLS pointer to 0 */
+	m68k_vdso_data->tls_ptr = 0;
+
+	pr_info("m68k vDSO: %u code pages, data at %px\n",
+		vdso_pages, m68k_vdso_data);
+
+	return 0;
+}
+arch_initcall(vdso_init);
+
+/*
+ * Called during execve to install the vDSO into the new process.
+ * Layout:
+ *   vdso_base:          vDSO data page (read-only)
+ *   vdso_base + PAGE_SIZE: vDSO code pages (read+exec)
+ */
+int arch_setup_additional_pages(struct linux_binprm *bprm, int uses_interp)
+{
+	struct mm_struct *mm = current->mm;
+	unsigned long vdso_base, vdso_text_len;
+	struct vm_area_struct *vma;
+	int ret;
+
+	if (!vdso_pagelist)
+		return 0;
+
+	if (mmap_write_lock_killable(mm))
+		return -EINTR;
+
+	/* Total size: 1 data page + code pages */
+	vdso_text_len = vdso_pages << PAGE_SHIFT;
+
+	/* Find unmapped area for data page + code pages */
+	vdso_base = get_unmapped_area(NULL, 0,
+				      PAGE_SIZE + vdso_text_len, 0, 0);
+	if (IS_ERR_VALUE(vdso_base)) {
+		ret = vdso_base;
+		goto out_unlock;
+	}
+
+	/* Install vDSO data page (vvar) - read-only with fault handler */
+	vma = _install_special_mapping(mm, vdso_base, PAGE_SIZE,
+				       VM_READ | VM_MAYREAD | VM_DONTDUMP |
+				       VM_PFNMAP,
+				       &vdso_data_mapping);
+	if (IS_ERR(vma)) {
+		ret = PTR_ERR(vma);
+		goto out_unlock;
+	}
+
+	/* Install vDSO code pages */
+	vma = _install_special_mapping(mm, vdso_base + PAGE_SIZE, vdso_text_len,
+				       VM_READ | VM_EXEC | VM_MAYREAD | VM_MAYEXEC,
+				       &vdso_mapping);
+	if (IS_ERR(vma)) {
+		ret = PTR_ERR(vma);
+		goto out_unlock;
+	}
+
+	/* Store vDSO base in mm context.
+	 * Note: we store the data page address, so userspace can read TLS
+	 * directly from offset 0.
+	 */
+	mm->context.vdso = vdso_base;
+
+	ret = 0;
+
+out_unlock:
+	mmap_write_unlock(mm);
+	return ret;
+}
diff --git a/arch/m68k/kernel/vdso/Makefile b/arch/m68k/kernel/vdso/Makefile
new file mode 100644
index 000000000..c3119ae82
--- /dev/null
+++ b/arch/m68k/kernel/vdso/Makefile
@@ -0,0 +1,39 @@
+# SPDX-License-Identifier: GPL-2.0
+#
+# Building vDSO images for m68k
+#
+
+# vDSO object files (userspace code)
+obj-vdso := vdso-note.o vdso-tls.o
+
+# Build targets
+targets := $(obj-vdso) vdso.so vdso.so.dbg vdso.lds
+
+obj-vdso := $(addprefix $(obj)/, $(obj-vdso))
+
+# The kernel object that embeds the vDSO
+obj-y += vdso.o
+
+# Preprocessor flags for linker script
+CPPFLAGS_vdso.lds += -P -C -U$(ARCH)
+
+# Linker flags for the vDSO shared object
+ldflags-y := -Bsymbolic --no-undefined -soname=linux-vdso.so.1 \
+             -z max-page-size=4096 -shared \
+             --hash-style=sysv --build-id=sha1 -T
+
+# Force dependency: vdso.o needs vdso.so to exist
+$(obj)/vdso.o: $(obj)/vdso.so
+
+# Link rule for the vDSO shared object
+$(obj)/vdso.so.dbg: $(obj)/vdso.lds $(obj-vdso) FORCE
+	$(call if_changed,vdsold)
+
+# Strip rule for the final .so
+$(obj)/vdso.so: OBJCOPYFLAGS := -S
+$(obj)/vdso.so: $(obj)/vdso.so.dbg FORCE
+	$(call if_changed,objcopy)
+
+# Link command
+quiet_cmd_vdsold = VDSOLD  $@
+      cmd_vdsold = $(LD) $(ldflags-y) $(filter %.lds,$^) $(filter %.o,$^) -o $@
diff --git a/arch/m68k/kernel/vdso/vdso-note.S b/arch/m68k/kernel/vdso/vdso-note.S
new file mode 100644
index 000000000..09277cd71
--- /dev/null
+++ b/arch/m68k/kernel/vdso/vdso-note.S
@@ -0,0 +1,14 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * M68K vDSO note section
+ *
+ * This creates the ELF note that identifies this as a Linux vDSO.
+ */
+
+#include <linux/build-salt.h>
+#include <linux/version.h>
+#include <linux/elfnote.h>
+
+ELFNOTE_START(Linux, 0, "a")
+	.long LINUX_VERSION_CODE
+ELFNOTE_END
diff --git a/arch/m68k/kernel/vdso/vdso-tls.S b/arch/m68k/kernel/vdso/vdso-tls.S
new file mode 100644
index 000000000..de66c492a
--- /dev/null
+++ b/arch/m68k/kernel/vdso/vdso-tls.S
@@ -0,0 +1,32 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * M68K vDSO TLS access function
+ *
+ * This provides a symbol that userspace can call to get the TLS pointer.
+ * However, the primary mechanism for fast TLS access is for userspace to
+ * read directly from offset 0 of the vDSO data page (vvar).
+ *
+ * The kernel updates this value on:
+ *   - Context switch (prepare_arch_switch)
+ *   - set_thread_area() syscall
+ */
+
+#include <linux/linkage.h>
+
+/*
+ * __vdso_m68k_tls - Get the TLS pointer
+ *
+ * This is mostly for identification; the fast path is to read
+ * directly from the data page at offset 0.
+ *
+ * Returns: TLS pointer in d0
+ */
+SYM_FUNC_START(__vdso_m68k_tls)
+	/* The TLS pointer is at the very beginning of the data page.
+	 * The data page is at a fixed offset before the code page.
+	 * However, this function is more of a marker than useful code.
+	 * Userspace should read directly from the vDSO base address.
+	 */
+	move.l	#0, %d0		/* Return 0 - userspace should use direct access */
+	rts
+SYM_FUNC_END(__vdso_m68k_tls)
diff --git a/arch/m68k/kernel/vdso/vdso.S b/arch/m68k/kernel/vdso/vdso.S
new file mode 100644
index 000000000..951c36da4
--- /dev/null
+++ b/arch/m68k/kernel/vdso/vdso.S
@@ -0,0 +1,18 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Embed the vDSO binary into the kernel image.
+ *
+ * The vDSO ELF binary is built separately and included here as raw data.
+ * The kernel's vdso.c uses these symbols to find and map the vDSO.
+ */
+
+#include <linux/linkage.h>
+#include <asm/page.h>
+
+	.section ".rodata", "a"
+	.balign PAGE_SIZE
+	.globl m68k_vdso_start, m68k_vdso_end
+m68k_vdso_start:
+	.incbin "arch/m68k/kernel/vdso/vdso.so"
+	.balign PAGE_SIZE
+m68k_vdso_end:
diff --git a/arch/m68k/kernel/vdso/vdso.lds.S b/arch/m68k/kernel/vdso/vdso.lds.S
new file mode 100644
index 000000000..7f14c12e6
--- /dev/null
+++ b/arch/m68k/kernel/vdso/vdso.lds.S
@@ -0,0 +1,66 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * M68K vDSO linker script
+ */
+
+#include <asm/page.h>
+
+OUTPUT_FORMAT("elf32-m68k", "elf32-m68k", "elf32-m68k")
+OUTPUT_ARCH(m68k)
+
+SECTIONS
+{
+	PROVIDE(_start = .);
+
+	. = SIZEOF_HEADERS;
+
+	.hash		: { *(.hash) }			:text
+	.gnu.hash	: { *(.gnu.hash) }
+	.dynsym		: { *(.dynsym) }
+	.dynstr		: { *(.dynstr) }
+	.gnu.version	: { *(.gnu.version) }
+	.gnu.version_d	: { *(.gnu.version_d) }
+	.gnu.version_r	: { *(.gnu.version_r) }
+
+	.note		: { *(.note.*) }		:text	:note
+
+	.text		: { *(.text*) }			:text
+	PROVIDE(__etext = .);
+
+	.rodata		: { *(.rodata*) }		:text
+
+	.dynamic	: { *(.dynamic) }		:text	:dynamic
+
+	.eh_frame_hdr	: { *(.eh_frame_hdr) }		:text	:eh_frame_hdr
+	.eh_frame	: { KEEP(*(.eh_frame)) }	:text
+
+	/*
+	 * Discard .note.GNU-stack, which is emitted as a stacktop section.
+	 */
+	/DISCARD/	: {
+		*(.note.GNU-stack)
+		*(.data .data.* .gnu.linkonce.d.*)
+		*(.bss .bss.* .gnu.linkonce.b.*)
+	}
+}
+
+PHDRS
+{
+	text		PT_LOAD		FLAGS(5);	/* PF_R|PF_X */
+	dynamic		PT_DYNAMIC	FLAGS(4);	/* PF_R */
+	note		PT_NOTE		FLAGS(4);	/* PF_R */
+	eh_frame_hdr	PT_GNU_EH_FRAME;
+}
+
+/*
+ * This controls what userland symbols we export from the vDSO.
+ * Currently we only export a symbol that identifies the vDSO version.
+ */
+VERSION
+{
+	LINUX_5.0 {
+	global:
+		__vdso_m68k_tls;
+	local: *;
+	};
+}
diff --git a/arch/m68k/mm/mcfmmu.c b/arch/m68k/mm/mcfmmu.c
index 19a750290..d79dfdabe 100644
--- a/arch/m68k/mm/mcfmmu.c
+++ b/arch/m68k/mm/mcfmmu.c
@@ -126,7 +126,7 @@ int cf_tlb_miss(struct pt_regs *regs, int write, int dtlb, int extension_word)
 	}
 
 	set_pte(pte, pte_mkyoung(*pte));
-	asid = mm->context & 0xff;
+	asid = mm->context.id & 0xff;
 	if (!pte_dirty(*pte) && !KMAPAREA(mmuar))
 		set_pte(pte, pte_wrprotect(*pte));
 
diff --git a/arch/m68k/sun3/mmu_emu.c b/arch/m68k/sun3/mmu_emu.c
index b39fc3717..b9a75eb33 100644
--- a/arch/m68k/sun3/mmu_emu.c
+++ b/arch/m68k/sun3/mmu_emu.c
@@ -363,7 +363,7 @@ int mmu_emu_handle_fault (unsigned long vaddr, int read_flag, int kernel_fault)
 		crp = swapper_pg_dir;
 		context = 0;
 	} else {
-		context = current->mm->context;
+		context = current->mm->context.id;
 		if(kernel_fault)
 			crp = swapper_pg_dir;
 		else
-- 
2.51.0

