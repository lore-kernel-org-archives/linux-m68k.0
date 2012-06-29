From: <gerg@snapgear.com>
Subject: [PATCH 3/4] m68k: add IO access definitions to support PCI on ColdFire platforms
Date: Fri, 29 Jun 2012 15:17:49 +1000
Message-ID: <1340947070-10672-4-git-send-email-gerg@snapgear.com>
References: <1340947070-10672-1-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from dnvwsmailout1.mcafee.com ([161.69.31.173]:18152 "EHLO
	DNVWSMAILOUT1.mcafee.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750907Ab2F2FRs (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Fri, 29 Jun 2012 01:17:48 -0400
In-Reply-To: <1340947070-10672-1-git-send-email-gerg@snapgear.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org
Cc: Greg Ungerer <gerg@uclinux.org>

From: Greg Ungerer <gerg@uclinux.org>

Define the usual memory access functions (readb/writeb/...) and I/O space
functions (inb/outb/...) for PCI bus support on ColdFire CPU based platforms.

Signed-off-by: Greg Ungerer <gerg@uclinux.org>
---
 arch/m68k/include/asm/io_mm.h |   48 ++++++++++++++++++++++++++++++++++++++++-
 1 files changed, 47 insertions(+), 1 deletions(-)

diff --git a/arch/m68k/include/asm/io_mm.h b/arch/m68k/include/asm/io_mm.h
index b85dbef..a6686d2 100644
--- a/arch/m68k/include/asm/io_mm.h
+++ b/arch/m68k/include/asm/io_mm.h
@@ -65,7 +65,53 @@
 
 
 
-#ifdef CONFIG_ISA
+#if defined(CONFIG_PCI) && defined(CONFIG_COLDFIRE)
+
+#define HAVE_ARCH_PIO_SIZE
+#define PIO_OFFSET	0
+#define PIO_MASK	0xffff
+#define PIO_RESERVED	0x10000
+
+u8 mcf_pci_inb(u32 addr);
+u16 mcf_pci_inw(u32 addr);
+u32 mcf_pci_inl(u32 addr);
+void mcf_pci_insb(u32 addr, u8 *buf, u32 len);
+void mcf_pci_insw(u32 addr, u16 *buf, u32 len);
+void mcf_pci_insl(u32 addr, u32 *buf, u32 len);
+
+void mcf_pci_outb(u8 v, u32 addr);
+void mcf_pci_outw(u16 v, u32 addr);
+void mcf_pci_outl(u32 v, u32 addr);
+void mcf_pci_outsb(u32 addr, const u8 *buf, u32 len);
+void mcf_pci_outsw(u32 addr, const u16 *buf, u32 len);
+void mcf_pci_outsl(u32 addr, const u32 *buf, u32 len);
+
+#define	inb	mcf_pci_inb
+#define	inb_p	mcf_pci_inb
+#define	inw	mcf_pci_inw
+#define	inw_p	mcf_pci_inw
+#define	inl	mcf_pci_inl
+#define	inl_p	mcf_pci_inl
+#define	insb	mcf_pci_insb
+#define	insw	mcf_pci_insw
+#define	insl	mcf_pci_insl
+
+#define	outb	mcf_pci_outb
+#define	outb_p	mcf_pci_outb
+#define	outw	mcf_pci_outw
+#define	outw_p	mcf_pci_outw
+#define	outl	mcf_pci_outl
+#define	outl_p	mcf_pci_outl
+#define	outsb	mcf_pci_outsb
+#define	outsw	mcf_pci_outsw
+#define	outsl	mcf_pci_outsl
+
+#define readb(addr)	in_8(addr)
+#define writeb(v, addr)	out_8((addr), (v))
+#define readw(addr)	in_le16(addr)
+#define writew(v, addr)	out_le16((addr), (v))
+
+#elif defined(CONFIG_ISA)
 
 #if MULTI_ISA == 0
 #undef MULTI_ISA
-- 
1.7.0.4
