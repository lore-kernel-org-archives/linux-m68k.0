Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.73.89.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793008134;
	b=gs/8GsQKiU5We3v17qhmYjXVlNYMg62gyDLIAGe7VIsLiK51a90lFRCVmW9C+ain93DM
	 PTjddPbSnbcJR77TREDuY2tpxPoQw5OouXSkVv1tXRcH83zxv9wKnV78mtvWAq5mRN0sF
	 uZI9KzSnste9+xDsnymr4/xPvjMUidANbE//+xKDQVIlqIDDNihwjfU2ywbtKDCxyq9Wh
	 DPu4Mf3HpB43ujjiOPcihmot99HU9QuGjZcQuupA0wSEpq2JWJDM/tS4VU8jM2sYJXajE
	 d5qAoqTO3cwaItFjFR03fGOasl3g0ilJ3lvXGexQwwpnN+LKbf91bCpqu2+ov7/H+cg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793008134;
	h=DMARC-Filter:Received:Received:From:Content-Type:
	 Content-Transfer-Encoding:Mime-Version:Subject:Message-Id:Date:Cc:To:
	 X-Mailer;
	bh=OCVdNorY0OsJ7v1lsiMsDR0YfUPn6Z1slksp3tJmLYs=;
	b=NQAJtICwpODJOXYJcG2oPEA4MDXb7oxQ/KNHAAaL8vqvFQkJjnKmxHS39fJWihYagSS7
	 qqQUkXuUFfgFRipHjj+SP2n5vniK0Tuxj2k+qDundgOyunomL1aaGe1UkXqmNjxlGGWUx
	 F9MczuJkzN26xAQqwPjjUw3QiJ3Wyc7P2WpGayvb/MDDFFOZBYBF5yQAMD6NHe9JQcfjs
	 Xxd9vBOp+X8j+JXDmLOcHh1QlZuCIK/haed5i0Smi2QSDv9tPBYUkCNNS0jkH5rgNIjbi
	 HHJoYXOYxB+Slk2nee0m/pACx1J2Pzr3T7W9U/7618k7zR5k9rpG736+zPfs/jJBWLw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=h3q.com;
	spf=pass smtp.mailfrom=h3q.com;
	arc=none smtp.remote-ip=213.73.89.199
Received: from mail.h3q.com (mail.h3q.com [213.73.89.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00C26606A320
	for <linux-m68k@vger.kernel.org>; Mon, 26 Oct 2026 09:48:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 00C26606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=h3q.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=h3q.com
Received: (qmail 23817 invoked from network); 26 Oct 2026 09:48:44 -0000
Received: from mail.h3q.com (HELO mail.h3q.com) (mail.h3q.com)
  by mail.h3q.com with ESMTPS (ECDHE-RSA-AES256-GCM-SHA384 encrypted); 26 Oct 2026 09:48:44 -0000
From: Denis Ahrens <denis@h3q.com>
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Post: <mailto:linux-m68k@vger.kernel.org>
List-Help: <mailto:linux-m68k+help@vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-m68k+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3901.100.1.1.12\))
Subject: [PATCH] m68k: mvme16x: lower min_low_pfn to make RAM DMA-able
Message-Id: <C718B642-57B9-48F3-8C0C-87DCB31A8495@h3q.com>
Date: Mon, 26 Oct 2026 10:48:34 +0100
Cc: linux-m68k@lists.linux-m68k.org,
 linux-kernel@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
X-Mailer: Apple Mail (2.3901.100.1.1.12)

paging_init() sets min_low_pfn to availmem, i.e. the first free page
after the kernel image, so that nothing allocates DMA buffers into the
image.  But free_initmem() later returns the freed .init pages of that
same area to the page allocator without touching min_low_pfn, and
dma_capable() in dma-direct keeps refusing to map any RAM below it.

With the ~8 MiB kernel image the MVME177 needs, kmalloc() hands out
buffers well below min_low_pfn, so the on-board NCR53c710 SCSI adapter
fails to map its command blocks and the SCSI disk stops working.

All bus master devices on the MVME16x boards address RAM with plain
physical addresses, so lower min_low_pfn to the bottom of the first
memory block from board-specific code, and leave mm/ and dma-direct
alone.  This mirrors what arch/m68k/virt/platform.c already does for its
goldfish/virtio devices.  The min_low_pfn check only applies when
dma_addr_t is 32 bits, which is the case on m68k.

The mvme16x SCSI and i82596 Ethernet drivers are platform devices
registered by their own module_init(), i.e. after this arch_initcall, so
min_low_pfn is already lowered before the first DMA mapping happens.

Fixes: b12d66278dd6 ("dma-direct: check for overflows on 32 bit DMA =
addresses")
Tested-by: Denis Ahrens <denis@h3q.com> # MVME177, 53c710 rev 2, =
ZuluSCSI
Signed-off-by: Denis Ahrens <denis@h3q.com>
---
 arch/m68k/mvme16x/config.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/m68k/mvme16x/config.c b/arch/m68k/mvme16x/config.c
index 99768fe8da73..56e29e43c5bb 100644
--- a/arch/m68k/mvme16x/config.c
+++ b/arch/m68k/mvme16x/config.c
@@ -23,6 +23,7 @@
 #include <linux/major.h>
 #include <linux/interrupt.h>
 #include <linux/module.h>
+#include <linux/memblock.h>
 #include <linux/platform_device.h>
 #include <linux/rtc/m48t59.h>
=20
@@ -328,6 +329,29 @@ static int __init mvme16x_platform_init(void)
=20
 arch_initcall(mvme16x_platform_init);
=20
+/*
+ * paging_init() sets min_low_pfn to the first free page after the =
kernel
+ * image, but free_initmem() later returns the .init section of that =
same
+ * image to the page allocator.  All bus master devices on the MVME16x
+ * boards address RAM with plain physical addresses, so mark all of RAM
+ * DMA-able by lowering min_low_pfn to the bottom of the first memory
+ * block.  This mirrors what arch/m68k/virt/platform.c does.
+ */
+static int __init mvme16x_init_dma_pfn_limit(void)
+{
+       unsigned long pfn =3D m68k_memory[0].addr >> PAGE_SHIFT;
+
+       if (pfn >=3D min_low_pfn)
+               return 0;
+
+       pr_info("MVME16x: lowering min_low_pfn 0x%lx -> 0x%lx\n",
+               min_low_pfn, pfn);
+       min_low_pfn =3D pfn;
+
+       return 0;
+}
+arch_initcall(mvme16x_init_dma_pfn_limit);
+
 static irqreturn_t mvme16x_abort_int (int irq, void *dev_id)
 {
        unsigned long *new =3D (unsigned long *)vectors;

base-commit: c03c1a14507dfaf8b856c2608f9ac216021fc222
--=20
2.43.0

