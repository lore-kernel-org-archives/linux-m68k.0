Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96256C4332B
	for <linux-m68k@archiver.kernel.org>; Sat, 13 Mar 2021 15:46:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 69BA364F1A
	for <linux-m68k@archiver.kernel.org>; Sat, 13 Mar 2021 15:46:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233478AbhCMPqY (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Sat, 13 Mar 2021 10:46:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45774 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233570AbhCMPqU (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Sat, 13 Mar 2021 10:46:20 -0500
Received: from mail.kernel-space.org (unknown [IPv6:2a01:4f8:c2c:5a84::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 48EA2C061574
        for <linux-m68k@vger.kernel.org>; Sat, 13 Mar 2021 07:46:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel-space.org;
        s=20190913; t=1615650376;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=nsxp6yEnZypbY1+Ta3Bbf6gOwLbOIkA+zWoqWGJL2P0=;
        b=EfRyBV4dQr/jpMbN72ZGW5HjOYLvfigwiZeIq8zkMlLVXjCoB9luCRGv63xS1yw0bulk/P
        WwJwSrPAj50v9Hxd/D57KGdcnOJvmLYXprohEfcqrMLBQx3mB6b/MrlnX53LaH4WNLvq++
        nBj5ywkBjZ9ZNSCeqJfHgG602Zviuq0=
Received: from localhost.localdomain (host-87-8-57-96.retail.telecomitalia.it [87.8.57.96])
        by sysam.it (OpenSMTPD) with ESMTPSA id 70a6cdcf (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO);
        Sat, 13 Mar 2021 15:46:16 +0000 (UTC)
From:   Angelo Dureghello <angelo@kernel-space.org>
To:     gerg@linux-m68k.org
Cc:     geert@linux-m68k.org, rppt@kernel.org, linux-m68k@vger.kernel.org,
        Angelo Dureghello <angelo@kernel-space.org>
Subject: [PATCH] m68k: mm: fix inappropriate pte dirty bit set
Date:   Sat, 13 Mar 2021 16:46:03 +0100
Message-Id: <20210313154603.629688-1-angelo@kernel-space.org>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On mcf5441x, with mmc / ext4 rootfs mounted, the following warning
was observed while executing some commands as routef:

[    8.660000] ------------[ cut here ]------------
[    8.670000] WARNING: CPU: 0 PID: 35 at fs/ext4/inode.c:3643 ext4_set_page_dirty+0x54/0x108
[    8.680000] CPU: 0 PID: 35 Comm: ip Not tainted 5.10.0-rc5stmark2-001-00007-g02a1970b5d05-dirty #276
[    8.690000] Stack from 40b8fddc:
[    8.690000]         40b8fddc 4036549b 4036549b 402dc01a 4036a528 00000e3b 00000009 47f618bc
[    8.690000]         402dc078 4036a528 00000e3b 400eb5f6 00000009 00000000 00000000 8007a000
[    8.690000]         404ef419 000ff81b 8007c000 402dc46e 403628ce 40b7b534 400eb5f6 4036a528
[    8.690000]         00000e3b 00000009 00000000 47f618bc 40b8ff22 40b8a0f8 4005e09a 47f618bc
[    8.690000]         ffffffff 400097ff 402e4210 00000000 80086dbc 80086d94 40b7b534 4005e1cc
[    8.690000]         00000000 40b8ffac 40053540 00000000 00095d88 40b88800 40b88804 000ff81b
[    8.700000] Call Trace:
[    8.700000]  [<402dc01a>] __warn+0x9c/0xb8
[    8.710000]  [<402dc078>] warn_slowpath_fmt+0x42/0x62
[    8.710000]  [<400eb5f6>] ext4_set_page_dirty+0x54/0x108
[    8.720000]  [<402dc46e>] printk+0x12/0x18
[    8.720000]  [<400eb5f6>] ext4_set_page_dirty+0x54/0x108
[    8.730000]  [<4005e09a>] unmap_page_range+0x2d0/0x402
[    8.740000]  [<400097ff>] sys_waitid+0x4b/0xd4
[    8.740000]  [<402e4210>] down_read+0x0/0x30
[    8.740000]  [<4005e1cc>] unmap_single_vma+0x0/0x68
[    8.750000]  [<40053540>] page_mapping+0x0/0x7c
[    8.750000]  [<4005e2e8>] unmap_vmas+0x36/0x40
[    8.760000]  [<4006267e>] exit_mmap+0xac/0x110
[    8.760000]  [<40005dfe>] __mmput+0xe/0x68
[    8.770000]  [<4000922a>] do_exit+0x24c/0x6e8
[    8.770000]  [<4000977e>] sys_exit_group+0x0/0x14
[    8.780000]  [<40009744>] do_group_exit+0x4e/0x88
[    8.780000]  [<40009792>] __wake_up_parent+0x0/0x22
[    8.790000]  [<40004ba0>] system_call+0x54/0x96
[    8.790000]
[    8.790000] ---[ end trace b876c21409f1d404 ]---

The cause of the wanring is pte dirty bit set on unmapping, since the page
itself not marked dirty. This condition is not expected.

The PTE dirty bit shouldn't be set in a tlb miss, but it comes set on
page fault, from

mm/memory.c:wp_page_shared() and its call to fault_dirty_shared_page()

Signed-off-by: Angelo Dureghello <angelo@kernel-space.org>
---
 arch/m68k/mm/mcfmmu.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/m68k/mm/mcfmmu.c b/arch/m68k/mm/mcfmmu.c
index eac9dde65193..19fd691774db 100644
--- a/arch/m68k/mm/mcfmmu.c
+++ b/arch/m68k/mm/mcfmmu.c
@@ -141,7 +141,6 @@ int cf_tlb_miss(struct pt_regs *regs, int write, int dtlb, int extension_word)
 			local_irq_restore(flags);
 			return -1;
 		}
-		set_pte(pte, pte_mkdirty(*pte));
 	}
 
 	set_pte(pte, pte_mkyoung(*pte));
-- 
2.30.1

