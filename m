Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1121B14F104
	for <linux-m68k@lists.linux-m68k.org>; Mon, 30 Dec 2024 03:12:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735528337; cv=none; b=hKGZKJQ6sP7iURBSocwtCFz9xn7qUPdKBK5E/vvhJaTFta1o/2RlRJ2K/Da3ir9kbqzHoB6/nWCnbGqrHHB6LzfWDnDfZ5CJuN3UGOdnmUeA30kO89vFDdRDd6GcXwfzsNfJ6Z/uLIt3RKybkmDkv5dwo2GOdUZuH+C13FVtLn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735528337; c=relaxed/simple;
	bh=RByHVD3bvwf9OBgmvjYl7zmyuddvG3+m7GzmELh8Ojk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BsCwKjsXLpGGkDYJ5gq8uLy4xJBoxzFTeN7NPwAioKmxD+QZUtzN1Y6s8GmMVlXV4JLQrUjJoABv8SgSbbTuFnTRKjAh8KtivgTKZwxNJYmRiY+Aw/MxB3iwmUhw7zsif05MLHyGrORRd4nrm9VaNyULb89Bfr9iVE6SMvePiZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=amsiYaOw; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="amsiYaOw"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-21634338cfdso163101055ad.2
        for <linux-m68k@lists.linux-m68k.org>; Sun, 29 Dec 2024 19:12:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1735528335; x=1736133135; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=00MV44O/wLuPQ/RpQp8S/rpHXiOskq9DnLB00pReqmw=;
        b=amsiYaOweXS3VpBERR/NEA2y9RMxsRxG+lozacyVtM+QfxTEL4AimSbt7+URDkYoNX
         eEK/CZb29FGz2OvMlL1xA+kUwXmtrEQ3hhj/dKfBr+kzpcvZna8XkA3gD93/20zt4Bd6
         D5CKsRGyFgKrhdZIuIMT3kE101gNJOe0Oqz8BfLVVHG8h73QHeL8mn06OEzWDyM03DQl
         EMmau2jGvH4eAa7AfNoRuPGPI4zrnQtdjvHorix/LVaa0wPWY96WaMLfBPRePekoM1iU
         OQqsmhbhW0mRLtriSlXjdNyC/nnhcr/B9N764PGkeOADSjiCcIRwQfjEb1WIuOR+SB/W
         VIjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735528335; x=1736133135;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=00MV44O/wLuPQ/RpQp8S/rpHXiOskq9DnLB00pReqmw=;
        b=pSKcJM1GXnPOEE6O2a3Qx4hKPDJTwzGqifKZotvtL2P8KHPNcGr5uzTcGHHsH9f/m8
         VzZDa2xe29dz1VyJ2PIXHvZBKBFfBBTpQ6p7R882TS/WUOwGcKzDb7cz8rew2wjrInIR
         kt6WpbPj82i3BWngMrA9YSCtRnA+lCmBoW48fkYaRd6VM8xQflNZqtcLoq+Xn8lofQ3q
         8Ohvz1iuMxxiN1HV8KnHIvpVw0zf6dmhNFDracpSE6J+W7KcsAWSr82dvI7WG62pUCIK
         HV/stmBHOf5p0WsrqAuPS5al7/saAAe7XKDKIUuvhDPCix8tTljXzMNohk09VPiVTlPU
         ckyA==
X-Forwarded-Encrypted: i=1; AJvYcCVcyyTYaBv1mAW8T7J80s2GTg2irFVae2oErStmwCsSGTJN/tWrKsjE4ndUHb+nhxfsEwjFzVA/8mJd@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YxT6w37KYFPoIcTCh78zOwEJrW/wFY4TQfwoQuINCfpsdycxHIw
	thAKeisTAutCeKeDZx8lSNx4qGyVeH4eA+CUW//7FIBU5FXR/voun68iF0XUMww=
X-Gm-Gg: ASbGncsriXwErDeUzX7AKl99qNOR7eub45nQFZovYcqLK7kM038Ay/e9zMzMMFReRmr
	rqBMj2GxdX5k/gynEsqIfrJQRb4JPVdHI8B2oamlXke5nPqEILRHrUKu5wV18UW86QfpVlddw8t
	foDwf/74sZRXIYnEbiJs2umbJd25uXiZXt6KHqbCV+42pN2jdgHA5Nbj1Q20rjbThvBLK1cFUOO
	T8D5Wl81SfXor1RusoRy/UpuVanXYnw0xR4A5GMFo2+TgZfuoGyXquugoB2Z51U48T3zObrkOkm
	Di5LVw==
X-Google-Smtp-Source: AGHT+IHVtuGTDJKnXgo1JS5AtVrvj0I/cg1dyieo6seko5BYBtWvsXqnYPIAVAFKhaTndzKmWg8VgQ==
X-Received: by 2002:a05:6a20:9185:b0:1e5:7db5:d6e7 with SMTP id adf61e73a8af0-1e5e083f019mr66304616637.46.1735528334820;
        Sun, 29 Dec 2024 19:12:14 -0800 (PST)
Received: from [10.84.148.23] ([203.208.167.148])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad84eb45sm18191842b3a.88.2024.12.29.19.12.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 29 Dec 2024 19:12:14 -0800 (PST)
Message-ID: <9cac5690-c570-4d43-a6bc-2b59b85497ae@bytedance.com>
Date: Mon, 30 Dec 2024 11:12:00 +0800
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 15/17] mm: pgtable: remove tlb_remove_page_ptdesc()
Content-Language: en-US
To: Mike Rapoport <rppt@kernel.org>, akpm@linux-foundation.org,
 kevin.brodsky@arm.com, peterz@infradead.org
Cc: agordeev@linux.ibm.com, tglx@linutronix.de, david@redhat.com,
 jannh@google.com, hughd@google.com, yuzhao@google.com, willy@infradead.org,
 muchun.song@linux.dev, vbabka@kernel.org, lorenzo.stoakes@oracle.com,
 rientjes@google.com, vishal.moola@gmail.com, arnd@arndb.de, will@kernel.org,
 aneesh.kumar@kernel.org, npiggin@gmail.com, dave.hansen@linux.intel.com,
 ryan.roberts@arm.com, linux-mm@kvack.org,
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-kernel@vger.kernel.org, x86@kernel.org,
 linux-arch@vger.kernel.org, linux-csky@vger.kernel.org,
 linux-hexagon@vger.kernel.org, loongarch@lists.linux.dev,
 linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
 linux-openrisc@vger.kernel.org, linux-sh@vger.kernel.org,
 linux-um@lists.infradead.org
References: <cover.1734945104.git.zhengqi.arch@bytedance.com>
 <b37435768345e0fcf7ea358f69b4a71767f0f530.1734945104.git.zhengqi.arch@bytedance.com>
 <Z2_EPmOTUHhcBegW@kernel.org>
From: Qi Zheng <zhengqi.arch@bytedance.com>
In-Reply-To: <Z2_EPmOTUHhcBegW@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Mike,

On 2024/12/28 17:26, Mike Rapoport wrote:
> On Mon, Dec 23, 2024 at 05:41:01PM +0800, Qi Zheng wrote:
>> Here we are explicitly dealing with struct page, and the following logic
>> semms strange:
>>
>> tlb_remove_page_ptdesc((tlb), (page_ptdesc(pte)));
>>
>> tlb_remove_page_ptdesc
>> --> tlb_remove_page(tlb, ptdesc_page(pt));
>>
>> So remove tlb_remove_page_ptdesc() and make callers call tlb_remove_page()
>> directly.
> 
> Please don't. The ptdesc wrappers are there as a part of reducing the size
> of struct page project [1].
> 
> For now struct ptdesc overlaps struct page, but the goal is to have them
> separate and always operate on struct ptdesc when working with page tables.

OK, so tlb_remove_page_ptdesc() and tlb_remove_ptdesc() are somewhat
intermediate products of the project.

Hi Andrew, can you help remove [PATCH v3 15/17], [PATCH v3 16/17] and
[PATCH v3 17/17] from the mm-unstable branch?

For [PATCH v3 17/17], I can send it separately later, or Kevin Brodsky
can help do this in his patch series. ;)

Thanks,
Qi

> 
> [1] https://kernelnewbies.org/MatthewWilcox/Memdescs
>   

