From: <gerg@snapgear.com>
Subject: [PATCH 2/4] m68k: add PCI bus support for the ColdFire M54xx SoC family
Date: Fri, 29 Jun 2012 15:17:48 +1000
Message-ID: <1340947070-10672-3-git-send-email-gerg@snapgear.com>
References: <1340947070-10672-1-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from dnvwsmailout1.mcafee.com ([161.69.31.173]:18148 "EHLO
	DNVWSMAILOUT1.mcafee.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750830Ab2F2FRq (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Fri, 29 Jun 2012 01:17:46 -0400
In-Reply-To: <1340947070-10672-1-git-send-email-gerg@snapgear.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org
Cc: Greg Ungerer <gerg@uclinux.org>

From: Greg Ungerer <gerg@uclinux.org>

The ColdFire M54xx SoC family have a traditional PCI bus interface.
Add the core support code to access and use this bus on these parts.

Signed-off-by: Greg Ungerer <gerg@uclinux.org>
---
 arch/m68k/include/asm/m54xxpci.h     |  138 +++++++++++++++
 arch/m68k/include/asm/m54xxsim.h     |    3 +
 arch/m68k/platform/coldfire/Makefile |    2 +
 arch/m68k/platform/coldfire/pci.c    |  314 ++++++++++++++++++++++++++++++++++
 4 files changed, 457 insertions(+), 0 deletions(-)
 create mode 100644 arch/m68k/include/asm/m54xxpci.h
 create mode 100644 arch/m68k/platform/coldfire/pci.c

diff --git a/arch/m68k/include/asm/m54xxpci.h b/arch/m68k/include/asm/m54xxpci.h
new file mode 100644
index 0000000..6fbf54f
--- /dev/null
+++ b/arch/m68k/include/asm/m54xxpci.h
@@ -0,0 +1,138 @@
+/****************************************************************************/
+
+/*
+ *	m54xxpci.h -- ColdFire 547x and 548x PCI bus support
+ *
+ *	(C) Copyright 2011,  Greg Ungerer <gerg@uclinux.org>
+ *
+ * This file is subject to the terms and conditions of the GNU General Public
+ * License.  See the file COPYING in the main directory of this archive
+ * for more details.
+ */
+
+/****************************************************************************/
+#ifndef	M54XXPCI_H
+#define	M54XXPCI_H
+/****************************************************************************/
+
+/*
+ *	The core set of PCI support registers are mapped into the MBAR region.
+ */
+#define	PCIIDR		(CONFIG_MBAR + 0xb00)	/* PCI device/vendor ID */
+#define	PCISCR		(CONFIG_MBAR + 0xb04)	/* PCI status/command */
+#define	PCICCRIR	(CONFIG_MBAR + 0xb08)	/* PCI class/revision */
+#define	PCICR1		(CONFIG_MBAR + 0xb0c)	/* PCI configuration 1 */
+#define	PCIBAR0		(CONFIG_MBAR + 0xb10)	/* PCI base address 0 */
+#define	PCIBAR1		(CONFIG_MBAR + 0xb14)	/* PCI base address 1 */
+#define	PCICCPR		(CONFIG_MBAR + 0xb28)	/* PCI cardbus CIS pointer */
+#define	PCISID		(CONFIG_MBAR + 0xb2c)	/* PCI subsystem IDs */
+#define	PCIERBAR	(CONFIG_MBAR + 0xb30)	/* PCI expansion ROM */
+#define	PCICPR		(CONFIG_MBAR + 0xb34)	/* PCI capabilities pointer */
+#define	PCICR2		(CONFIG_MBAR + 0xb3c)	/* PCI configuration 2 */
+
+#define	PCIGSCR		(CONFIG_MBAR + 0xb60)	/* Global status/control */
+#define	PCITBATR0	(CONFIG_MBAR + 0xb64)	/* Target base translation 0 */
+#define	PCITBATR1	(CONFIG_MBAR + 0xb68)	/* Target base translation 1 */
+#define	PCITCR		(CONFIG_MBAR + 0xb6c)	/* Target control */
+#define	PCIIW0BTAR	(CONFIG_MBAR + 0xb70)	/* Initiator window 0 */
+#define	PCIIW1BTAR	(CONFIG_MBAR + 0xb74)	/* Initiator window 1 */
+#define	PCIIW2BTAR	(CONFIG_MBAR + 0xb78)	/* Initiator window 2 */
+#define	PCIIWCR		(CONFIG_MBAR + 0xb80)	/* Initiator window config */
+#define	PCIICR		(CONFIG_MBAR + 0xb84)	/* Initiator control */
+#define	PCIISR		(CONFIG_MBAR + 0xb88)	/* Initiator status */
+#define	PCICAR		(CONFIG_MBAR + 0xbf8)	/* Configuration address */
+
+#define	PCITPSR		(CONFIG_MBAR + 0x8400)	/* TX packet size */
+#define	PCITSAR		(CONFIG_MBAR + 0x8404)	/* TX start address */
+#define	PCITTCR		(CONFIG_MBAR + 0x8408)	/* TX transaction control */
+#define	PCITER		(CONFIG_MBAR + 0x840c)	/* TX enables */
+#define	PCITNAR		(CONFIG_MBAR + 0x8410)	/* TX next address */
+#define	PCITLWR		(CONFIG_MBAR + 0x8414)	/* TX last word */
+#define	PCITDCR		(CONFIG_MBAR + 0x8418)	/* TX done counts */
+#define	PCITSR		(CONFIG_MBAR + 0x841c)	/* TX status */
+#define	PCITFDR		(CONFIG_MBAR + 0x8440)	/* TX FIFO data */
+#define	PCITFSR		(CONFIG_MBAR + 0x8444)	/* TX FIFO status */
+#define	PCITFCR		(CONFIG_MBAR + 0x8448)	/* TX FIFO control */
+#define	PCITFAR		(CONFIG_MBAR + 0x844c)	/* TX FIFO alarm */
+#define	PCITFRPR	(CONFIG_MBAR + 0x8450)	/* TX FIFO read pointer */
+#define	PCITFWPR	(CONFIG_MBAR + 0x8454)	/* TX FIFO write pointer */
+
+#define	PCIRPSR		(CONFIG_MBAR + 0x8480)	/* RX packet size */
+#define	PCIRSAR		(CONFIG_MBAR + 0x8484)	/* RX start address */
+#define	PCIRTCR		(CONFIG_MBAR + 0x8488)	/* RX transaction control */
+#define	PCIRER		(CONFIG_MBAR + 0x848c)	/* RX enables */
+#define	PCIRNAR		(CONFIG_MBAR + 0x8490)	/* RX next address */
+#define	PCIRDCR		(CONFIG_MBAR + 0x8498)	/* RX done counts */
+#define	PCIRSR		(CONFIG_MBAR + 0x849c)	/* RX status */
+#define	PCIRFDR		(CONFIG_MBAR + 0x84c0)	/* RX FIFO data */
+#define	PCIRFSR		(CONFIG_MBAR + 0x84c4)	/* RX FIFO status */
+#define	PCIRFCR		(CONFIG_MBAR + 0x84c8)	/* RX FIFO control */
+#define	PCIRFAR		(CONFIG_MBAR + 0x84cc)	/* RX FIFO alarm */
+#define	PCIRFRPR	(CONFIG_MBAR + 0x84d0)	/* RX FIFO read pointer */
+#define	PCIRFWPR	(CONFIG_MBAR + 0x84d4)	/* RX FIFO write pointer */
+
+#define	PACR		(CONFIG_MBAR + 0xc00)	/* PCI arbiter control */
+#define	PASR		(COFNIG_MBAR + 0xc04)	/* PCI arbiter status */
+
+/*
+ *	Definitions for the Global status and control register.
+ */
+#define	PCIGSCR_PE	0x20000000		/* Parity error detected */
+#define	PCIGSCR_SE	0x10000000		/* System error detected */
+#define	PCIGSCR_XCLKBIN	0x07000000		/* XLB2CLKIN mask */
+#define	PCIGSCR_PEE	0x00002000		/* Parity error intr enable */
+#define	PCIGSCR_SEE	0x00001000		/* System error intr enable */
+#define	PCIGSCR_RESET	0x00000001		/* Reset bit */
+
+/*
+ *	Bit definitions for the PCICAR configuration address register.
+ */
+#define	PCICAR_E	0x80000000		/* Enable config space */
+#define	PCICAR_BUSN	16			/* Move bus bits */
+#define	PCICAR_DEVFNN	8			/* Move devfn bits */
+#define	PCICAR_DWORDN	0			/* Move dword bits */
+
+/*
+ *	The initiator windows hold the memory and IO mapping information.
+ *	This macro creates the register values from the desired addresses.
+ */
+#define	WXBTAR(hostaddr, pciaddr, size)	\
+			(((hostaddr) & 0xff000000) | \
+			((((size) - 1) & 0xff000000) >> 8) | \
+			(((pciaddr) & 0xff000000) >> 16))
+
+#define	PCIIWCR_W0_MEM	0x00000000		/* Window 0 is memory */
+#define	PCIIWCR_W0_IO	0x08000000		/* Window 0 is IO */
+#define	PCIIWCR_W0_MRD	0x00000000		/* Window 0 memory read */
+#define	PCIIWCR_W0_MRDL	0x02000000		/* Window 0 memory read line */
+#define	PCIIWCR_W0_MRDM	0x04000000		/* Window 0 memory read mult */
+#define	PCIIWCR_W0_E	0x01000000		/* Window 0 enable */
+
+#define	PCIIWCR_W1_MEM	0x00000000		/* Window 0 is memory */
+#define	PCIIWCR_W1_IO	0x00080000		/* Window 0 is IO */
+#define	PCIIWCR_W1_MRD	0x00000000		/* Window 0 memory read */
+#define	PCIIWCR_W1_MRDL	0x00020000		/* Window 0 memory read line */
+#define	PCIIWCR_W1_MRDM	0x00040000		/* Window 0 memory read mult */
+#define	PCIIWCR_W1_E	0x00010000		/* Window 0 enable */
+
+/*
+ *	Bit definitions for the PCIBATR registers.
+ */
+#define	PCITBATR0_E	0x00000001		/* Enable window 0 */
+#define	PCITBATR1_E	0x00000001		/* Enable window 1 */
+
+/*
+ *	PCI arbiter support definitions and macros.
+ */
+#define	PACR_INTMPRI	0x00000001
+#define	PACR_EXTMPRI(x)	(((x) & 0x1f) << 1)
+#define	PACR_INTMINTE	0x00010000
+#define	PACR_EXTMINTE(x) (((x) & 0x1f) << 17)
+#define	PACR_PKMD	0x40000000
+#define	PACR_DS		0x80000000
+
+#define	PCICR1_CL(x)	((x) & 0xf)		/* Cacheline size field */
+#define	PCICR1_LT(x)	(((x) & 0xff) << 8)	/* Latency timer field */
+
+/****************************************************************************/
+#endif	/* M54XXPCI_H */
diff --git a/arch/m68k/include/asm/m54xxsim.h b/arch/m68k/include/asm/m54xxsim.h
index ae56b88..d3c5e0d 100644
--- a/arch/m68k/include/asm/m54xxsim.h
+++ b/arch/m68k/include/asm/m54xxsim.h
@@ -81,4 +81,7 @@
 #define MCF_PAR_PSC_RTS_RTS	(0x30)
 #define MCF_PAR_PSC_CANRX	(0x40)
 
+#define MCF_PAR_PCIBG		(CONFIG_MBAR + 0xa48)	/* PCI bus grant */
+#define MCF_PAR_PCIBR		(CONFIG_MBAR + 0xa4a)	/* PCI */
+
 #endif	/* m54xxsim_h */
diff --git a/arch/m68k/platform/coldfire/Makefile b/arch/m68k/platform/coldfire/Makefile
index 76d389d..8d72a38 100644
--- a/arch/m68k/platform/coldfire/Makefile
+++ b/arch/m68k/platform/coldfire/Makefile
@@ -32,5 +32,7 @@ obj-$(CONFIG_NETtel)	+= nettel.o
 obj-$(CONFIG_CLEOPATRA)	+= nettel.o
 obj-$(CONFIG_FIREBEE)	+= firebee.o
 
+obj-$(CONFIG_PCI)	+= pci.o
+
 obj-y			+= pinmux.o gpio.o
 extra-y := head.o
diff --git a/arch/m68k/platform/coldfire/pci.c b/arch/m68k/platform/coldfire/pci.c
new file mode 100644
index 0000000..eea4d57
--- /dev/null
+++ b/arch/m68k/platform/coldfire/pci.c
@@ -0,0 +1,314 @@
+/*
+ * pci.c -- PCI bus support for ColdFire processors
+ *
+ * (C) Copyright 2012, Greg Ungerer <gerg@uclinux.com>
+ *
+ * This file is subject to the terms and conditions of the GNU General Public
+ * License.  See the file COPYING in the main directory of this archive
+ * for more details.
+ */
+
+#include <linux/types.h>
+#include <linux/module.h>
+#include <linux/init.h>
+#include <linux/kernel.h>
+#include <linux/interrupt.h>
+#include <linux/irq.h>
+#include <linux/io.h>
+#include <linux/pci.h>
+#include <linux/delay.h>
+#include <asm/coldfire.h>
+#include <asm/mcfsim.h>
+#include <asm/m54xxpci.h>
+
+/*
+ * Memory and IO mappings. We use a 1:1 mapping for local host memory to
+ * PCI bus memory (no reason not to really). IO space doesn't matter, we
+ * always use access functions for that. The device configuration space is
+ * mapped over the IO map space when we enable it in the PCICAR register.
+ */
+#define	PCI_MEM_PA	0xf0000000		/* Host physical address */
+#define	PCI_MEM_BA	0xf0000000		/* Bus physical address */
+#define	PCI_MEM_SIZE	0x08000000		/* 128 MB */
+#define	PCI_MEM_MASK	(PCI_MEM_SIZE - 1)
+
+#define	PCI_IO_PA	0xf8000000		/* Host physical address */
+#define	PCI_IO_BA	0x00000000		/* Bus physical address */
+#define	PCI_IO_SIZE	0x00010000		/* 64k */
+#define	PCI_IO_MASK	(PCI_IO_SIZE - 1)
+
+static struct pci_bus *rootbus;
+static unsigned long iospace;
+
+/*
+ * We need to be carefull probing on bus 0 (directly connected to host
+ * bridge). We should only acccess the well defined possible devices in
+ * use, ignore aliases and the like.
+ */
+static unsigned char mcf_host_slot2sid[32] = {
+	0, 0, 0, 0, 0, 0, 0, 0,
+	0, 0, 0, 0, 0, 0, 0, 0,
+	0, 1, 2, 0, 3, 4, 0, 0,
+	0, 0, 0, 0, 0, 0, 0, 0,
+};
+
+static unsigned char mcf_host_irq[] = {
+	0, 69, 69, 71, 71,
+};
+
+/*
+ * Configuration space access functions. Configuration space access is
+ * through the IO mapping window, enabling it via the PCICAR register.
+ */
+static unsigned long mcf_mk_pcicar(int bus, unsigned int devfn, int where)
+{
+	return (bus << PCICAR_BUSN) | (devfn << PCICAR_DEVFNN) | (where & 0xfc);
+}
+
+static int mcf_pci_readconfig(struct pci_bus *bus, unsigned int devfn,
+	int where, int size, u32 *value)
+{
+	unsigned long addr;
+
+	*value = 0xffffffff;
+
+	if (bus->number == 0) {
+		if (mcf_host_slot2sid[PCI_SLOT(devfn)] == 0)
+			return PCIBIOS_SUCCESSFUL;
+	}
+
+	addr = mcf_mk_pcicar(bus->number, devfn, where);
+	__raw_writel(PCICAR_E | addr, PCICAR);
+	addr = iospace + (where & 0x3);
+
+	switch (size) {
+	case 1:
+		*value = __raw_readb(addr);
+		break;
+	case 2:
+		*value = le16_to_cpu(__raw_readw(addr));
+		break;
+	default:
+		*value = le32_to_cpu(__raw_readl(addr));
+		break;
+	}
+
+	return PCIBIOS_SUCCESSFUL;
+}
+
+static int mcf_pci_writeconfig(struct pci_bus *bus, unsigned int devfn,
+	int where, int size, u32 value)
+{
+	unsigned long addr;
+
+	if (bus->number == 0) {
+		if (mcf_host_slot2sid[PCI_SLOT(devfn)] == 0)
+			return PCIBIOS_SUCCESSFUL;
+	}
+
+	addr = mcf_mk_pcicar(bus->number, devfn, where);
+	__raw_writel(PCICAR_E | addr, PCICAR);
+	addr = iospace + (where & 0x3);
+
+	switch (size) {
+	case 1:
+		 __raw_writeb(value, addr);
+		break;
+	case 2:
+		__raw_writew(cpu_to_le16(value), addr);
+		break;
+	default:
+		__raw_writel(cpu_to_le32(value), addr);
+		break;
+	}
+
+	__raw_writel(0, PCICAR);
+	return PCIBIOS_SUCCESSFUL;
+}
+
+static struct pci_ops mcf_pci_ops = {
+	.read	= mcf_pci_readconfig,
+	.write	= mcf_pci_writeconfig,
+};
+
+/*
+ *	IO address space access functions. Pretty strait forward, these are
+ *	directly mapped in to the IO mapping window. And that is mapped into
+ *	virtual address space.
+ */
+u8 mcf_pci_inb(u32 addr)
+{
+	return __raw_readb(iospace + (addr & PCI_IO_MASK));
+}
+EXPORT_SYMBOL(mcf_pci_inb);
+
+u16 mcf_pci_inw(u32 addr)
+{
+	return le16_to_cpu(__raw_readw(iospace + (addr & PCI_IO_MASK)));
+}
+EXPORT_SYMBOL(mcf_pci_inw);
+
+u32 mcf_pci_inl(u32 addr)
+{
+	return le32_to_cpu(__raw_readl(iospace + (addr & PCI_IO_MASK)));
+}
+EXPORT_SYMBOL(mcf_pci_inl);
+
+void mcf_pci_insb(u32 addr, u8 *buf, u32 len)
+{
+	for (; len; len--)
+		*buf++ = mcf_pci_inb(addr);
+}
+EXPORT_SYMBOL(mcf_pci_insb);
+
+void mcf_pci_insw(u32 addr, u16 *buf, u32 len)
+{
+	for (; len; len--)
+		*buf++ = mcf_pci_inw(addr);
+}
+EXPORT_SYMBOL(mcf_pci_insw);
+
+void mcf_pci_insl(u32 addr, u32 *buf, u32 len)
+{
+	for (; len; len--)
+		*buf++ = mcf_pci_inl(addr);
+}
+EXPORT_SYMBOL(mcf_pci_insl);
+
+void mcf_pci_outb(u8 v, u32 addr)
+{
+	__raw_writeb(v, iospace + (addr & PCI_IO_MASK));
+}
+EXPORT_SYMBOL(mcf_pci_outb);
+
+void mcf_pci_outw(u16 v, u32 addr)
+{
+	__raw_writew(cpu_to_le16(v), iospace + (addr & PCI_IO_MASK));
+}
+EXPORT_SYMBOL(mcf_pci_outw);
+
+void mcf_pci_outl(u32 v, u32 addr)
+{
+	__raw_writel(cpu_to_le32(v), iospace + (addr & PCI_IO_MASK));
+}
+EXPORT_SYMBOL(mcf_pci_outl);
+
+void mcf_pci_outsb(u32 addr, const u8 *buf, u32 len)
+{
+	for (; len; len--)
+		mcf_pci_outb(*buf++, addr);
+}
+EXPORT_SYMBOL(mcf_pci_outsb);
+
+void mcf_pci_outsw(u32 addr, const u16 *buf, u32 len)
+{
+	for (; len; len--)
+		mcf_pci_outw(*buf++, addr);
+}
+EXPORT_SYMBOL(mcf_pci_outsw);
+
+void mcf_pci_outsl(u32 addr, const u32 *buf, u32 len)
+{
+	for (; len; len--)
+		mcf_pci_outl(*buf++, addr);
+}
+EXPORT_SYMBOL(mcf_pci_outsl);
+
+/*
+ * Initialize the PCI bus registers, and scan the bus.
+ */
+static struct resource mcf_pci_mem = {
+	.name	= "PCI Memory space",
+	.start	= PCI_MEM_PA,
+	.end	= PCI_MEM_PA + PCI_MEM_SIZE - 1,
+	.flags	= IORESOURCE_MEM,
+};
+
+static struct resource mcf_pci_io = {
+	.name	= "PCI IO space",
+	.start	= 0x400,
+	.end	= 0x10000 - 1,
+	.flags	= IORESOURCE_IO,
+};
+
+/*
+ * Interrupt mapping and setting.
+ */
+static int mcf_pci_map_irq(const struct pci_dev *dev, u8 slot, u8 pin)
+{
+	int sid;
+
+	sid = mcf_host_slot2sid[slot];
+	if (sid)
+		return mcf_host_irq[sid];
+	return 0;
+}
+
+static int __init mcf_pci_init(void)
+{
+	pr_info("ColdFire: PCI bus initialization...\n");
+
+	/* Reset the external PCI bus */
+	__raw_writel(PCIGSCR_RESET, PCIGSCR);
+	__raw_writel(0, PCITCR);
+
+	request_resource(&iomem_resource, &mcf_pci_mem);
+	request_resource(&iomem_resource, &mcf_pci_io);
+
+	/* Configure PCI arbiter */
+	__raw_writel(PACR_INTMPRI | PACR_INTMINTE | PACR_EXTMPRI(0x1f) |
+		PACR_EXTMINTE(0x1f), PACR);
+
+	/* Set required multi-function pins for PCI bus use */
+	__raw_writew(0x3ff, MCF_PAR_PCIBG);
+	__raw_writew(0x3ff, MCF_PAR_PCIBR);
+
+	/* Set up config space for local host bus controller */
+	__raw_writel(PCI_COMMAND_MEMORY | PCI_COMMAND_MASTER |
+		PCI_COMMAND_INVALIDATE, PCISCR);
+	__raw_writel(PCICR1_LT(32) | PCICR1_CL(8), PCICR1);
+	__raw_writel(0, PCICR2);
+
+	/*
+	 * Set up the initiator windows for memory and IO mapping.
+	 * These give the CPU bus access onto the PCI bus. One for each of
+	 * PCI memory and IO address spaces.
+	 */
+	__raw_writel(WXBTAR(PCI_MEM_PA, PCI_MEM_BA, PCI_MEM_SIZE),
+		PCIIW0BTAR);
+	__raw_writel(WXBTAR(PCI_IO_PA, PCI_IO_BA, PCI_IO_SIZE),
+		PCIIW1BTAR);
+	__raw_writel(PCIIWCR_W0_MEM /*| PCIIWCR_W0_MRDL*/ | PCIIWCR_W0_E |
+		PCIIWCR_W1_IO | PCIIWCR_W1_E, PCIIWCR);
+
+	/*
+	 * Set up the target windows for access from the PCI bus back to the
+	 * CPU bus. All we need is access to system RAM (for mastering).
+	 */
+	__raw_writel(CONFIG_RAMBASE, PCIBAR1);
+	__raw_writel(CONFIG_RAMBASE | PCITBATR1_E, PCITBATR1);
+
+	/* Keep a virtual mapping to IO/config space active */
+	iospace = (unsigned long) ioremap(PCI_IO_PA, PCI_IO_SIZE);
+	if (iospace == 0)
+		return -ENODEV;
+	pr_info("Coldfire: PCI IO/config window mapped to 0x%x\n",
+		(u32) iospace);
+
+	/* Turn of PCI reset, and wait for devices to settle */
+	__raw_writel(0, PCIGSCR);
+	schedule_timeout(msecs_to_jiffies(200));
+
+	rootbus = pci_scan_bus(0, &mcf_pci_ops, NULL);
+	rootbus->resource[0] = &mcf_pci_io;
+	rootbus->resource[1] = &mcf_pci_mem;
+
+	pci_fixup_irqs(pci_common_swizzle, mcf_pci_map_irq);
+	pci_bus_size_bridges(rootbus);
+	pci_bus_assign_resources(rootbus);
+	pci_enable_bridges(rootbus);
+	pci_bus_add_devices(rootbus);
+	return 0;
+}
+
+subsys_initcall(mcf_pci_init);
-- 
1.7.0.4
