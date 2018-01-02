From: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH 16/67] powerpc: rename dma_direct_ to dma_nommu_
Date: Tue, 02 Jan 2018 20:45:30 +1100
Message-ID: <878tdgtwzp.fsf__5731.32279464534$1514886224$gmane$org@concordia.ellerman.id.au>
References: <20171229081911.2802-1-hch@lst.de> <20171229081911.2802-17-hch@lst.de>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <20171229081911.2802-17-hch@lst.de>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Christoph Hellwig <hch@lst.de>, iommu@lists.linux-foundation.org
Cc: linux-mips@linux-mips.org, linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, Guan Xuetao <gxt@mprc.pku.edu.cn>, linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, linux-c6x-dev@linux-c6x.org, linux-hexagon@vger.kernel.org, x86@kernel.org, linux-snps-arc@lists.infradead.org, adi-buildroot-devel@lists.sourceforge.net, linux-m68k@lists.linux-m68k.org, patches@groups.riscv.org, linux-metag@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Michal Simek <monstr@monstr.eu>, linux-parisc@vger.kernel.org, linux-cris-kernel@axis.com, linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, linuxppc-dev@lists.ozlabs.org

Christoph Hellwig <hch@lst.de> writes:

> We want to use the dma_direct_ namespace for a generic implementation,
> so rename powerpc to the second best choice: dma_nommu_.

I'm not a fan of "nommu". Some of the users of direct ops *are* using an
IOMMU, they're just setting up a 1:1 mapping once at init time, rather
than mapping dynamically.

Though I don't have a good idea for a better name, maybe "1to1",
"linear", "premapped" ?

cheers
