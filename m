Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3258943F8B2
	for <linux-m68k@lists.linux-m68k.org>; Mon, 24 Aug 2026 15:45:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787586315; cv=none; b=PyLk0FmfJp/tJdgYAKRRQIs+FvMgjhLo5qNgjzI/nOHxWruj6SD8X0z+jiRybcPLl5z/NWG9VvSMLE8NGHclPlQwKAhEKoy14lHxsNvJGqHe8FesBDf0zycLlLHwCwqxVt3dBfx7obyCBBuNRWSLVt68/WC+eNj/8piUKoS1ZNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787586315; c=relaxed/simple;
	bh=rH5ooTmhOET3vAsIUkA6yaGvEUpGPYpVuc1a+dr0RM0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GKC3WfRv2rO5TLozaaTPTVtjlUumBSM9cY9QxV8XxlXEDQNKCAYbXRHwiNJEt3TmYi6kfnHKOi2iklHxyZ/wSiNdd0lmWiVy0WF2demFPIMcEwUXxUysmWbLB7e/2t160BiZZ/3PLQF5eCkBWwr5iAfDbuHaxNL7euiQVXh+ibY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=aejljMpz; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="aejljMpz"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2cab973140bso47081435ad.3
        for <linux-m68k@lists.linux-m68k.org>; Mon, 24 Aug 2026 08:45:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1787586312; x=1788191112; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=QEtJVtkW7q375yAi3A0GskrIJ2s9H0yJ3yupt0Y509Y=;
        b=aejljMpzWYYMlst3U/hvzuoVjGSmL51yl2ujeJPFa8x4ECDsW2c1woiVaSEosfPXF1
         yHMYQCmpnVCroEme8zJ+7jDEei6CgjFuMTUzpEgDzXgKcLnQn/i1apuX/vcWlQpVgqdj
         /cmBzGC1lHonOTl01ALYHC7ol7dl6hh9ritPP7jwCnHOEgSQ77Suk1Pl3KHxDOmTnGkH
         n/DXpYORDkKTHp8pZ58E8tMsRHR2Co0aia/QQO8J8EaX3eY1VaMrum3Ub0Op444NkW58
         TmKCvSXIjvTKwv5sjEWbk9lbZixE/fFYhf3JcvldCaxe+h6HGmkqCDIkl3ynUlTvcKIR
         p2nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787586312; x=1788191112;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QEtJVtkW7q375yAi3A0GskrIJ2s9H0yJ3yupt0Y509Y=;
        b=firG1fydn8cZXbHD+ungv5x1kMDQVGgYh1YKDy5CNRPE0ZED8QEnE9ZwX1SAlxTlnm
         tur++fw5AUAbtspb3MXKoA/XUu1EK/LMNZ/ucyaEFE4LNImQansEx8t2WmU57JafCw6n
         LhCpt52+CQBaT2erkBpLyD+p95toE5f4Ne9Zau8g2B/0I1Hoyw1CiYvS40WUbooAfz9q
         iC+FBZZYxmntF0cI+ijhBiGywmXfx+k7hdAn087kyrdCqXj6ZIst9pCEPQ7IMcjBv0lg
         Jd2O0TsH+I2yVLaXH7ry73iOlGNmcpaZX9NRqjg24nVyBsE+vAl7XMql92jYKNN/sOH1
         jLXw==
X-Forwarded-Encrypted: i=1; AHgh+Rq4peHAb0FpEL7/D4VxUKXDYw3fLSkwjyAhgxrXJmH1WvgKCbR/QQ1tq3w4B0qt8mCLJwPvZVXJto+N@lists.linux-m68k.org
X-Gm-Message-State: AFuF++klTtDgqMlWmCS6Cf2AjXbcJvxqNtTkTm9DEJS/bJOumSwqcE/d
	4PqDiZqtn8gEJRLr9NsJ5Rqx12gVpFgVnnjBFlXunsVfgouU5OsBz99noW0G3g7wIYw=
X-Gm-Gg: AR+sD105Lrh38TZaNNDrHFT/Dw1oogZkGYOhMJHzAqv/P5z3cIjB88//g47a1GMUXBq
	aO1/ki8ZktvwCzXnnPQEXIKjRHhH5oB2ILDFqkhOoJk6r3qPnLZwYXZfDkbnyVCB+Q7Op6ErUym
	Bt98L3uuDxMPtkRsftNatS9UlqZn/7w41Y45CSVn+e7Vd064Jk7ArIft7baQt6eIFM97JqTj/7L
	rnhONpgDwgKO45gqHiQUcpAQEKxeCwf2pdV+TwQXi9JD8QOsXAYk7cZc8bE6BJ5/OpCNjbP2oNG
	i3ccOb2UTooNewNK/OvczTfCPnVkANY6JYJQQa9cTb36itBbm21Z2u/3rmXephEOF9GANFFLJok
	f0bvCie/X0tjNIR4l4syg9bvXtBwojj1ZDBaG+oH2YaReJDqrfBMcklE5sKFGm1zEotO/XrPeYz
	YwAOA6L9+Aona3CAgRo0nqiaOS1C/RY9F+id21Fxmxw/03dy/ZqpnFOvQh4e+FfFsQfQxAhdLIW
	APutVcn3phqxxo=
X-Received: by 2002:a17:90b:5867:b0:395:4de4:92c8 with SMTP id 98e67ed59e1d1-395df4dcdbcmr39252435a91.15.1787586312489;
        Mon, 24 Aug 2026 08:45:12 -0700 (PDT)
Received: from [100.64.0.1] ([165.225.242.163])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39645b7ff6dsm23611a91.10.2026.08.24.08.45.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Aug 2026 08:45:11 -0700 (PDT)
Message-ID: <029cfde8-74fc-4437-bc18-b1b53d44cab2@sifive.com>
Date: Mon, 24 Aug 2026 10:45:09 -0500
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC V3 1/8] mm: Make ptrval_to_str() generally available
To: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker
 <dalias@libc.org>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>,
 WANG Xuerui <kernel@xen0n.name>, linux-alpha@vger.kernel.org,
 linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org,
 loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org,
 linux-mips@vger.kernel.org, linux-openrisc@vger.kernel.org,
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-um@lists.infradead.org, linux-arch@vger.kernel.org,
 linux-kernel@vger.kernel.org, Lorenzo Stoakes <ljs@kernel.org>,
 linux-mm@kvack.org, akpm@linux-foundation.org, david@kernel.org
References: <20260818040041.1891769-1-anshuman.khandual@arm.com>
 <20260818040041.1891769-2-anshuman.khandual@arm.com>
From: Samuel Holland <samuel.holland@sifive.com>
Content-Language: en-US
In-Reply-To: <20260818040041.1891769-2-anshuman.khandual@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2026-08-17 11:00 PM, Anshuman Khandual wrote:
> Move ptrval_to_str() inside a header thus making the helper more generally

Typo here and in subject: ptrval -> ptval

> available for new users which are being added later. While here, also move
> another related string size macro PTVAL_STR_MAX inside the header as well.
> 
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: David Hildenbrand <david@kernel.org>
> Cc: Lorenzo Stoakes <ljs@kernel.org>
> Cc: linux-mm@kvack.org
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
> ---
>  include/linux/mm_types.h | 15 +++++++++++++++
>  mm/memory.c              | 16 ++--------------
>  2 files changed, 17 insertions(+), 14 deletions(-)
> 
> diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
> index b18c2b2e7d2c..a5b514e55dd7 100644
> --- a/include/linux/mm_types.h
> +++ b/include/linux/mm_types.h
> @@ -2001,4 +2001,19 @@ static inline unsigned long mmf_init_legacy_flags(unsigned long flags)
>  	return flags & MMF_INIT_LEGACY_MASK;
>  }
>  
> +void ptval_bytes_to_hex_str(char *buf, size_t buf_size, const void *entry, size_t entry_size);
> +
> +#define ptval_to_str(buf, val)								\
>...
