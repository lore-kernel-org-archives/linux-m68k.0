Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7E0621C197
	for <linux-m68k@lists.linux-m68k.org>; Wed, 26 Feb 2025 02:40:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740537656; cv=none; b=uOtkP8uklaXRo0Q/C+Vz/Kkq9GQMICRWBNK/KqNk/pqfwwO3mMneQ5LLRbN7KgFkm7cJUYE2KUrYL1hgbFK5PLHydaVosEGAfmnxH30fFg7xOXbxOcC/04g1gLgHhoB3T/xbpKQocCFwRBI3RSVbDPTIs80/mtV606g/hDdqGMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740537656; c=relaxed/simple;
	bh=wjq1hhNmQD/Y69/cVuHxDfp8iNsL790jhspOLVSqRqg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=C25lopUSgqYTRXlJgsozVvBOOcLsTdXOypb6UygnKTCeUjSdtRL+45AD2mMaOul03RtcxD1OYWhuYLkRu2qcT57XrIqDEzxs+Pl31Sga1XqhOm8P/kasvA1YKjQ9myxmKonJpJkT41YfniiqVmKXZnVdnYkUTlLOGQ5RwmkzNoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=UPoWi69R; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="UPoWi69R"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-2fbfa8c73a6so12403707a91.2
        for <linux-m68k@lists.linux-m68k.org>; Tue, 25 Feb 2025 18:40:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1740537654; x=1741142454; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=faw8k4TIY5A7eHVQZOGgzqUSa20esi5XC3jgrNGM418=;
        b=UPoWi69RDfFCTWyc1VSz7nBUvJH/NMIUmmI3Ri/lcQVGAsvH1ShyHE09dokqE9iR66
         lmidVwWpK2q0pufB6iQoe5CYvAteurwg2R00KrBEmUFDIpnv8v8M8xhzqlxoUe4EssDc
         bGbyt1YdlRxEH5sqjNUWWkeEamBnZt1elvtYvAzwt2YExgyRCPfIGZix5QYn8yLBwMJv
         OCP/DC1eYqwmzG5ZBOMWkGshaTfX1n/ZxNQlfQxAQc79YPLz33e65NHkjbXocjfMehjs
         hUw7AkhLhaGhQjClbBmcyxvDQVrJcarWkz6gpl+szTNF9WVaqzkM2tA2XNqd2LhpRJDx
         dy9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740537654; x=1741142454;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=faw8k4TIY5A7eHVQZOGgzqUSa20esi5XC3jgrNGM418=;
        b=senKcKUuBwssvWR+cJZHQ7dU5fJNjgvMkxmMJto3CffBFyKnywRgIzi8535Re/+leD
         PuTEvNihZ3gOMx3TQ1MiGy9WkjUBx7JrtdsEkvcb6QTuIRQunGM9rqgvdWz9n+Rg3SQD
         pcQBgbbOSQXOiQp3Pk0jGFND6bsenZFdEDHnxkiX4Fns9aXWWeFAfzp5Grhy1xeX4CSE
         Fgd/YMUjfR3aSG0iM4/RCX3t1xIfY0VdYTwMr3HTV23cvk0A83WSquwqRtHd6S4PlEYS
         ukitzd+vQCguO+lXRjbkN39rlF3FH+ANmMJSsnhCb+ITxXXpi0XpCtKmD8XbERMJ/S8Z
         4ZPQ==
X-Forwarded-Encrypted: i=1; AJvYcCUTk91eOavt2cQZjy7aF+Y0Z+Ag1lIs2ggCAEvyAQx2Tnsh+jFEZRJoqF1guOCdcUGc7EHWnoPSGYvm@lists.linux-m68k.org
X-Gm-Message-State: AOJu0Yz3gRObxwyma8T2qYsBTzGFZAwKOEpOrTy6xHU4dfqMFtg7FoAY
	hiVlBWSEUbHGD3RJE1expilP4OkwDF26VmHTDuUyIVJfPye2yvFWNpkTA3E2Uwc=
X-Gm-Gg: ASbGncvu0AyO6kUDljy7wtHquDrI4FeE00cTta+8rviVE/QA+thGE3llRMua/41xAaX
	JuMGsWHVU0nE/eG2RrHIBCiRNsGN5tSkhMRIojhH5lU2rAN6mz2jdxQZEj4T0/2NYZvRChfwkYv
	7yMkUwW92TPEBXfk9KCaKJdUOwtw0qiepyrMRdESe6SDVEyebM8ZwpeDZ27nzDDk9jieOvkjmnG
	iyp+1/+ifPh+FnwtkWBdUs54+PjvppW/AIBYTpuc8l1evDZM4kmfDdPkitn3YwVW39qYIs4ydIb
	GR606So3yMbBhOP6ZYI31OIwRoVOz0mnzcXCUZ7hY33Khi0iYQ==
X-Google-Smtp-Source: AGHT+IGBavOro6p44pm0knw7epDm1Ms4/cRCm5nI7A9v1bvB0aFlwIUaa3TK9A89BXdQQHklrRCMwg==
X-Received: by 2002:a17:90b:2242:b0:2ee:ee77:2263 with SMTP id 98e67ed59e1d1-2fce868c4f9mr34212880a91.7.1740537654049;
        Tue, 25 Feb 2025 18:40:54 -0800 (PST)
Received: from [10.68.122.90] ([63.216.146.179])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2230a000a01sm21742845ad.40.2025.02.25.18.40.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Feb 2025 18:40:53 -0800 (PST)
Message-ID: <3e3ab5b0-4669-4d7a-a7bd-6f5963662757@bytedance.com>
Date: Wed, 26 Feb 2025 10:40:42 +0800
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/6] x86: pgtable: convert to use tlb_remove_ptdesc()
To: Andrew Morton <akpm@linux-foundation.org>
Cc: peterz@infradead.org, kevin.brodsky@arm.com, riel@surriel.com,
 vishal.moola@gmail.com, david@redhat.com, jannh@google.com,
 hughd@google.com, willy@infradead.org, yuzhao@google.com,
 muchun.song@linux.dev, will@kernel.org, aneesh.kumar@kernel.org,
 npiggin@gmail.com, arnd@arndb.de, dave.hansen@linux.intel.com,
 rppt@kernel.org, alexghiti@rivosinc.com, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, linux-csky@vger.kernel.org,
 linux-hexagon@vger.kernel.org, loongarch@lists.linux.dev,
 linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
 linux-openrisc@vger.kernel.org, linux-sh@vger.kernel.org,
 linux-um@lists.infradead.org, x86@kernel.org, linux-riscv@lists.infradead.org
References: <cover.1740454179.git.zhengqi.arch@bytedance.com>
 <36ad56b7e06fa4b17fb23c4fc650e8e0d72bb3cd.1740454179.git.zhengqi.arch@bytedance.com>
 <20250225183519.91a5b75b13c0df6954c68576@linux-foundation.org>
From: Qi Zheng <zhengqi.arch@bytedance.com>
In-Reply-To: <20250225183519.91a5b75b13c0df6954c68576@linux-foundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 2/26/25 上午10:35, Andrew Morton wrote:
> On Tue, 25 Feb 2025 11:45:55 +0800 Qi Zheng <zhengqi.arch@bytedance.com> wrote:
> 
>> The x86 has already been converted to use struct ptdesc, so convert it to
>> use tlb_remove_ptdesc() instead of tlb_remove_table().
>>
> 
> This is dependent upon Rik's a37259732a7dc ("x86/mm: Make
> MMU_GATHER_RCU_TABLE_FREE unconditional") from the x86 tree.  I'll add

Yes.

> Rik's patch to mm-unstable also and shall figure it out during the
> merge window.

Thanks!


