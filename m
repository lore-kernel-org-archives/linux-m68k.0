Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2E911DE3AD
	for <linux-m68k@lists.linux-m68k.org>; Mon,  6 Jan 2025 13:37:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736170672; cv=none; b=GLzXBjayQ7SjJL0OOHXNGYCInglChKfh4jAKPJWLZX+MGBWcOUCRCY3gRUgPpPvHSmrZMbtj1qdRFuFCaNmzKB4ocnUe8D/eRJ6h3dcHgMV9w/bx0SpokIiu9owbgAFIb6IuqGG6zYBeIs/mxH4ecdp/ms2XYM0tz0vCezryXtI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736170672; c=relaxed/simple;
	bh=LrtzBOpc20LA4eXs+7jXvZs6h3AKiR2Si9ZU3N7n2dE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jSDY0Np/sWZ0zYCIwpU/SeVEqeJiFmrnXeVfNeKzSGBTiye5EWgRYUYEvFpZkM2EGT64GVQ1/V1g7VHvFRYZBlVNG47LLaI1wGnpavffyMZyNM1AIQx5FyPQiKICg9I+VuEh3K7hRiMSWlDtIqfbykvyC8js74DlpiS6wYeW5lo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=fZtnreXU; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="fZtnreXU"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-21670dce0a7so23102735ad.1
        for <linux-m68k@lists.linux-m68k.org>; Mon, 06 Jan 2025 05:37:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1736170670; x=1736775470; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=45XLTheYrSs123jVGiTYWA09gh8PmFWTSz2LniJsnL8=;
        b=fZtnreXUNVby1sJV0/dbjRM7aPckHj5L33ZH3OU1NXIgn+uNEVFkDuWva/lD+vnw//
         T2RfaXuPrJoTmiUAoYd/+46AIZp8PbtrGEuGdr6giU0iN0MEDY4cmxKl/2f1tR4YxBPT
         oS/vVuybGeM41sxPmlhQKBHRFyTnAJTwigKTrN5dKFZxcSYPcOUtCzcdaGk6jgyVmH4U
         /CXDVDxB2gCHAMGGNct2jzT9L/g1y7sX1f0t46JvTBytIgXDhoKKiPykLk0UmYajWtoJ
         qJ2QhbJYk++PPkJCqG1hf59bR92Ce43Uo/QqSePFBDvvlpe88q/QzsSZWUwn0zd3RvOx
         cGDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736170670; x=1736775470;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=45XLTheYrSs123jVGiTYWA09gh8PmFWTSz2LniJsnL8=;
        b=PZlrnMx7EVOEyvL88nIUBJFIglj09Qs8g2jqgCoBE49vRrU9gP0oUNZtq6Z5tqYSX6
         AP4mQ2ENae0I+o9Aaj8HK/SwmNo5P68e1R7hNCtFGnn4wcl7DiYfrDLucwPGa5733wjq
         VkSMZpkBO6PmalxNX6gpCmnLLwKQjwnQov77wzcIfxQgIq34oF3t/akmWa25CBr7OHr5
         lljoMWY+hkDDtoOvHBAElsIJUQJ6WQm2/JRRrFfuq2phjtrJ2EcC1IqdrVPoS/wF6r9z
         8MJDoOrjwAQqOS/M/R3iNye7RpNj2JOYoavzH0m+7l9DxRulmtqHbNYFCyR120sjDGVG
         yltw==
X-Forwarded-Encrypted: i=1; AJvYcCUC0pzAxV2L7kujFFt/7xiUa6q4wbqdSgnQp6/IeAt5cLN5v+EmAIg5NpNQfryyAP/h3+3SBOCcRK8I@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YxSZTadCsoGfPK0JZ4mkX4nnLPxguEzXe6Th34s6IUCpcmFndl2
	M/MhjS1ZdZNjHRjhm3J/7U0xg7FEhwdoBJa3bSWjRLxJ8768ewMeapt0RnAvkhg=
X-Gm-Gg: ASbGncvAnmmP/QPjY84Rq7NL3DADkYKxoh34xSBgV/fkfSzZ+lDVnuQEAbitgc8Buzt
	5bgGpGlQRNzuvoQ3P6HBNHXOecYgUXCXwaA1st0wmsO8x0gETaFhu9Dub/ATnd0w14Khng01C52
	fXjADS9HSbDZq5u4IBaLcWEebSLQQ48KW8NVehIYIzNcrCdM6cTFhgziJiKnGxCqz6K+Fc463gV
	kwbfPflpJRQgr2PA4Tp2bV+f/0uEnHrMEvN/C1IwUDE+G+wYvU5X/xVwzV28xzsijEgmBeIuslx
	gHEQ55RwHTYICc+sEuox5dSUZOqmVpuC2uietUBJmZ0EdIMfMl4G
X-Google-Smtp-Source: AGHT+IFnWXSZW4FIIFkfBRxwzvmAw3s/HsdTqMia2pBdvLu70V6jfgNFfu5B3ABCLJ+ulhyhNt7Jxw==
X-Received: by 2002:a17:902:c406:b0:216:2bd7:1c4a with SMTP id d9443c01a7336-219e6ebb716mr865705425ad.26.1736170668665;
        Mon, 06 Jan 2025 05:37:48 -0800 (PST)
Received: from ?IPV6:2409:8a28:f44:d64:296c:a8f3:f81e:f88b? ([2409:8a28:f44:d64:296c:a8f3:f81e:f88b])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc9f51a0sm290583325ad.187.2025.01.06.05.37.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jan 2025 05:37:48 -0800 (PST)
Message-ID: <760c9610-a11b-4bc2-852e-340adb27f666@bytedance.com>
Date: Mon, 6 Jan 2025 21:37:36 +0800
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
 <a3a2bd64-9952-4c66-8626-f2436ce07d1d@bytedance.com>
 <Z3vb+0MktvDNysQD@li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com>
From: Qi Zheng <zhengqi.arch@bytedance.com>
In-Reply-To: <Z3vb+0MktvDNysQD@li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 2025/1/6 21:34, Alexander Gordeev wrote:
> On Mon, Jan 06, 2025 at 07:05:16PM +0800, Qi Zheng wrote:
>>> I understand that you want to sort p.._free_tlb() routines, but please
>>
>> Yes, I thought it was a minor change, so I just did it.
>>
>>> do not move the code around or make a separate follow-up patch.
>>
>> Well, if you have a strong opinion about this, I can send an updated
>> patch.
> 
> If you ever send v5, then please update this patch.

OK, will do.

> 
>> Thanks!
> 
> Thank you!
