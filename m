Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B492B1ABEA5
	for <linux-m68k@lists.linux-m68k.org>; Tue, 18 Feb 2025 12:53:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=147.75.193.91
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739883186; cv=none; b=qVKQlMPoXOE/25ouPZxOIBovX5uMnzQPVfxH4U6eCcWfOxk2jxYpaA9ALyyO+1astSmPF8xvWvBHvBv3S2pUcH4QVcHKTaHRA2cAXLgURdV/JD8VEPWEt+81pBFqdtXXdzIXwtLCkv/V1K7CHC55YBDWu9JyxEX4BbQ1nwURx1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739883186; c=relaxed/simple;
	bh=LeuvJWnSjh6SamjA+sG3hzTlZR7ebX/ksLFDWPpkPKo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RNdBxppDBHjiLNRiAs8newfSsfEQIwqLWsaut754ilbW3nUtfpizjMEQnIigdCri3Ez0YLXyh7hB2VfU7dDjztwgAFKa4VupBS8qoQvZaEKayxbZS02dF01AntvI1MeXucEIJEdYRFUl4zvORQNd/i5Rra6KwrhJ0r0PRhLvGm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=kernel.org; arc=none smtp.client-ip=147.75.193.91
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id F1838A40BA4;
	Tue, 18 Feb 2025 12:51:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC6B8C4CEE7;
	Tue, 18 Feb 2025 12:53:02 +0000 (UTC)
From: Greg Ungerer <gerg@linux-m68k.org>
To: linux-m68k@lists.linux-m68k.org
Cc: Greg Ungerer <gerg@linux-m68k.org>
Subject: [PATCH 11/13] m68k: implement an embedded devicetree for mm targets
Date: Tue, 18 Feb 2025 22:46:31 +1000
Message-ID: <20250218125124.2692982-12-gerg@linux-m68k.org>
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

Add code to support using an embedded DTB for all m68k mm targets as well
as the nommu ones.

Signed-off-by: Greg Ungerer <gerg@linux-m68k.org>
---
 arch/m68k/kernel/setup_mm.c      | 33 ++++++++++++++++++++++++++++++++
 arch/m68k/kernel/vmlinux-std.lds | 10 ++++++++++
 2 files changed, 43 insertions(+)

diff --git a/arch/m68k/kernel/setup_mm.c b/arch/m68k/kernel/setup_mm.c
index 15c1a595a1de..ef871a78eb78 100644
--- a/arch/m68k/kernel/setup_mm.c
+++ b/arch/m68k/kernel/setup_mm.c
@@ -27,6 +27,8 @@
 #include <linux/nvram.h>
 #include <linux/initrd.h>
 #include <linux/random.h>
+#include <linux/of.h>
+#include <linux/of_fdt.h>
 
 #include <asm/bootinfo.h>
 #include <asm/byteorder.h>
@@ -204,6 +206,32 @@ static void __init m68k_parse_bootinfo(const struct bi_record *record)
 #endif
 }
 
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
 void __init setup_arch(char **cmdline_p)
 {
 	/* The bootinfo is located right after the kernel */
@@ -334,6 +362,11 @@ void __init setup_arch(char **cmdline_p)
 
 	paging_init();
 
+#ifdef CONFIG_EMBEDDED_DTB
+	m68k_setup_fdt();
+	m68k_dtb_model();
+#endif
+
 	if (IS_ENABLED(CONFIG_BLK_DEV_INITRD) && m68k_ramdisk.size) {
 		initrd_start = (unsigned long)phys_to_virt(m68k_ramdisk.addr);
 		initrd_end = initrd_start + m68k_ramdisk.size;
diff --git a/arch/m68k/kernel/vmlinux-std.lds b/arch/m68k/kernel/vmlinux-std.lds
index 1ccdd04ae462..45389a9a2356 100644
--- a/arch/m68k/kernel/vmlinux-std.lds
+++ b/arch/m68k/kernel/vmlinux-std.lds
@@ -43,6 +43,16 @@ SECTIONS
   __init_begin = .;
   INIT_TEXT_SECTION(PAGE_SIZE) :data
   INIT_DATA_SECTION(16)
+
+#ifdef CONFIG_EMBEDDED_DTB
+  STRUCT_ALIGN();
+  .embedded_dtb : {
+	embedded_dtb = .;
+	*(.embedded_dtb)
+	KEEP(*(.embedded_dtb))
+  }
+#endif
+
   .m68k_fixup : {
 	__start_fixup = .;
 	*(.m68k_fixup)
-- 
2.43.0

