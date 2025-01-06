Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48CD31DE4D0
	for <linux-m68k@lists.linux-m68k.org>; Mon,  6 Jan 2025 13:23:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736169807; cv=none; b=gn0E69J7azPINkYOd9dirzs3t4GnVemtrvSsX0PhzoCy4cXP95ErHKgb8QHPBOSQQ+1aFs3XeeuR8yXeekK2u07tCfzPE6o7z8EuhHFx+Mx22ENfDlIYJGsgtw6j0jcm7B1And6Se/vCt/daoL/ewkbAgFF04fBh55iDFNXP5kk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736169807; c=relaxed/simple;
	bh=AslleoXTRiRbWr13FtvX0Ckl/9sdreGxSQ4NH4wFg4A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=b8Vr4Ycb28SnfdqfjvyTF1s8DeAPKhNVxApwNnEk39Dvqf+RtXQpN8VGm1n7KT4VVO+YQ7DyANxmxPW45jy/sUzADPNkU9bNmvwE7qtwXKKHMICfllJB6/3vTBP0kQLBJIQQS6vXTC7NpaI6hc9SPMCY/fzoo4i0HCjX0jFwuZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=eYdWuF1S; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="eYdWuF1S"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-21669fd5c7cso208853185ad.3
        for <linux-m68k@lists.linux-m68k.org>; Mon, 06 Jan 2025 05:23:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1736169803; x=1736774603; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=af8Jbj+kqP+p1W8uyVyt9V0YBDVs6Wu8XxDGXWv1rDo=;
        b=eYdWuF1SqcQ7XACZMmAKK4CMN3Gisg2RC8/BVpJtuSYxU0FiZtAA1AN6f7rcDSQ2MM
         pGk1+hMjB0DpcKzC8ul6CXpBZCzf0UnYChSzIjbQOUw8XhwqCHsnTs93w0KsUW9wYiE0
         YPvic82YGAKHZ+ydQ6YhSiMJAJIR3a31Ly2QiVvqFQQbW/r+IJic4JAiixfVBD+1un/L
         syiLlYh9msjRChlGXtVaJYbGeZ1+Ep1AwH9pVxZahYHoRK37Bp3w5I+eSGB/NMsJXz3y
         QTt00/tylhZxc+FBs5YtY0lg+Ckf4rmgdYQEbCGNzugxkp97Jx9Kawdr9C+MpQoWoiWh
         0P/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736169803; x=1736774603;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=af8Jbj+kqP+p1W8uyVyt9V0YBDVs6Wu8XxDGXWv1rDo=;
        b=puKG3vCPMqaR3jMNJk5x8aHrgzLRtAqK8BwS3kbtZWTyRRk8RYYE4AHSaYeCer88xN
         uPurhznoObFh8dGORYVoxInKFK+ad75ZAgHGqWasrCJ89MobrA1X4YYrKQDgViEE4YaC
         2GrlW+eIBUPpivJXj5GnvLGpKtoE7VEnpKOcV5vvgzU4gnGqKAf4XG0Kj25HBVbfZMMf
         NWE68+9ROr0R1iYj9VV/u90nHTHc3H3Ymatti9yVmkTpjwHROSaSRT/XxgynMJkZPoGs
         oKSslU+loDVRLCqbrBi6jLS4kpUtoT6NA/sRBeVO11DdPJosjgqiYHfa2PJ/eG7PVd0X
         Mv4Q==
X-Forwarded-Encrypted: i=1; AJvYcCURmqm4JM65Hj3cwIx68hh2LQ9nBPIwfoEZifDwskURwE5HRrISkkp3Ki4MMje41N/HkTbQslP7A6y3@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YyLo5B9x0SZu31cyH4dwFKipJDYKSBJbbPCohdDRkRQbkjyIe8o
	Sa6Qq6ZgLc/dL5jrPYYQvEzL4vTn0k0/0k2mK3U7ElbHMUHSrC+rAISaTgOdGWo=
X-Gm-Gg: ASbGncvkP853YxuZAe2bNn5QgB3Gvk7O4KyOs6Fls/NwxX5esDM0JyuoE7CzDwV5AKR
	IlSz2X63XVE+ZEpVFS2k2ECvpbfLHg3NKOwMqK5pzOYATcVRZyzWOBCNb/lBtLjuiosrsGwpU9/
	I1Cz2j5TKpZHAFsg0EPbagEphgK7Vx5GbiCQR8n0+9OeMdwC7WXFnH2elma8ZuJ3ibwgR0ORJru
	0pCJw5DJk/RqEq1vEJVxQUSuzbWLRYrcbhZ9IVXXOvKEz3De+D/Ff/ifBy8900X48gG0qsc26yh
	uyQ8UO9sLI2mgxK8FimniVwDA7Sz5PkQYZXU7wA0QAPLIAL7mSkQ
X-Google-Smtp-Source: AGHT+IE/ZrXmD5LZyqp5+IF7XucHWltqSucrfnZMLD6UEt/qaBj6OXgwMq9je0lWMbXPRWlni+TKWA==
X-Received: by 2002:a05:6a20:2d07:b0:1e1:b44f:cff1 with SMTP id adf61e73a8af0-1e5e07f9c06mr81291446637.33.1736169803320;
        Mon, 06 Jan 2025 05:23:23 -0800 (PST)
Received: from ?IPV6:2409:8a28:f44:d64:296c:a8f3:f81e:f88b? ([2409:8a28:f44:d64:296c:a8f3:f81e:f88b])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad90c149sm31371677b3a.191.2025.01.06.05.23.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jan 2025 05:23:22 -0800 (PST)
Message-ID: <bce4bb4e-459a-44c8-945b-8889149377fd@bytedance.com>
Date: Mon, 6 Jan 2025 21:23:10 +0800
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 07/15] mm: pgtable: introduce pagetable_dtor()
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
 <8ada95453180c71b7fca92b9a9f11fa0f92d45a6.1735549103.git.zhengqi.arch@bytedance.com>
 <Z3uxwiEhYHDqdTh3@li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com>
 <e1de887c-6193-48ee-a9b3-04c8a0cdda45@bytedance.com>
 <Z3vOZ18jcCpHIcPD@li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com>
From: Qi Zheng <zhengqi.arch@bytedance.com>
In-Reply-To: <Z3vOZ18jcCpHIcPD@li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 2025/1/6 20:36, Alexander Gordeev wrote:
> On Mon, Jan 06, 2025 at 06:55:58PM +0800, Qi Zheng wrote:
>>>> +static inline void pagetable_dtor(struct ptdesc *ptdesc)
>>>> +{
>>>> +	struct folio *folio = ptdesc_folio(ptdesc);
>>>> +
>>>> +	ptlock_free(ptdesc);
>>>> +	__folio_clear_pgtable(folio);
>>>> +	lruvec_stat_sub_folio(folio, NR_PAGETABLE);
>>>> +}
>>>> +
>>>
>>> If I am not mistaken, it is just pagetable_pte_dtor() rename.
>>> What is the point in moving the code around?
>>
>> No, this is to unify pagetable_p*_dtor() into pagetable_dtor(), so
>> that we can move pagetable_dtor() to __tlb_remove_table(), and then
>> ptlock and PTE page can be freed together through RCU, which is
>> also the main purpose of this patch series.
> 
> I am only talking about this patch. pagetable_dtor() code above is
> the same pagetable_pte_dtor() below - it is only the function name
> that changed. So why to move the function body? Anyway, that is

Ah, I just don't want to put pagetable_dtor() in between
pagetable_pte_ctor() and ___pte_offset_map(), so I moved it above
pagetable_pte_ctor(). No other special reason. ;)

Thanks!

> just a nit.
> 
>> Thanks!
> 
>>>> -static inline void pagetable_pte_dtor(struct ptdesc *ptdesc)
>>>> -{
>>>> -	struct folio *folio = ptdesc_folio(ptdesc);
>>>> -
>>>> -	ptlock_free(ptdesc);
>>>> -	__folio_clear_pgtable(folio);
>>>> -	lruvec_stat_sub_folio(folio, NR_PAGETABLE);
>>>> -}
> 
> Thank you!
