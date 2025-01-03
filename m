Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2BFA1957FF
	for <linux-m68k@lists.linux-m68k.org>; Fri,  3 Jan 2025 03:56:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735876609; cv=none; b=t8o4WwDfLQxwi0DSMwDeAHDXQGz0NRJAKoyVXOzj2uPCjYSVkugsdCWX01Zf5wkIR9tuOu6szZhz1FCKoMcRVDiZkirFSMeHDL6lBVOPWCiySilw6er3Uyw8ykEW3liZ+tRirb8Z7/0DkpXGiH6bePkFWQrxy+qdJ6x3+U71oSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735876609; c=relaxed/simple;
	bh=1jkG8vOEuzvlWn7ntVxS/sK5whSZ5XgibAKAEgNYiaM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gPfuCcvdcZ4S2Div7otLhhBklKRSPCR4sHgOfcKCtC/cJuT5PeWFvZk/cYEl8VvGgFBZKxLInGO8CzNIk7d2OLYZPhBsACYR+eQo4hDfNOSz7CSiA70xgt3POJ0uIfq7PEAHjjgQfJcFgKH8GnH7cIdLa8YLl8QRBR1TMqgxsgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=GmfV3AWg; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="GmfV3AWg"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-216401de828so154144315ad.3
        for <linux-m68k@lists.linux-m68k.org>; Thu, 02 Jan 2025 19:56:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1735876607; x=1736481407; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZAFSLXktiWezwRLeMqNHQIZ8a5HqagkfYDHtpNVk3Hg=;
        b=GmfV3AWgzwKvgZtn5jXFCH80RvDqkiyRl0oNgW0YaXlH57CP1bcDFpcs7Cs4P/risw
         eJEOSRlNhi/DknXFiF/RAe6fgL9pJ53Sd4giFmK1HY/BxSNXUrYZax2EtKL3LKR0MNNA
         NmCqUPfgFzlkGscCLN2LjwMeFCpNKRbjSQkS/DQuK8x7ZBmJ/qQQ9wPYpMrkyvITrbqB
         k3DkIly8cNwBm5qCW/EbzSD8nvN+IuV/TuuVtWVEnrr4SYvKWfNa5Y35mVreTDnKKLRC
         ZLKSc02bCK8d6kCTh77ewOCab9TYggeGjwCVhxBX59Obh4TAo9bLz/7bVk1P8wwgDAEi
         tBYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735876607; x=1736481407;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZAFSLXktiWezwRLeMqNHQIZ8a5HqagkfYDHtpNVk3Hg=;
        b=uHDX9o7VizCdMc5cd71PpybOyGFElamXEegjlFt40XZHyhg6IhzLN4E50U2jPJYetD
         oM9Jef0WRJp68xs3Ly8zTmWlw0q9A0C4kQ7+rn4y1rquMbOz+Aq72DEaDR6Y9ko7NiuW
         tAJCAhEbU7zBNscWc0oKPCJlkgd7OlsSvqbIOCpO2+1imlZUu/BZoOxZFBTL4OvZBc9p
         V4GDaeadOCGPp7M5BM5PxuF6IyGRl47IA0FtLy5+NHay0pBu7qAXSV0rug+qgXPjXOQg
         4XOaZeH1iMgeOY5uydV7aG2iYbycx927Yb+HVMMCcIWYUr0u2vx7D4RKJPzWRuA5exnX
         LPfA==
X-Forwarded-Encrypted: i=1; AJvYcCWGFdvVxh6k0GxuHJ/MjfYMrFQ3SjZfHQ60zwwholvcc8N0x96x4n26aoQdaFkkoG4uOTkqZ7wGn0N3@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YzF+8MuPhNYoWfyWFMQ63VvSz1NGJ2iHdbg9kEnql5g3JdtzSFE
	bm2xKnVsbTdfgh/5Jj01ksrUcTlLFtvwIu2j17MfJfC/EfYdqzCJPPv5XKkYLV0=
X-Gm-Gg: ASbGncuL3icmtBcFSrdqquoUbIBiWS2HWjRtqpJ1BbWydcK/y+zxhrXZwJ48YnXhGc7
	8HTQ26CruxGo86rpfTiZ2Mlnk5by68VVVCdxB88L9AfLjY5hgZNdMdyqfIikj2WSazEYgALvt0v
	cl0hqBfdnNSAoXFufQ7oAGvH32s72KcgUMjM7/aWGLfaC/l4NzMiWS61tq0rssDXzHRT5cbuqLA
	1dWGy3ggKbPLWNEgzxTo0Luca94eNwr/miXF7V377cXt0L2TPlTE1p+iWl1YC1/p+QqbLgTjH9D
	97knXw==
X-Google-Smtp-Source: AGHT+IEc/ggyHLTYoMeUluV4bigOVwXpofNkIsaBMCcId3pHP1FalWdw/+NGvDWYCJeax838Cotn8g==
X-Received: by 2002:a05:6a21:158d:b0:1e1:ca91:b0e3 with SMTP id adf61e73a8af0-1e5e0800420mr68823527637.36.1735876606776;
        Thu, 02 Jan 2025 19:56:46 -0800 (PST)
Received: from [10.84.148.23] ([203.208.167.148])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad8dbafesm25847661b3a.128.2025.01.02.19.56.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Jan 2025 19:56:46 -0800 (PST)
Message-ID: <1cea8c66-626e-434f-aafd-9d44d37f5cc4@bytedance.com>
Date: Fri, 3 Jan 2025 11:56:32 +0800
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 00/15] move pagetable_*_dtor() to __tlb_remove_table()
Content-Language: en-US
To: Kevin Brodsky <kevin.brodsky@arm.com>
Cc: peterz@infradead.org, agordeev@linux.ibm.com, palmer@dabbelt.com,
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
 <04b0a778-7a6b-4df3-b40e-ca76adddb243@arm.com>
From: Qi Zheng <zhengqi.arch@bytedance.com>
In-Reply-To: <04b0a778-7a6b-4df3-b40e-ca76adddb243@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 2025/1/3 01:00, Kevin Brodsky wrote:
> On 30/12/2024 10:07, Qi Zheng wrote:
>> Qi Zheng (13):
>>    Revert "mm: pgtable: make ptlock be freed by RCU"
>>    mm: pgtable: add statistics for P4D level page table
>>    arm64: pgtable: use mmu gather to free p4d level page table
>>    s390: pgtable: add statistics for PUD and P4D level page table
>>    mm: pgtable: introduce pagetable_dtor()
>>    arm: pgtable: move pagetable_dtor() to __tlb_remove_table()
>>    arm64: pgtable: move pagetable_dtor() to __tlb_remove_table()
>>    riscv: pgtable: move pagetable_dtor() to __tlb_remove_table()
>>    x86: pgtable: move pagetable_dtor() to __tlb_remove_table()
>>    s390: pgtable: also move pagetable_dtor() of PxD to
>>      __tlb_remove_table()
>>    mm: pgtable: introduce generic __tlb_remove_table()
>>    mm: pgtable: move __tlb_remove_table_one() in x86 to generic file
>>    mm: pgtable: introduce generic pagetable_dtor_free()
> 
> Aside from the nit on patch 4 and the request for clarification on patch
> 10, this is looking good to me, so for the whole series (aside from my
> own patches of course):
> 
> Reviewed-by: Kevin Brodsky <kevin.brodsky@arm.com>

Thanks for your review!

> 
> And happy new year!

Happy New Year!! :)

> 
> Cheers,
> - Kevin
