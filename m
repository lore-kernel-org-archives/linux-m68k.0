Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3A3A1ABEA5
	for <linux-m68k@lists.linux-m68k.org>; Tue, 18 Feb 2025 12:53:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=147.75.193.91
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739883184; cv=none; b=rqyqgP1nxlv59R6hByXVZQqB9nVKaV5CSbkhLHVz+oNkjzr5WW3LV/f5iqxRwCjJnJ4oP4K0Mexw+5XFBx293119TEKR3YXQw+pTND97EKdbAxuZpraGXHvtnamqc3YAo7+9ctSbs1wkDDUWUk2e9zI1SOn0GVw7ck6EsocK4NA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739883184; c=relaxed/simple;
	bh=Y+PUmBu9Jg4gUGN/XV9Ukd7C0RjBYuSq82giffwKsBY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CZYTMI+vB8qGZ14R4nZirHkE55z0I1/ekNGmFYznfNu1ryiEmVFSzQdx6GQldQwPCC3n65W8imohWuZI4L+Ukij9eTeetMCww63hzusxoIob7IFo7GBevGKzxpziCNWBpPYNsHyyG+ZqB0U4MxeejvTcTSFdgM+mwIOWD84MnjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=kernel.org; arc=none smtp.client-ip=147.75.193.91
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 575CFA40BA3;
	Tue, 18 Feb 2025 12:51:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30DA8C4CEE2;
	Tue, 18 Feb 2025 12:53:01 +0000 (UTC)
From: Greg Ungerer <gerg@linux-m68k.org>
To: linux-m68k@lists.linux-m68k.org
Cc: Greg Ungerer <gerg@linux-m68k.org>
Subject: [PATCH 10/13] m68k: implement an embedded devicetree for nonmmu
Date: Tue, 18 Feb 2025 22:46:30 +1000
Message-ID: <20250218125124.2692982-11-gerg@linux-m68k.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250218125124.2692982-1-gerg@linux-m68k.org>
References: <20250218125124.2692982-1-gerg@linux-m68k.org>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If there is no capability for the boot loader to specify a devicetree
blob then this option allows for it to be embedded within the linux
kernel binary itself. This change specifically adds this embedding
support for the m68knommu targets.

Signed-off-by: Greg Ungerer <gerg@linux-m68k.org>
---
 arch/m68k/Kconfig.devices          | 11 ++++++++++
 arch/m68k/kernel/Makefile          |  1 +
 arch/m68k/kernel/embedded_dtb.S    | 19 +++++++++++++++++
 arch/m68k/kernel/setup_no.c        | 33 ++++++++++++++++++++++++++++++
 arch/m68k/kernel/vmlinux-nommu.lds |  9 ++++++++
 5 files changed, 73 insertions(+)
 create mode 100644 arch/m68k/kernel/embedded_dtb.S

diff --git a/arch/m68k/Kconfig.devices b/arch/m68k/Kconfig.devices
index e6e3efac1840..ea0bce4db639 100644
--- a/arch/m68k/Kconfig.devices
+++ b/arch/m68k/Kconfig.devices
@@ -144,3 +144,14 @@ config SERIAL_CONSOLE
 endmenu
 
 endif
+
+config EMBEDDED_DTB
+	bool "Embedded devicetree ELF section"
+	help
+	  If there is no capability for the boot loader to specify a
+	  devicetree (DTB) then this option allows for it to be embedbed
+	  within the linux binary itself. Typically you can do this with
+	  something like this:
+
+		objcopy --update-section .embedded_dtb=<filename>.dtb vmlinux
+
diff --git a/arch/m68k/kernel/Makefile b/arch/m68k/kernel/Makefile
index 6c732ed3998b..04627f13efb6 100644
--- a/arch/m68k/kernel/Makefile
+++ b/arch/m68k/kernel/Makefile
@@ -20,6 +20,7 @@ obj-$(CONFIG_M68K_NONCOHERENT_DMA) += dma.o
 obj-$(CONFIG_KEXEC_CORE)	+= machine_kexec.o relocate_kernel.o
 obj-$(CONFIG_BOOTINFO_PROC)	+= bootinfo_proc.o
 obj-$(CONFIG_UBOOT)		+= uboot.o
+obj-$(CONFIG_EMBEDDED_DTB)	+= embedded_dtb.o
 
 obj-$(CONFIG_EARLY_PRINTK)	+= early_printk.o
 
diff --git a/arch/m68k/kernel/embedded_dtb.S b/arch/m68k/kernel/embedded_dtb.S
new file mode 100644
index 000000000000..389a63f52770
--- /dev/null
+++ b/arch/m68k/kernel/embedded_dtb.S
@@ -0,0 +1,19 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#include <linux/linkage.h>
+#include <asm/page.h>
+
+/*
+ * If we have a single configured platform then include that fdt now.
+ * Otherwise leave some space so it can be inserted later.
+ */
+.section ".embedded_dtb","aw"
+.balign PAGE_SIZE
+
+#if defined(CONFIG_M520x)
+.incbin "arch/m68k/boot/dts/mcf5208evb.dtb"
+#elif defined(CONFIG_M547x)
+.incbin "arch/m68k/boot/dts/mcf5475evb.dtb"
+#else
+.skip PAGE_SIZE,0
+#endif
diff --git a/arch/m68k/kernel/setup_no.c b/arch/m68k/kernel/setup_no.c
index c926da9d5ec2..50f972c91caa 100644
--- a/arch/m68k/kernel/setup_no.c
+++ b/arch/m68k/kernel/setup_no.c
@@ -33,6 +33,8 @@
 #include <linux/initrd.h>
 #include <linux/root_dev.h>
 #include <linux/rtc.h>
+#include <linux/of.h>
+#include <linux/of_fdt.h>
 
 #include <asm/setup.h>
 #include <asm/bootinfo.h>
@@ -70,6 +72,32 @@ void (*mach_halt)(void);
 #define	CPU_NAME	"UNKNOWN"
 #endif
 
+#ifdef CONFIG_EMBEDDED_DTB
+static void __init m68k_setup_fdt(void)
+{
+	extern void *embedded_dtb;
+	phys_addr_t fdt = (phys_addr_t) &embedded_dtb;
+
+	pr_info("m68k generic DT machine support, FDT blob at 0x%08x\n", fdt);
+	if (!early_init_dt_verify(__va(fdt), fdt)) {
+		pr_err("FDT blob is bad?!\n");
+		return;
+	}
+	early_init_dt_scan_nodes();
+	unflatten_device_tree();
+}
+
+static void __init m68k_dtb_model(void)
+{
+	const char *model;
+	model = of_flat_dt_get_machine_name();
+	if (model)
+		pr_info("DTB reports model \"%s\"\n", model);
+	else
+		pr_warn("DTB has no model type?\n");
+}
+#endif /* CONFIG_EMBEDDED_DTB */
+
 /*
  * Different cores have different instruction execution timings.
  * The old/traditional 68000 cores are basically all the same, at 16.
@@ -166,6 +194,11 @@ void __init setup_arch(char **cmdline_p)
 	 * Get kmalloc into gear.
 	 */
 	paging_init();
+
+#ifdef CONFIG_EMBEDDED_DTB
+	m68k_setup_fdt();
+	m68k_dtb_model();
+#endif
 }
 
 /*
diff --git a/arch/m68k/kernel/vmlinux-nommu.lds b/arch/m68k/kernel/vmlinux-nommu.lds
index 2624fc18c131..1be3bfe31ba4 100644
--- a/arch/m68k/kernel/vmlinux-nommu.lds
+++ b/arch/m68k/kernel/vmlinux-nommu.lds
@@ -70,6 +70,15 @@ SECTIONS {
 	INIT_TEXT_SECTION(PAGE_SIZE)
 	INIT_DATA_SECTION(16)
 	PERCPU_SECTION(16)
+
+#ifdef CONFIG_EMBEDDED_DTB
+	STRUCT_ALIGN();
+	.embedded_dtb : {
+		embedded_dtb = .;
+		*(.embedded_dtb)
+		KEEP(*(.embedded_dtb))
+	}
+#endif
 	.m68k_fixup : {
 		__start_fixup = .;
 		*(.m68k_fixup)
-- 
2.43.0

