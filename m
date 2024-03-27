Received: from fhigh2-smtp.messagingengine.com (fhigh2-smtp.messagingengine.com [103.168.172.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 557571A716
	for <linux-m68k@lists.linux-m68k.org>; Wed, 27 Mar 2024 08:37:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.153
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711528649; cv=none; b=qjV4KQ8UUEVsIvpoL7o1Z6OMMGtnWJKJbyLNt3E+O7KCKAqPIFSsaxzU9/ajZ/S5cAZL4S0BHHdG9RlyE08Atn7pNweYKHUZO+baxEaXpbnjSbKnLK3O2a5TPpIePBlZlMShawg/AKYSJ8c+Exd1hBHeklNsxoRkXcN/zpbjmYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711528649; c=relaxed/simple;
	bh=FSGroBoz5ODr9QCid6PVURNzJhnt0tb6wtrrv7/LpOY=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=NneFfCoPN1228EOW+XqUha1TkB0141oOUf9ZeB/tQSQPTVr1hIIyp8wjhFuiwuNgV4v5BGJuSojGZxJM4J+O6oTZLUxNQzSpH4RuPka2jNOgfBtAIu6M0dOOCJIaIyew4J9rNA6LyElt/BlAScfXRgJdPJZdIs0X7mHBpXCuzno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=none smtp.mailfrom=linux-m68k.org; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=I0ocbKOz; arc=none smtp.client-ip=103.168.172.153
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="I0ocbKOz"
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id 515B01140175;
	Wed, 27 Mar 2024 04:37:26 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Wed, 27 Mar 2024 04:37:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1711528646; x=1711615046; bh=ZadPyG+nnGwVa71eC8JDf5KvRpBS
	MNjGsD+ahNvHaiQ=; b=I0ocbKOzDZMfxMlBCaLdjZoJnfGuLKGXyOsNOuhjD6Ro
	bX8JWjolI//nuRFBc9lKyzVZtfD0sLQALBlWDFIpAmeqmMJ1yzjSFUEA8MOsbhfZ
	hN8V8+4LMIAZYuHJT337bPmalfbjiNLz7m8PgP9xafxZVbwuowFnuJouiCiLw1mo
	k5PhIsX/Sm/5eh0B+WweyviuXXi2H3Ah73qMJ+TGfvF+t5ajWJbePqLqa2W22l+F
	jHzDg2yfIFlZz/fjFi0UgmsscIcu7IXhSTL8+LXGyDM6ee0fucVOmySIWRAThMsK
	PWXW7u6EwA1ADrisDA39pJIVRy5K7Uh3vR09v5X8+A==
X-ME-Sender: <xms:xdoDZtDQBMjpsO1GCJ2cz0I--Do7cH8AnGXZ27in7DMeReiHBS6UDg>
    <xme:xdoDZrjkXaWZMWrRvydBp95RFCCcccbjEKMy1NDdwDpbDNyOhZKNN3Wy_FmbcvAsX
    diQQ3q6SWVxNiLzoGA>
X-ME-Received: <xmr:xdoDZokKeCXY6eT-WnGABlxU5NR1c4KN6Datqn6BeACRPI5y2QakkPkkBldud8eQM3rPSDAaJzm9SevzZfzJfjDpxAexWl7gvhs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledruddugedguddvvdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvvefujgfkfhggtgesthdtredttddtvdenucfhrhhomhephfhinhhn
    ucfvhhgrihhnuceofhhthhgrihhnsehlihhnuhigqdhmieekkhdrohhrgheqnecuggftrf
    grthhtvghrnhepleeuheelheekgfeuvedtveetjeekhfffkeeffffftdfgjeevkeegfedv
    ueehueelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    epfhhthhgrihhnsehlihhnuhigqdhmieekkhdrohhrgh
X-ME-Proxy: <xmx:xdoDZnz-wpaNOaMwz69SIp_bnmAAysr_NRhURi7cJgeHIetLUavn2g>
    <xmx:xdoDZiSHPcBLhoDuiEOsP33QGsYU_bFLxQe_FOUYcJqlXLRfKElFyA>
    <xmx:xdoDZqZ-s28ss9pvY6r9kFjR76YKLvkh3i9npFN3M_iQwu2XcCe3cw>
    <xmx:xdoDZjSi2_phHlz_5S0FaMgnL4KM9XvAMlN7WecD97Bk3QRDo8Wr_A>
    <xmx:xtoDZgfTci-Hx76O1giZmfzmvRe5-rnucRdmIxyrC4b2Gg6Rz_7nWQ>
Feedback-ID: i58a146ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 27 Mar 2024 04:37:23 -0400 (EDT)
Date: Wed, 27 Mar 2024 19:38:54 +1100 (AEDT)
From: Finn Thain <fthain@linux-m68k.org>
To: Michael Schmitz <schmitzmic@gmail.com>
cc: Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k@lists.linux-m68k.org
Subject: Re: [PATCH RFC] m68k: skip kernel premption if interrupts were
 disabled
In-Reply-To: <14f7ba29-dc96-1f46-5b5e-aa6c5bb3de3b@linux-m68k.org>
Message-ID: <6f264600-0118-fae7-dc7c-e3407b661d66@linux-m68k.org>
References: <20240322014805.30606-1-schmitzmic@gmail.com> <fcabda73-4b16-ee2c-e993-2bfcf392a26a@linux-m68k.org> <e89bf618-2fa8-7cbd-16ed-d021a9a7f740@gmail.com> <948c12e4-e85f-a86c-ae95-a1eb03ca026d@gmail.com> <40928e38-0de7-75a6-d5f7-8c913155da03@linux-m68k.org>
 <5e344842-0b19-1f83-dc77-51210a8880c7@gmail.com> <1b9ae156-9dac-b11f-5ddb-fb5878b3c9a9@gmail.com> <acd34add-27af-24a5-9af5-d40cab71c651@linux-m68k.org> <597ab0b3-ac1d-443c-95f7-4f1bbcccae1f@gmail.com> <c8a063a1-c72c-9aed-65fc-b2d87f8c7a9b@linux-m68k.org>
 <546b3960-7a1d-4989-82ee-2d7d56a9d609@gmail.com> <fb93b00e-6cfd-f2a8-7937-1266d7bbfc23@linux-m68k.org> <570d4e69-e73c-4d35-8538-b5530c714c55@gmail.com> <14f7ba29-dc96-1f46-5b5e-aa6c5bb3de3b@linux-m68k.org>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII


On Wed, 27 Mar 2024, Finn Thain wrote:

> 
> On Wed, 27 Mar 2024, Michael Schmitz wrote:
> 
> > it might be easier for Geert to merge the two patches (or a single one) 
> > on top of his preempt branch if they come in the usual git format.
> 
> I suppose that would be easier, assuming it doesn't need a lot of rework. 
> Anyway, here's the diff.
> 
> diff --git a/arch/m68k/mm/motorola.c b/arch/m68k/mm/motorola.c
> index c1761d309fc6..d0092a3127c0 100644
> --- a/arch/m68k/mm/motorola.c
> +++ b/arch/m68k/mm/motorola.c
> @@ -15,6 +15,7 @@
>  #include <linux/mm.h>
>  #include <linux/swap.h>
>  #include <linux/kernel.h>
> +#include <linux/preempt.h>
>  #include <linux/string.h>
>  #include <linux/types.h>
>  #include <linux/init.h>
> @@ -139,10 +140,14 @@ void __init init_pointer_table(void *table, int type)
>  
>  void *get_pointer_table(int type)
>  {
> -	ptable_desc *dp = ptable_list[type].next;
> -	unsigned int mask = list_empty(&ptable_list[type]) ? 0 : PD_MARKBITS(dp);
> +	ptable_desc *dp;
> +	unsigned int mask;
>  	unsigned int tmp, off;
>  
> +	preempt_disable();
> +
> +	dp = ptable_list[type].next;
> +	mask = list_empty(&ptable_list[type]) ? 0 : PD_MARKBITS(dp);
>  	/*
>  	 * For a pointer table for a user process address space, a
>  	 * table is taken from a page allocated for the purpose.  Each
> @@ -153,9 +158,13 @@ void *get_pointer_table(int type)
>  		void *page;
>  		ptable_desc *new;
>  
> +		sched_preempt_enable_no_resched();
> +
>  		if (!(page = (void *)get_zeroed_page(GFP_KERNEL)))
>  			return NULL;
>  
> +		preempt_disable();
> +
>  		if (type == TABLE_PTE) {
>  			/*
>  			 * m68k doesn't have SPLIT_PTE_PTLOCKS for not having
> @@ -170,6 +179,7 @@ void *get_pointer_table(int type)
>  		PD_MARKBITS(new) = ptable_mask(type) - 1;
>  		list_add_tail(new, dp);
>  
> +		sched_preempt_enable_no_resched();
>  		return (pmd_t *)page;
>  	}
>  
> @@ -180,6 +190,7 @@ void *get_pointer_table(int type)
>  		/* move to end of list */
>  		list_move_tail(dp, &ptable_list[type]);
>  	}
> +	sched_preempt_enable_no_resched();
>  	return page_address(PD_PAGE(dp)) + off;
>  }
>  
> @@ -190,6 +201,8 @@ int free_pointer_table(void *table, int type)
>  	unsigned long page = ptable & PAGE_MASK;
>  	unsigned int mask = 1U << ((ptable - page)/ptable_size(type));
>  
> +	preempt_disable();
> +
>  	dp = PD_PTABLE(page);
>  	if (PD_MARKBITS (dp) & mask)
>  		panic ("table already free!");
> @@ -203,6 +216,7 @@ int free_pointer_table(void *table, int type)
>  		if (type == TABLE_PTE)
>  			pagetable_pte_dtor(virt_to_ptdesc((void *)page));
>  		free_page (page);
> +		sched_preempt_enable_no_resched();
>  		return 1;
>  	} else if (ptable_list[type].next != dp) {
>  		/*
> @@ -211,6 +225,7 @@ int free_pointer_table(void *table, int type)
>  		 */
>  		list_move(dp, &ptable_list[type]);
>  	}
> +	sched_preempt_enable_no_resched();
>  	return 0;
>  }
>  
> 

For my part,

Signed-off-by: Finn Thain <fthain@linux-m68k.org>
