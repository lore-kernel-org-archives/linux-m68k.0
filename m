Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 624B31DD88D
	for <linux-m68k@lists.linux-m68k.org>; Mon,  6 Jan 2025 13:35:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736170511; cv=none; b=iW0r6aIyPL/Gk33X4TNhQ6hhNKIGsVa7F5ScxrhBfc/a5tuujbvKBWwUxDssdw2OxaQiym6lc9HJVNeWErl3QBisVIpIkcJ2DgNM0KzteeXYx2Q0aXbFn2Jc4bKuKf0czJHl//DyKcH8U+Hr6MXjKhcTeU1gxzV93UHY5gpYxC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736170511; c=relaxed/simple;
	bh=rzubnT0gas16PzeOBWAv24OQZ7te5xw5qxzCAysoAMo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=D5RLhwXLQhrZ/fM/EpZpZU8D4zBC5pAxh+CLwmiZ+7wGFZ51fsXseJHCx3pUvsblHEO7neFge3KtQIzxvscZtVia/eNlOruz6nPS8WoLubXZTJ3QwIWdZm2T5bu+Kdi4G867o0QNKBRl5/VTq3QqcLQLkgc/kC76fu7qj9oVKOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=VqFhqt6a; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="VqFhqt6a"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-21636268e43so22626375ad.2
        for <linux-m68k@lists.linux-m68k.org>; Mon, 06 Jan 2025 05:35:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1736170508; x=1736775308; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dSl9CiTNSQwE0RKlCdBtogvBaV/TE9/iFGVUzDM7I3Y=;
        b=VqFhqt6aBRz6OzuQoWW8rg9YXMaRVIIjYXZxqyGemAa5/JhiWmmtlvSzAj17/5/rNW
         IU1gg26UYGjUv7bHsjhi4aDsOWM++dv2XRmZ4B1KRBs2QzsWdHn4NF/Xif661pFW0FFq
         310yi8fFUWOW0hO49FJmiWU6gJ/u3x+EUPoGGLG/5P7bvUQLnvhPqgiZGShs5SwDqZbB
         62WS+Yvi95xId79Rpjx47RrCEfKMCmWQ27ANI0CC5RWBlOUaYtnrgxr7SOwJUfV5IBSK
         CmKQJF++uAX+I3IX4oIWeq9nAs/oeV8fWgPC4EJQ2yIzxDG+Um3LTK/HJZukUMX4L3ob
         r1Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736170508; x=1736775308;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dSl9CiTNSQwE0RKlCdBtogvBaV/TE9/iFGVUzDM7I3Y=;
        b=YYCIlrTNza7y6Wl5s8ikceQFbjlFjkwS2aqWTKmAt23zVbe9svRSzspZbrqUHAP+2b
         UhLXr3Vuc9HExDYogdhW8WDA4hmz/CbkR7lotWkIA+WhTEcy5YjRIBjw2mpYxnEJ4/HA
         0E8phrNwdaX3Bb4J9Y1wbbSUVQphu2owL28vnLbdqW4T3Jk9Yi9CIxGXORjvfs6UJXLi
         5yLb41kY2a7lLOZUlNVlrcQJSM5yH+s7niM+iK9s1RrdW3e8n0GuobmimcrcpC8K97Q+
         Sx1NpKLaOlS6p82kZrUieHbc8PThzaDA0w+luxodmaOabLhQPI1Vzub+eOhn0WLTJ4LR
         A/cg==
X-Forwarded-Encrypted: i=1; AJvYcCU7mYJa5c8HFiM0O8Rn5q78Rn7qvlUoxtGyBiQDA6O1Yvrhh+1pnr6a3NgQiuatlTyM+qoDESbQ3byM@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YxrdwYiMvRH8k+tpjX1TUTOY0wJdDyN0dx+nlmPfL+mQWcO5Qjt
	RIhWq8BJwQa+0E7+O0kQqvMmGmT83Zom6oOC/obYu4VMVh494VqH5B7u0VvCMok=
X-Gm-Gg: ASbGnctWQl+wgnoMRjNt4cWi7f0X668YO/0xr4a6yK0HddzZqIXXJiuxqTxuUJVpiiv
	uhcekjDiP+f5/w2WiwttRCvmSLdtu9RsVIMlyh64unQH2yzEutcQZ8x7l2PM0OKlCdBIv5mBoa0
	g9mYQsDVXRa7Etk5APrn7Uj8PfdC+KL9r43zY/J3fzgX7D3FSESexMBlwOSdMcgbqwtZ9HytCCh
	Ezg7w90hCpd/UkcbhkiE9W6LU3JipTQqjwZpjsP02UY/gTjaeYv4YOsNkjsIjVsBA7ifafGFTsX
	fivjPsQz/3KI0MxA8s2kv4Lvlvj/dWCzaXsc2JuUbkay/gXBueNK
X-Google-Smtp-Source: AGHT+IFuxfmftFbdw6fO4bIMnZYJ/q+si7Sq93AxF4PGQarIeYtLJTB7gRBGy3tWc8bUzZwj1LueBQ==
X-Received: by 2002:a17:902:e844:b0:216:3083:d03d with SMTP id d9443c01a7336-219e6f13c50mr852868805ad.44.1736170508636;
        Mon, 06 Jan 2025 05:35:08 -0800 (PST)
Received: from ?IPV6:2409:8a28:f44:d64:296c:a8f3:f81e:f88b? ([2409:8a28:f44:d64:296c:a8f3:f81e:f88b])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc9cdf02sm292469725ad.151.2025.01.06.05.34.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jan 2025 05:35:08 -0800 (PST)
Message-ID: <57ea8193-2fd9-41a9-85b4-7af924f900f4@bytedance.com>
Date: Mon, 6 Jan 2025 21:34:55 +0800
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
 <2d16f0fe-9c7f-4229-b7b5-ffa3ab1b1143@bytedance.com>
 <Z3vQHplZqtHf6Td8@li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com>
From: Qi Zheng <zhengqi.arch@bytedance.com>
In-Reply-To: <Z3vQHplZqtHf6Td8@li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 2025/1/6 20:44, Alexander Gordeev wrote:
> On Mon, Jan 06, 2025 at 07:02:17PM +0800, Qi Zheng wrote:
>>> On Mon, Dec 30, 2024 at 05:07:47PM +0800, Qi Zheng wrote:
>>>> To unify the PxD and PTE TLB free path, also move the pagetable_dtor() of
>>>> PMD|PUD|P4D to __tlb_remove_table().
>>>
>>> The above and Subject are still incorrect: pagetable_dtor() is
>>> called from pagetable_dtor_free(), not from __tlb_remove_table().
>>
>> Hmm, __tlb_remove_table() calls pagetable_dtor_free(), so moving to
>> pagetable_dtor_free() means moving to __tlb_remove_table(). Right?
> 
> Right. But you Subject and description claim "... also move the
> pagetable_dtor()" not to pagetable_dtor_free() - which is another
> function.

OK, will change the subject and description to:

s390: pgtable: also move pagetable_dtor() of PxD to pagetable_dtor_free()

To unify the PxD and PTE TLB free path, also move the pagetable_dtor() of
PMD|PUD|P4D to pagetable_dtor_free().

But pagetable_dtor_free() is newly introduced in this patch, should it
be changed to 'move ... to pagetable_pte_dtor_free()'? But this seems
strange. :(

> 
>> And the main purpose of this patch is also to move pagetable_dtor()
>> to __tlb_remove_table(). So I think this description makes sense?
> 
> The patch makes sense, but the description it is incorrect ;)
> 
> Thanks!

Thanks!
