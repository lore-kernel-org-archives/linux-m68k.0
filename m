Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7FAB263F4A
	for <linux-m68k@lists.linux-m68k.org>; Sun, 28 Dec 2025 13:29:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766928602; cv=none; b=jFffbNdFKPxrJPfvar+xuNsyJYBpt5kkqIuILAKi862O7leWZwqEiEsmnlqZA3GS7Rqt2q+nfNmFazwvm+7YEpVt97/h8D7y7m+1+wUUvGyBfM/CWcUhvpLazk9CDAHuoXxIKGuuMXUNUOX0owsAx7t2rk4VoIwijMo56kx/X5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766928602; c=relaxed/simple;
	bh=wzDS29pPv16SN5nJL5o+rnuk9lYuas+/v91h2NRmxn8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=seofU4ofHrf70EsLeDZuByr1mJ12xvSlnLJBFMkASsJvGLHy3OJM4bxBNfiC4NuG78gV0dZxJc+w8CGq89JC2Jqy3AckvHkfabeW5berH4GyIntvLjmwR6Rb40UG2bJfE2b7wyAp9+xbUyDGepKP6R/NQn1JI95a6dto1Q6OucI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=knyTZrlw; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="knyTZrlw"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-594330147efso10221825e87.2
        for <linux-m68k@lists.linux-m68k.org>; Sun, 28 Dec 2025 05:29:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766928597; x=1767533397; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7lWyQqsYJqWc7lm9cTjRQLwXSVE/IuAz3ei2okz3340=;
        b=knyTZrlw0YjnHOBfCpWvtPeMqAqsTqW2HdDnxBCxMeMl++ZcoCi0dpkN7wPVN4oP5G
         XNW/m3XsRTAEKEMQ+a4UV+Q45D7Eg6HqU/u0UolsSIY6EzZdO+dPHMpsAqwLkii+3owE
         zEO1UliFv9Ya2CbQJ9CFZq/YwX1MB4wN8ngzzn+JOTxbkaIAAzwkxvlf6W4rmX5cFPc1
         bBDTz9M/jlpvf42aeq36H+0ofMcxwjBlcT7W3kujfR7jOkl6hYA/T+DlWe2XTH6i/PRo
         QNBoXeBKb6WwX6Gqy8kw6GSRFtirRpp23iuZCI79JKTAAqYaGpeNgYYiLjIDUNCPLNCY
         gwtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766928597; x=1767533397;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7lWyQqsYJqWc7lm9cTjRQLwXSVE/IuAz3ei2okz3340=;
        b=AVb0tAYvEjiP3udaJC+JEIa5E4ERWqBAlwHiLN5BHS+NP7fzgRANLKKQNokT+OVXv7
         wCSBph+u5Ani/lawtHzGM0BwG9fr3Ov/5ke7rJz0TBXefgHRpcbWaU4OGINQzaCMBZ51
         VmMuUikOV+gog9OuGlyOJIt2vAsUDHoM7XbKE3sZ34J1kdSyvxfVwT6rHN3A5luYyHZN
         89+bO6/CAZtDCPmUskZZxv03oq+pi+Y5s5IRQWscYEDq2FL8Fu7jyJ/5YIacWPy6c58R
         6wdmhz6pUkZbQYz4Kp0NReTtdXdy6FPhTgZFJ25s3Jjayuvwq6cgzsJuk7kpbnzD3ArG
         2F2A==
X-Forwarded-Encrypted: i=1; AJvYcCUgAwP41pvkhm7nHaXP5pTxQhGHpANG3PF8ZQd5vQP6Ooff5GONvfDcfWmASbbIuoFrOQazmN+6bSr4@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YynUnY7F3v/wMyHiiuDKXYO71ODa0kWAszOCGvxZrpi/6aQK0EB
	oWpTOx4KQSyN9b6BClwwXu5IZXzEwxeD4XUSKq70fpKgi43R2adUzqpV
X-Gm-Gg: AY/fxX5LDA49jeeBRc1YEfLKS7M1DJ2LgupMk2QGLGIIL8qtAg0xeudysw0eyg8Amf/
	tnUew7MXftB0uvHrX+JCdnaSm1p8MwJm9jiNYPHU6l/p6WQulPRNx02uW66vJ2nFapyo08cOaZN
	4+rHvHuGja23BJgg4KRwqMvrZFbYNXenq0pIPpPcAqScVEV+wTvAMcGeqopC5GSFidGvIMIzGky
	lRJF+mH2boOuKsBMgNCuMTxC1c1WTAVumJJ17KFyPbwwXbGdHm4i2WD1mIJKZ37s4Kw7tPVok4O
	Cj3ikGTZA5iTxHKxi2ExPHS22c2IqfpkwO3PG9VyhS2l/1+Ar4l6fMJmYisVv5LbkLdMXQHglJJ
	R8rcfd4YtWOmiWGV8+4oOtXOcIGKcmPkC5EplGXi8yAyCZOuUd9bCwXfrVdkibG4391fuWMolW+
	criMfBt4us7lSevDU7nEclzf7fLXT0rVkqM6U6EA6Wwh73DOqBuPwR04tFx7AyETHu/n3y3lTIv
	8K1TrPb
X-Google-Smtp-Source: AGHT+IGo/pr+AQ2VNaaG2TyhewLh2BG0nsRAoXdF/d33J1EZZvYOr8FxE2Re2WZCgj4kGCoIAYrr8g==
X-Received: by 2002:a05:6512:3b0c:b0:59a:11b2:2c08 with SMTP id 2adb3069b0e04-59a17dd5fb7mr9312428e87.43.1766928596662;
        Sun, 28 Dec 2025 05:29:56 -0800 (PST)
Received: from ?IPV6:2a00:1fa0:425c:b771:d34f:d055:3147:bcd9? ([2a00:1fa0:425c:b771:d34f:d055:3147:bcd9])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59a185d602fsm8238417e87.11.2025.12.28.05.29.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 28 Dec 2025 05:29:55 -0800 (PST)
Message-ID: <d58d6cfa-d9d1-47fd-91e4-533756f3b3bd@gmail.com>
Date: Sun, 28 Dec 2025 16:29:49 +0300
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 25/28] x86: don't reserve hugetlb memory in setup_arch()
To: Mike Rapoport <rppt@kernel.org>, Andrew Morton <akpm@linux-foundation.org>
Cc: Alex Shi <alexs@kernel.org>, Alexander Gordeev <agordeev@linux.ibm.com>,
 Andreas Larsson <andreas@gaisler.com>, Borislav Petkov <bp@alien8.de>,
 Brian Cain <bcain@kernel.org>,
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 "David S. Miller" <davem@davemloft.net>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 David Hildenbrand <david@kernel.org>, Dinh Nguyen <dinguyen@kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Guo Ren <guoren@kernel.org>,
 Heiko Carstens <hca@linux.ibm.com>, Helge Deller <deller@gmx.de>,
 Huacai Chen <chenhuacai@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Johannes Berg <johannes@sipsolutions.net>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Jonathan Corbet <corbet@lwn.net>, "Liam R. Howlett"
 <Liam.Howlett@oracle.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Magnus Lindholm <linmag7@gmail.com>, Matt Turner <mattst88@gmail.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>,
 Michal Hocko <mhocko@suse.com>, Michal Simek <monstr@monstr.eu>,
 Muchun Song <muchun.song@linux.dev>, Oscar Salvador <osalvador@suse.de>,
 Palmer Dabbelt <palmer@dabbelt.com>, Pratyush Yadav <pratyush@kernel.org>,
 Richard Weinberger <richard@nod.at>, Russell King <linux@armlinux.org.uk>,
 Stafford Horne <shorne@gmail.com>, Suren Baghdasaryan <surenb@google.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Thomas Gleixner <tglx@linutronix.de>, Vasily Gorbik <gor@linux.ibm.com>,
 Vineet Gupta <vgupta@kernel.org>, Vlastimil Babka <vbabka@suse.cz>,
 Will Deacon <will@kernel.org>, x86@kernel.org, linux-alpha@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
 linux-cxl@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-hexagon@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
 linux-mm@kvack.org, linux-openrisc@vger.kernel.org,
 linux-parisc@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
 linux-snps-arc@lists.infradead.org, linux-um@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev,
 sparclinux@vger.kernel.org
References: <20251228124001.3624742-1-rppt@kernel.org>
 <20251228124001.3624742-26-rppt@kernel.org>
Content-Language: en-US
From: Sergey Shtylyov <sergei.shtylyov@gmail.com>
In-Reply-To: <20251228124001.3624742-26-rppt@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12/28/25 3:39 PM, Mike Rapoport wrote:

> From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
> 
> Commit 665eaf313314 ("x86/setup: call hugetlb_bootmem_alloc early")
> added an early call to hugetlb_bootmem_alloc() to setup_arch() to allow
> HVO style pre-initialization of vmemmap on x86.
> 
> With the ordering of hugetlb reservation vs memory map initiaization
> sorted out in core MM this no longer needs to be an architecture specific
> quirk.
> 
> Drop the call to hugetlb_bootmem_alloc() from x86::setup_arch().
> 
> Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> ---
>  arch/x86/kernel/setup.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/arch/x86/kernel/setup.c b/arch/x86/kernel/setup.c
> index 1b2edd07a3e1..e2318fa9b1bb 100644
> --- a/arch/x86/kernel/setup.c
> +++ b/arch/x86/kernel/setup.c
> @@ -1191,7 +1191,6 @@ void __init setup_arch(char **cmdline_p)
>  
>  	if (boot_cpu_has(X86_FEATURE_GBPAGES)) {
>  		hugetlb_cma_reserve(PUD_SHIFT - PAGE_SHIFT);
> -		hugetlb_bootmem_alloc();
>  	}

   You need to drop {} now, no? But seeing that this *if* gets dropped
altogether in the next patch, you may as well ignore me... :-)

[...]

MBR, Sergey

