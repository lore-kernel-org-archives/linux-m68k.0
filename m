Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C517D1C4A38
	for <linux-m68k@lists.linux-m68k.org>; Fri, 20 Dec 2024 11:46:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734695179; cv=none; b=RQVRlhJ6puIPPgKGAMy1F6e3Yk0ilDHGN6wJJkBj1rMeV413UVKyM6wNqzCXZC6Nvy6zRwGn/tn/JL/vJla2TdS60+KwN3woV9BoNtu5f46KZXyYZRWPcqiIkWwlVBa9eeyOWb77/k6R7R9zJcSNq4CAgjIb5xz/OpNk0wgBCJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734695179; c=relaxed/simple;
	bh=yIScTezDLLIu5IKi/+u7+E2INdxlbVe48yxybU1XCOs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NaCL5bYCu59kQG5A45mGqgyHO7rNnPK04F1MZeVKm7NBpRcF4WIloUlUIrh42Id3vENFfq8QHe2G7Wge+eHC6XOGzDUySggPNTjbG5uqt+BjsexQ7bxhVNInZNJBKkL9hoRccWpVGW50dyUxYGDpDeRq4cdyEstw14nr447Bw0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=QGww1azu; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="QGww1azu"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-21675fd60feso20921355ad.2
        for <linux-m68k@lists.linux-m68k.org>; Fri, 20 Dec 2024 03:46:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1734695175; x=1735299975; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mBRlMffFmN+hz5HGm/qsvwuPzuwmJovQ60y3/xe1EoY=;
        b=QGww1azumEL1ZFL4wXk1bM0Se1GudYJuBtKja9medPj/z4tIC1oo02pJma7pbcNh4l
         tZNgpQ2rFRDfm7S5iyEKPONGAsDFjq/ZnHXPjIXgcNufkqi8mkE43T/4E2Lv+DViDhiS
         S3reVt6TNwQKUh0CMS6XugLxKnpEVsdIa+q50mU11JAA/l5WZOclYHTeXLLNWPM0hdjA
         yCfi3eIdHTJj2KEfuBNb8A8wgetHQXzTulYvtAzvs4QwCEoCFqyN1nqDhFRR8r6OosDD
         qbyWEocrQB1JO+NFpsRLRL6Rh/ZSgM4EvHXjAjhKyyjp6NDTcIWBrarOj771J9vYuYwi
         3MDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734695175; x=1735299975;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mBRlMffFmN+hz5HGm/qsvwuPzuwmJovQ60y3/xe1EoY=;
        b=oUgb5WaK/ZHQkYGMeV17tZcWdewJBiHjLe47zArCQhNAPJKwQcGTlNHbzdE6YMs/yF
         oRn3Dps1dOXCzzoiMsiDiYLy7iRMOvRKRukCXqjfixF4nwi8HYmzAeLLvoZvA12L558t
         Aqf3EUGW5jIfANO/l134G2K1xHAfmquZwi4bbcbzgLCK5z0hrihmU0UKmqLdlmJeLEYg
         XsNDQTsQqoAJZ77FeZaiZMS1cUFdqQx2DTZivnUodkDlVlMqkRwoRUFr1IQoQkA20x7C
         bWrnni+gHfXgn/gr/ZodV3KBRhCmd7hvxdCaA50H54NhJTlo0fskGT/bWvkLj2vytvt5
         dwLQ==
X-Forwarded-Encrypted: i=1; AJvYcCWRUbCwjxOBtXOINJpkVnCkvDxz8xf86sUg6EbV40Jg73yoZrYBoiaa8GcqycTfoqcWZ50KDTZaT0Jb@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YzwVhoHT1KcVT9NSwBDPCqc80hZzMYypO1qwKCJoXV1PbW6lHc7
	nWv6SR8x1vUvN4bgwotCW6M2p49r1OidhxHeh5FVjjiABOm6wxBbZCFSltwHPxE=
X-Gm-Gg: ASbGncsuWYtAET+uQF+x15W93SXguyJvN6tsJ5zMoyrEbtgSzscjJghuC11Pbtau+9s
	cEPXPBao/QBzgQSu535O777rR4gSW7BCXfmjEllIrmzdRFBumZYLNx46ipHtAFQPyzgwEZqiVbt
	Jtq9Ua66INjBzbVfxNLI3A6+murAdOW83/0vb3RElOCq3y+OeX22CqpCtg/HiDdqcTO7pjZOsDz
	euUU1z1Xvx8Oi/FzP67SvIXEnwz0Y1izF3+D7s7PsgyF8YZi8ZB5lMosPYjH8mXMFcK25hHffIu
	wsj4N8ZOwm+KkyIDo6XdSGrbRvkb0aQFyaxSL4pwdTKLJFK2MITT9ZI=
X-Google-Smtp-Source: AGHT+IG40UPaAgLiyyOp9k8XqW2vPy2P2eyTWxZSuqMQTAARXLtkQgcz7lH63J8oRPI229SK+RLglg==
X-Received: by 2002:a17:902:ce92:b0:216:4169:f9d7 with SMTP id d9443c01a7336-219e6e8bc7cmr41107195ad.2.1734695174995;
        Fri, 20 Dec 2024 03:46:14 -0800 (PST)
Received: from ?IPV6:2409:8a28:f44:3764:680a:144b:d927:5a3b? ([2409:8a28:f44:3764:680a:144b:d927:5a3b])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f2db9939b5sm5267286a91.1.2024.12.20.03.46.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Dec 2024 03:46:14 -0800 (PST)
Message-ID: <0daabd32-cba4-4345-baa8-e8c66bc899ff@bytedance.com>
Date: Fri, 20 Dec 2024 19:46:04 +0800
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
From: Qi Zheng <zhengqi.arch@bytedance.com>
In-Reply-To: <75cb4ff8-eb0c-4519-a30a-f8be717ba278@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Kevin,

On 2024/12/20 18:49, Kevin Brodsky wrote:
> Hi Peter, Qi,
> 
> On 19/12/2024 18:19, Peter Zijlstra wrote:
>> On Thu, Dec 19, 2024 at 04:44:16PM +0000, Kevin Brodsky wrote:
>>> Besides the ptlock management at PTE/PMD level, all the
>>> pagetable_*_[cd]tor have the same implementation. Introduce common
>>> helpers for all levels to reduce the duplication.
>> Uff, I forgot to Cc you on the discussion here, sorry!:
>>
>>    https://lkml.kernel.org/r/cover.1734526570.git.zhengqi.arch@bytedance.com
>>
>> we now have two series doing more or less overlapping things :/
>>
>> You can in fact trivially merge the all the implementations -- the
>> apparent non-common bit (ptlock_free) is a no-op for all those other
>> levels because they'll be having ptdesc->lock == NULL.
> 
> Ah that is good to know, thanks for letting me know about that and Qi's
> series! Fortunately there isn't that much overlap between our series - I
> think we can easily sort this out.
> 
> Qi, shall we collaborate to make our series complementary? I believe my
> series covers patch 2 and 4 of your series, but it goes further by
> covering all levels and all architectures, and patches introducing
> ctor/dtor are already split as Alexander suggested on your series. So my
> suggestion would be:
> 
> * Remove patch 1 in my series - I'd just introduce
> pagetable_{p4d,pgd}_[cd]tor with the same implementation as
> pagetable_pud_[cd]tor.
> * Remove patch 2 and 4 from your series and rebase it on mine.

I quickly went through your patch series. It looks like my patch 2 and
your patch 6 are duplicated, so you want me to remove my patch 2.

But I think you may not be able to simple let arm64, riscv and x86 to
use generic p4d_{alloc_one,free}(). Because even if
CONFIG_PGTABLE_LEVELS > 4, the pgtable_l5_enabled() may not be true.

For example, in arm64:

#if CONFIG_PGTABLE_LEVELS > 4

static __always_inline bool pgtable_l5_enabled(void)
{
	if (!alternative_has_cap_likely(ARM64_ALWAYS_BOOT))
		return vabits_actual == VA_BITS;
	return alternative_has_cap_unlikely(ARM64_HAS_VA52);
}

Did I miss something?

My patch series is not only for cleanup, but also for fixes of
UAF issue [1], so is it possible to rebase your patch series onto
mine? I can post v3 ASAP.

[1]. 
https://lore.kernel.org/all/67548279.050a0220.a30f1.015b.GAE@google.com/

Thanks!

> 
> Let me know if that makes sense, if so I'll post a v2.
> 
> Cheers,
> - Kevin
