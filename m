From: <gerg@snapgear.com>
Subject: [PATCH 03/35] m68k: definitions for the ColdFire V4e MMU hardware
Date: Fri, 25 Nov 2011 13:40:48 +1000
Message-ID: <1322192480-22822-4-git-send-email-gerg@snapgear.com>
References: <1322192480-22822-1-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from dalsmrelay2.nai.com ([205.227.136.216]:16480 "EHLO
	dalsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750830Ab1KYDjE (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Thu, 24 Nov 2011 22:39:04 -0500
In-Reply-To: <1322192480-22822-1-git-send-email-gerg@snapgear.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org
Cc: Greg Ungerer <gerg@uclinux.org>

From: Greg Ungerer <gerg@uclinux.org>

Basic register level definitions to support the internal MMU of the
V4e ColdFire cores.

Signed-off-by: Greg Ungerer <gerg@uclinux.org>
Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 arch/m68k/include/asm/mcfmmu.h |  117 ++++++++++++++++++++++++++++++++++++++++
 1 files changed, 117 insertions(+), 0 deletions(-)
 create mode 100644 arch/m68k/include/asm/mcfmmu.h

diff --git a/arch/m68k/include/asm/mcfmmu.h b/arch/m68k/include/asm/mcfmmu.h
new file mode 100644
index 0000000..84b4c28
--- /dev/null
+++ b/arch/m68k/include/asm/mcfmmu.h
@@ -0,0 +1,117 @@
+/****************************************************************************/
+
+/*
+ *	mcfmmu.h -- definitions for the ColdFire v4e MMU
+ *
+ *	(C) Copyright 2011,  Greg Ungerer <gerg@uclinux.org>
+ *
+ * This file is subject to the terms and conditions of the GNU General Public
+ * License.  See the file COPYING in the main directory of this archive
+ * for more details.
+ */
+
+/****************************************************************************/
+#ifndef	MCFMMU_H
+#define	MCFMMU_H
+/****************************************************************************/
+
+/*
+ *	The MMU support registers are mapped into the address space using
+ *	the processor MMUBASE register. We used a fixed address for mapping,
+ *	there doesn't seem any need to make this configurable yet.
+ */
+#define	MMUBASE		0xfe000000
+
+/*
+ *	The support registers of the MMU. Names are the sames as those
+ *	used in the Freescale v4e documentation.
+ */
+#define	MMUCR		(MMUBASE + 0x00)	/* Control register */
+#define	MMUOR		(MMUBASE + 0x04)	/* Operation register */
+#define	MMUSR		(MMUBASE + 0x08)	/* Status register */
+#define	MMUAR		(MMUBASE + 0x10)	/* TLB Address register */
+#define	MMUTR		(MMUBASE + 0x14)	/* TLB Tag register */
+#define	MMUDR		(MMUBASE + 0x18)	/* TLB Data register */
+
+/*
+ *	MMU Control register bit flags
+ */
+#define	MMUCR_EN	0x00000001		/* Virtual mode enable */
+#define	MMUCR_ASM	0x00000002		/* Address space mode */
+
+/*
+ *	MMU Operation register.
+ */
+#define	MMUOR_UAA	0x00000001		/* Update allocatiom address */
+#define	MMUOR_ACC	0x00000002		/* TLB access */
+#define	MMUOR_RD	0x00000004		/* TLB access read */
+#define	MMUOR_WR	0x00000000		/* TLB access write */
+#define	MMUOR_ADR	0x00000008		/* TLB address select */
+#define	MMUOR_ITLB	0x00000010		/* ITLB operation */
+#define	MMUOR_CAS	0x00000020		/* Clear non-locked ASID TLBs */
+#define	MMUOR_CNL	0x00000040		/* Clear non-locked TLBs */
+#define	MMUOR_CA	0x00000080		/* Clear all TLBs */
+#define	MMUOR_STLB	0x00000100		/* Search TLBs */
+#define	MMUOR_AAN	16			/* TLB allocation address */
+#define	MMUOR_AAMASK	0xffff0000		/* AA mask */
+
+/*
+ *	MMU Status register.
+ */
+#define	MMUSR_HIT	0x00000002		/* Search TLB hit */
+#define	MMUSR_WF	0x00000008		/* Write access fault */
+#define	MMUSR_RF	0x00000010		/* Read access fault */
+#define	MMUSR_SPF	0x00000020		/* Supervisor protect fault */
+
+/*
+ *	MMU Read/Write Tag register.
+ */
+#define	MMUTR_V		0x00000001		/* Valid */
+#define	MMUTR_SG	0x00000002		/* Shared global */
+#define	MMUTR_IDN	2			/* Address Space ID */
+#define	MMUTR_IDMASK	0x000003fc		/* ASID mask */
+#define	MMUTR_VAN	10			/* Virtual Address */
+#define	MMUTR_VAMASK	0xfffffc00		/* VA mask */
+
+/*
+ *	MMU Read/Write Data register.
+ */
+#define	MMUDR_LK	0x00000002		/* Lock entry */
+#define	MMUDR_X		0x00000004		/* Execute access enable */
+#define	MMUDR_W		0x00000008		/* Write access enable */
+#define	MMUDR_R		0x00000010		/* Read access enable */
+#define	MMUDR_SP	0x00000020		/* Supervisor access enable */
+#define	MMUDR_CM_CWT	0x00000000		/* Cachable write thru */
+#define	MMUDR_CM_CCB	0x00000040		/* Cachable copy back */
+#define	MMUDR_CM_NCP	0x00000080		/* Non-cachable precise */
+#define	MMUDR_CM_NCI	0x000000c0		/* Non-cachable imprecise */
+#define	MMUDR_SZ_1MB	0x00000000		/* 1MB page size */
+#define	MMUDR_SZ_4KB	0x00000100		/* 4kB page size */
+#define	MMUDR_SZ_8KB	0x00000200		/* 8kB page size */
+#define	MMUDR_SZ_1KB	0x00000300		/* 1kB page size */
+#define	MMUDR_PAN	10			/* Physical address */
+#define	MMUDR_PAMASK	0xfffffc00		/* PA mask */
+
+/*
+ *	Simple access functions for the MMU registers. Nothing fancy
+ *	currently required, just simple 32bit access.
+ */
+#ifndef __ASSEMBLY__
+
+#define	CF_PAGE_PGNUM_MASK	(PAGE_MASK)
+
+static inline u32 mmu_read(u32 a)
+{
+	return *((volatile u32 *) a);
+}
+
+static inline void mmu_write(u32 a, u32 v)
+{
+	*((volatile u32 *) a) = v;
+	__asm__ __volatile__ ("nop");
+}
+
+#endif
+
+/****************************************************************************/
+#endif	/* MCFMMU_H */
-- 
1.7.0.4
