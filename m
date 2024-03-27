Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1397721A06
	for <linux-m68k@lists.linux-m68k.org>; Wed, 27 Mar 2024 06:56:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711522603; cv=none; b=U7BFpfpzXQJv8QQDOy4JCpX+0pC4xZNM2T8lzYSDdYGPEb0RcXfSYTpu5BWinD1b9JVGhWjeCGCpYoGa7zYTlzxLwb2NQz0RpPKtrFEBM24QCAxs80kkAWbWNiw/wBRtZ37iGmUqJu4lV/ELp5LJpAjncXnSRgd+bpwdhGas2C0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711522603; c=relaxed/simple;
	bh=6mWs0tn14kzCkglDFCvW5ks3nyuO1NtOIZZlintIKGs=;
	h=Subject:To:References:Cc:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=oXkW7XbHjp/L3h6yODOnDshQY0nzeGlkZ2ujtNCcm6CaWJypaXtvxr6gbBFiiUDBHDf+qNtunI/f/jknNhBKPmTIeLGuLZoaSHDCZ2Ng2sMSvgdncFVJU49Dezqfx5ZhpsCfOMZdiy5Pp2zamyA1gzFq3VwfaJfuSefriQUI1LE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UQ0a8FrJ; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UQ0a8FrJ"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-5e42b4bbfa4so3687384a12.1
        for <linux-m68k@lists.linux-m68k.org>; Tue, 26 Mar 2024 23:56:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711522601; x=1712127401; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:cc:references:to:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F6E6ZPAp6hwwJm3OgTZAvfPYmHCObD8vfRNdE1GtBwA=;
        b=UQ0a8FrJEFW49Lgc4VQ3SVHT7PaKt17T2HEsPPgp2kiMs71bHKu/ApM9XfiJF5WJ4+
         caEGVki12N38b2GB9J/wLisBdz9Kle7GKmhOW301zbV0Z1rWOylumeZvkS+l3ACtnUsF
         LB5CAn+lvPwPleaGRL7ynrle78ug84tE0hhg8Sw2F9cCCO7+oYbhpLtZOZmd1MHVs3nj
         LAxykmMdUoyF6wT615YRWnHQGYDctl++cnoUVH6r0zd6kuzhbPYfi/dej+PGTncjh3cS
         2jnAqI2TLpLpP00J+0rEpYKPjyjUuIuo7EBHWyKPVflgMu02KScYL57C6uqhmKmoQ3FS
         rgYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711522601; x=1712127401;
        h=content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:cc:references:to:subject:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=F6E6ZPAp6hwwJm3OgTZAvfPYmHCObD8vfRNdE1GtBwA=;
        b=W2WIKkf8nphEL8uxxmf2oV6YOAR75LXm8Wi34G0DaBHH77FDE74D8hCG5YMCsQBw16
         1YDEN+IowG8Z4UAxfT0Rtviu5Okwc6KFkq9AhFePFKkBD4lzUle9RhEOP3UAyX6WfHAl
         nOTEIH9+AsfWJMqsuL0UkRCt3+WiegUNQ1rDRFk26eAbst4Ah1fzZ6BJu4gMPP1DC7DQ
         5WpsZoC9XN2yNDwoeiM0R71GoOrPCH//Ca3Oz0t1g7RBaTd3JNLFqcSqJbb/S2zMEzeS
         pjh5gxPNWO/5lneAbECb7+izbtMRYKb1Ifo6dOwXiLIZ8In6Fe5l4eHZtJXy9JBbUHj6
         fClg==
X-Forwarded-Encrypted: i=1; AJvYcCVt2XGvwonEyhCyYdgTNRWefQ2HqErc9UhzsNWMGV2pmtEB+kUY70jcb/KTOJb7I75VhjxqpmK3a0uSvlH0zf1XXmBoeMUp7sYtNV6ZuP19
X-Gm-Message-State: AOJu0YxlHwhey3GJ7+XA4+02RhxpVeu9AoeJhZp31Df1wXQu630rjnp9
	eUCqRZLY9aHz8tyWT78MYTPB4YxmL8C/3KCnsCDgm4+wm/CJBCydiVH7bNcE
X-Google-Smtp-Source: AGHT+IHmMCiQasaZkV4ZC7BwwtKsTtsae2bXXP56oSe9vD8QMnfMFEOhJGfcGqia1KWR8hjhCodkNg==
X-Received: by 2002:a05:6a20:9c97:b0:1a3:5581:1692 with SMTP id mj23-20020a056a209c9700b001a355811692mr3800920pzb.30.1711522600790;
        Tue, 26 Mar 2024 23:56:40 -0700 (PDT)
Received: from [10.1.1.24] (222-152-175-63-fibre.sparkbb.co.nz. [222.152.175.63])
        by smtp.gmail.com with ESMTPSA id a9-20020a17090a480900b002a03456ccabsm810041pjh.30.2024.03.26.23.56.37
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 26 Mar 2024 23:56:40 -0700 (PDT)
Subject: Re: [PATCH RFC] m68k: skip kernel premption if interrupts were
 disabled
To: Finn Thain <fthain@linux-m68k.org>
References: <20240322014805.30606-1-schmitzmic@gmail.com>
 <fcabda73-4b16-ee2c-e993-2bfcf392a26a@linux-m68k.org>
 <e89bf618-2fa8-7cbd-16ed-d021a9a7f740@gmail.com>
 <948c12e4-e85f-a86c-ae95-a1eb03ca026d@gmail.com>
 <40928e38-0de7-75a6-d5f7-8c913155da03@linux-m68k.org>
 <5e344842-0b19-1f83-dc77-51210a8880c7@gmail.com>
 <1b9ae156-9dac-b11f-5ddb-fb5878b3c9a9@gmail.com>
 <acd34add-27af-24a5-9af5-d40cab71c651@linux-m68k.org>
 <597ab0b3-ac1d-443c-95f7-4f1bbcccae1f@gmail.com>
 <c8a063a1-c72c-9aed-65fc-b2d87f8c7a9b@linux-m68k.org>
 <546b3960-7a1d-4989-82ee-2d7d56a9d609@gmail.com>
 <fb93b00e-6cfd-f2a8-7937-1266d7bbfc23@linux-m68k.org>
 <570d4e69-e73c-4d35-8538-b5530c714c55@gmail.com>
 <14f7ba29-dc96-1f46-5b5e-aa6c5bb3de3b@linux-m68k.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k@lists.linux-m68k.org
From: Michael Schmitz <schmitzmic@gmail.com>
Message-ID: <3dee11c5-d0dd-b61e-c7e7-bd12841618ba@gmail.com>
Date: Wed, 27 Mar 2024 19:56:34 +1300
User-Agent: Mozilla/5.0 (X11; Linux ppc; rv:45.0) Gecko/20100101
 Icedove/45.4.0
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <14f7ba29-dc96-1f46-5b5e-aa6c5bb3de3b@linux-m68k.org>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

Hi Finn,

thanks - that should suffice.

Tests on the slower ARAnyM instance also passed OK. Leaves test on 030 - 
I'll see whether I can find an earlier kernel version with a smaller 
memory footprint to test these patches on.

Now none of this has got us any closer to a solution for the spinlock 
recursion bug...

Cheers,

	Michael

Am 27.03.2024 um 16:50 schrieb Finn Thain:
>
> On Wed, 27 Mar 2024, Michael Schmitz wrote:
>
>> it might be easier for Geert to merge the two patches (or a single one)
>> on top of his preempt branch if they come in the usual git format.
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
