Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C690A1E378C
	for <linux-m68k@lists.linux-m68k.org>; Tue,  7 Jan 2025 10:51:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736247087; cv=none; b=L0EE/au7EnxNn0FY0kWoW1cXbA+nQdOVjbIOugHbbaedYj5aj4hwgLx9UXoLh3Dy6KGvExo/SYizTs9+AwXTtGZFxy5lQYJvXxU+LvRrxwbyN6Pr51C6Iy+W81R0I+Y+Pck+lJUNTXD3hu06yrHlhxQRZQdQ0vYwn2v+8aUmLxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736247087; c=relaxed/simple;
	bh=BoszZx+BqHikhY7SukX5wUGx8tROnX9EyvNqTYI4nrY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=h/rHxHgwgFWMRWvLqCDnjjZxTAd99XH/1Zbv+0I2+D8vzm3HuBGLM3oVBQAyTZ5tatPAuIdcnQSDX885o+faA0J2NdrSnSQM8ecTSawOd/IK2J6TQJHsLKOSlAPnnrT84ZzBo49jHC8dG5B5X8X9HNalD9uHiGWABzMqn0/1QGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=biPtgyGX; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="biPtgyGX"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2156e078563so194316575ad.2
        for <linux-m68k@lists.linux-m68k.org>; Tue, 07 Jan 2025 02:51:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1736247083; x=1736851883; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ubzgdL9cLh9waK09x12ru+nh0CrFzuM9srghqESdiGM=;
        b=biPtgyGXdAfjikUpD4XepcksCzyHUCM6SthUBGteDcvZJ17TSxnF6B2e4D+SpEjbhJ
         XndZn9mc6QuynTbKvKP+qIZzaidY289p9BP5rokfVc7BtYD6Nt+ZB2pzZ1YuRXWk2DNw
         pZc+C7wgD0hDdM6xAw4M2OPcZyxqv9JXyLyLVA5xSyxzwZ5h98ywxio0z0iskl3E4VIf
         rSiJTgIQksMMDAZw2FtHpIYCQKRkqMGD32H/KgI9G52oHKRnKoJEa5es6vrnnvuDZJWS
         qW4S9xUTu3gBe8zyIHEx86wgIJdGewF7OQW/Ejo9LZ8k4eFlaevEEhrHwXFvf/f54/Bs
         k8jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736247083; x=1736851883;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ubzgdL9cLh9waK09x12ru+nh0CrFzuM9srghqESdiGM=;
        b=xGN7kmDOB5uCwhdrjFyZAHlghN40kCNRTo6+NOE8jdHRYHwCD9ff0a8NIk+7lKBYWw
         ilBQtmgdVgzCAI4fRgx977KJ73Pa+fTYWkqk80Jit+2ul7TlMTpU+YVQIFbGS2J91qEh
         X6Yk5hlv1eePXmCR89lUEjdTlRMtwcdv+i66PBjERbd9EHJ5fJjCfU8MHjO7RatYydvg
         SbE9SkWTehdwwosbMhsvnC5rJgXXCQQwhOaEnoIwuwwqjALvUs9tWyFo76AbNZPkNLll
         imUYiZDh0J4SLwaTD3cqU5cLW1/nfRj+ebm0RXWEeSDQrI37ltLprI5A6Oxs1BrTIfMV
         UtRQ==
X-Forwarded-Encrypted: i=1; AJvYcCXsyb0YtvRKXNZmHjvOHtvhA0e/Mx4Dk3Ayms4XCmIhM2VQE4AtRSoaBkIfGCMTWs6t6DNcheFd+Q9v@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YwG5eZy5pZKcTTl2EgQwCndgtyq5p03ew6o60SqWuNEp9+thEif
	2RG4cTw2dw8zg1d+she6397RcAuRhpG5n6c132aYjWyVLb1Bpmx+Aka9TvTZ0RI=
X-Gm-Gg: ASbGncuf3x+p8zESqg4OU1dLBdmmOvQU2+NNgQtVthLE0KEiRFRYlPGXCSHkN7MXfP2
	+heFRztWmFaeMIyMwUdPk5n5325PjKZrjUnZR4s+vx35CFHyY2IMUxcuPrUFqbCK2l0NOFyUbuK
	lcaB38OimqDZhFk+B2WvrOwQ8oZJOEjJBKijt8XZTcj8s0i5pAR+m+urd/pMNWS1YQZGzZuZB+Y
	EmhbGVAQswHxQ7Zk+KaWsvyRzBDAI2zc+t98vax+l+xIUgYCPBUe2u+XvS7YcnjVf9uycZkeJ8G
	FneM
X-Google-Smtp-Source: AGHT+IFtbfiI9xlsmfuUVQ2Vnnc4auVp2ktX/5YZgw6vYG9rwgEZ2ifuqdpGqVP2TXFmBqefmQU79g==
X-Received: by 2002:a17:902:ea08:b0:216:7410:7e14 with SMTP id d9443c01a7336-219e6eb5c15mr809959765ad.34.1736247082763;
        Tue, 07 Jan 2025 02:51:22 -0800 (PST)
Received: from [10.4.33.153] ([139.177.225.247])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dca025d1sm307318475ad.254.2025.01.07.02.51.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jan 2025 02:51:22 -0800 (PST)
Message-ID: <07e0c05f-cb69-4263-885d-6d20d4442152@bytedance.com>
Date: Tue, 7 Jan 2025 18:51:07 +0800
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 10/15] riscv: pgtable: move pagetable_dtor() to
 __tlb_remove_table()
Content-Language: en-US
To: Kevin Brodsky <kevin.brodsky@arm.com>
Cc: agordeev@linux.ibm.com, palmer@dabbelt.com, tglx@linutronix.de,
 david@redhat.com, jannh@google.com, hughd@google.com, yuzhao@google.com,
 willy@infradead.org, muchun.song@linux.dev, vbabka@kernel.org,
 lorenzo.stoakes@oracle.com, rientjes@google.com, vishal.moola@gmail.com,
 arnd@arndb.de, will@kernel.org, aneesh.kumar@kernel.org, npiggin@gmail.com,
 dave.hansen@linux.intel.com, rppt@kernel.org, ryan.roberts@arm.com,
 linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-kernel@vger.kernel.org, x86@kernel.org, linux-arch@vger.kernel.org,
 linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org,
 loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org,
 linux-mips@vger.kernel.org, linux-openrisc@vger.kernel.org,
 linux-sh@vger.kernel.org, linux-um@lists.infradead.org,
 peterz@infradead.org, akpm@linux-foundation.org
References: <cover.1735549103.git.zhengqi.arch@bytedance.com>
 <0e8f0b3835c15e99145e0006ac1020ae45a2b166.1735549103.git.zhengqi.arch@bytedance.com>
 <1b09335c-f0b6-4ccb-9800-5fb22f7e8083@arm.com>
 <ebce5e05-5e46-4c6e-94a0-bcf3655a862b@bytedance.com>
 <7e2c26c8-f5df-4833-a93f-3409b00b58fd@arm.com>
 <e9fe97d4-99d5-443e-b722-43903655a76e@bytedance.com>
 <31e1a033-00a7-4953-81e7-0caedd0227a9@bytedance.com>
 <d9a14211-4bbd-4fb6-ba87-a555a40bb67a@arm.com>
 <de8756aa-dbf7-4f6f-91f0-934270397192@bytedance.com>
 <ee393a7f-d01e-4e5d-9bf8-779795613af1@arm.com>
From: Qi Zheng <zhengqi.arch@bytedance.com>
In-Reply-To: <ee393a7f-d01e-4e5d-9bf8-779795613af1@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 2025/1/7 17:57, Kevin Brodsky wrote:
> On 06/01/2025 04:49, Qi Zheng wrote:
>> [...]
>>
>>> Once this is done, we should be able to replace all those confusing
>>> calls to tlb_remove_page() on PTPs with tlb_remove_table() and remove
>>> the explicit call to pagetable_dtor(). AIUI this is essentially what
>>> Peter suggested on v3 [2].
>>
>> Since this patch series is mainly for bug fix, I think that these things
>> can be done in separate patch series later.
> 
> Sure that's fair.
> 
>>
>>>
>>> [...]
>>>
>>>> Or can we just not let tlb_remove_table() fall back to
>>>> tlb_remove_page()? Like the following:
>>>>
>>>> diff --git a/include/asm-generic/tlb.h b/include/asm-generic/tlb.h
>>>> index a59205863f431..354ffaa4bd120 100644
>>>> --- a/include/asm-generic/tlb.h
>>>> +++ b/include/asm-generic/tlb.h
>>>> @@ -195,8 +195,6 @@
>>>>     *  various ptep_get_and_clear() functions.
>>>>     */
>>>>
>>>> -#ifdef CONFIG_MMU_GATHER_TABLE_FREE
>>>> -
>>>>    struct mmu_table_batch {
>>>>    #ifdef CONFIG_MMU_GATHER_RCU_TABLE_FREE
>>>>           struct rcu_head         rcu;
>>>> @@ -219,16 +217,6 @@ static inline void __tlb_remove_table(void *table)
>>>>
>>>>    extern void tlb_remove_table(struct mmu_gather *tlb, void *table);
>>>>
>>>> -#else /* !CONFIG_MMU_GATHER_HAVE_TABLE_FREE */
>>>> -
>>>> -/*
>>>> - * Without MMU_GATHER_TABLE_FREE the architecture is assumed to have
>>>> page based
>>>> - * page directories and we can use the normal page batching to free
>>>> them.
>>>> - */
>>>> -#define tlb_remove_table(tlb, page) tlb_remove_page((tlb), (page))
>>>
>>> We still need a different implementation of tlb_remove_table() in this
>>> case. We could define it inline here:
>>>
>>> static inline void tlb_remove_table(struct mmu_gather *tlb, void *table)
>>> {
>>>       struct page *page = table;
>>>
>>>       pagetable_dtor(page_ptdesc(page));
>>>       tlb_remove_page(page);
>>> }
>>
>> Right. As I said above, will add this to the updated patch #8.
> 
> I think it would be preferable to make it a standalone patch, because
> this is a change to generic code that could in principle impact other
> arch's too.

Agree, I have done that:

```
Author: Qi Zheng <zhengqi.arch@bytedance.com>
Date:   Fri Dec 13 17:13:48 2024 +0800

     mm: pgtable: completely move pagetable_dtor() to generic 
tlb_remove_table()

     For the generic tlb_remove_table(), it is implemented in the 
following two
     forms:

     1) CONFIG_MMU_GATHER_TABLE_FREE is enabled

     tlb_remove_table
     --> generic __tlb_remove_table()

     2) CONFIG_MMU_GATHER_TABLE_FREE is disabled

     tlb_remove_table
     --> tlb_remove_page

     For case 1), the pagetable_dtor() has already been moved to generic
     __tlb_remove_table().

     For case 2), now only arm will call 
tlb_remove_table()/tlb_remove_ptdesc()
     when CONFIG_MMU_GATHER_TABLE_FREE is disabled. Let's move 
pagetable_dtor()
     completely to generic tlb_remove_table(), so that the architectures can
     follow more easily.

     Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>

diff --git a/arch/arm/include/asm/tlb.h b/arch/arm/include/asm/tlb.h
index b8eebdb598631..ea4fbe7b17f6f 100644
--- a/arch/arm/include/asm/tlb.h
+++ b/arch/arm/include/asm/tlb.h
@@ -34,10 +34,6 @@ __pte_free_tlb(struct mmu_gather *tlb, pgtable_t pte, 
unsigned long addr)
  {
         struct ptdesc *ptdesc = page_ptdesc(pte);

-#ifndef CONFIG_MMU_GATHER_TABLE_FREE
-       pagetable_dtor(ptdesc);
-#endif
-
  #ifndef CONFIG_ARM_LPAE
         /*
          * With the classic ARM MMU, a pte page has two corresponding pmd
diff --git a/include/asm-generic/tlb.h b/include/asm-generic/tlb.h
index 69de47c7ef3c5..53ae7748f555b 100644
--- a/include/asm-generic/tlb.h
+++ b/include/asm-generic/tlb.h
@@ -220,14 +220,20 @@ static inline void __tlb_remove_table(void *table)

  extern void tlb_remove_table(struct mmu_gather *tlb, void *table);

-#else /* !CONFIG_MMU_GATHER_HAVE_TABLE_FREE */
+#else /* !CONFIG_MMU_GATHER_TABLE_FREE */

+static inline void tlb_remove_page(struct mmu_gather *tlb, struct page 
*page);
  /*
   * Without MMU_GATHER_TABLE_FREE the architecture is assumed to have 
page based
   * page directories and we can use the normal page batching to free them.
   */
-#define tlb_remove_table(tlb, page) tlb_remove_page((tlb), (page))
+static inline void tlb_remove_table(struct mmu_gather *tlb, void *table)
+{
+       struct page *page = (struct page *)table;

+       pagetable_dtor(page_ptdesc(page));
+       tlb_remove_page(tlb, page);
+}
  #endif /* CONFIG_MMU_GATHER_TABLE_FREE */

  #ifdef CONFIG_MMU_GATHER_RCU_TABLE_FREE
```

and will send v5 later.

Thanks!

> 
> - Kevin
