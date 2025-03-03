Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFB0B1E5B89
	for <linux-m68k@lists.linux-m68k.org>; Mon,  3 Mar 2025 07:15:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740986140; cv=none; b=LkqHjFV79rvLqMBtXHtg2/PcQzc0BdDYd7QvX8xwU+nCJfqxzLzbzgm5o+EKs4N2K6ZsNBSq0+73xFSUCTCuC4HRNIuLCw3l6HRykP7YsdN1XK9jSvPu3UYgfz/PYnKvyygKeldhn47Uz0ZWEWUBIaxZDCG4WQaArp2UEhjP79M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740986140; c=relaxed/simple;
	bh=cyZ+Grt5WsWeJ35wJ4Miw4zucqCOoTXmPw42CecotaE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RRHG4qa/A2btEukAcWzbjJwg8W8Kuoy+iOpGKDgvIPrQPOvexp0JvX6PQ9NOi4wb+XpZdVNwFT7YEmXa8FprlkpYnsJ/280Fjl9f9KWQyMG0e75rigIsBwLOMuSYfr3NAxpVVbowAHhb2fI5CXJiYNwj8zH8qxq5j+TmQJBu93k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=Ljyywa6p; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="Ljyywa6p"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2239c066347so17245805ad.2
        for <linux-m68k@lists.linux-m68k.org>; Sun, 02 Mar 2025 23:15:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1740986137; x=1741590937; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z3xf7HJyOLISUqnBF4lpknQTsncyxq6apcdgU1Q2bwI=;
        b=Ljyywa6pSOzR0ZICXjPgDBHZkOepr5K0VMmCQvEorW3BgrWMBUbxc55DST8LDRzSw4
         u5Zlr7TTv6H+fgd36PHfVDQN11axUDU0k6vm/K0T6CEpuV1gAn9lq3/GXtJZ3iZ3/Uzt
         NZm0kjfrjyxM73I/m+zCp5ZXOZNPBhw2QGB+77nQjV32IEDvTkQHL4tfb+elwgnix4pE
         2D5nJdwfUfqlv0KEmJOaATv45COAJlE5Eahm1prnGZMZ6txwjhGfA7WYq7ID4dWXvHuG
         3+Ig3DTUgfUm9Vp/W+zP32Qy9sx48YnFpi8ohFmoKLvmo2GqSjvCiE+G/Z58BlA9ZxE4
         cpjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740986137; x=1741590937;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Z3xf7HJyOLISUqnBF4lpknQTsncyxq6apcdgU1Q2bwI=;
        b=lf5McKvF6oOgY1IRYqSE6xjSSC1nBNsP8nwbkcoxEyUKRk/sX38/hVjfeOxpLMOddO
         BGTrFCx7XBZkWYZODtI4/6ZH+RRV+2SfuU3ZdB+5TyHgVbSKi5zxb3ozHV/joIII6aYZ
         OJpxKJq7+LNwtXTm2CpAG64u7fFjI6Jz9FFR8WlPgrHGr7JV2fSfEd2o7IhGBgWhjLBN
         /C0c3ER3nclZB8sHfNTNq2ASI+hRLSzvBgLvZ1oMmW6VEnmQvTOze7v2TyhL4a7gUmlh
         ZZuqSUgcKtlFvcMjg2VQPQl3VYb1kgUNvQoqgI8dHeOF6n5qGtP9xLJIQhi9zeRsvxGg
         exPQ==
X-Forwarded-Encrypted: i=1; AJvYcCUFQ/WoWKWt1trgn0PVzkNpbSnaLfoG0AtkERzpg24BgTcsFTEbAJUZvx7OIsidb9Sp3Mmmvg7qfETE@lists.linux-m68k.org
X-Gm-Message-State: AOJu0Yzq4vGnCNsGlNzFOmYDqQANITKZrn3PO0zKFsQL+IGBvdIBH1HO
	jeaCgd/lhhTOCj9bSJ5JVn0TvuPcXXqDFAUkFy96qWKThLYTyGKTn2e9cIxyHbo=
X-Gm-Gg: ASbGncsH+J08ZCxwZ6u8OHMlFoEH44MRSl17AfZiSxClJNWr2Bsr3vP7CLq5fc8rIJP
	gGJJ1Eqml48y8PvZHOa+CLAHJVLAtC0pquIoRD7I4Xc4KyWwXLX6OiHXscMZq2/DcGxrwMn5I2t
	n67eIIPRYoiKfpd2PI5rMJ4T52liDy7VJI/Four9AH0OJfHp23F36IuQvskog10LcDCzK3sygxO
	iIMaNEO8LoSsB+vylppAryk3aHDZ4hQO7o5G3wAAOjY25DVswjF7HUevAJzPPeV50YZwGX0Zsl9
	Ky178hOQc3sw5LFAgyfFm8InY9JEDUpzASDkVGzcuQRod9HSy8QtgBJA/nDlClB+hoCwNQ==
X-Google-Smtp-Source: AGHT+IFFzAQLESy+9XTrR371K4l9s8+Ug8zXVzf/oXiEIXCRNjxwSBTp4Oh3Iq6eaMxuwqzsZm0CFA==
X-Received: by 2002:a17:902:f64a:b0:223:5645:8e1a with SMTP id d9443c01a7336-2236926727dmr181629675ad.51.1740986137075;
        Sun, 02 Mar 2025 23:15:37 -0800 (PST)
Received: from [10.68.122.90] ([203.208.167.148])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2235050ce10sm71093955ad.200.2025.03.02.23.15.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 02 Mar 2025 23:15:36 -0800 (PST)
Message-ID: <4eb93ca8-7526-4709-b43e-2ed9e5583e3b@bytedance.com>
Date: Mon, 3 Mar 2025 15:15:22 +0800
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/6] riscv: pgtable: unconditionally use
 tlb_remove_ptdesc()
To: yunhui cui <cuiyunhui@bytedance.com>
Cc: peterz@infradead.org, kevin.brodsky@arm.com, riel@surriel.com,
 vishal.moola@gmail.com, david@redhat.com, jannh@google.com,
 hughd@google.com, willy@infradead.org, yuzhao@google.com,
 muchun.song@linux.dev, akpm@linux-foundation.org, will@kernel.org,
 aneesh.kumar@kernel.org, npiggin@gmail.com, arnd@arndb.de,
 dave.hansen@linux.intel.com, rppt@kernel.org, alexghiti@rivosinc.com,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org,
 loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org,
 linux-mips@vger.kernel.org, linux-openrisc@vger.kernel.org,
 linux-sh@vger.kernel.org, linux-um@lists.infradead.org, x86@kernel.org,
 linux-riscv@lists.infradead.org
References: <cover.1740454179.git.zhengqi.arch@bytedance.com>
 <9025595e895515515c95e48db54b29afa489c41d.1740454179.git.zhengqi.arch@bytedance.com>
 <CAEEQ3wnvgX=Bq=oAQV6wfg5a7H2jiG7f8P6trbC9agJ8D6t4pA@mail.gmail.com>
From: Qi Zheng <zhengqi.arch@bytedance.com>
In-Reply-To: <CAEEQ3wnvgX=Bq=oAQV6wfg5a7H2jiG7f8P6trbC9agJ8D6t4pA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 3/3/25 9:45 AM, yunhui cui wrote:
> Hi Qi,
> 

[...]

>>
>>
> 
> This set of patches mainly refactors the remove page table function
> interfaces. The comment "riscv_ipi_for_rfence" has been removed, as it
> was no longer needed, and this patch handles that.
> 
> Additionally, whether riscv_use_sbi_for_rfence is true or false, page
> tables can now be released using RCU. This patch changes the previous
> synchronous release logic (for !riscv_use_sbi_for_rfence) to an
> RCU-based release.
> 
> So, Reviewed-by: Yunhui Cui <cuiyunhui@bytedance.com>
> 
> Based on qemu-system-riscv64, I tested this patch. The log is as follows:
> ./gup_test
> TAP version 13
> 1..1
> # GUP_FAST_BENCHMARK: Time: get:663365 put:117 us
> # ok 1 ioctl status 0
> # Totals: pass:1 fail:0 xfail:0 xpass:0 skip:0 error:0

Nice.

> 
> So, Tested-by: Yunhui Cui <cuiyunhui@bytedance.com>

Thank you very much for your review and testing!

> 
> Thanks,
> Yunhui

