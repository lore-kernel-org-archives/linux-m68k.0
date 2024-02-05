Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0288F10A01
	for <linux-m68k@vger.kernel.org>; Mon,  5 Feb 2024 06:03:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707113040; cv=none; b=iA3EHLgsOxZ1KOH5FpoKGilZQ7MmLuga65dFJ2lpY6YUKGHuxWp4639j9PrS+8tHz1iL0aRrCk4v/g+zhJKIwFBiHEco8rJKC+ZQQLorl8kQZ/JZHnv1OeU4elZ9uYnlpECkrUrsUYnK704CcAoxiyov1rfm8KbOogEbG9sDVEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707113040; c=relaxed/simple;
	bh=oJpWbcjUnZOYUHS4gSQXzCthYT9BcnlkYXcv4Jt18zE=;
	h=Subject:To:References:Cc:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=f/YpJEDwsPDYNd+LPfy2u3kcKufGbfgkrnZHPpQJllj+6U8+r6pcyUzACs8yRx2uw8URnOsfaX5xhizZS2EX1NbDc5+FiLXZ9j/KsY1otLuPFITBY6fOjePxDgHzudYejqhr8GYMJHlZxw1zryBp1cQblifEBsrDnkQQMh2toJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZST5obS8; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZST5obS8"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-6e02d298334so464197b3a.0
        for <linux-m68k@vger.kernel.org>; Sun, 04 Feb 2024 22:03:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707113038; x=1707717838; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:cc:references:to:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uGL/ByuU508fiYbUuhFT4hiOKhi0VVx0cF+VFQ1lbtw=;
        b=ZST5obS8nw1zenRJsrhTIxk61N7Zi0eZgrLO2fLcQBJxqn0RCKJ3/VmMvz9fBIJ1s3
         h4MjZUROh3vC1N16fYm9hAZhvqCVC/DLtEIc/JjOQi2jXAhhyi0wEQ5EWJvTbzEflUME
         vNa5Fa4uy3lrkxkrylgf+ehBJvmNWXT5TJ1D2aRlSXKfW1c5Y01yZnILcxG97zixEs7x
         gOsxrXnYHn1tncHRxwnabKCeUhYM3xRGjmGOYILNmKWub0e3SwXEwoWTpNJr82EGG68c
         gz5dygaMe18Ks2jH+49Zy5MP2hgRkhM7CTKcfUraPg3SgpjP0Uex4yRAkUUTQA+qiUWJ
         0zBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707113038; x=1707717838;
        h=content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:cc:references:to:subject:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uGL/ByuU508fiYbUuhFT4hiOKhi0VVx0cF+VFQ1lbtw=;
        b=dnmw+WjcEEgNdzSXTgrto3ilt4k7n+ovYO5QeKplJwRZUoEaaJe0evBQvibpGi8lA8
         7G8hnab9z9n7qvUmspJjbgDsP1eOcYxhM4sjKLan0zirTJiopWiEBu6JK2MU7ZV5oBHK
         C+66Hw7ptOZXrdVga1a1RnxYOCu6SXa1OkEu8UOkdGDXvgbhUkzvMRdopZaw06LxzwmA
         aCZMafAm9dDf7gvkaJ/oMTwYZYz54chyHRB3RwqsmK89iQg7dTgFCTUj99xZbzvG62Dy
         xWLrwe+rlckGAG1qnND9S4Vt6A3HktGvku+o30RYIIHJAbanN4mnSJgfQzxY9FSaBx1U
         y23A==
X-Gm-Message-State: AOJu0YzSN9uYwIflIvOg4D6O39X2/7iOlIQaA4BosahP0m+FKFil3EGo
	pKlz7pOlwkGv7KgQ0eKtHukf+otg4oEiD8owQkM4ySVWkABhuBDn0/kS2MX+
X-Google-Smtp-Source: AGHT+IHoO3LMCIOXxmTyYNmuzpbv3IS/NMGor1ZHWl7ZLieG/Y4cX5Y6J49N6aIruGcBEs6Nd1cWxw==
X-Received: by 2002:a05:6a20:d805:b0:19c:b1f0:9848 with SMTP id iv5-20020a056a20d80500b0019cb1f09848mr8061184pzb.7.1707113038208;
        Sun, 04 Feb 2024 22:03:58 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCXizbn1+mwF5kqicwH3nhpU5gBjVET9EY5OXahXHT9TPJxnu23HJdBpzAJIdPn+sIIEuGXn5rSu3daujgNTwPNIZAPykFsWbDeT73fAiu3qp/6DdSSMvQRTdthByQ8ZK8UxAq4YBeSXhbEmiPoPgePwpM/bo/Yp8e260cTNV7ZXo7wP/X8CKuL5
Received: from [10.1.1.24] (125-236-136-221-fibre.sparkbb.co.nz. [125.236.136.221])
        by smtp.gmail.com with ESMTPSA id x15-20020aa784cf000000b006e03ab56acbsm2048073pfn.217.2024.02.04.22.03.53
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 04 Feb 2024 22:03:57 -0800 (PST)
Subject: Re: [PATCH RFC 4/4] m68k equivalent of 26178ec11ef3 "x86: mm:
 consolidate VM_FAULT_RETRY handling" If e.g. get_user() triggers a page fault
 and a fatal signal is caught, we might end up with handle_mm_fault()
 returning VM_FAULT_RETRY and not doing anything to page tables. In such case
 we must *not* return to the faulting insn - that would repeat the entire
 thing without making any progress; what we need instead is to treat that as
 failed (user) memory access.
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 linux-m68k@vger.kernel.org
References: <20240204192105.5677-1-schmitzmic@gmail.com>
 <20240204192105.5677-5-schmitzmic@gmail.com>
 <87ad7f18a772614df4d36595d385b51e54c949d0.camel@physik.fu-berlin.de>
Cc: geert@linux-m68k.org, uli@fpond.eu, fthain@linux-m68k.org,
 viro@zeniv.linux.org.uk
From: Michael Schmitz <schmitzmic@gmail.com>
Message-ID: <721d2b41-c9ac-7771-3e74-235cccd26fb4@gmail.com>
Date: Mon, 5 Feb 2024 19:03:51 +1300
User-Agent: Mozilla/5.0 (X11; Linux ppc; rv:45.0) Gecko/20100101
 Icedove/45.4.0
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <87ad7f18a772614df4d36595d385b51e54c949d0.camel@physik.fu-berlin.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Adrian,

Am 05.02.2024 um 18:32 schrieb John Paul Adrian Glaubitz:
> Hi Michael,
>
> On Mon, 2024-02-05 at 08:21 +1300, Michael Schmitz wrote:
>> From: Al Viro <viro@zeniv.linux.org.uk>
>>
>> MSch: v4.4 backport compile errors fixes.
>>
>> Tested-by: Finn Thain <fthain@linux-m68k.org>
>> Tested-by: Geert Uytterhoeven <geert@linux-m68k.org>
>> Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>
>> Signed-off-by: Al Viro <viro@zeniv.linux.org.uk>
>> Signed-off-by: Michael Schmitz <schmitzmic@gmail.com>
>> ---
>>  arch/m68k/mm/fault.c | 5 ++++-
>>  1 file changed, 4 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/m68k/mm/fault.c b/arch/m68k/mm/fault.c
>> index 6a94cdd0c830..f94df64c3784 100644
>> --- a/arch/m68k/mm/fault.c
>> +++ b/arch/m68k/mm/fault.c
>> @@ -139,8 +139,11 @@ good_area:
>>  	fault = handle_mm_fault(mm, vma, address, flags);
>>  	pr_debug("handle_mm_fault returns %d\n", fault);
>>
>> -	if ((fault & VM_FAULT_RETRY) && fatal_signal_pending(current))
>> +	if ((fault & VM_FAULT_RETRY) && fatal_signal_pending(current)) {
>> +		if (!user_mode(regs))
>> +			goto no_context;
>>  		return 0;
>> +	}
>>
>>  	if (unlikely(fault & VM_FAULT_ERROR)) {
>>  		if (fault & VM_FAULT_OOM)
>
> That subject looks like it contains the long description which should go
> into the patch instead.

Yep - I fat-fingered editing the commit message there. Thanks for spotting!

Fixed in v2.

	Michael

>
> Adrian
>
