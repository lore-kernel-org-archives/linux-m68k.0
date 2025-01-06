Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B6561DD0C7
	for <linux-m68k@lists.linux-m68k.org>; Mon,  6 Jan 2025 11:02:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736161358; cv=none; b=U36akokOtOYuGne4ed0CI7l2Fnq/cvNHT5wXFXcEovIVRO+sEEG5aGGmohMU9RJZsVpbhCSHFlERXw2LqmQQAlJ4XdWVxLio/X4Fvlt2u2gJ1q/wRV+7vvkNGCmY8yN7gA7Co/XdzkkFhDDwVj/fKCX+ZM/HcY2Mj+Dgynf5RLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736161358; c=relaxed/simple;
	bh=30+xZQfb9yDuTIOe+TrzSZCg5DGlryILzZEnHJoiL0s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HotLhuJ++OluDy8eyetOYgD5mfTBxR8n7ZuS1tefOQkWy8/tAAToFZ7UUSP/OdfmvyWcdBaz0aMd0egKNhotRD635NA2yoaiBK7sykQnsVE21bzo4I+N08LZo+Tw7kp5s986e38n8f4Cpijv3wjzpQAVtp6G31Jw1wNG2tn6Z9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=WmJz38cH; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="WmJz38cH"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2161eb95317so209058835ad.1
        for <linux-m68k@lists.linux-m68k.org>; Mon, 06 Jan 2025 03:02:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1736161353; x=1736766153; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PtS7kKDFbbWBE6dlgb91yolih02/BD7li/VWMu2pf+Q=;
        b=WmJz38cHzBze/nqD4qTLLCHLDZt8hF9JdEoknsZZunJv+JiwIFk9aIq1a++jpQmXuS
         7SXUyFh1X09KZDdt+3gq+JKvoZJ9VQ3V7ISZHQptyeeVw1JNiHuIWXPLqP4Lx45oY5Vm
         n0mp3K2gt+DM42HA9hN9ku8Hc8u6AYIfGm6B7zkyYUdYpgtV/jS45mKSMz7sRcIAwN4v
         qqvBX6N8XGRkNYD3Z7Efy7X6qxA/pJ2M+n4sKY2a2HsLmffygvpCFLyGkj4gTFqLKW8x
         yw/mvpnkIApjIUz8Z082X/BD/bIFungCf1YmoQ6cljv55iBKp4P/1609Ycw+zorhAb4z
         F/Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736161353; x=1736766153;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PtS7kKDFbbWBE6dlgb91yolih02/BD7li/VWMu2pf+Q=;
        b=vf3xnNGJqDN4nFOhPvFmSxbSK72+hMDJsQdwuaO5f9L1X6kUWKXTxHSBVP3nROmh/w
         z3BM/W88eQnAhDsf2dMDyTd/gIWJZ7k/aec/pWssRIFghLkKoTKmcKCShYaxbqr3QZwn
         RlEDf2pR3K7WaCvbKFcC9iXIlR8co3L6Kcfvu3JLWR+mB1rWRqdalqROZ3UR7BtdjXSH
         xr9r62OdsYql4UblZqrB1aqkDWPH5Alz0XRr7TGvEaDgjYPWJdb7FruFEuCYfOq+F5D4
         INK+tRtbz9dIET/1SQl+c9HqiIHFOBdBL4TteymQOmKS0i1ysFnw9Ym1UPpL0Up/2oMJ
         HNRA==
X-Forwarded-Encrypted: i=1; AJvYcCUQ1bINTN62j1G8KTjPoTGzhwpcSSwr/03J2aoMAuqRNLd+Gn4H5P3HUwFz5JxXghOKMB+TW7XgY0+r@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YxwGvCK1VPVEDwlUPcZBdyGmVvpqqMi5H6gy1Mj03JDkJimhLKG
	RN2xjdxaRcj28f7huVL5LAW+HU9KlMfKV0wENOUvjg0YHeL54kk6VsSTD8kY3Rg=
X-Gm-Gg: ASbGncu/FStFeWnkADZkB4+nSdHiT5XFxjJRObJ52WHE9vlf0TxOf9qgy5jre9Cm99B
	myqYS3p4hrftY8RjIGn9GeqP99HtI9A7HiofE8R3qiZFnxPngr5kS+ES/P5cI49T55AJI8rjvh7
	B3YXGjzXLqM90FqklMaiisoPtFS0kaLjd9U+UiW0BgcPxTArBj87XKIzXch8BgisPfhLXb5SM9/
	PICR5mPlbr5nuAykvMJOSDv1I4vaH2ky0WIT7B6v/iWfkql0K2X/a1P4VJMDWH8rVieo9p33ERc
	2MhUoA==
X-Google-Smtp-Source: AGHT+IFCeOw2arXEHpOUWAGun1CKXf9/XTpPQ1dFbIMLlKInW35U2LjXZ6DtTEzjdru/7w1/tbEHpw==
X-Received: by 2002:a05:6a00:4644:b0:725:b347:c3cc with SMTP id d2e1a72fcca58-72abdeb9c33mr83929136b3a.23.1736161353534;
        Mon, 06 Jan 2025 03:02:33 -0800 (PST)
Received: from [10.84.148.23] ([203.208.167.150])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad816464sm31123318b3a.40.2025.01.06.03.02.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jan 2025 03:02:33 -0800 (PST)
Message-ID: <2d16f0fe-9c7f-4229-b7b5-ffa3ab1b1143@bytedance.com>
Date: Mon, 6 Jan 2025 19:02:17 +0800
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 12/15] s390: pgtable: also move pagetable_dtor() of PxD
 to __tlb_remove_table()
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
 <ad21b9392096336cf15aee46f68f9989a9cf877e.1735549103.git.zhengqi.arch@bytedance.com>
 <Z3uyJ2BjslzsjkZI@li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com>
From: Qi Zheng <zhengqi.arch@bytedance.com>
In-Reply-To: <Z3uyJ2BjslzsjkZI@li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 2025/1/6 18:36, Alexander Gordeev wrote:
> On Mon, Dec 30, 2024 at 05:07:47PM +0800, Qi Zheng wrote:
>> To unify the PxD and PTE TLB free path, also move the pagetable_dtor() of
>> PMD|PUD|P4D to __tlb_remove_table().
> 
> The above and Subject are still incorrect: pagetable_dtor() is
> called from pagetable_dtor_free(), not from __tlb_remove_table().

Hmm, __tlb_remove_table() calls pagetable_dtor_free(), so moving to
pagetable_dtor_free() means moving to __tlb_remove_table(). Right?
And the main purpose of this patch is also to move pagetable_dtor()
to __tlb_remove_table(). So I think this description makes sense?

> 
> ...
>> diff --git a/arch/s390/mm/pgalloc.c b/arch/s390/mm/pgalloc.c
>> index 569de24d33761..c73b89811a264 100644
>> --- a/arch/s390/mm/pgalloc.c
>> +++ b/arch/s390/mm/pgalloc.c
>> @@ -180,7 +180,7 @@ unsigned long *page_table_alloc(struct mm_struct *mm)
>>   	return table;
>>   }
>>   
>> -static void pagetable_pte_dtor_free(struct ptdesc *ptdesc)
>> +static void pagetable_dtor_free(struct ptdesc *ptdesc)
>>   {
>>   	pagetable_dtor(ptdesc);
>>   	pagetable_free(ptdesc);
>> @@ -190,20 +190,14 @@ void page_table_free(struct mm_struct *mm, unsigned long *table)
>>   {
>>   	struct ptdesc *ptdesc = virt_to_ptdesc(table);
>>   
>> -	pagetable_pte_dtor_free(ptdesc);
>> +	pagetable_dtor_free(ptdesc);
>>   }
>>   
>>   void __tlb_remove_table(void *table)
>>   {
>>   	struct ptdesc *ptdesc = virt_to_ptdesc(table);
>> -	struct page *page = ptdesc_page(ptdesc);
>>   
>> -	if (compound_order(page) == CRST_ALLOC_ORDER) {
>> -		/* pmd, pud, or p4d */
>> -		pagetable_free(ptdesc);
>> -		return;
>> -	}
>> -	pagetable_pte_dtor_free(ptdesc);
>> +	pagetable_dtor_free(ptdesc);
>>   }
