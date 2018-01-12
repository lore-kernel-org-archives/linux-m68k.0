From: Christoph Hellwig <hch@lst.de>
Subject: [PATCH 01/34] alpha: mark jensen as broken
Date: Fri, 12 Jan 2018 09:41:59 +0100
Message-ID: <20180112084232.2857-2-hch__33981.2834551141$1515747185$gmane$org@lst.de>
References: <20180112084232.2857-1-hch@lst.de>
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <20180112084232.2857-1-hch@lst.de>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: iommu@lists.linux-foundation.org
Cc: Konrad Rzeszutek Wilk <konrad@darnok.org>, linux-alpha@vger.kernel.org, linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-c6x-dev@linux-c6x.org, linux-cris-kernel@axis.com, linux-hexagon@vger.kernel.org, linux-ia64@vger.kernel.org, linux-m68k@lists.linux-m68k.org, linux-metag@vger.kernel.org, Michal Simek <monstr@monstr.eu>, linux-mips@linux-mips.org, linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, patches@groups.riscv.org, linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, Guan Xuetao <gxt@mprc.pku.edu.cn>, x86@kernel.org, linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org

CONFIG_ALPHA_JENSEN has failed to compile since commit 6aca0503
("alpha/dma: use common noop dma ops"), so mark it as broken.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 arch/alpha/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/alpha/Kconfig b/arch/alpha/Kconfig
index b31b974a03cb..e96adcbcab41 100644
--- a/arch/alpha/Kconfig
+++ b/arch/alpha/Kconfig
@@ -209,6 +209,7 @@ config ALPHA_EIGER
 
 config ALPHA_JENSEN
 	bool "Jensen"
+	depends on BROKEN
 	help
 	  DEC PC 150 AXP (aka Jensen): This is a very old Digital system - one
 	  of the first-generation Alpha systems. A number of these systems
-- 
2.14.2
