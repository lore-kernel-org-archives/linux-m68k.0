Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com [64.147.123.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF0031BF31
	for <linux-m68k@lists.linux-m68k.org>; Wed, 27 Mar 2024 03:49:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.147.123.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711511377; cv=none; b=Sub5YYAXsBRrE7vyOxNb1YLi97elCkNUzRIEVx7+YHGofFcRBIoK8bFICEikdMcQAhCwx7xR6tH85GKQD997RTT+OPEEP3naaPG9/urxtKiAb5aThZB+onddjhGwXC0tiixbsPtSQo8Ovg9iBewVR+VCPd86ahgfXclY+glS6CU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711511377; c=relaxed/simple;
	bh=ZkDc6MDywhbnS/bk2VUE9vmqR/BtGXvl2LCZ0Tqn+LM=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=PJC1Xd00ihflvmPnXnRer5K4Zmx7Xn69aSp+Cnxu9i8H030Ktu4NVR7soAbOe6ktIfIlqAh1KLE+/Gj4tdNqjG6XAaxntU20RGIqWG7TpncJS17gq+8hsuIdkP7rzi0g2yD2kHSa/CjalIq1MXeMQRayCWWbmhkrC56pK5DmH0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=none smtp.mailfrom=linux-m68k.org; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=gH+jrp4N; arc=none smtp.client-ip=64.147.123.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="gH+jrp4N"
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailout.west.internal (Postfix) with ESMTP id 5CAD232001FC;
	Tue, 26 Mar 2024 23:49:32 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Tue, 26 Mar 2024 23:49:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1711511371; x=1711597771; bh=9Ii/dkj/J9bS8NVHbYUMCKS0bH8d
	t9gXmTU+ucQdCiM=; b=gH+jrp4NGTeJjwZVNo8WV309vZbjF3S/zLOdfiZM1Zx8
	iqWkvnDPB7ytLWZbt4owlg2XAJ5B64tI8QIiPoABJ7EfbUHAjuGI/WEXl/nkbCDJ
	a2AJriO80OK1rkLb8g1YN1LDNQPkNq9hUPOxosh+uNlPUL4NH7k+TbIhUTa5N6mu
	Finh5wgeSrjDYSaEh17zEtjnkXUQswcUIQQqPDqnxx2UVMtpq/qCW5857A65lATa
	tSNC9SbyOvCgXv5+5qijlkziwIvLz/G/ILIgyz+TWTBRgDJdSRMcMFmlad9n0RlL
	E9SKm5du9y3rsGaLlevSyv3b133OXD/s1NpbBdLOrw==
X-ME-Sender: <xms:S5cDZqi9-7m2MxR-ypozdvFI1J26jGxVUYY_TebDInytpFTEao6oGQ>
    <xme:S5cDZrDMaitGJI364MjjlQk0FDnYETw_FO23BIrCVOISRpBheUuMEPNFU_tTsY5zy
    _hDdS5wWb0HIrLi2ZE>
X-ME-Received: <xmr:S5cDZiGf_7mhCUTBtBH_GtOpcx5XtVDR3DRFZZ49bEpCL7TLKpFvNKQ9c0ySut5D8_WtiL7lwQEEO1m6SoPDIu5rdscl44OExz0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledruddugedgieegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevufgjkfhfgggtsehttdertddttddvnecuhfhrohhmpefhihhnnhcu
    vfhhrghinhcuoehfthhhrghinheslhhinhhugidqmheikehkrdhorhhgqeenucggtffrrg
    htthgvrhhnpeelueehleehkefgueevtdevteejkefhffekfeffffdtgfejveekgeefvdeu
    heeuleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hfthhhrghinheslhhinhhugidqmheikehkrdhorhhg
X-ME-Proxy: <xmx:S5cDZjTTHXATMxzSYombk7ZB-3IsU9o66CN1Llw2lz0MWXMQ3Uhf9w>
    <xmx:S5cDZnxpp5DrvXvmJv6ejC0BsARmu0j1xZiZz9xRRwmXkeTmdQdarQ>
    <xmx:S5cDZh7uQ0c9wD0lJOOlS5w5FKEIsTc65wxE5_acTKpOkjJWfsIr0w>
    <xmx:S5cDZkzoIFqo1eK2lNYZyREBQIWrLkcrdq_O9vKzAO_JLb_xbFvwzQ>
    <xmx:S5cDZi-qz59hW7TEZPUwHBlZ4hpsaFViHGjEIXb9oviHwLutyBBf8Q>
Feedback-ID: i58a146ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 26 Mar 2024 23:49:28 -0400 (EDT)
Date: Wed, 27 Mar 2024 14:50:56 +1100 (AEDT)
From: Finn Thain <fthain@linux-m68k.org>
To: Michael Schmitz <schmitzmic@gmail.com>
cc: Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k@lists.linux-m68k.org
Subject: Re: [PATCH RFC] m68k: skip kernel premption if interrupts were
 disabled
In-Reply-To: <570d4e69-e73c-4d35-8538-b5530c714c55@gmail.com>
Message-ID: <14f7ba29-dc96-1f46-5b5e-aa6c5bb3de3b@linux-m68k.org>
References: <20240322014805.30606-1-schmitzmic@gmail.com> <fcabda73-4b16-ee2c-e993-2bfcf392a26a@linux-m68k.org> <e89bf618-2fa8-7cbd-16ed-d021a9a7f740@gmail.com> <948c12e4-e85f-a86c-ae95-a1eb03ca026d@gmail.com> <40928e38-0de7-75a6-d5f7-8c913155da03@linux-m68k.org>
 <5e344842-0b19-1f83-dc77-51210a8880c7@gmail.com> <1b9ae156-9dac-b11f-5ddb-fb5878b3c9a9@gmail.com> <acd34add-27af-24a5-9af5-d40cab71c651@linux-m68k.org> <597ab0b3-ac1d-443c-95f7-4f1bbcccae1f@gmail.com> <c8a063a1-c72c-9aed-65fc-b2d87f8c7a9b@linux-m68k.org>
 <546b3960-7a1d-4989-82ee-2d7d56a9d609@gmail.com> <fb93b00e-6cfd-f2a8-7937-1266d7bbfc23@linux-m68k.org> <570d4e69-e73c-4d35-8538-b5530c714c55@gmail.com>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII


On Wed, 27 Mar 2024, Michael Schmitz wrote:

> it might be easier for Geert to merge the two patches (or a single one) 
> on top of his preempt branch if they come in the usual git format.

I suppose that would be easier, assuming it doesn't need a lot of rework. 
Anyway, here's the diff.

diff --git a/arch/m68k/mm/motorola.c b/arch/m68k/mm/motorola.c
index c1761d309fc6..d0092a3127c0 100644
--- a/arch/m68k/mm/motorola.c
+++ b/arch/m68k/mm/motorola.c
@@ -15,6 +15,7 @@
 #include <linux/mm.h>
 #include <linux/swap.h>
 #include <linux/kernel.h>
+#include <linux/preempt.h>
 #include <linux/string.h>
 #include <linux/types.h>
 #include <linux/init.h>
@@ -139,10 +140,14 @@ void __init init_pointer_table(void *table, int type)
 
 void *get_pointer_table(int type)
 {
-	ptable_desc *dp = ptable_list[type].next;
-	unsigned int mask = list_empty(&ptable_list[type]) ? 0 : PD_MARKBITS(dp);
+	ptable_desc *dp;
+	unsigned int mask;
 	unsigned int tmp, off;
 
+	preempt_disable();
+
+	dp = ptable_list[type].next;
+	mask = list_empty(&ptable_list[type]) ? 0 : PD_MARKBITS(dp);
 	/*
 	 * For a pointer table for a user process address space, a
 	 * table is taken from a page allocated for the purpose.  Each
@@ -153,9 +158,13 @@ void *get_pointer_table(int type)
 		void *page;
 		ptable_desc *new;
 
+		sched_preempt_enable_no_resched();
+
 		if (!(page = (void *)get_zeroed_page(GFP_KERNEL)))
 			return NULL;
 
+		preempt_disable();
+
 		if (type == TABLE_PTE) {
 			/*
 			 * m68k doesn't have SPLIT_PTE_PTLOCKS for not having
@@ -170,6 +179,7 @@ void *get_pointer_table(int type)
 		PD_MARKBITS(new) = ptable_mask(type) - 1;
 		list_add_tail(new, dp);
 
+		sched_preempt_enable_no_resched();
 		return (pmd_t *)page;
 	}
 
@@ -180,6 +190,7 @@ void *get_pointer_table(int type)
 		/* move to end of list */
 		list_move_tail(dp, &ptable_list[type]);
 	}
+	sched_preempt_enable_no_resched();
 	return page_address(PD_PAGE(dp)) + off;
 }
 
@@ -190,6 +201,8 @@ int free_pointer_table(void *table, int type)
 	unsigned long page = ptable & PAGE_MASK;
 	unsigned int mask = 1U << ((ptable - page)/ptable_size(type));
 
+	preempt_disable();
+
 	dp = PD_PTABLE(page);
 	if (PD_MARKBITS (dp) & mask)
 		panic ("table already free!");
@@ -203,6 +216,7 @@ int free_pointer_table(void *table, int type)
 		if (type == TABLE_PTE)
 			pagetable_pte_dtor(virt_to_ptdesc((void *)page));
 		free_page (page);
+		sched_preempt_enable_no_resched();
 		return 1;
 	} else if (ptable_list[type].next != dp) {
 		/*
@@ -211,6 +225,7 @@ int free_pointer_table(void *table, int type)
 		 */
 		list_move(dp, &ptable_list[type]);
 	}
+	sched_preempt_enable_no_resched();
 	return 0;
 }
 
