Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6FC6208D91
	for <linux-m68k@lists.linux-m68k.org>; Wed, 16 Oct 2024 12:25:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=147.75.193.91
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729081509; cv=none; b=IB0D2EIpjdHFJjSFcdigdg5NJAxriWIGpbWZYQl83RzkwbiiqJPMLImglkFpiNB+oiRVfq1exajoLBDIgzkp1tw1opvtYVKR0uSlbzpLJwoINVJ72D6T9U32nkvTOr+EFPwJcBv9Ay8MJwTqCjrNhETxhC3PloHhMVKPQgMi9n8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729081509; c=relaxed/simple;
	bh=FhExyBVsAa8DlJgV7GRUKfpMvTFVrG7J2kadpMHGjFg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uVA+Y1pMfPYKwJ4T0yisRxPXZJGTyJEaCorkaYRsf1KyRtVJoQPrId4CgjudxQewJCatalWKV41vxHZ8lmgjwC/KrC4FHEcuonKB68seoRxMzuC+W1BJSC6mI5N4iviq/wOJcX/5S/TmpPleN5Cy/TvWLIMP9b+g9t0bh7T06HI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BcH3WvKo; arc=none smtp.client-ip=147.75.193.91
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BcH3WvKo"
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 5462EA43CE7;
	Wed, 16 Oct 2024 12:24:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B63D7C4CEC7;
	Wed, 16 Oct 2024 12:24:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729081506;
	bh=FhExyBVsAa8DlJgV7GRUKfpMvTFVrG7J2kadpMHGjFg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BcH3WvKoF6eSdLcu4KIL/oX1Tn7Y00nHxcTsKKWYyMhF9lKJ5Rzy/RniwiJvC5IzN
	 8ZlFCX8WzT5Wb0kNFn8LgRpXf1T8rscmfk4ykinUu2pKTXxkoRcKsXCFa3dLeOOfAG
	 JpGLnl/bccMCxeT6gmfx7cWriUR2ynzwEcFbGe1Kg3+JJGrZvDWhsXGf3IT/OxPscB
	 uD9d2jKY4rQJ6OXg6WCpLiKcrlefvCl+X5uJ5pyBZbdhHrwyI8cqmgKIvAG/pJZCDM
	 cN+rAjVtvS3z38VZ7RG7nnyqR3iHZvGmgdDqgMwHTHZaGcdacC/fgISxxq+Mq5rM/a
	 HYujkF/kPCdxA==
From: Mike Rapoport <rppt@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>,
	Luis Chamberlain <mcgrof@kernel.org>
Cc: Andreas Larsson <andreas@gaisler.com>,
	Andy Lutomirski <luto@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Borislav Petkov <bp@alien8.de>,
	Brian Cain <bcain@quicinc.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Christoph Hellwig <hch@infradead.org>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Dinh Nguyen <dinguyen@kernel.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Guo Ren <guoren@kernel.org>,
	Helge Deller <deller@gmx.de>,
	Huacai Chen <chenhuacai@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Kent Overstreet <kent.overstreet@linux.dev>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Matt Turner <mattst88@gmail.com>,
	Max Filippov <jcmvbkbc@gmail.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Michal Simek <monstr@monstr.eu>,
	Mike Rapoport <rppt@kernel.org>,
	Oleg Nesterov <oleg@redhat.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Richard Weinberger <richard@nod.at>,
	Russell King <linux@armlinux.org.uk>,
	Song Liu <song@kernel.org>,
	Stafford Horne <shorne@gmail.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Uladzislau Rezki <urezki@gmail.com>,
	Vineet Gupta <vgupta@kernel.org>,
	Will Deacon <will@kernel.org>,
	bpf@vger.kernel.org,
	linux-alpha@vger.kernel.org,
	linux-arch@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-csky@vger.kernel.org,
	linux-hexagon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org,
	linux-mm@kvack.org,
	linux-modules@vger.kernel.org,
	linux-openrisc@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-sh@vger.kernel.org,
	linux-snps-arc@lists.infradead.org,
	linux-trace-kernel@vger.kernel.org,
	linux-um@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	loongarch@lists.linux.dev,
	sparclinux@vger.kernel.org,
	x86@kernel.org,
	Christoph Hellwig <hch@lst.de>
Subject: [PATCH v6 1/8] mm: vmalloc: group declarations depending on CONFIG_MMU together
Date: Wed, 16 Oct 2024 15:24:17 +0300
Message-ID: <20241016122424.1655560-2-rppt@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241016122424.1655560-1-rppt@kernel.org>
References: <20241016122424.1655560-1-rppt@kernel.org>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>

There are a couple of declarations that depend on CONFIG_MMU in
include/linux/vmalloc.h spread all over the file.

Group them all together to improve code readability.

No functional changes.

Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
Reviewed-by: Christoph Hellwig <hch@lst.de>
---
 include/linux/vmalloc.h | 60 +++++++++++++++++------------------------
 1 file changed, 24 insertions(+), 36 deletions(-)

diff --git a/include/linux/vmalloc.h b/include/linux/vmalloc.h
index ad2ce7a6ab7a..27408f21e501 100644
--- a/include/linux/vmalloc.h
+++ b/include/linux/vmalloc.h
@@ -134,12 +134,6 @@ extern void vm_unmap_ram(const void *mem, unsigned int count);
 extern void *vm_map_ram(struct page **pages, unsigned int count, int node);
 extern void vm_unmap_aliases(void);
 
-#ifdef CONFIG_MMU
-extern unsigned long vmalloc_nr_pages(void);
-#else
-static inline unsigned long vmalloc_nr_pages(void) { return 0; }
-#endif
-
 extern void *vmalloc_noprof(unsigned long size) __alloc_size(1);
 #define vmalloc(...)		alloc_hooks(vmalloc_noprof(__VA_ARGS__))
 
@@ -266,12 +260,29 @@ static inline bool is_vm_area_hugepages(const void *addr)
 #endif
 }
 
+/* for /proc/kcore */
+long vread_iter(struct iov_iter *iter, const char *addr, size_t count);
+
+/*
+ *	Internals.  Don't use..
+ */
+__init void vm_area_add_early(struct vm_struct *vm);
+__init void vm_area_register_early(struct vm_struct *vm, size_t align);
+
+int register_vmap_purge_notifier(struct notifier_block *nb);
+int unregister_vmap_purge_notifier(struct notifier_block *nb);
+
 #ifdef CONFIG_MMU
+#define VMALLOC_TOTAL (VMALLOC_END - VMALLOC_START)
+
+unsigned long vmalloc_nr_pages(void);
+
 int vm_area_map_pages(struct vm_struct *area, unsigned long start,
 		      unsigned long end, struct page **pages);
 void vm_area_unmap_pages(struct vm_struct *area, unsigned long start,
 			 unsigned long end);
 void vunmap_range(unsigned long addr, unsigned long end);
+
 static inline void set_vm_flush_reset_perms(void *addr)
 {
 	struct vm_struct *vm = find_vm_area(addr);
@@ -279,24 +290,14 @@ static inline void set_vm_flush_reset_perms(void *addr)
 	if (vm)
 		vm->flags |= VM_FLUSH_RESET_PERMS;
 }
+#else  /* !CONFIG_MMU */
+#define VMALLOC_TOTAL 0UL
 
-#else
-static inline void set_vm_flush_reset_perms(void *addr)
-{
-}
-#endif
-
-/* for /proc/kcore */
-extern long vread_iter(struct iov_iter *iter, const char *addr, size_t count);
-
-/*
- *	Internals.  Don't use..
- */
-extern __init void vm_area_add_early(struct vm_struct *vm);
-extern __init void vm_area_register_early(struct vm_struct *vm, size_t align);
+static inline unsigned long vmalloc_nr_pages(void) { return 0; }
+static inline void set_vm_flush_reset_perms(void *addr) {}
+#endif /* CONFIG_MMU */
 
-#ifdef CONFIG_SMP
-# ifdef CONFIG_MMU
+#if defined(CONFIG_MMU) && defined(CONFIG_SMP)
 struct vm_struct **pcpu_get_vm_areas(const unsigned long *offsets,
 				     const size_t *sizes, int nr_vms,
 				     size_t align);
@@ -311,22 +312,9 @@ pcpu_get_vm_areas(const unsigned long *offsets,
 	return NULL;
 }
 
-static inline void
-pcpu_free_vm_areas(struct vm_struct **vms, int nr_vms)
-{
-}
-# endif
-#endif
-
-#ifdef CONFIG_MMU
-#define VMALLOC_TOTAL (VMALLOC_END - VMALLOC_START)
-#else
-#define VMALLOC_TOTAL 0UL
+static inline void pcpu_free_vm_areas(struct vm_struct **vms, int nr_vms) {}
 #endif
 
-int register_vmap_purge_notifier(struct notifier_block *nb);
-int unregister_vmap_purge_notifier(struct notifier_block *nb);
-
 #if defined(CONFIG_MMU) && defined(CONFIG_PRINTK)
 bool vmalloc_dump_obj(void *object);
 #else
-- 
2.43.0

