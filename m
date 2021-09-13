Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EFE7C433EF
	for <linux-m68k@archiver.kernel.org>; Mon, 13 Sep 2021 01:34:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0D56260FDA
	for <linux-m68k@archiver.kernel.org>; Mon, 13 Sep 2021 01:34:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236731AbhIMBgK (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Sun, 12 Sep 2021 21:36:10 -0400
Received: from wout1-smtp.messagingengine.com ([64.147.123.24]:47225 "EHLO
        wout1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S236696AbhIMBgJ (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Sun, 12 Sep 2021 21:36:09 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.west.internal (Postfix) with ESMTP id 805FB320091F
        for <linux-m68k@lists.linux-m68k.org>; Sun, 12 Sep 2021 21:34:54 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Sun, 12 Sep 2021 21:34:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=content-type:date:from:message-id
        :mime-version:subject:to:x-me-proxy:x-me-proxy:x-me-sender
        :x-me-sender:x-sasl-enc; s=fm3; bh=Vf6uqBSVgat5Zl7ElHoPk+ZL99vSW
        cnPs/IeFIDAP+Y=; b=uRdfL6t6hWMVijbMccGZsV1y6pIjkZ4zJREsJtdQtCQmR
        grxYyFgk5zG0Ga7Kfu+FC4bVptUHQDSQ+KdGa1YaAXO3M8tqhkdyzE7zY5iWqgw+
        Yp0kRK9QULcaYw5+3ekbsZQMM5AzmgNuWcOwNRqlxz18uCvBJXMNMiqaCYK2jvaa
        65P8FttbOzNXgRNR8VRN83EkFWam1dAS7Soy1my/LEH5lNC1RFB4STAqBw+tGT6Z
        p9S8aKo6EIYfp8eBZJT4s+GKpAW3xh5VAtyGu9vuhjfXe7K+OyZSbnOQQ6BTdHV7
        97jyByBrLQ9LSOzaW6ZtiqfJcYMFCldr/9ShHwpUg==
X-ME-Sender: <xms:vao-YTdqP2f8rh1N_2enuND-7-y432LOmn7YIq9GcfkLyO1ckgTlqw>
    <xme:vao-YZO_F9TFDP66upCoFQd8wWYWrJHBrYWz9Kz6AgAmcRm5qF_tn9kocQc-vW2Od
    QFEhNR0ggJEoMlUdyI>
X-ME-Received: <xmr:vao-Ycj7HrFks-0kocJsDDVGTbxq1BGel0LuLs0xtOWmkvOqLfuoYRG-2r0IqmxuhdJYkS-81UjBoTBL2Y5_dLq05FQQqqylT3pPmQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudegiedggeelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpeffhffvuffkgggtsehttdertddttd
    dvnecuhfhrohhmpefhihhnnhcuvfhhrghinhcuoehfthhhrghinheslhhinhhugidqmhei
    kehkrdhorhhgqeenucggtffrrghtthgvrhhnpeektdffvefggfejveeiieeuveehtdduje
    fhfeeitddvgeeuudejuefhkeevfeehffenucevlhhushhtvghrufhiiigvpedtnecurfgr
    rhgrmhepmhgrihhlfhhrohhmpehfthhhrghinheslhhinhhugidqmheikehkrdhorhhg
X-ME-Proxy: <xmx:vao-YU9QqhF_48rawMh6-kSJwE4WTuPucsC-bUBf08GhoGwJeleLsg>
    <xmx:vao-YfvvwlD64Sa_ibLEJiH5ukEJh9fXO_4-PWTBXSq_bJ1yGqwhFQ>
    <xmx:vao-YTFM5uz37qHz4IPjAEz1CFSKDuEKSw63Uh-FAB6Y074gzQwrpw>
    <xmx:vqo-Yd5EaMH1Pb3se0RYnnN-Wq63jOUXMUNEi0kXUIO9g9riHcZJeQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA for
 <linux-m68k@lists.linux-m68k.org>; Sun,
 12 Sep 2021 21:34:51 -0400 (EDT)
Date:   Mon, 13 Sep 2021 11:34:48 +1000 (AEST)
From:   Finn Thain <fthain@linux-m68k.org>
To:     linux-m68k@lists.linux-m68k.org
Subject: [RFC] m68k: Enable memtest kernel parameter
Message-ID: <9fac90da-18d5-7b89-96a5-3cf9dbc8bcf8@linux-m68k.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org


This appears to work on Aranym, QEMU and the Quadra 630 I have here.
It is completely untested on Coldfire etc. I don't even know whether the
right memory mappings are in place for this to actually work as intended.
Would someone take a look please?

diff --git a/arch/m68k/Kconfig b/arch/m68k/Kconfig
index 6e40f7f29ebc..d87e12b4855b 100644
--- a/arch/m68k/Kconfig
+++ b/arch/m68k/Kconfig
@@ -9,6 +9,7 @@ config M68K
 	select ARCH_HAVE_NMI_SAFE_CMPXCHG if RMW_INSNS
 	select ARCH_MIGHT_HAVE_PC_PARPORT if ISA
 	select ARCH_NO_PREEMPT if !COLDFIRE
+	select ARCH_USE_MEMTEST
 	select ARCH_WANT_IPC_PARSE_VERSION
 	select BINFMT_FLAT_ARGVP_ENVP_ON_STACK
 	select DMA_DIRECT_REMAP if HAS_DMA && MMU && !COLDFIRE
diff --git a/arch/m68k/mm/motorola.c b/arch/m68k/mm/motorola.c
index 3a653f0a4188..d6301a094fc1 100644
--- a/arch/m68k/mm/motorola.c
+++ b/arch/m68k/mm/motorola.c
@@ -455,6 +455,8 @@ void __init paging_init(void)
 
 	flush_tlb_all();
 
+	early_memtest(min_addr, max_addr);
+
 	/*
 	 * initialize the bad page table and bad page to point
 	 * to a couple of allocated pages
-- 
2.26.3
