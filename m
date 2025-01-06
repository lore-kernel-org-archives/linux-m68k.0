Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27DF71DACB8
	for <linux-m68k@lists.linux-m68k.org>; Mon,  6 Jan 2025 11:05:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736161534; cv=none; b=bPGtCew7uw2CjrVaVRzXh2mj7CRx/IIo+KXCB6RUKvdu132KLzfEbIJpyj3P94HI34IGJ5SoOCSjPnNTYQQLMwSaHWIHb0CA7cyCc4VJYygwh7ArNgNoQwVMcK4Y0mFYEHCl2T4oI9BIM4dFQKlGltlxr672s4FJpKGZ61Ap9wU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736161534; c=relaxed/simple;
	bh=nrJv0YgE9y8sC59y8brGraMEhYTf+ZUta6CR44gi/rg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Hz0Euy1QOQSS2pY2cENA44S6pnxMtcVKW+kz05XUvF1WYWW4VCgcWKuvPkGHskRHGQ/GrE2fLFP6On2jW4mOik4PhzIm3sLNVRjywil3YalI2NREUK5cdQcq2OM3KprcgHWrQtizyeBZ2fQQpWVqydS9OMy0kHu4OcJheKrrhvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=ejJmtCS/; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="ejJmtCS/"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-216426b0865so198478905ad.0
        for <linux-m68k@lists.linux-m68k.org>; Mon, 06 Jan 2025 03:05:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1736161531; x=1736766331; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=90v7s8TT3xlSw2lUPUFz/yMbjnPAJgy/hnUWpq/XFIU=;
        b=ejJmtCS//XkVvkTL9f+wHvHi8qjOuYdc3hyyDCDndN353DBCTeyho/0BYvVjqZHz9f
         9WDs+E+BXeL08eoEzYTr6wcvJwGtbHCjUXuZSiVVjiSQ+0N0yggVwtNlCf4ZNj8QEd6B
         5cHtcGD5QV9wm2MozGvGeHvRkxgrb0XESCZf5+J/ZHm4OBLv7IHtH4i/D1nwQ4fq22Fv
         wyS52aKwhmvp5hwH/IasbEXgOJZ5hvodzHw6cOHdCrPhG3xTy5fgDEzz0+V6q0iUDTEY
         Cd4jCLZyNqH+dgquQ2dm8kdIPHjJi9CNUwxHzAVy2PANRdMTOXYF3H+XCUm4QHtBNlCz
         DCuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736161531; x=1736766331;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=90v7s8TT3xlSw2lUPUFz/yMbjnPAJgy/hnUWpq/XFIU=;
        b=FCwSBwwhhPIVJld+QWpWMTi/GNjmq//9H1eL2qBaiLavnE6MrDX+WdjDqxORU7dObT
         fw1XXpWsPit9CA52Zf9AgtO5Dt5s6WO79O372qzduyUmF8mUW4FtCvuMTiTG4AFcZBXO
         wwGOnBs8hb4i+fiox4PBbhweW//ZS0WkiiZiyaetHxYTN5VPUh8r8NbTfCIDT8GFBnHv
         RMlOCa7uZMy4bDZPq6P2nJH4aLRNxg/t7NdLYm2OMqZF9QKTZkU5qx4Tr0l76JrJzE1L
         Ej3GKQOd3n9JesfbzECPW3D7uu3BnhItHFh14t4h1MwyAmyVatLl6pw+CHYUD9CiqpRm
         i0IQ==
X-Forwarded-Encrypted: i=1; AJvYcCVKF1fGuLVNG1vsyA/AoShv0A0rx14Kn33o3OHLuZ46cOw0qlhSX6QgOXuY7McgkXeViuf6R8UG41iC@lists.linux-m68k.org
X-Gm-Message-State: AOJu0Ywwr4xthHH2z2SUKqA3cvcmaMHhFyt9maMUhpNMhvj7RVZ99XbW
	ae+n1H45cGgY7cYUlIoyJtkx6fOPrJYSJr9wMNFjHTi4dbLyUr701g+bZyOpTss=
X-Gm-Gg: ASbGncubYxAVxIFVxf4Z+knUakiItHnueJtqO71wx4VneQpAoFWx5hpWjA2xf6M5dn0
	SX9wj37Jp/ZoX4VOL4dKFog3HVTIdolmdVVZmPkDfpZnaCcFexQ7SCuQTnXJKZu6w3M2DhHlBX2
	DNSbL9epgEv34WiguOzHa/FwtdEbtYPQQFRULAsXnYfhALOOJjmuP6nWUI1xrq0JsOSFZ/Vzsb/
	CzXykXPS9OnfLmbaG3O0OEdqbdFdV1ZiWVPr46QX96yjQ5rQdGKasRhqBOfNWXzrEoU+NwPU/mp
	bh9xpA==
X-Google-Smtp-Source: AGHT+IE9JcDEXfRGdbs/GeoaL5OkZZjAJop4jCS2xW4+Uq7eaBcmeEMmC0BHepygycRFzBYwAZovzA==
X-Received: by 2002:a05:6a00:35c6:b0:725:4109:5b5f with SMTP id d2e1a72fcca58-72abdd7bc5dmr104274758b3a.8.1736161531577;
        Mon, 06 Jan 2025 03:05:31 -0800 (PST)
Received: from [10.84.148.23] ([203.208.167.150])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad8dbb42sm31017515b3a.115.2025.01.06.03.05.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jan 2025 03:05:31 -0800 (PST)
Message-ID: <a3a2bd64-9952-4c66-8626-f2436ce07d1d@bytedance.com>
Date: Mon, 6 Jan 2025 19:05:16 +0800
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 06/15] s390: pgtable: add statistics for PUD and P4D
 level page table
Content-Language: en-US
To: Alexander Gordeev <agordeev@linux.ibm.com>
Cc: peterz@infradead.org, kevin.brodsky@arm.com, palmer@dabbelt.com,
 tglx@linutronix.de, david@redhat.com, jannh@google.com, hughd@google.com,
 yuzhao@google.com, willy@infradead.org, muchun.song@linux.dev,
 vbabka@kernel.org, lorenzo.stoakes@oracle.com, akpm@linux-foundation.org,
 rientjes@google.com, vishal.moola@gmail.com, arnd@arndb.de, will@kernel.org,
 aneesh.kumar@kernel.org, npiggin@gmail.com, dave.hansen@linux.intel.com,
 rppt@kernel.org, ryan.roberts@arm.com, linux-mm@kvack.org,
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-kernel@vger.kernel.org, x86@kernel.org,
 linux-arch@vger.kernel.org, linux-csky@vger.kernel.org,
 linux-hexagon@vger.kernel.org, loongarch@lists.linux.dev,
 linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
 linux-openrisc@vger.kernel.org, linux-sh@vger.kernel.org,
 linux-um@lists.infradead.org
References: <cover.1735549103.git.zhengqi.arch@bytedance.com>
 <35be22a2b1666df729a9fc108c2da5cce266e4be.1735549103.git.zhengqi.arch@bytedance.com>
 <Z3uxVkg3i7zXI92e@li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com>
From: Qi Zheng <zhengqi.arch@bytedance.com>
In-Reply-To: <Z3uxVkg3i7zXI92e@li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 2025/1/6 18:32, Alexander Gordeev wrote:
> On Mon, Dec 30, 2024 at 05:07:41PM +0800, Qi Zheng wrote:
>> Like PMD and PTE level page table, also add statistics for PUD and P4D
>> page table.
> ...
>> diff --git a/arch/s390/include/asm/tlb.h b/arch/s390/include/asm/tlb.h
>> index e95b2c8081eb8..b946964afce8e 100644
>> --- a/arch/s390/include/asm/tlb.h
>> +++ b/arch/s390/include/asm/tlb.h
>> @@ -110,24 +110,6 @@ static inline void pmd_free_tlb(struct mmu_gather *tlb, pmd_t *pmd,
>>   	tlb_remove_ptdesc(tlb, pmd);
>>   }
>>   
>> -/*
>> - * p4d_free_tlb frees a pud table and clears the CRSTE for the
>> - * region second table entry from the tlb.
>> - * If the mm uses a four level page table the single p4d is freed
>> - * as the pgd. p4d_free_tlb checks the asce_limit against 8PB
>> - * to avoid the double free of the p4d in this case.
>> - */
>> -static inline void p4d_free_tlb(struct mmu_gather *tlb, p4d_t *p4d,
>> -				unsigned long address)
>> -{
>> -	if (mm_p4d_folded(tlb->mm))
>> -		return;
>> -	__tlb_adjust_range(tlb, address, PAGE_SIZE);
>> -	tlb->mm->context.flush_mm = 1;
>> -	tlb->freed_tables = 1;
>> -	tlb_remove_ptdesc(tlb, p4d);
>> -}
>> -
>>   /*
>>    * pud_free_tlb frees a pud table and clears the CRSTE for the
>>    * region third table entry from the tlb.
>> @@ -140,11 +122,30 @@ static inline void pud_free_tlb(struct mmu_gather *tlb, pud_t *pud,
>>   {
>>   	if (mm_pud_folded(tlb->mm))
>>   		return;
>> +	pagetable_pud_dtor(virt_to_ptdesc(pud));
>>   	tlb->mm->context.flush_mm = 1;
>>   	tlb->freed_tables = 1;
>>   	tlb->cleared_p4ds = 1;
>>   	tlb_remove_ptdesc(tlb, pud);
>>   }
>>   
>> +/*
>> + * p4d_free_tlb frees a p4d table and clears the CRSTE for the
>> + * region second table entry from the tlb.
>> + * If the mm uses a four level page table the single p4d is freed
>> + * as the pgd. p4d_free_tlb checks the asce_limit against 8PB
>> + * to avoid the double free of the p4d in this case.
>> + */
>> +static inline void p4d_free_tlb(struct mmu_gather *tlb, p4d_t *p4d,
>> +				unsigned long address)
>> +{
>> +	if (mm_p4d_folded(tlb->mm))
>> +		return;
>> +	pagetable_p4d_dtor(virt_to_ptdesc(p4d));
>> +	__tlb_adjust_range(tlb, address, PAGE_SIZE);
>> +	tlb->mm->context.flush_mm = 1;
>> +	tlb->freed_tables = 1;
>> +	tlb_remove_ptdesc(tlb, p4d);
>> +}
> 
> I understand that you want to sort p.._free_tlb() routines, but please

Yes, I thought it was a minor change, so I just did it.

> do not move the code around or make a separate follow-up patch.

Well, if you have a strong opinion about this, I can send an updated
patch.

Thanks!

> 
> Thanks!
