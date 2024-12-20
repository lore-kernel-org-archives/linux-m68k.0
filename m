Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 883392165EB
	for <linux-m68k@lists.linux-m68k.org>; Fri, 20 Dec 2024 14:16:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734704196; cv=none; b=k9pdh/0MErYWITNMuHa8h9pyU84tteaUuKTcpcSf3ix1+4UDVtvD0/iM25iTQ2+UfhTw7Bd5Ltgt+03PJKVRcw2w9D4wa08xPLpOVSclaO5a+tG+A1JAJeIdDNe1Ekxw4ojrd5zDbB0GgdtCz6NiX5+vQ+K8Nk2Zv5cbGNR4n/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734704196; c=relaxed/simple;
	bh=s7rqpd1mjl40lUv0Se4TtYGvbPHUeMLFx/l0Mmxbw0s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=e1vmnw/0mtFzEen4re5gVvaH940Ufg33iwJnPx9Wmj9QnA3B5JYlKTmq2sSz5f/gVK8+RB1vSYbKJ11GNoefZiUAjbRkYoA3DbqgvSiHwhn3EiTLkQA0KjhdGdbzxBMUZPRmwjBt9t/I5jkdVuiEYPXpwl0GXzYhlj7GpIyMhJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=fs+mHDxZ; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="fs+mHDxZ"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2166360285dso18781655ad.1
        for <linux-m68k@lists.linux-m68k.org>; Fri, 20 Dec 2024 06:16:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1734704194; x=1735308994; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=g7iBLKI/TaFFZvOKdERySTto1DEdoOqdcbn/lUOJJc0=;
        b=fs+mHDxZCTY7WY14Dceanv/1ICKtoDEvJ65WKJe1qsP+CQM5DxYdlx/hdD+X4eKO7P
         29VmzlD6BxfI3Dvval03e15oqUq26Yx7/UJQKQnfB8ggKBKeWk6lTfIkf8r5Il5r/vBI
         8zYTfMLzKf4r7cWMW+XwTWBeW9Q6/WeVe0R5B5++dZQ5+s30SV7/OkCmCPIfUdub7oMl
         ZUqQ9bGMYvr6hBZZzUs9VZJZlKHAeyIWJFw3kO35RXjvWtY4mhQcoi9A7qymnCYQgBOG
         bNdBlyKxMO0GtHAHl4Jk0f3mYQ2BgYDhTdfvnAbTAc0ExE5BBJPLIgzgjB9uC9idL+jP
         8+5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734704194; x=1735308994;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=g7iBLKI/TaFFZvOKdERySTto1DEdoOqdcbn/lUOJJc0=;
        b=NoA1F0uEYAgtLBxwdfEKOSj0fKRbOGy+nVoCaxcA6uXmdFINuVuN2EmZAsZRkE51QE
         wgia23TmPZbi1Db78J8Gz62LbZBMWXJqYTLlXvmnvBIsTjGGgKaHT/v8025aMbmjNnIw
         aQwEdXo2zj7/opH8/l1d9vMZZCfNJvd1vpsvAHxsb2DoDk8NhrLFc9EsLimxepgNrmaM
         mT/6g8u3yvD6p9F5nylykAMww+dCnCZuXEA5FjHyMjDbcQr6kIjTJ0BBmK87W48igIRr
         5ncsc2lUn3eWRi3Vv7WH1zsnICu9vFhVx6ypILaG0jz436uWU8AAYbjeazAlRfQQ6fQG
         /g0w==
X-Forwarded-Encrypted: i=1; AJvYcCWhEHUk0lRajix1TfftDJ4g/rkoz9/lVkfRLXs5WVCGLrfiFXVo31l1GyFOylUV0+RcKBwJhI5jGJkK@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YxEHYkdTdwFnoeqXuQ0VVTnnyd4YRm3RQtRQkY5ztQa23isgYSZ
	c/SlMuW9N4PFOtyZ/qFK878tgppyufJoUXM198O3A0+u+84W5XlqN+2+dybP1bw=
X-Gm-Gg: ASbGncupt/NjuA11yBUfUQHekgWrlzg5qKKLvf16CkLj4w/ofDeWXGH3I8srijbq8/Z
	R5bLHI7Pzz8y5623auCTuXTpw6fI4ONbVJ143KVOedn5z6aIdMcZ9UN+Keh4NrNaTbuR7YdC2C8
	aUixnI/UNEPW6FNxS1K5p8qzgxZospoao0S0+bjPmhM6HaUO01Dq7KhH9mdr0E22AMd7MuFxKRz
	ExKtaXOVDqwJA9Fjq83NinYw3F2Z84Y25E+/8Tpnfvy4rqLRxaiAw3vPn8/8n9PYkraPXoCAkV0
	hd963zLh2bacr0F2XxBZNEN8geSmrN49WZp66B2D0IWYO+u2kop3W0c=
X-Google-Smtp-Source: AGHT+IEEYygST4Gz03iGTM9RRiblbKn1x180pLztYOSIYhLMIpPKwcn4PYi8F34LVLcH4FrG3CDhdg==
X-Received: by 2002:a17:902:d481:b0:216:770e:f46 with SMTP id d9443c01a7336-219e6f26692mr39017935ad.54.1734704193630;
        Fri, 20 Dec 2024 06:16:33 -0800 (PST)
Received: from ?IPV6:2409:8a28:f44:3764:dc48:fb1b:dd06:cba7? ([2409:8a28:f44:3764:dc48:fb1b:dd06:cba7])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc972734sm29423545ad.88.2024.12.20.06.16.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Dec 2024 06:16:33 -0800 (PST)
Message-ID: <33ce9b58-4787-49cd-a7f2-34272cb3ecf7@bytedance.com>
Date: Fri, 20 Dec 2024 22:16:22 +0800
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/10] mm: Move common parts of pagetable_*_[cd]tor to
 helpers
Content-Language: en-US
To: Kevin Brodsky <kevin.brodsky@arm.com>
Cc: Peter Zijlstra <peterz@infradead.org>, linux-mm@kvack.org,
 Andrew Morton <akpm@linux-foundation.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Linus Walleij <linus.walleij@linaro.org>, Andy Lutomirski <luto@kernel.org>,
 "Mike Rapoport (IBM)" <rppt@kernel.org>, Ryan Roberts
 <ryan.roberts@arm.com>, Thomas Gleixner <tglx@linutronix.de>,
 Will Deacon <will@kernel.org>, Matthew Wilcox <willy@infradead.org>,
 linux-alpha@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
 linux-hexagon@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
 linux-openrisc@vger.kernel.org, linux-parisc@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-snps-arc@lists.infradead.org, linux-um@lists.infradead.org,
 loongarch@lists.linux.dev, x86@kernel.org,
 Alexander Gordeev <agordeev@linux.ibm.com>
References: <20241219164425.2277022-1-kevin.brodsky@arm.com>
 <20241219164425.2277022-2-kevin.brodsky@arm.com>
 <20241219171920.GB26279@noisy.programming.kicks-ass.net>
 <75cb4ff8-eb0c-4519-a30a-f8be717ba278@arm.com>
 <0daabd32-cba4-4345-baa8-e8c66bc899ff@bytedance.com>
 <2f65f93e-9d44-4acc-b63c-8f5a35f59699@arm.com>
From: Qi Zheng <zhengqi.arch@bytedance.com>
In-Reply-To: <2f65f93e-9d44-4acc-b63c-8f5a35f59699@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 2024/12/20 21:50, Kevin Brodsky wrote:
> On 20/12/2024 12:46, Qi Zheng wrote:
>> Hi Kevin,
>>
>> On 2024/12/20 18:49, Kevin Brodsky wrote:
>>> [...]
>>>
>>> Qi, shall we collaborate to make our series complementary? I believe my
>>> series covers patch 2 and 4 of your series, but it goes further by
>>> covering all levels and all architectures, and patches introducing
>>> ctor/dtor are already split as Alexander suggested on your series. So my
>>> suggestion would be:
>>>
>>> * Remove patch 1 in my series - I'd just introduce
>>> pagetable_{p4d,pgd}_[cd]tor with the same implementation as
>>> pagetable_pud_[cd]tor.
>>> * Remove patch 2 and 4 from your series and rebase it on mine.
>>
>> I quickly went through your patch series. It looks like my patch 2 and
>> your patch 6 are duplicated, so you want me to remove my patch 2.
>>
>> But I think you may not be able to simple let arm64, riscv and x86 to
>> use generic p4d_{alloc_one,free}(). Because even if
>> CONFIG_PGTABLE_LEVELS > 4, the pgtable_l5_enabled() may not be true.
>>
>> For example, in arm64:
>>
>> #if CONFIG_PGTABLE_LEVELS > 4
>>
>> static __always_inline bool pgtable_l5_enabled(void)
>> {
>>      if (!alternative_has_cap_likely(ARM64_ALWAYS_BOOT))
>>          return vabits_actual == VA_BITS;
>>      return alternative_has_cap_unlikely(ARM64_HAS_VA52);
>> }
> 
> Correct. That's why the implementation of p4d_free() I introduce in
> patch 6 checks mm_p4d_folded(), which is implemented as
> !pgtable_l5_enabled() on those architectures (see last paragraph in
> commit message). In fact it turns out Alexander suggested exactly this
> approach [2].

OK, I see.

> 
>>
>> Did I miss something?
>>
>> My patch series is not only for cleanup, but also for fixes of
>> UAF issue [1], so is it possible to rebase your patch series onto
>> mine? I can post v3 ASAP.
> 
> I see, yours should be merged first then. The issue is that yours would
> depend on some of the patches in mine, not the other way round.
> 
> My suggestion would then be for you to take patch 5, 6 and 7 from my
> series, as they match Alexander's suggestions (and patch 5 is I think a
> useful simplification), and replace patch 2 in your series with those. I
> would then rebase my series on top and adapt it accordingly. Does that
> sound reasonable?

Sounds good. But maybe just patch 5 and 6. Because I actually did
the work of your patch 7 in my patch 2 and 4.

So, is it okay to do something like the following?

1. I separate the ctor()/dtor() part from my patch 2, and then replace
    the rest with your patch 6.
2. take your patch 5 form your series

If it's ok, I will post the v3 next Monday. ;)

Thanks!

> 
> - Kevin
> 
> [2]
> https://lore.kernel.org/all/Z2RKpdv7pL34MIEt@tuxmaker.boeblingen.de.ibm.com/
> 
