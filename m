From: <gerg@snapgear.com>
Subject: [PATCH 1/4] m68k: common PCI support definitions and code
Date: Fri, 29 Jun 2012 15:17:47 +1000
Message-ID: <1340947070-10672-2-git-send-email-gerg@snapgear.com>
References: <1340947070-10672-1-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from dnvwsmailout1.mcafee.com ([161.69.31.173]:18244 "EHLO
	DNVWSMAILOUT1.mcafee.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750978Ab2F2FTl (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Fri, 29 Jun 2012 01:19:41 -0400
In-Reply-To: <1340947070-10672-1-git-send-email-gerg@snapgear.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org
Cc: Greg Ungerer <gerg@uclinux.org>

From: Greg Ungerer <gerg@uclinux.org>

Basic set of definitions and support code required to turn on CONFIG_PCI
for the m68k architecture. Nothing specific to any PCI implementation in
any m68k class CPU harwdare yet.

Signed-off-by: Greg Ungerer <gerg@uclinux.org>
---
 arch/m68k/include/asm/dma.h   |    4 ++
 arch/m68k/include/asm/io_mm.h |    2 +
 arch/m68k/include/asm/pci.h   |    6 ++
 arch/m68k/kernel/Makefile     |    1 +
 arch/m68k/kernel/pcibios.c    |  109 +++++++++++++++++++++++++++++++++++++++++
 drivers/pci/Makefile          |    1 +
 6 files changed, 123 insertions(+), 0 deletions(-)
 create mode 100644 arch/m68k/kernel/pcibios.c

diff --git a/arch/m68k/include/asm/dma.h b/arch/m68k/include/asm/dma.h
index 6fbdfe8..7a59439 100644
--- a/arch/m68k/include/asm/dma.h
+++ b/arch/m68k/include/asm/dma.h
@@ -486,6 +486,10 @@ static __inline__ int get_dma_residue(unsigned int dmanr)
 extern int request_dma(unsigned int dmanr, const char * device_id);	/* reserve a DMA channel */
 extern void free_dma(unsigned int dmanr);	/* release it again */
 
+#ifdef CONFIG_PCI
+extern int isa_dma_bridge_buggy;
+#else
 #define isa_dma_bridge_buggy    (0)
+#endif
 
 #endif /* _M68K_DMA_H */
diff --git a/arch/m68k/include/asm/io_mm.h b/arch/m68k/include/asm/io_mm.h
index fa4324b..b85dbef 100644
--- a/arch/m68k/include/asm/io_mm.h
+++ b/arch/m68k/include/asm/io_mm.h
@@ -340,4 +340,6 @@ static inline void memcpy_toio(volatile void __iomem *dst, const void *src, int
  */
 #define xlate_dev_kmem_ptr(p)	p
 
+#define ioport_map(port, nr)	((void __iomem *)(port))
+
 #endif /* _IO_H */
diff --git a/arch/m68k/include/asm/pci.h b/arch/m68k/include/asm/pci.h
index 4ad0aea..848c3df 100644
--- a/arch/m68k/include/asm/pci.h
+++ b/arch/m68k/include/asm/pci.h
@@ -2,6 +2,7 @@
 #define _ASM_M68K_PCI_H
 
 #include <asm-generic/pci-dma-compat.h>
+#include <asm-generic/pci.h>
 
 /* The PCI address space does equal the physical memory
  * address space.  The networking and block device layers use
@@ -9,4 +10,9 @@
  */
 #define PCI_DMA_BUS_IS_PHYS	(1)
 
+#define	pcibios_assign_all_busses()	1
+
+#define	PCIBIOS_MIN_IO		0x00000100
+#define	PCIBIOS_MIN_MEM		0x02000000
+
 #endif /* _ASM_M68K_PCI_H */
diff --git a/arch/m68k/kernel/Makefile b/arch/m68k/kernel/Makefile
index 5c7070e..068ad49 100644
--- a/arch/m68k/kernel/Makefile
+++ b/arch/m68k/kernel/Makefile
@@ -18,6 +18,7 @@ obj-y	+= setup.o signal.o sys_m68k.o syscalltable.o time.o traps.o
 
 obj-$(CONFIG_MMU_MOTOROLA) += ints.o vectors.o
 obj-$(CONFIG_MMU_SUN3) += ints.o vectors.o
+obj-$(CONFIG_PCI) += pcibios.o
 
 ifndef CONFIG_MMU_SUN3
 obj-y	+= dma.o
diff --git a/arch/m68k/kernel/pcibios.c b/arch/m68k/kernel/pcibios.c
new file mode 100644
index 0000000..b2988aa
--- /dev/null
+++ b/arch/m68k/kernel/pcibios.c
@@ -0,0 +1,109 @@
+/*
+ * pci.c -- basic PCI support code
+ *
+ * This program is free software; you can redistribute  it and/or modify it
+ * under  the terms of  the GNU General  Public License as published by the
+ * Free Software Foundation;  either version 2 of the  License, or (at your
+ * option) any later version.
+ *
+ * (C) Copyright 2011, Greg Ungerer <gerg@uclinux.org>
+ */
+
+#include <linux/kernel.h>
+#include <linux/types.h>
+#include <linux/mm.h>
+#include <linux/init.h>
+#include <linux/pci.h>
+
+/*
+ * From arch/i386/kernel/pci-i386.c:
+ *
+ * We need to avoid collisions with `mirrored' VGA ports
+ * and other strange ISA hardware, so we always want the
+ * addresses to be allocated in the 0x000-0x0ff region
+ * modulo 0x400.
+ *
+ * Why? Because some silly external IO cards only decode
+ * the low 10 bits of the IO address. The 0x00-0xff region
+ * is reserved for motherboard devices that decode all 16
+ * bits, so it's ok to allocate at, say, 0x2800-0x28ff,
+ * but we want to try to avoid allocating at 0x2900-0x2bff
+ * which might be mirrored at 0x0100-0x03ff..
+ */
+resource_size_t pcibios_align_resource(void *data, const struct resource *res,
+	resource_size_t size, resource_size_t align)
+{
+	resource_size_t start = res->start;
+
+	if ((res->flags & IORESOURCE_IO) && (start & 0x300))
+		start = (start + 0x3ff) & ~0x3ff;
+
+	start = (start + align - 1) & ~(align - 1);
+
+	return start;
+}
+
+/*
+ * This is taken from the ARM code for this.
+ */
+int pcibios_enable_device(struct pci_dev *dev, int mask)
+{
+	struct resource *r;
+	u16 cmd, newcmd;
+	int idx;
+
+	pci_read_config_word(dev, PCI_COMMAND, &cmd);
+	newcmd = cmd;
+
+	for (idx = 0; idx < 6; idx++) {
+		/* Only set up the requested stuff */
+		if (!(mask & (1 << idx)))
+			continue;
+
+		r = dev->resource + idx;
+		if (!r->start && r->end) {
+			pr_err(KERN_ERR "PCI: Device %s not available because of resource collisions\n",
+				pci_name(dev));
+			return -EINVAL;
+		}
+		if (r->flags & IORESOURCE_IO)
+			newcmd |= PCI_COMMAND_IO;
+		if (r->flags & IORESOURCE_MEM)
+			newcmd |= PCI_COMMAND_MEMORY;
+	}
+
+	/*
+	 * Bridges (eg, cardbus bridges) need to be fully enabled
+	 */
+	if ((dev->class >> 16) == PCI_BASE_CLASS_BRIDGE)
+		newcmd |= PCI_COMMAND_IO | PCI_COMMAND_MEMORY;
+
+
+	if (newcmd != cmd) {
+		pr_info("PCI: enabling device %s (0x%04x -> 0x%04x)\n",
+			pci_name(dev), cmd, newcmd);
+		pci_write_config_word(dev, PCI_COMMAND, newcmd);
+	}
+	return 0;
+}
+
+void pcibios_update_irq(struct pci_dev *dev, int irq)
+{
+	pci_write_config_byte(dev, PCI_INTERRUPT_LINE, irq);
+}
+
+void __devinit pcibios_fixup_bus(struct pci_bus *bus)
+{
+	struct pci_dev *dev;
+
+	list_for_each_entry(dev, &bus->devices, bus_list) {
+		pci_write_config_byte(dev, PCI_CACHE_LINE_SIZE, 8);
+		pci_write_config_byte(dev, PCI_LATENCY_TIMER, 32);
+	}
+}
+
+char __devinit *pcibios_setup(char *str)
+{
+	return str;
+}
+
diff --git a/drivers/pci/Makefile b/drivers/pci/Makefile
index 01c001f..8d688b2 100644
--- a/drivers/pci/Makefile
+++ b/drivers/pci/Makefile
@@ -49,6 +49,7 @@ obj-$(CONFIG_MN10300) += setup-bus.o
 obj-$(CONFIG_MICROBLAZE) += setup-bus.o
 obj-$(CONFIG_TILE) += setup-bus.o setup-irq.o
 obj-$(CONFIG_SPARC_LEON) += setup-bus.o setup-irq.o
+obj-$(CONFIG_M68K) += setup-bus.o setup-irq.o
 
 #
 # ACPI Related PCI FW Functions
-- 
1.7.0.4
