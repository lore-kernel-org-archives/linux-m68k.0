Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E756189902
	for <linux-m68k@lists.linux-m68k.org>; Fri,  3 Jan 2025 03:54:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735876454; cv=none; b=eGzWkHg+lz+Snuisp+n7tuqIQAxQYrd0xaigdylyTOJkhARMsWz2JxOl5fQ+2Ko3rUlH6X+EEy5Lx9qEtHOvFW0RoEOzmRoKEYwGcSEeT7o8rBKkKc4Py93MQsdz+JBkT9JB2hqDPzEySZB8K8VCOATu7IA+yagGtj/1L1IAgig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735876454; c=relaxed/simple;
	bh=FQ5D1Kx+YlPJIwMGyXspAy7bXvtTs/Tb+GWLn9dccaw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jRJ3dTlhHKDwhXe7H/ZT4ixEdlAKHF5eA6KnVyfKI+oskEPbFbFmWtmWmm8qlDHEqpVrlRFTfa1G6sSxm/ETC1rc+L+4mBFDtcUnKatY0qhFyQvJ8IoSBgVPPZObNIeGC4nno871kMTar7THoF9sbNVlxKgCc7rdpvgcQPqJAVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=NZjPK+L+; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="NZjPK+L+"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2163bd70069so65841445ad.0
        for <linux-m68k@lists.linux-m68k.org>; Thu, 02 Jan 2025 19:54:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1735876451; x=1736481251; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ExtURrdtg4wvz/5S73kPKLfYL+g+cN7JWlBZcDSiUw0=;
        b=NZjPK+L+5edxFAea6/NqHJpT1oAi2PHtHxQxFxUN5ag49zIY8vURl7G5IiGSv1wz4Z
         zm+dU/me6ajKLZEXO420splxy14mdsCdcKM3vDV0bEUbnZIcAkHSf6EyR7qerd1qGqLi
         8Cu3YuEOHzIHk5k1hrIlnznGW7v9PtNca6XUuf5n2s4FzDbfOFgqycLOsqyEWtQSbiVu
         tteRAdJdvJy5u9bpvZTrT39M73lFUC+L0XabHvZk3iicjtgyLpORAldcChdPLzO6Z8z6
         O6avjTGXV3IArMcxG82XSz01V29tBQ9dJHAdqQJ13SNOgsuVDgFhJ3pLZMUb7pru7tnB
         H5iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735876451; x=1736481251;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ExtURrdtg4wvz/5S73kPKLfYL+g+cN7JWlBZcDSiUw0=;
        b=o2clUfd5SYt2kThGRCSQKD8DyRMgxn2kSbVjuQvvjdsZKm2Oc8iB05torBpVS5b14J
         9RMZZC2TR5WB2fG5IEqC5h7St/aMtjMt+urw2n4Pi2tcwqQ65Sqtm8+Cv1Ha+XFE2xBX
         PBmXnB1eeWJIqnUPiJ1t0oSYin7uxoCavFe5iOItoobPxuKsIV5BIWWas4mk4BeZV6On
         K3hytMjCkjxdM36a2/xMW4QLa/tl3i0+8Ni2ceYopqCfRItpkGjZZc66xs6NzCk37KNp
         uZATr3OMjql4hvUTioj0+QXQ9Eyh0w/hQft1XEtfenu60CMmMaSWTLyhB/TptVCn5/+L
         VdPA==
X-Forwarded-Encrypted: i=1; AJvYcCXU/15Of3EpyzwLzqVJOMq6p34XOTWgTvXKde0MLblW03qkz933HDUm4Ztlh5IqIVUGAmr4Baf+qVwW@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YyIYgfYtx+Gt/iZ+LXYXFQ+KhlTNMioTs2vabve56wKYhgR4H71
	rrM3zMm/qgNrmxDHHUz/UZLrThv/Elr16boVQaARhHKeWNhyLEUUWw0P6s8j4IA=
X-Gm-Gg: ASbGncsFfWwf4KtCzDTm83EEbdi1OPpVZeCJxITvZAzFhsbycgal9jaTKQxyC/sNbCQ
	SC9xcYaPAAHFVaerzBZ0DDGmOBfLYQE2kKUbHVRxDL8GGEuWPmNH94d4qbhfE/T3Ui8VcjfL8aB
	nLcEXLpAftxWYwawFPl+MyGfe3kEAx+YFCM93ZXLRpzzOZykmBRKJioz6VRebbHFijTv3hR9Frx
	QdMfl8oSMcWPLXT+0xBU3rQRNY6WCF9d+8C+537SeGIdZ705GhPUBPqbKiPdv7Oj2pEy5QR/PPV
	dlDkKg==
X-Google-Smtp-Source: AGHT+IGRLBberTsNPcVz5fDDiJ496OTTAGvxwwTdPWwuUiji7gMKzctc+wxIQ/Y0LkCE8MhlfHWUlw==
X-Received: by 2002:a05:6a21:6d86:b0:1e0:ae58:2945 with SMTP id adf61e73a8af0-1e5e081179bmr90059001637.31.1735876450877;
        Thu, 02 Jan 2025 19:54:10 -0800 (PST)
Received: from [10.84.148.23] ([203.208.167.148])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad8fba98sm25284573b3a.161.2025.01.02.19.53.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Jan 2025 19:54:10 -0800 (PST)
Message-ID: <77c202bf-e0a3-45e7-bf8d-eef7903e3c64@bytedance.com>
Date: Fri, 3 Jan 2025 11:53:56 +0800
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 04/15] mm: pgtable: add statistics for P4D level page
 table
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
 <2fa644e37ab917292f5c342e40fa805aa91afbbd.1735549103.git.zhengqi.arch@bytedance.com>
 <237a3bf6-c24f-4feb-8d3d-bb3beb2fd18e@arm.com>
From: Qi Zheng <zhengqi.arch@bytedance.com>
In-Reply-To: <237a3bf6-c24f-4feb-8d3d-bb3beb2fd18e@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 2025/1/3 00:53, Kevin Brodsky wrote:
> On 30/12/2024 10:07, Qi Zheng wrote:
>> diff --git a/arch/riscv/include/asm/pgalloc.h b/arch/riscv/include/asm/pgalloc.h
>> index 551d614d3369c..3466fbe2e508d 100644
>> --- a/arch/riscv/include/asm/pgalloc.h
>> +++ b/arch/riscv/include/asm/pgalloc.h
>> @@ -108,8 +108,12 @@ static inline void __pud_free_tlb(struct mmu_gather *tlb, pud_t *pud,
>>   static inline void __p4d_free_tlb(struct mmu_gather *tlb, p4d_t *p4d,
>>   				  unsigned long addr)
>>   {
>> -	if (pgtable_l5_enabled)
>> +	if (pgtable_l5_enabled) {
>> +		struct ptdesc *ptdesc = virt_to_ptdesc(p4d);
>> +
>> +		pagetable_p4d_dtor(ptdesc);
>>   		riscv_tlb_remove_ptdesc(tlb, virt_to_ptdesc(p4d));
> 
> Nit: could use the new ptdesc variable here instead of calling
> virt_to_ptdesc().

Right, but we will remove pagetable_p4d_dtor() in patch #10, so this
may not matter.

Thanks!

> 
> - Kevin
