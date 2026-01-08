Received: from coreboot.org (mail.coreboot.org [78.46.105.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1CE72FFDE3
	for <linux-m68k@lists.linux-m68k.org>; Thu,  8 Jan 2026 06:06:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=78.46.105.101
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767852392; cv=pass; b=dt5y0iXJgZQPZ77ufLDERyG4k+wScHIUl/hQyzJdMqqu8LJhYs8BqFk8+XZ/EDIFVgIWmRZYa/e0WlZoKo7rRBtX3dmEBj57Ywb8lh+rmaOrLExrf1lDsmJJwrdLcU7WY8lpLnKufmvHpIYbLSeBla4+x8No0MO/Xk29+UXY9Rs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767852392; c=relaxed/simple;
	bh=uG3Q4KnFzTOVKzxEMW3sNaSSgRnOO7PzJVCdYDRJyMI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eT2UqdCoK+TIa/NYotOQFceMe41wRzQXSgex8ohQYrPGC28rwB0rFABYIXBT5LZabbP5jz3Q5HN+FfaPNw6xN6EXxtZWZbsjHkoQwYLO5YPZwDuqClG5bnWmQ0AQ4U5B/G4XCzBPj6QunYhRLTdHdqJb0kiq17yMzfHUqSbKC4A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=coreboot.org; spf=pass smtp.mailfrom=coreboot.org; dkim=pass (1024-bit key) header.d=coreboot.org header.i=@coreboot.org header.b=ECG9EIIZ; arc=pass smtp.client-ip=78.46.105.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=coreboot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=coreboot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=coreboot.org header.i=@coreboot.org header.b="ECG9EIIZ"
Received: from authenticated-user (PRIMARY_HOSTNAME [PUBLIC_IP])
	by coreboot.org (Postfix) with ESMTPA id 0DAC281799;
	Thu,  8 Jan 2026 06:06:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=coreboot.org;
	s=dkim; t=1767852386; h=from:from:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bgWW/qOyI8oR77Syc1vNd9FGTBSyCeMClbyKNA/+K7w=;
	b=ECG9EIIZEB3juTNk1k1io86+X7u3v1bDtKyIjoYCGJL2JNVx4bPuROzKfV+0CCq0/KZWX1
	JOcnqw8gMC3rFXpIz4aK9eHoQ6mhlYwr+tpwpvRn55srDJEAf021sNK+wlcwu48xqSj6m0
	2WDBjPRXm61sp27v3Fl+MvugK03G6ZI=
From: Stefan <stefan.reinauer@coreboot.org>
To: geert@linux-m68k.org
Cc: linux-m68k@lists.linux-m68k.org,
	Stefan <stefan.reinauer@coreboot.org>
Subject: [PATCH 2/5] m68k: Extend vDSO with clock_gettime() support infrastructure
Date: Wed,  7 Jan 2026 22:05:30 -0800
Message-ID: <20260108060533.3891380-3-stefan.reinauer@coreboot.org>
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
	s=dkim; t=1767852386; h=from:from:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bgWW/qOyI8oR77Syc1vNd9FGTBSyCeMClbyKNA/+K7w=;
	b=TMU5Pe61bmM2azqCp/gt/faBoSmfb0d4w9qGGIomn5RCIVEi9g2REfn7bRVX2LL8o6EQlm
	Ue3J9bUH6/VQUZvmY02rwipEimG57PuOeno1EZP4e0SR6rK5eQelnw4DoNCNdL4n4Ekme1
	xdPfes8rsvNXQ6CnbOWF5QzA5Fbu/lU=
ARC-Seal: i=1; s=dkim; d=coreboot.org; t=1767852386; a=rsa-sha256;
	cv=none;
	b=AIb1GaHlliZjyjXlRUey7BhCchUFCHOmcUVB51qp/t0q1zICZC8k0jq5gqGsrPeZ2zmCal3Xr1/DtgiybsZZW9vG1Ph2/MHJexjedYOi2+xpT8rQBmfXjanfiTreh/l+P4174z+qUMUHf4q+U1wPIinCJMPfAhg7Z+P/HbXwxfU=
ARC-Authentication-Results: i=1; coreboot.org;
	auth=pass smtp.auth=stepan@coreboot.org smtp.mailfrom=stefan.reinauer@coreboot.org
X-Spamd-Bar: +
X-Spam-Level: *
Authentication-Results: coreboot.org;
	auth=pass smtp.auth=stepan@coreboot.org smtp.mailfrom=stefan.reinauer@coreboot.org

Add the data structures and kernel infrastructure needed to support fast
userspace clock_gettime() via the vDSO. This extends the existing TLS-only
vDSO with:

Data structure changes (vdso.h):
- Expand m68k_vdso_data to include clock state: sequence counter for
  consistent reads, raw tick counters, timer parameters (frequency,
  multiplier, shift), and pre-computed wall/monotonic time values
- Add timer type constants for Mac VIA and Amiga CIA timers
- Add a timer page to the vDSO layout for mapping hardware timer
  registers read-only to userspace
- Add sequence counter helpers (m68k_vdso_write_begin/end) for lock-free
  updates
- Add m68k_vdso_init_clock() and m68k_vdso_set_timer_addr() declarations

Kernel infrastructure (vdso.c):
- Add vdso_timer_mapping with fault handler to map platform timer
  registers into userspace
- Implement m68k_vdso_set_timer_addr() for platform code to register
  timer physical address
- Implement m68k_vdso_init_clock() to initialize clocksource parameters
- Update arch_setup_additional_pages() to install the timer page between
  the data page and code pages

Linker script (vdso.lds):
- Add vDSO linker script for m68k defining the ELF structure and
  exporting __vdso_m68k_tls

The timer page allows userspace to read hardware timer registers directly
without a syscall. On platforms without vDSO clock support, accesses to
the timer page will fault and the vDSO code falls back to the syscall
path.

This commit provides the kernel-side infrastructure; platform-specific
timer integration (Mac VIA, Amiga CIA) and the userspace vDSO clock
routines will follow in subsequent patches.

Signed-off-by: Stefan Reinauer <stefan.reinauer@coreboot.org>
---
 arch/m68k/include/asm/elf.h      |   5 +-
 arch/m68k/include/asm/vdso.h     | 109 +++++++++++-
 arch/m68k/kernel/vdso.c          | 130 ++++++++++++--
 arch/m68k/kernel/vdso/vdso.lds   | 282 +++++++++++++++++++++++++++++++
 arch/m68k/kernel/vdso/vdso.lds.S |   2 +-
 5 files changed, 499 insertions(+), 29 deletions(-)
 create mode 100644 arch/m68k/kernel/vdso/vdso.lds

diff --git a/arch/m68k/include/asm/elf.h b/arch/m68k/include/asm/elf.h
index e93255b35..d9c98c28c 100644
--- a/arch/m68k/include/asm/elf.h
+++ b/arch/m68k/include/asm/elf.h
@@ -132,14 +132,15 @@ int arch_setup_additional_pages(struct linux_binprm *, int);
 
 /*
  * Pass AT_SYSINFO_EHDR to userspace - points to vDSO code page (ELF header).
- * mm->context.vdso stores the data page address, code page is +PAGE_SIZE.
+ * mm->context.vdso stores the base address; code page is at +2*PAGE_SIZE
+ * (after vvar data page and timer page).
  */
 #define ARCH_DLINFO							\
 do {									\
 	if (current->mm->context.vdso)					\
 		NEW_AUX_ENT(AT_SYSINFO_EHDR,				\
 			    (elf_addr_t)(current->mm->context.vdso +	\
-					 PAGE_SIZE));			\
+					 2 * PAGE_SIZE));		\
 } while (0)
 #endif
 
diff --git a/arch/m68k/include/asm/vdso.h b/arch/m68k/include/asm/vdso.h
index d0759bce5..ad0ec3cfe 100644
--- a/arch/m68k/include/asm/vdso.h
+++ b/arch/m68k/include/asm/vdso.h
@@ -8,27 +8,74 @@
 
 /*
  * M68K vDSO data structure - mapped read-only to userspace.
- * The kernel updates this on context switch and set_thread_area() calls.
+ * The kernel updates this on context switch, set_thread_area() calls,
+ * and timer interrupts.
  *
  * This struct is at offset 0 in the vDSO data page, so userspace can
  * read the TLS pointer directly from the vDSO base address.
+ *
+ * For clock_gettime() support, the kernel also maintains clock state
+ * that userspace can read to compute the current time without syscalls.
  */
 struct m68k_vdso_data {
-	unsigned long tls_ptr;		/* Thread pointer, offset 0 */
-	unsigned long reserved[3];	/* Reserved for future use */
+	/* TLS support - must be at offset 0 */
+	__u32 tls_ptr;			/* Thread pointer */
+
+	/* Clock support - sequence counter for consistent reads */
+	__u32 seq;			/* Sequence counter (odd = update in progress) */
+
+	/* Raw clock tick counters - updated on timer interrupt */
+	__u32 clk_total;		/* Accumulated ticks from timer wraps */
+	__u32 clk_offset;		/* Pending wrap adjustment */
+
+	/* Timer parameters - set at init, constant thereafter */
+	__u32 timer_cycles;		/* Ticks per jiffy */
+	__u32 clock_freq_hz;		/* Timer frequency in Hz */
+	__u32 cs_mult;			/* Clocksource multiplier */
+	__u32 cs_shift;			/* Clocksource shift */
+
+	/* Pre-computed time values - updated on timer interrupt */
+	__s64 wall_time_sec;		/* Wall clock seconds (CLOCK_REALTIME) */
+	__u32 wall_time_nsec;		/* Wall clock nanoseconds */
+	__s64 monotonic_sec;		/* Monotonic seconds (CLOCK_MONOTONIC) */
+	__u32 monotonic_nsec;		/* Monotonic nanoseconds */
+
+	/* Platform-specific timer info */
+	__u32 timer_type;		/* M68K_TIMER_* constant */
+	__u32 timer_reg_offset;		/* Offset to timer count register in timer page */
+
+	__u32 reserved[2];		/* Reserved for future use */
 };
 
+/* Timer types */
+#define M68K_TIMER_NONE		0	/* No vDSO clock support */
+#define M68K_TIMER_VIA		1	/* Mac VIA timer */
+#define M68K_TIMER_CIA		2	/* Amiga CIA timer */
+
 /*
- * vDSO layout:
- *   Page 0: Data page (TLS pointer, read-only to user, written by kernel)
- *   Page 1: Code page (minimal ELF with vDSO identification)
+ * vDSO memory layout:
+ *   Page 0:         Data page (vvar) - TLS, clock data, read-only to user
+ *   Page 1:         Timer page - mapped hardware timer registers (read-only)
+ *   Page 2+:        Code pages - vDSO ELF with __vdso_clock_gettime64, etc.
+ *
+ * The timer page is optional - only mapped on platforms with vDSO clock
+ * support (Mac VIA, Amiga CIA). On unsupported platforms, clock_gettime
+ * falls back to syscall.
  */
 #define M68K_VDSO_DATA_PAGES	1
+#define M68K_VDSO_TIMER_PAGES	1
 #define M68K_VDSO_CODE_PAGES	1
-#define M68K_VDSO_PAGES		(M68K_VDSO_DATA_PAGES + M68K_VDSO_CODE_PAGES)
+#define M68K_VDSO_PAGES		(M68K_VDSO_DATA_PAGES + M68K_VDSO_TIMER_PAGES + M68K_VDSO_CODE_PAGES)
+
+/* Offsets from vDSO base for userspace */
+#define M68K_VDSO_DATA_OFFSET	0
+#define M68K_VDSO_TIMER_OFFSET	(M68K_VDSO_DATA_PAGES * PAGE_SIZE)
+#define M68K_VDSO_CODE_OFFSET	((M68K_VDSO_DATA_PAGES + M68K_VDSO_TIMER_PAGES) * PAGE_SIZE)
 
 #ifndef __ASSEMBLY__
 
+#include <linux/compiler.h>
+
 /* Kernel pointer to the vDSO data page (for updates) */
 extern struct m68k_vdso_data *m68k_vdso_data;
 
@@ -39,9 +86,55 @@ extern char m68k_vdso_start[], m68k_vdso_end[];
 static inline void m68k_vdso_update_tls(unsigned long tp)
 {
 	if (m68k_vdso_data)
-		WRITE_ONCE(m68k_vdso_data->tls_ptr, tp);
+		WRITE_ONCE(m68k_vdso_data->tls_ptr, (__u32)tp);
+}
+
+/*
+ * Begin a vDSO data update sequence.
+ * Increments seq to odd value, indicating update in progress.
+ * Must be paired with m68k_vdso_write_end().
+ */
+static inline void m68k_vdso_write_begin(void)
+{
+	if (m68k_vdso_data) {
+		WRITE_ONCE(m68k_vdso_data->seq, m68k_vdso_data->seq + 1);
+		/* Ensure seq update is visible before data updates */
+		smp_wmb();
+	}
+}
+
+/*
+ * End a vDSO data update sequence.
+ * Increments seq to even value, indicating update complete.
+ */
+static inline void m68k_vdso_write_end(void)
+{
+	if (m68k_vdso_data) {
+		/* Ensure data updates are visible before seq update */
+		smp_wmb();
+		WRITE_ONCE(m68k_vdso_data->seq, m68k_vdso_data->seq + 1);
+	}
 }
 
+/*
+ * Update clock tick counters in vDSO.
+ * Called from timer interrupt with seq protection.
+ */
+static inline void m68k_vdso_update_clock(__u32 clk_total, __u32 clk_offset)
+{
+	if (m68k_vdso_data) {
+		m68k_vdso_data->clk_total = clk_total;
+		m68k_vdso_data->clk_offset = clk_offset;
+	}
+}
+
+/* Initialize vDSO timer parameters (called once at boot) */
+void m68k_vdso_init_clock(__u32 timer_type, __u32 timer_cycles,
+			  __u32 clock_freq_hz, __u32 cs_mult, __u32 cs_shift);
+
+/* Set physical address of timer registers for vDSO mapping */
+void m68k_vdso_set_timer_addr(unsigned long phys_addr, unsigned long size);
+
 #endif /* !__ASSEMBLY__ */
 
 #endif /* CONFIG_MMU */
diff --git a/arch/m68k/kernel/vdso.c b/arch/m68k/kernel/vdso.c
index 395092654..1e66f7eba 100644
--- a/arch/m68k/kernel/vdso.c
+++ b/arch/m68k/kernel/vdso.c
@@ -2,10 +2,18 @@
 /*
  * M68K vDSO setup
  *
- * This provides a fast path for TLS (Thread Local Storage) pointer access.
- * Instead of making a syscall to get/set the thread pointer, userspace can
- * read directly from the vDSO data page which the kernel updates on context
- * switch and set_thread_area() syscall.
+ * This provides fast paths for:
+ * - TLS (Thread Local Storage) pointer access
+ * - clock_gettime() via hardware timer access
+ *
+ * Instead of making syscalls, userspace can read directly from the vDSO
+ * data pages which the kernel updates on context switch, set_thread_area()
+ * calls, and timer interrupts.
+ *
+ * Memory layout:
+ *   Page 0: vvar (data page) - TLS pointer, clock state
+ *   Page 1: Timer page - mapped hardware timer registers (platform-specific)
+ *   Page 2+: vDSO code - ELF with __vdso_clock_gettime64, etc.
  */
 
 #include <linux/elf.h>
@@ -13,6 +21,7 @@
 #include <linux/mm.h>
 #include <linux/slab.h>
 #include <linux/binfmts.h>
+#include <linux/io.h>
 #include <asm/page.h>
 #include <asm/vdso.h>
 
@@ -25,8 +34,13 @@ static union {
 	u8			page[PAGE_SIZE];
 } vdso_data_store __page_aligned_data;
 
-/* Kernel pointer for TLS updates */
+/* Kernel pointer for vDSO data updates */
 struct m68k_vdso_data *m68k_vdso_data = &vdso_data_store.data;
+EXPORT_SYMBOL(m68k_vdso_data);
+
+/* Physical address of platform timer registers (set by platform code) */
+static unsigned long timer_phys_addr;
+static unsigned long timer_page_size;
 
 /* Page array for the vDSO code pages */
 static struct page **vdso_pagelist;
@@ -64,6 +78,24 @@ static struct vm_special_mapping vdso_data_mapping __ro_after_init = {
 	.fault = vdso_data_fault,
 };
 
+/* Timer page mapping (read-only hardware registers to userspace) */
+static vm_fault_t vdso_timer_fault(const struct vm_special_mapping *sm,
+				   struct vm_area_struct *vma,
+				   struct vm_fault *vmf)
+{
+	/* Only allow access if timer mapping is configured */
+	if (!timer_phys_addr || vmf->pgoff != 0)
+		return VM_FAULT_SIGBUS;
+
+	return vmf_insert_pfn(vma, vmf->address,
+			      __phys_to_pfn(timer_phys_addr));
+}
+
+static struct vm_special_mapping vdso_timer_mapping __ro_after_init = {
+	.name = "[vdso_timer]",
+	.fault = vdso_timer_fault,
+};
+
 static int __init vdso_init(void)
 {
 	unsigned int i;
@@ -97,8 +129,12 @@ static int __init vdso_init(void)
 	/* Get page for vDSO data */
 	vdso_data_page = virt_to_page(&vdso_data_store);
 
-	/* Initialize the TLS pointer to 0 */
-	m68k_vdso_data->tls_ptr = 0;
+	/*
+	 * Note: vdso_data_store is zero-initialized (BSS), and clock
+	 * parameters are set by platform timer init (mac_sched_init, etc.)
+	 * which runs before this initcall. Don't overwrite that data!
+	 * timer_type=0 (M68K_TIMER_NONE) means no vDSO clock support.
+	 */
 
 	pr_info("m68k vDSO: %u code pages, data at %px\n",
 		vdso_pages, m68k_vdso_data);
@@ -107,16 +143,55 @@ static int __init vdso_init(void)
 }
 arch_initcall(vdso_init);
 
+/*
+ * Set the physical address of the timer registers to map into vDSO.
+ * Called by platform code (Mac VIA, Amiga CIA) during timer init.
+ */
+void m68k_vdso_set_timer_addr(unsigned long phys_addr, unsigned long size)
+{
+	timer_phys_addr = phys_addr & PAGE_MASK;  /* Page-align */
+	timer_page_size = PAGE_ALIGN(size);
+	pr_info("m68k vDSO: timer at phys %lx, size %lx\n",
+		timer_phys_addr, timer_page_size);
+}
+EXPORT_SYMBOL(m68k_vdso_set_timer_addr);
+
+/*
+ * Initialize vDSO clock parameters.
+ * Called by platform timer init code after clocksource is registered.
+ */
+void m68k_vdso_init_clock(__u32 timer_type, __u32 timer_cycles,
+			  __u32 clock_freq_hz, __u32 cs_mult, __u32 cs_shift)
+{
+	if (!m68k_vdso_data)
+		return;
+
+	m68k_vdso_write_begin();
+
+	m68k_vdso_data->timer_type = timer_type;
+	m68k_vdso_data->timer_cycles = timer_cycles;
+	m68k_vdso_data->clock_freq_hz = clock_freq_hz;
+	m68k_vdso_data->cs_mult = cs_mult;
+	m68k_vdso_data->cs_shift = cs_shift;
+
+	m68k_vdso_write_end();
+
+	pr_info("m68k vDSO: clock type=%u cycles=%u freq=%u mult=%u shift=%u\n",
+		timer_type, timer_cycles, clock_freq_hz, cs_mult, cs_shift);
+}
+EXPORT_SYMBOL(m68k_vdso_init_clock);
+
 /*
  * Called during execve to install the vDSO into the new process.
  * Layout:
- *   vdso_base:          vDSO data page (read-only)
- *   vdso_base + PAGE_SIZE: vDSO code pages (read+exec)
+ *   vdso_base:                    vDSO data page (vvar, read-only)
+ *   vdso_base + PAGE_SIZE:        Timer page (read-only hardware regs)
+ *   vdso_base + 2*PAGE_SIZE:      vDSO code pages (read+exec)
  */
 int arch_setup_additional_pages(struct linux_binprm *bprm, int uses_interp)
 {
 	struct mm_struct *mm = current->mm;
-	unsigned long vdso_base, vdso_text_len;
+	unsigned long vdso_base, vdso_text_len, total_size;
 	struct vm_area_struct *vma;
 	int ret;
 
@@ -126,12 +201,13 @@ int arch_setup_additional_pages(struct linux_binprm *bprm, int uses_interp)
 	if (mmap_write_lock_killable(mm))
 		return -EINTR;
 
-	/* Total size: 1 data page + code pages */
 	vdso_text_len = vdso_pages << PAGE_SHIFT;
 
-	/* Find unmapped area for data page + code pages */
-	vdso_base = get_unmapped_area(NULL, 0,
-				      PAGE_SIZE + vdso_text_len, 0, 0);
+	/* Total size: data page + timer page + code pages */
+	total_size = PAGE_SIZE + PAGE_SIZE + vdso_text_len;
+
+	/* Find unmapped area for all vDSO pages */
+	vdso_base = get_unmapped_area(NULL, 0, total_size, 0, 0);
 	if (IS_ERR_VALUE(vdso_base)) {
 		ret = vdso_base;
 		goto out_unlock;
@@ -147,8 +223,23 @@ int arch_setup_additional_pages(struct linux_binprm *bprm, int uses_interp)
 		goto out_unlock;
 	}
 
+	/*
+	 * Install timer page - read-only mapping of hardware timer registers.
+	 * This allows userspace to read the timer without a syscall.
+	 * If no timer is configured (timer_phys_addr == 0), accesses will
+	 * fault and the vDSO code will fall back to syscall.
+	 */
+	vma = _install_special_mapping(mm, vdso_base + PAGE_SIZE, PAGE_SIZE,
+				       VM_READ | VM_MAYREAD | VM_DONTDUMP |
+				       VM_PFNMAP | VM_IO,
+				       &vdso_timer_mapping);
+	if (IS_ERR(vma)) {
+		ret = PTR_ERR(vma);
+		goto out_unlock;
+	}
+
 	/* Install vDSO code pages */
-	vma = _install_special_mapping(mm, vdso_base + PAGE_SIZE, vdso_text_len,
+	vma = _install_special_mapping(mm, vdso_base + 2 * PAGE_SIZE, vdso_text_len,
 				       VM_READ | VM_EXEC | VM_MAYREAD | VM_MAYEXEC,
 				       &vdso_mapping);
 	if (IS_ERR(vma)) {
@@ -156,9 +247,12 @@ int arch_setup_additional_pages(struct linux_binprm *bprm, int uses_interp)
 		goto out_unlock;
 	}
 
-	/* Store vDSO base in mm context.
-	 * Note: we store the data page address, so userspace can read TLS
-	 * directly from offset 0.
+	/*
+	 * Store vDSO base in mm context.
+	 * This points to the data page; userspace uses known offsets:
+	 *   +0x0000: vvar (data page with TLS, clock state)
+	 *   +0x1000: timer registers
+	 *   +0x2000: vDSO code
 	 */
 	mm->context.vdso = vdso_base;
 
diff --git a/arch/m68k/kernel/vdso/vdso.lds b/arch/m68k/kernel/vdso/vdso.lds
new file mode 100644
index 000000000..b99671c73
--- /dev/null
+++ b/arch/m68k/kernel/vdso/vdso.lds
@@ -0,0 +1,282 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * This header exists to force full rebuild when the compiler is upgraded.
+ *
+ * When fixdep scans this, it will find this string "CONFIG_CC_VERSION_TEXT"
+ * and add dependency on include/config/CC_VERSION_TEXT, which is touched
+ * by Kconfig when the version string from the compiler changes.
+ */
+/* Additional tree-wide dependencies start here. */
+/*
+ * If any of the GCC plugins change, we need to rebuild everything that
+ * was built with them, as they may have changed their behavior and those
+ * behaviors may need to be synchronized across all translation units.
+ */
+/*
+ * If the randstruct seed itself changes (whether for GCC plugins or
+ * Clang), the entire tree needs to be rebuilt since the randomization of
+ * structures may change between compilation units if not.
+ */
+/*
+ * If any external changes affect Clang's integer wrapping sanitizer
+ * behavior, a full rebuild is needed as the coverage for wrapping types
+ * may have changed, which may impact the expected behaviors that should
+ * not differ between compilation units.
+ */
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Automatically generated file; DO NOT EDIT.
+ * Linux/m68k 6.18.3 Kernel Configuration
+ */
+/*
+ * The use of "&&" / "||" is limited in certain expressions.
+ * The following enable to calculate "and" / "or" with macro expansion only.
+ */
+/*
+ * Helper macros to use CONFIG_ options in C/CPP expressions. Note that
+ * these only work with boolean and tristate options.
+ */
+/*
+ * Getting something that works in C and CPP for an arg that may or may
+ * not be defined is tricky.  Here, if we have "#define CONFIG_BOOGER 1"
+ * we match on the placeholder define, insert the "0," for arg1 and generate
+ * the triplet (0, 1, 0).  Then the last step cherry picks the 2nd arg (a one).
+ * When CONFIG_BOOGER is not defined, we generate a (... 1, 0) pair, and when
+ * the last step cherry picks the 2nd arg, we get a zero.
+ */
+/*
+ * IS_BUILTIN(CONFIG_FOO) evaluates to 1 if CONFIG_FOO is set to 'y', 0
+ * otherwise. For boolean options, this is equivalent to
+ * IS_ENABLED(CONFIG_FOO).
+ */
+/*
+ * IS_MODULE(CONFIG_FOO) evaluates to 1 if CONFIG_FOO is set to 'm', 0
+ * otherwise.  CONFIG_FOO=m results in "#define CONFIG_FOO_MODULE 1" in
+ * autoconf.h.
+ */
+/*
+ * IS_REACHABLE(CONFIG_FOO) evaluates to 1 if the currently compiled
+ * code can call a function defined in code compiled based on CONFIG_FOO.
+ * This is similar to IS_ENABLED(), but returns false when invoked from
+ * built-in code when CONFIG_FOO is set to 'm'.
+ */
+/*
+ * IS_ENABLED(CONFIG_FOO) evaluates to 1 if CONFIG_FOO is set to 'y' or 'm',
+ * 0 otherwise.  Note that CONFIG_FOO=y results in "#define CONFIG_FOO 1" in
+ * autoconf.h, while CONFIG_FOO=m results in "#define CONFIG_FOO_MODULE 1".
+ */
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * M68K vDSO linker script
+ */
+/* SPDX-License-Identifier: GPL-2.0 */
+/* SPDX-License-Identifier: GPL-2.0 */
+/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
+/* const.h: Macros for dealing with constants.  */
+/* Some constant macros are used in both assembler and
+ * C code.  Therefore we cannot annotate them always with
+ * 'UL' and other type specifiers unilaterally.  We
+ * use the following macros to deal with this.
+ *
+ * Similarly, _AT() will cast an expression with a type in C, but
+ * leave it unchanged in asm.
+ */
+/*
+** asm/setup.h -- Definition of the Linux/m68k setup information
+**
+** Copyright 1992 by Greg Harp
+**
+** This file is subject to the terms and conditions of the GNU General Public
+** License.  See the file COPYING in the main directory of this archive
+** for more details.
+**
+** Created 09/29/92 by Greg Harp
+**
+** 5/2/94 Roman Hodek:
+**   Added bi_atari part of the machine dependent union bi_un; for now it
+**   contains just a model field to distinguish between TT and Falcon.
+** 26/7/96 Roman Zippel:
+**   Renamed to setup.h; added some useful macros to allow gcc some
+**   optimizations if possible.
+** 5/10/96 Geert Uytterhoeven:
+**   Redesign of the boot information structure; moved boot information
+**   structure to bootinfo.h
+*/
+/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
+/*
+ * asm/bootinfo.h -- Definition of the Linux/m68k boot information structure
+ *
+ * Copyright 1992 by Greg Harp
+ *
+ * This file is subject to the terms and conditions of the GNU General Public
+ * License.  See the file COPYING in the main directory of this archive
+ * for more details.
+ */
+/* SPDX-License-Identifier: GPL-2.0 */
+/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
+/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
+/*
+ * int-ll64 is used everywhere now.
+ */
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * asm-generic/int-ll64.h
+ *
+ * Integer declarations for architectures which use "long long"
+ * for 64-bit types.
+ */
+/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
+/*
+ * asm-generic/int-ll64.h
+ *
+ * Integer declarations for architectures which use "long long"
+ * for 64-bit types.
+ */
+/* SPDX-License-Identifier: GPL-2.0 */
+/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
+/*
+ * In order to keep safe and avoid regression, only unify uapi
+ * bitsperlong.h for some archs which are using newer toolchains
+ * that have the definitions of __CHAR_BIT__ and __SIZEOF_LONG__.
+ * See the following link for more info:
+ * https://lore.kernel.org/linux-arch/b9624545-2c80-49a1-ac3c-39264a591f7b@app.fastmail.com/
+ */
+/*
+ * FIXME: The check currently breaks x86-64 build, so it's
+ * temporarily disabled. Please fix x86-64 and reenable
+ */
+/*
+ * small_const_nbits(n) is true precisely when it is known at compile-time
+ * that BITMAP_SIZE(n) is 1, i.e. 1 <= n <= BITS_PER_LONG. This allows
+ * various bit/bitmap APIs to provide a fast inline implementation. Bitmaps
+ * of size 0 are very rare, and a compile-time-known-size 0 is most likely
+ * a sign of error. They will be handled correctly by the bit/bitmap APIs,
+ * but using the out-of-line functions, so that the inline implementations
+ * can unconditionally dereference the pointer(s).
+ */
+    /*
+     *  Tag Definitions
+     *
+     *  Machine independent tags start counting from 0x0000
+     *  Machine dependent tags start counting from 0x8000
+     */
+     /* (struct mem_info) */
+     /* (struct mem_info) */
+     /* (string) */
+/*
+ * A random seed used to initialize the RNG. Record format:
+ *
+ *   - length       [ 2 bytes, 16-bit big endian ]
+ *   - seed data    [ `length` bytes, padded to preserve 4-byte struct alignment ]
+ */
+    /*
+     *  Linux/m68k Architectures (BI_MACHTYPE)
+     */
+    /*
+     *  CPU, FPU and MMU types (BI_CPUTYPE, BI_FPUTYPE, BI_MMUTYPE)
+     *
+     *  Note: we may rely on the following equalities:
+     *
+     *      CPU_68020 == MMU_68851
+     *      CPU_68030 == MMU_68030
+     *      CPU_68040 == FPU_68040 == MMU_68040
+     *      CPU_68060 == FPU_68060 == MMU_68060
+     */
+    /*
+     * Stuff for bootinfo interface versioning
+     *
+     * At the start of kernel code, a 'struct bootversion' is located.
+     * bootstrap checks for a matching version of the interface before booting
+     * a kernel, to avoid user confusion if kernel and bootstrap don't work
+     * together :-)
+     *
+     * If incompatible changes are made to the bootinfo interface, the major
+     * number below should be stepped (and the minor reset to 0) for the
+     * appropriate machine. If a change is backward-compatible, the minor
+     * should be stepped. "Backwards-compatible" means that booting will work,
+     * but certain features may not.
+     */
+/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
+/*
+** asm/setup.h -- Definition of the Linux/m68k setup information
+**
+** Copyright 1992 by Greg Harp
+**
+** This file is subject to the terms and conditions of the GNU General Public
+** License.  See the file COPYING in the main directory of this archive
+** for more details.
+*/
+    /*
+     *  Miscellaneous
+     */
+/* SPDX-License-Identifier: GPL-2.0 */
+/* This handles the memory map.. */
+/* SPDX-License-Identifier: GPL-2.0 */
+/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
+/* const.h: Macros for dealing with constants.  */
+/*
+ * PAGE_SHIFT determines the page size.
+ *
+ * Note: This definition is required because PAGE_SHIFT is used
+ * in several places throughout the codebase.
+ */
+/*
+ * Applies only to 32-bit architectures.
+ *
+ * Subtle: (1 << CONFIG_PAGE_SHIFT) is an int, not an unsigned long.
+ * So if we assign PAGE_MASK to a larger type it gets extended the
+ * way we want (i.e. with 1s in the high bits) while masking a
+ * 64-bit value such as phys_addr_t.
+ */
+/* SPDX-License-Identifier: GPL-2.0 */
+/* SPDX-License-Identifier: GPL-2.0 */
+/* SPDX-License-Identifier: GPL-2.0 */
+/* SPDX-License-Identifier: GPL-2.0 */
+OUTPUT_FORMAT("elf32-m68k", "elf32-m68k", "elf32-m68k")
+OUTPUT_ARCH(m68k)
+SECTIONS
+{
+ PROVIDE(_start = .);
+ . = SIZEOF_HEADERS;
+ .hash : { *(.hash) } :text
+ .gnu.hash : { *(.gnu.hash) }
+ .dynsym : { *(.dynsym) }
+ .dynstr : { *(.dynstr) }
+ .gnu.version : { *(.gnu.version) }
+ .gnu.version_d : { *(.gnu.version_d) }
+ .gnu.version_r : { *(.gnu.version_r) }
+ .note : { *(.note.*) } :text :note
+ .text : { *(.text*) } :text
+ PROVIDE(__etext = .);
+ .rodata : { *(.rodata*) } :text
+ .dynamic : { *(.dynamic) } :text :dynamic
+ .eh_frame_hdr : { *(.eh_frame_hdr) } :text :eh_frame_hdr
+ .eh_frame : { KEEP(*(.eh_frame)) } :text
+ /*
+	 * Discard .note.GNU-stack, which is emitted as a stacktop section.
+	 */
+ /DISCARD/ : {
+  *(.note.GNU-stack)
+  *(.data .data.* .gnu.linkonce.d.*)
+  *(.bss .bss.* .gnu.linkonce.b.*)
+ }
+}
+PHDRS
+{
+ text PT_LOAD FILEHDR PHDRS FLAGS(5); /* PF_R|PF_X */
+ dynamic PT_DYNAMIC FLAGS(4); /* PF_R */
+ note PT_NOTE FLAGS(4); /* PF_R */
+ eh_frame_hdr PT_GNU_EH_FRAME;
+}
+/*
+ * This controls what userland symbols we export from the vDSO.
+ * Currently we only export a symbol that identifies the vDSO version.
+ */
+VERSION
+{
+ LINUX_5.0 {
+ global:
+  __vdso_m68k_tls;
+ local: *;
+ };
+}
diff --git a/arch/m68k/kernel/vdso/vdso.lds.S b/arch/m68k/kernel/vdso/vdso.lds.S
index 7f14c12e6..f8466da6f 100644
--- a/arch/m68k/kernel/vdso/vdso.lds.S
+++ b/arch/m68k/kernel/vdso/vdso.lds.S
@@ -46,7 +46,7 @@ SECTIONS
 
 PHDRS
 {
-	text		PT_LOAD		FLAGS(5);	/* PF_R|PF_X */
+	text		PT_LOAD		FILEHDR PHDRS FLAGS(5);	/* PF_R|PF_X */
 	dynamic		PT_DYNAMIC	FLAGS(4);	/* PF_R */
 	note		PT_NOTE		FLAGS(4);	/* PF_R */
 	eh_frame_hdr	PT_GNU_EH_FRAME;
-- 
2.51.0

