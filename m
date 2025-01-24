Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 570F4524F
	for <linux-m68k@lists.linux-m68k.org>; Fri, 24 Jan 2025 13:04:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737723856; cv=none; b=d8FGPyHP8+te5bRsovU7MLc35YnHObW5OzdDwPHyIRWQyAb9CrfwM2GZEf08+yh3sO0ZBVqju3G9YLuzx592nIOQs5mzXlbeYJPelVV4Dyl/umX9QTPcPVva50klAzqURMfULvClhs7xTbj8kjd3Ijc0vcHiOjXnfbg6SvF+908=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737723856; c=relaxed/simple;
	bh=6DUwB+hCjWKh6+gmJpLDb9ZpCQfqoZDHN+wZTg6VGKo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ktnr7oJHFcLWo2VjvLqh0lRwJXxdcZG2Q/uu+WHxgrl6Ibtb3/A2Dy1Srz4ypNMj1MepS4gnI+ue7lf61PgkVIUm/tQEFRoA/+gQU5oB0C0/QDncKzZki2dS/REkvNUs/SZzfTzcBs1FXSQ7YDbcFeUEWoJvylhJy92QmdHsGcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=YJzP4Vwc; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="YJzP4Vwc"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-2ee67e9287fso3755020a91.0
        for <linux-m68k@lists.linux-m68k.org>; Fri, 24 Jan 2025 05:04:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1737723855; x=1738328655; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dId7b4yz8t9ytNzoIMZDzDyU9S5trP6VQ+ykZ7MFw3k=;
        b=YJzP4Vwcf4HfGYF5U/hbtvc1UrDAceJ/WdhPIFtVseWFw6dvYObSdh1TVAK1IfITYy
         m/xbyL7wzKDCkHdITpu3OSLhFiPa55Q2e1bvjZQa7iA3Fk6sjtJObXOYJi9UMJD1YZ1S
         YBks8diZXvF9nKQc9NX9wQQQ1wbX4GX/Nam3qCRosSu34ciFc5dtrqswL8c3xKqPcbEP
         b+hWC3z98GgiZOiJaW5zQKD6rJboTiO4M72p9fHDdBrQj/1F+RdfIyCQm4/ekBzRg1Q/
         KbIBVZAA1A1PwpsG//XT91W1JFkffdQBUPLN4oMb+drntTdZS6KeLZZgdRdik51zgLof
         q8kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737723855; x=1738328655;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dId7b4yz8t9ytNzoIMZDzDyU9S5trP6VQ+ykZ7MFw3k=;
        b=bVuCa4oYgDn5PasAMFuy9ck6R8+TT+d/HMV4f2a0FZT0EBnJtLxP4LZvt8GkfWGSvM
         MLsIubuck6VaFInM9Ii7ZNW9vhOw+nRbd5k0nWnv3PEZv4BaH7KWdD5wVi1CX1dF74el
         R4hjCLxUJvkyw/eMByEYGZOO3M/x5atQ5rx+p9bjgaOjXmdMsEgpWH6fbeXWG13VUCY6
         ji31hCTmmxt5xh6ozNsfeEbZbNmYnepiiOyIGuTfdmMZzPq9oEuaSs9MhSBV2bq0uZsW
         9JoU0+JyvZmF4xWVFJtgyTog6SaIyPLOOEy6QuVRpAYE25aDrbSHd+KfmtQMWV1DlcQR
         VIow==
X-Forwarded-Encrypted: i=1; AJvYcCUuTeYAiQ6f2FwbfvgBej+XF/J4hrRGDojmjo7S0Vms9H17pRiK4adyMz9Mn7Gk5XfLY0biq2xAS66h@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YwesU9O3L7dx/8oziF3Y3cQeGBC9dPnc/jnG3W3/TYgETGLltlQ
	DlfFMmvYb8N72xFKVUcapRAVoxRFCmHpB3YAXdd78BX0N/sLw28vu/rhnUmdhYI=
X-Gm-Gg: ASbGncsQHLn6fPupBot0Lkm87GPEvHfGaEF4si7vp+3mkXVDCwTKrbWbBJztGjPZeW7
	X0F5MQvMdNXL2D786Vrry0WhZhNq5hEtZaDEEuQ4Z+1Ez0Z7tHPZoOpz5PvYzKYA4fNKIi0qnFk
	arE40R1yvhaGRczpXHhtjFJs3DZ0YpQJSJRW8zIziCXznACHENH+mIByNgIB4k1aJYS4qUnbVdm
	P8iFQu9eAIFAZVD3KZNgIM5a6X0ghzylT9O0dYEC/wlxigIhYZ6ZAwzX6X3G9akKAj9aW7rI1HY
	E/kobspceAOFIvYXtNlu9bdgsbg0YbPnZsSuv0iBSafCLNRFQTtNagmDxhJV3F3DwtfM08yu9gR
	Y8NZh
X-Google-Smtp-Source: AGHT+IGZTgGY31e/1k/dTmcJmo/YDWxdXL7RglCap7bUypXHuwXLFHjK5+LGZw2OAN+HVTY4hEX3Xw==
X-Received: by 2002:a17:90b:2d88:b0:2f2:a664:df1a with SMTP id 98e67ed59e1d1-2f782c628bbmr47170073a91.2.1737723854887;
        Fri, 24 Jan 2025 05:04:14 -0800 (PST)
Received: from ?IPV6:240e:370:8b13:5250:f0b9:2326:6cb0:b423? ([240e:370:8b13:5250:f0b9:2326:6cb0:b423])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f7ffa5a975sm1776638a91.15.2025.01.24.05.04.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Jan 2025 05:04:13 -0800 (PST)
Message-ID: <65710478-4ee0-499e-9f66-dff81e226042@bytedance.com>
Date: Fri, 24 Jan 2025 21:04:02 +0800
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/5] remove tlb_remove_page_ptdesc()
Content-Language: en-US
To: Peter Zijlstra <peterz@infradead.org>
Cc: kevin.brodsky@arm.com, riel@surriel.com, vishal.moola@gmail.com,
 david@redhat.com, jannh@google.com, hughd@google.com, willy@infradead.org,
 yuzhao@google.com, muchun.song@linux.dev, akpm@linux-foundation.org,
 will@kernel.org, aneesh.kumar@kernel.org, npiggin@gmail.com, arnd@arndb.de,
 dave.hansen@linux.intel.com, rppt@kernel.org, alexghiti@rivosinc.com,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org,
 loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org,
 linux-mips@vger.kernel.org, linux-openrisc@vger.kernel.org,
 linux-sh@vger.kernel.org, linux-um@lists.infradead.org, x86@kernel.org,
 linux-riscv@lists.infradead.org
References: <cover.1737637631.git.zhengqi.arch@bytedance.com>
 <20250124114759.GB15996@noisy.programming.kicks-ass.net>
From: Qi Zheng <zhengqi.arch@bytedance.com>
In-Reply-To: <20250124114759.GB15996@noisy.programming.kicks-ass.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 2025/1/24 19:47, Peter Zijlstra wrote:
> On Thu, Jan 23, 2025 at 09:26:13PM +0800, Qi Zheng wrote:
>> Hi all,
>>
>> As suggested by Peter Zijlstra below [1], this series aims to remove
>> tlb_remove_page_ptdesc().
>>
>> : Fundamentally tlb_remove_page() is about removing *pages* as from a PTE,
>> : there should not be a page-table anywhere near here *ever*.
>> :
>> : Yes, some architectures use tlb_remove_page() for page-tables too, but
>> : that is more or less an implementation detail that can be fixed.
>>
>> After this series, all architectures use tlb_remove_table() or tlb_remove_ptdesc()
>> to remove the page table pages. In the future, once all architectures using
>> tlb_remove_table() have also converted to using struct ptdesc (eg. powerpc), it
>> may be possible to use only tlb_remove_ptdesc().
> 
> Right, so I don't think Sparc and Power care to use ptdesc, they're
> using non page page-tables.
> 
> At the very least we should do something like this, the only point of
> having tlb_remove_ptdesc() is type safety, there really is no benefit
> from it in any other way.
> 
> ---
> diff --git a/include/asm-generic/tlb.h b/include/asm-generic/tlb.h
> index dec030cb1210..a6731328db6f 100644
> --- a/include/asm-generic/tlb.h
> +++ b/include/asm-generic/tlb.h
> @@ -504,7 +504,7 @@ static inline void tlb_remove_page(struct mmu_gather *tlb, struct page *page)
>   	return tlb_remove_page_size(tlb, page, PAGE_SIZE);
>   }
>   
> -static inline void tlb_remove_ptdesc(struct mmu_gather *tlb, void *pt)
> +static inline void tlb_remove_ptdesc(struct mmu_gather *tlb, struct ptdesc *pt)
>   {
>   	tlb_remove_table(tlb, pt);
>   }

Ah, make sense. I think this can be added to the patch #1.

Thanks!

