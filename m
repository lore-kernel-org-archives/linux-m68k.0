Received: from wfhigh7-smtp.messagingengine.com (wfhigh7-smtp.messagingengine.com [64.147.123.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D01E34F88C
	for <linux-m68k@lists.linux-m68k.org>; Tue, 26 Mar 2024 09:56:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.147.123.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711447001; cv=none; b=LSADEn9+Q/UcQjMRSYy3SHwu21dbwtB9XO4R5QcTe+Hsq71u4YT7AFiCX1Y9SB73zF/V78NAI3bEUIwnbK33XvU0xv5YKa5xoTtddqkiRpwv9zonwNXwP3sXyi/dBP9QbQie6f8OgbVM7F0TCI5EcQfIpWpgAt4LUHzTg+a3oB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711447001; c=relaxed/simple;
	bh=fsCWJG41QxkgqbBt+Lnl6QeMjdUwwAF5Wn+l37O0yUk=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=ggLYH23mLqsLu9wrHxdFcTW05ONV/XCfQQpdxgHOGKQPFeAs1WHz6pgnRPbgzCk9ecnjThbPz0c9Tm/CF/IfUBgLyKyZU+dTQQFcVgypD5cV6naAIHAAp8lP65cIvBpY3EWhskm9+eHn/3uBZKOPG5xjMFAabEmqf23QqguVC+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=none smtp.mailfrom=linux-m68k.org; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=l/PxFu7+; arc=none smtp.client-ip=64.147.123.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="l/PxFu7+"
Received: from compute7.internal (compute7.nyi.internal [10.202.2.48])
	by mailfhigh.west.internal (Postfix) with ESMTP id 9007B18000A6;
	Tue, 26 Mar 2024 05:56:37 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute7.internal (MEProxy); Tue, 26 Mar 2024 05:56:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1711446997; x=1711533397; bh=Y/xKTsHpykkeADtnYXlovbqRymqh
	IVXFKDSLYDShgXo=; b=l/PxFu7+IlzucutFXfE7YfQe4aJObgN+pi5igSaDFR0E
	sapnYUzs8exlUE33LnbAWnvJDUk2AoiJWBIb6XGvyQ9cdX5kBI5AwIj6Mnon6tbG
	mvAsBVPUqvckn+355W/dd5iZGT0nB9mKF+0RGpE/x+C9L3NhEN6G8AxXAQMn01vp
	dLEPKzLwulr4qAhwMJJwhDYBS2juszeNYuCggIbFXIn9tM6w1GzF95kf5oJ0IQlr
	QH8TALSXPHwthORulsEVK+Czc2/VEQ7hZosQBivZSlBxrE781vi/rLPBrOZt0Ssg
	lCxRCcJVhQDy/dMY6c4NOyhiD2V2W9OXAZFzDDSu3A==
X-ME-Sender: <xms:1JsCZj1Hrz8tBuCi4G5qw0S3zVpuHtS1TNTrmy2acnr_r4zAP5R0AQ>
    <xme:1JsCZiE_1HEdxfCfLnmgamw_fN36sASXTreK088dCTZ_wZ8OQC6n5DWYTDX5bYtV8
    8QcRR0118t3D5lWASM>
X-ME-Received: <xmr:1JsCZj7f4u_Wti1FPHniNwGoBUODqKRFPYaJSiNHxDR2X1kzLONrCRGh1iLv2sna1tgsGwgRtc6_pevop5v6pZD-CzW9XQuOUYU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledruddufedguddtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevufgjkfhfgggtsehttdertddttddvnecuhfhrohhmpefhihhnnhcu
    vfhhrghinhcuoehfthhhrghinheslhhinhhugidqmheikehkrdhorhhgqeenucggtffrrg
    htthgvrhhnpeelueehleehkefgueevtdevteejkefhffekfeffffdtgfejveekgeefvdeu
    heeuleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hfthhhrghinheslhhinhhugidqmheikehkrdhorhhg
X-ME-Proxy: <xmx:1JsCZo0tNs6cWo4zmjjEZQh5TjTPLCq5yjc-IeAV0fMLjt5UDJ_Jzw>
    <xmx:1JsCZmHXPfpYfrve6-MfbaVkM37wQkfhFicjl_K2QMNd4QH3G_19cA>
    <xmx:1JsCZp92KEj7K0RT2hGEpOY1Su8WpaOlqIpleN-JmRGQe96EBuG78Q>
    <xmx:1JsCZjnt_sL1y5T0k3MsBp2xDrNiRxEre6AcTFzi5Vopi3svqJKXwQ>
    <xmx:1ZsCZiBxhzrszdFlTDPDSsLl55lebDjN5Zw5OJ0mAAggPIgbwoC4rXqqOkQ>
Feedback-ID: i58a146ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 26 Mar 2024 05:56:33 -0400 (EDT)
Date: Tue, 26 Mar 2024 20:58:02 +1100 (AEDT)
From: Finn Thain <fthain@linux-m68k.org>
To: Michael Schmitz <schmitzmic@gmail.com>
cc: Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k@lists.linux-m68k.org
Subject: Re: [PATCH RFC] m68k: skip kernel premption if interrupts were
 disabled
In-Reply-To: <597ab0b3-ac1d-443c-95f7-4f1bbcccae1f@gmail.com>
Message-ID: <c8a063a1-c72c-9aed-65fc-b2d87f8c7a9b@linux-m68k.org>
References: <20240322014805.30606-1-schmitzmic@gmail.com> <fcabda73-4b16-ee2c-e993-2bfcf392a26a@linux-m68k.org> <e89bf618-2fa8-7cbd-16ed-d021a9a7f740@gmail.com> <948c12e4-e85f-a86c-ae95-a1eb03ca026d@gmail.com> <40928e38-0de7-75a6-d5f7-8c913155da03@linux-m68k.org>
 <5e344842-0b19-1f83-dc77-51210a8880c7@gmail.com> <1b9ae156-9dac-b11f-5ddb-fb5878b3c9a9@gmail.com> <acd34add-27af-24a5-9af5-d40cab71c651@linux-m68k.org> <597ab0b3-ac1d-443c-95f7-4f1bbcccae1f@gmail.com>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII


On Tue, 26 Mar 2024, Michael Schmitz wrote:

> see below (hopefully not whitespace-damaged).
> 

Following your approach, I added mutual exclusion to the other candidate 
in the same file, namely get_pointer_table(). Together with your patch, 
that seems to be sufficient to make stress-ng happy. I don't know the real 
extent of the data race here so I've probably used too much locking in 
this experiment (?)

diff --git a/arch/m68k/mm/motorola.c b/arch/m68k/mm/motorola.c
index 068ad7c9bb5c..d1ad55ee1b60 100644
--- a/arch/m68k/mm/motorola.c
+++ b/arch/m68k/mm/motorola.c
@@ -140,10 +140,14 @@ void __init init_pointer_table(void *table, int type)
 
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
@@ -154,8 +158,13 @@ void *get_pointer_table(int type)
 		void *page;
 		ptable_desc *new;
 
-		if (!(page = (void *)get_zeroed_page(GFP_KERNEL)))
+		sched_preempt_enable_no_resched();
+
+		if (!(page = (void *)get_zeroed_page(GFP_KERNEL))) {
 			return NULL;
+		}
+
+		preempt_disable();
 
 		if (type == TABLE_PTE) {
 			/*
@@ -171,6 +180,7 @@ void *get_pointer_table(int type)
 		PD_MARKBITS(new) = ptable_mask(type) - 1;
 		list_add_tail(new, dp);
 
+		sched_preempt_enable_no_resched();
 		return (pmd_t *)page;
 	}
 
@@ -181,6 +191,7 @@ void *get_pointer_table(int type)
 		/* move to end of list */
 		list_move_tail(dp, &ptable_list[type]);
 	}
+	sched_preempt_enable_no_resched();
 	return page_address(PD_PAGE(dp)) + off;
 }
 
