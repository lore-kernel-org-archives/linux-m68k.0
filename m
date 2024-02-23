Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7589B1757A
	for <linux-m68k@lists.linux-m68k.org>; Fri, 23 Feb 2024 08:13:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708676003; cv=none; b=CNU6A8LEl5+CB3BAgsv1Kz5djntsQ4fNtVAJRwwWEGTjoDaDSB3wwPVzZautokL08dl7hvyx8ppGFQYkCCO7vaywSqKnyPPfQ/BdK6M+o4yKbjvMq3qIIyG55b4deRkvV4kmUZuyy9VWWa2e5oZIUcTB/Oaebo/tzni+utC5G5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708676003; c=relaxed/simple;
	bh=x3HN2Fcf2e9U2v06SCYwp15p0JYpj7gbKGtwV8l3H7c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ncoXWxPh4M5xr7YTWhVn93oKNFdICjFtFTHEyk9BY61B/H5ipWCZlAtkHcGj3cbkufHkR/Lxv/GdpiKCHmsCh37oPlWzmqRSs80wmDKx2WZ+kGH9FA/9lXqaPc2vbE18+xgClFcexPZIhXoAzC8RkJS37OKAhzPpLwegnlrJ71k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hwpHZa0M; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hwpHZa0M"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1708675989;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=aAzjuDCLmAWvO8xcKrjU4zGwSiBtDeIoA/McoIGvPgk=;
	b=hwpHZa0MsGdPwu/jQpbYNaqMM0vJNBzYa+y7gkbMFFT2AuWpQSfbY+0iu3QyRbPfBJjhvd
	WclBy114ZMDO6/EPEBHtYr77WsOKVhXuTx9Ess1bNjrRabngrps00kyWSVQdIk8dPjxJQL
	XHY89y71IehC9h4rYaU7g+UUEXnC1r8=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-324-YZZxQRmwM2qC3gncI46VzA-1; Fri, 23 Feb 2024 03:13:06 -0500
X-MC-Unique: YZZxQRmwM2qC3gncI46VzA-1
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-33d0d313b81so267713f8f.3
        for <linux-m68k@lists.linux-m68k.org>; Fri, 23 Feb 2024 00:13:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708675985; x=1709280785;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aAzjuDCLmAWvO8xcKrjU4zGwSiBtDeIoA/McoIGvPgk=;
        b=px5oc+msw8oBkgftD9nASyquudsuS+K+/UQXJmi+s2Vg58HnFIg6c1EXefDh4nVOsj
         eQliBL/G/GuX7sat7W90dfydcIIKHJHI+tiGEU4eoy7zyh8M4rIqn7xBCWaRffUxYakJ
         mdmct/z0M4VSAw8g6mZHv4tE+we2uOjR65LHCZ9w53GJr7QEROtTqsrirK91weZYZZms
         aKCFqKklcFWj9zcZG0bpim+wg/w7ZsFH9IMfmzAcWCjiYo1SmwEsF2bLgpPbyVnnUGVt
         8mtGc456+XFw7WwsoH78XSJoc8RBjHkWywbBfUS2S3dc06ZmsXq27tG0x/Eof7v5WlzB
         d8cg==
X-Forwarded-Encrypted: i=1; AJvYcCXW/kuxkaceW6SVVo0STceL1YryMJWa226bGSUBHtln/OEJV3nn0GEmnzlWIH/QySUW5CBjGChhazVsy5Fa7g+F1Wa+Ze1vEkKzXQxLtCS+
X-Gm-Message-State: AOJu0YwM42XIkGeyMrfCuQ4IApDk8VtfUE6f5LwE3K//KyDw30vy8SSN
	ppSbdehCw91BR7cyG/5Q0e8McrtGPypMdr619tDyk4x90m65lmg81l/7ATkRTNgGsOzxVumVtRv
	HRqB6BIyDnXIYkMhyj3TuzEJYuMCudLik42xFgjmS6kIV1S7SaSgk3iT0L3rEZNrdfw==
X-Received: by 2002:a5d:6a43:0:b0:33d:3089:a840 with SMTP id t3-20020a5d6a43000000b0033d3089a840mr956258wrw.49.1708675985494;
        Fri, 23 Feb 2024 00:13:05 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEytQZyH3TnclXxJT/vsFSiSIFTj8pgp9IIfHxcul/Ja6LrKjM2UFKQRaosQbXqowEyQrrgnw==
X-Received: by 2002:a5d:6a43:0:b0:33d:3089:a840 with SMTP id t3-20020a5d6a43000000b0033d3089a840mr956249wrw.49.1708675985198;
        Fri, 23 Feb 2024 00:13:05 -0800 (PST)
Received: from [192.168.0.9] (ip-109-43-178-100.web.vodafone.de. [109.43.178.100])
        by smtp.gmail.com with ESMTPSA id y10-20020a5d470a000000b0033d640c8942sm1850958wrq.10.2024.02.23.00.13.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Feb 2024 00:13:04 -0800 (PST)
Message-ID: <c2832612-9a67-4dc1-a8c2-4cc026b14567@redhat.com>
Date: Fri, 23 Feb 2024 09:13:03 +0100
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] m68k: Avoid CONFIG_COLDFIRE switch in uapi header
To: Arnd Bergmann <arnd@arndb.de>, Greg Ungerer <gerg@linux-m68k.org>,
 linux-m68k@lists.linux-m68k.org, Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-kernel@vger.kernel.org, Oleg Nesterov <oleg@redhat.com>
References: <20240219160126.510498-1-thuth@redhat.com>
 <6f3b246e-7417-4455-abe4-ca3b42fdda4c@linux-m68k.org>
 <4824192b-5573-4246-a47c-ad6249e2900e@app.fastmail.com>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <4824192b-5573-4246-a47c-ad6249e2900e@app.fastmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 20/02/2024 16.09, Arnd Bergmann wrote:
> On Tue, Feb 20, 2024, at 15:13, Greg Ungerer wrote:
>> On 20/2/24 02:01, Thomas Huth wrote:
>>> We should not use any CONFIG switches in uapi headers since these
>>> only work during kernel compilation; they are not defined for
>>> userspace. Fix it by moving the struct pt_regs to the kernel-internal
>>> header instead - struct pt_regs does not seem to be required for
>>> the userspace headers on m68k at all.
>>>
>>> Suggested-by: Greg Ungerer <gerg@linux-m68k.org>
>>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>>> ---
>>>    v2: Move the struct instead of changing the #ifdef
>>>
>>>    See previous discussion here:
>>>    https://lore.kernel.org/lkml/6e3f2a2e-2430-4b4f-9ead-d9a4d5e42713@linux-m68k.org/
>>
>> I am fine with this. FWIW the following architectures do
>> not define pt_regs in their uapi/ptrace.h header either:
>> arc, arm64, loongarch, nios2, openrisc, riscv, s390, xtensa
>> Though quite a few of them have a user_pt_regs instead.
>>
>> So for me:
>>
>> Acked-by: Greg Ungerer <gerg@linux-m68k.org>
>>
>> Geert, Arnd, do you have any thoughts on this?
> 
> It clearly doesn't change the ABI, so that part is fine.
> 
> If asm/ptrace.h is included by some userspace tool to
> get the definition, it might cause a compile-time error
> that needs a trivial source change.
> 
> This could be needed for ptrace (gdb, strace) or signal
> handling and setjmp (libc), though it's more likely that these
> already have their own copies.

If we still feel unsure, we should maybe rather go with v1:

  https://lore.kernel.org/lkml/20231110103120.387517-1-thuth@redhat.com/

?

  Thomas


