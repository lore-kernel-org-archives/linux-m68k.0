Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 150E31FF1B5
	for <linux-m68k@lists.linux-m68k.org>; Thu, 30 Apr 2026 05:23:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=172.105.4.254
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777526606; cv=none; b=sSaMD2fMK0znmda/2q2jxQfqJvjuTN+XBoQUcq4K6H6yxPdPdObQ3NLsGpeomAIN00HZEsXAb0GqfL6riDdd8YqAINnWJfHIemcXiKQkXS8iHOnjkU7mnINV2KSO4Lu9Z1xbvCcYrJeVqOvGfci7Pf4Npkm8WSL2lP+aUbw2hxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777526606; c=relaxed/simple;
	bh=/Mmg7v2OjCNDPA83xayMZLAHOY6Af6Ks5Z0wUft7bXA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VdkQopwTIezrqk0kytYl+zcmtlBZme2Z9Ms8LWIh85S16VwVntw5uQMXpN+1OH8QY/mPh3Gjaj3PsbLT56D1oog1xPQwBLlv8bfDkezxaEgl7gJb6t1kd8mOEcnQ97ab/bhRh8+xgDEN6WVA7yjwyKVYkZKpb2C9v8uHXBu7pi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=kernel.org; arc=none smtp.client-ip=172.105.4.254
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 746BE61141;
	Thu, 30 Apr 2026 05:23:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1084FC2BCB9;
	Thu, 30 Apr 2026 05:23:22 +0000 (UTC)
From: Greg Ungerer <gerg@linux-m68k.org>
To: linux-m68k@lists.linux-m68k.org
Cc: arnd@kernel.org,
	Greg Ungerer <gerg@kernel.org>,
	Greg Ungerer <gerg@linux-m68k.org>
Subject: [PATCH 6/7] m68k: coldfire: use ColdFire specifc IO access in system code
Date: Thu, 30 Apr 2026 15:19:22 +1000
Message-ID: <20260430052047.1827575-7-gerg@linux-m68k.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260430052047.1827575-1-gerg@linux-m68k.org>
References: <20260430052047.1827575-1-gerg@linux-m68k.org>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Greg Ungerer <gerg@kernel.org>

Convert all coldfire specific system setup code to only use the
newly created internal register access methods. This is replacing the
mixed and inconsistent use of readx/writex and __raw_readx/__raw_writex
for internal SoC registers.

Signed-off-by: Greg Ungerer <gerg@linux-m68k.org>
---
 arch/m68k/coldfire/clk.c    |  8 +++---
 arch/m68k/coldfire/device.c |  8 +++---
 arch/m68k/coldfire/pci.c    | 56 ++++++++++++++++++-------------------
 arch/m68k/coldfire/reset.c  |  4 +--
 4 files changed, 38 insertions(+), 38 deletions(-)

diff --git a/arch/m68k/coldfire/clk.c b/arch/m68k/coldfire/clk.c
index d03b6c4aa86b..c120bbca6c1b 100644
--- a/arch/m68k/coldfire/clk.c
+++ b/arch/m68k/coldfire/clk.c
@@ -42,12 +42,12 @@ void __clk_init_disabled(struct clk *clk)
 
 static void __clk_enable0(struct clk *clk)
 {
-	__raw_writeb(clk->slot, MCFPM_PPMCR0);
+	mcf_write8(clk->slot, MCFPM_PPMCR0);
 }
 
 static void __clk_disable0(struct clk *clk)
 {
-	__raw_writeb(clk->slot, MCFPM_PPMSR0);
+	mcf_write8(clk->slot, MCFPM_PPMSR0);
 }
 
 struct clk_ops clk_ops0 = {
@@ -58,12 +58,12 @@ struct clk_ops clk_ops0 = {
 #ifdef MCFPM_PPMCR1
 static void __clk_enable1(struct clk *clk)
 {
-	__raw_writeb(clk->slot, MCFPM_PPMCR1);
+	mcf_write8(clk->slot, MCFPM_PPMCR1);
 }
 
 static void __clk_disable1(struct clk *clk)
 {
-	__raw_writeb(clk->slot, MCFPM_PPMSR1);
+	mcf_write8(clk->slot, MCFPM_PPMSR1);
 }
 
 struct clk_ops clk_ops1 = {
diff --git a/arch/m68k/coldfire/device.c b/arch/m68k/coldfire/device.c
index b6958ec2a220..1420bae0964f 100644
--- a/arch/m68k/coldfire/device.c
+++ b/arch/m68k/coldfire/device.c
@@ -669,13 +669,13 @@ static void __init mcf_uart_set_irq(void)
 {
 #ifdef MCFUART_UIVR
 	/* UART0 interrupt setup */
-	writeb(MCFSIM_ICR_LEVEL6 | MCFSIM_ICR_PRI1, MCFSIM_UART1ICR);
-	writeb(MCF_IRQ_UART0, MCFUART_BASE0 + MCFUART_UIVR);
+	mcf_write8(MCFSIM_ICR_LEVEL6 | MCFSIM_ICR_PRI1, MCFSIM_UART1ICR);
+	mcf_write8(MCF_IRQ_UART0, MCFUART_BASE0 + MCFUART_UIVR);
 	mcf_mapirq2imr(MCF_IRQ_UART0, MCFINTC_UART0);
 
 	/* UART1 interrupt setup */
-	writeb(MCFSIM_ICR_LEVEL6 | MCFSIM_ICR_PRI2, MCFSIM_UART2ICR);
-	writeb(MCF_IRQ_UART1, MCFUART_BASE1 + MCFUART_UIVR);
+	mcf_write8(MCFSIM_ICR_LEVEL6 | MCFSIM_ICR_PRI2, MCFSIM_UART2ICR);
+	mcf_write8(MCF_IRQ_UART1, MCFUART_BASE1 + MCFUART_UIVR);
 	mcf_mapirq2imr(MCF_IRQ_UART1, MCFINTC_UART1);
 #endif
 }
diff --git a/arch/m68k/coldfire/pci.c b/arch/m68k/coldfire/pci.c
index ceb5775b8d23..5afb207ccc51 100644
--- a/arch/m68k/coldfire/pci.c
+++ b/arch/m68k/coldfire/pci.c
@@ -68,24 +68,24 @@ static int mcf_pci_readconfig(struct pci_bus *bus, unsigned int devfn,
 	}
 
 	addr = mcf_mk_pcicar(bus->number, devfn, where);
-	__raw_writel(PCICAR_E | addr, PCICAR);
-	__raw_readl(PCICAR);
+	mcf_write32(PCICAR_E | addr, PCICAR);
+	mcf_read32(PCICAR);
 	addr = iospace + (where & 0x3);
 
 	switch (size) {
 	case 1:
-		*value = __raw_readb(addr);
+		*value = mcf_read8(addr);
 		break;
 	case 2:
-		*value = le16_to_cpu(__raw_readw(addr));
+		*value = le16_to_cpu(mcf_read16(addr));
 		break;
 	default:
-		*value = le32_to_cpu(__raw_readl(addr));
+		*value = le32_to_cpu(mcf_read32(addr));
 		break;
 	}
 
-	__raw_writel(0, PCICAR);
-	__raw_readl(PCICAR);
+	mcf_write32(0, PCICAR);
+	mcf_read32(PCICAR);
 	return PCIBIOS_SUCCESSFUL;
 }
 
@@ -100,24 +100,24 @@ static int mcf_pci_writeconfig(struct pci_bus *bus, unsigned int devfn,
 	}
 
 	addr = mcf_mk_pcicar(bus->number, devfn, where);
-	__raw_writel(PCICAR_E | addr, PCICAR);
-	__raw_readl(PCICAR);
+	mcf_write32(PCICAR_E | addr, PCICAR);
+	mcf_read32(PCICAR);
 	addr = iospace + (where & 0x3);
 
 	switch (size) {
 	case 1:
-		 __raw_writeb(value, addr);
+		 mcf_write8(value, addr);
 		break;
 	case 2:
-		__raw_writew(cpu_to_le16(value), addr);
+		mcf_write16(cpu_to_le16(value), addr);
 		break;
 	default:
-		__raw_writel(cpu_to_le32(value), addr);
+		mcf_write32(cpu_to_le32(value), addr);
 		break;
 	}
 
-	__raw_writel(0, PCICAR);
-	__raw_readl(PCICAR);
+	mcf_write32(0, PCICAR);
+	mcf_read32(PCICAR);
 	return PCIBIOS_SUCCESSFUL;
 }
 
@@ -175,44 +175,44 @@ static int __init mcf_pci_init(void)
 	pr_info("ColdFire: PCI bus initialization...\n");
 
 	/* Reset the external PCI bus */
-	__raw_writel(PCIGSCR_RESET, PCIGSCR);
-	__raw_writel(0, PCITCR);
+	mcf_write32(PCIGSCR_RESET, PCIGSCR);
+	mcf_write32(0, PCITCR);
 
 	request_resource(&iomem_resource, &mcf_pci_mem);
 	request_resource(&iomem_resource, &mcf_pci_io);
 
 	/* Configure PCI arbiter */
-	__raw_writel(PACR_INTMPRI | PACR_INTMINTE | PACR_EXTMPRI(0x1f) |
+	mcf_write32(PACR_INTMPRI | PACR_INTMINTE | PACR_EXTMPRI(0x1f) |
 		PACR_EXTMINTE(0x1f), PACR);
 
 	/* Set required multi-function pins for PCI bus use */
-	__raw_writew(0x3ff, MCFGPIO_PAR_PCIBG);
-	__raw_writew(0x3ff, MCFGPIO_PAR_PCIBR);
+	mcf_write16(0x3ff, MCFGPIO_PAR_PCIBG);
+	mcf_write16(0x3ff, MCFGPIO_PAR_PCIBR);
 
 	/* Set up config space for local host bus controller */
-	__raw_writel(PCI_COMMAND_MEMORY | PCI_COMMAND_MASTER |
+	mcf_write32(PCI_COMMAND_MEMORY | PCI_COMMAND_MASTER |
 		PCI_COMMAND_INVALIDATE, PCISCR);
-	__raw_writel(PCICR1_LT(32) | PCICR1_CL(8), PCICR1);
-	__raw_writel(0, PCICR2);
+	mcf_write32(PCICR1_LT(32) | PCICR1_CL(8), PCICR1);
+	mcf_write32(0, PCICR2);
 
 	/*
 	 * Set up the initiator windows for memory and IO mapping.
 	 * These give the CPU bus access onto the PCI bus. One for each of
 	 * PCI memory and IO address spaces.
 	 */
-	__raw_writel(WXBTAR(PCI_MEM_PA, PCI_MEM_BA, PCI_MEM_SIZE),
+	mcf_write32(WXBTAR(PCI_MEM_PA, PCI_MEM_BA, PCI_MEM_SIZE),
 		PCIIW0BTAR);
-	__raw_writel(WXBTAR(PCI_IO_PA, PCI_IO_BA, PCI_IO_SIZE),
+	mcf_write32(WXBTAR(PCI_IO_PA, PCI_IO_BA, PCI_IO_SIZE),
 		PCIIW1BTAR);
-	__raw_writel(PCIIWCR_W0_MEM /*| PCIIWCR_W0_MRDL*/ | PCIIWCR_W0_E |
+	mcf_write32(PCIIWCR_W0_MEM /*| PCIIWCR_W0_MRDL*/ | PCIIWCR_W0_E |
 		PCIIWCR_W1_IO | PCIIWCR_W1_E, PCIIWCR);
 
 	/*
 	 * Set up the target windows for access from the PCI bus back to the
 	 * CPU bus. All we need is access to system RAM (for mastering).
 	 */
-	__raw_writel(CONFIG_RAMBASE, PCIBAR1);
-	__raw_writel(CONFIG_RAMBASE | PCITBATR1_E, PCITBATR1);
+	mcf_write32(CONFIG_RAMBASE, PCIBAR1);
+	mcf_write32(CONFIG_RAMBASE | PCITBATR1_E, PCITBATR1);
 
 	/* Keep a virtual mapping to IO/config space active */
 	iospace = (unsigned long) ioremap(PCI_IO_PA, PCI_IO_SIZE);
@@ -224,7 +224,7 @@ static int __init mcf_pci_init(void)
 		(u32) iospace);
 
 	/* Turn of PCI reset, and wait for devices to settle */
-	__raw_writel(0, PCIGSCR);
+	mcf_write32(0, PCIGSCR);
 	set_current_state(TASK_UNINTERRUPTIBLE);
 	schedule_timeout(msecs_to_jiffies(200));
 
diff --git a/arch/m68k/coldfire/reset.c b/arch/m68k/coldfire/reset.c
index f30952f0cbe6..6e5f8ab39f32 100644
--- a/arch/m68k/coldfire/reset.c
+++ b/arch/m68k/coldfire/reset.c
@@ -27,7 +27,7 @@ static void mcf_cpu_reset(void)
 {
 	local_irq_disable();
 	/* Set watchdog to soft reset, and enabled */
-	__raw_writeb(0xc0, MCFSIM_SYPCR);
+	mcf_write8(0xc0, MCFSIM_SYPCR);
 	for (;;)
 		/* wait for watchdog to timeout */;
 }
@@ -37,7 +37,7 @@ static void mcf_cpu_reset(void)
 static void mcf_cpu_reset(void)
 {
 	local_irq_disable();
-	__raw_writeb(MCF_RCR_SWRESET, MCF_RCR);
+	mcf_write8(MCF_RCR_SWRESET, MCF_RCR);
 }
 #endif
 
-- 
2.54.0

