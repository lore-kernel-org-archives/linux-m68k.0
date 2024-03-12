Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 345F2139580
	for <linux-m68k@lists.linux-m68k.org>; Tue, 12 Mar 2024 20:15:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710274505; cv=none; b=WZIzJYErYzYQmhEh1tv5fDYiDXhaDHkM6iKxZvqCKZNmWbtQPe1BgQjPGUJZ+SVk75ij6hWqzbMJwTs1ot0cF8QKI+EWybYHgH3fJDIBhYRT4bsB9MHBmD68rEyPvRgR6wB7PSLC9kHN8606ls1YhKRmsWv2t9f4R6fubikI0Pc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710274505; c=relaxed/simple;
	bh=N1mUp6Dd3gOa8EoAZNDUjllJW6Vt1h62T+mwL3fgquw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fwlKtQvBZybeoIteJEYunHizQJfpM/Lp7VG+KtoMml2qlq+D62Naus9oSLnEvwEPRqzvaZ6EmJINOIBUUm3TNJsAiQTHCH/eb9BCRn2NHtX/mz2lPReXsIiqKb7j9DaEZjOPiAzgBDYDl/2VaRB9cUPEhbPA1x+CiPLBvfww4gI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xe3p4PN0; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xe3p4PN0"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-1dd6412da28so2409035ad.3
        for <linux-m68k@lists.linux-m68k.org>; Tue, 12 Mar 2024 13:15:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710274503; x=1710879303; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/THc8p3tb2wtXAccS/2XQHGYSyjdKSJGkZ28F4c3CWQ=;
        b=Xe3p4PN0TxZ9n0zlldQqqTOKKYYtmkoId5G7k17qkaH83Gz/biYZIu2z5344U+BL8n
         gr/pS+dGq/XmqN8bhcR1Ruk1Uff7MPci4RswZEioqADqxfPSScykuEr8fF/drTjhBWx9
         5aYAvoOmWJE37IgTe9xyufX3+wabLq344pM/DXrmF57dLFZYP6B4b21TYEUFEGYGk83A
         A7Rz6Q8fAE35syVOPcPo0hsNAXRLn3EvA0pzfqeepZnwW8q9QvKzIEOwHjTlEeUjuO4c
         qm8wiX516BN9Zbr7RDQMFAHGd3+V1C2EpQA53TJfNJHstuj2v7mBRTVl31Hx01iXMRts
         eKZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710274503; x=1710879303;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/THc8p3tb2wtXAccS/2XQHGYSyjdKSJGkZ28F4c3CWQ=;
        b=DwrwANsxWYmBb/lzWLb/C52LFkBw1IcXkRBpc74pMuKpcXW/MHs/DfOjWRPcKGTKSl
         7YEZWR1WwLcgwMnn30uuSfA8KeMSEKS600XDuY3MF11fhvPxjsNKQwLUi06qePwM9Hem
         lotXlDC1t3TtaMEvnMrRUhLgDBeaUMNMDN/tGff5sREw8d53rzl6unHFnYHEXGr6rO3E
         wQEeUDJdeCMLzjcEo/JCtiQ25XzhBOPAWL2C71mKgXFqdaWXiYotM7tG1cWe0WMYbQwC
         WKhb+SlFZI7wzWyQZJNjZML0YGRgK1F6ExKWNUe/+/O/l+duikxCq+ELi5IJYc+KYikb
         Hvuw==
X-Forwarded-Encrypted: i=1; AJvYcCXcQiwZvPAiCEV84ETNoSSvhwotTQac/BuFfQojw9zCDNJ9q34oepR1bAFUn+E49nhHBqgCcEQ0h5XZx1wFOMmuIdNij9raL/G1zK5A2FcR
X-Gm-Message-State: AOJu0Yxpn6Je3QKP9N8AqWGOwPHpYIq/dK5gAVv7HCtqzUmtRLsKUb3Z
	qT93oM0DOIpY46nU22iviX4wY5c384+Z8r/MUnMzCUdybeh2gwSW
X-Google-Smtp-Source: AGHT+IEYI0TXlW7Y/UP9pqMU5cQ27g2akDNoFZUzGOJ3NbMhd1DZ5aK6q+XzO2tba9dXBgIJ1DBnzw==
X-Received: by 2002:a17:902:c254:b0:1db:f811:66f7 with SMTP id 20-20020a170902c25400b001dbf81166f7mr3383332plg.60.1710274503378;
        Tue, 12 Mar 2024 13:15:03 -0700 (PDT)
Received: from ?IPV6:2001:df0:0:200c:cce2:5e6b:f484:1b3f? ([2001:df0:0:200c:cce2:5e6b:f484:1b3f])
        by smtp.gmail.com with ESMTPSA id q5-20020a170902dac500b001dcc158df20sm5409678plx.97.2024.03.12.13.15.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Mar 2024 13:15:02 -0700 (PDT)
Message-ID: <a6f12fac-7651-455a-b4b5-33a8d5f15db4@gmail.com>
Date: Wed, 13 Mar 2024 09:14:59 +1300
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: spinlock recursion when running q800 emulation in qemu
Content-Language: en-US
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Finn Thain <fthain@linux-m68k.org>, Guenter Roeck <linux@roeck-us.net>,
 linux-m68k@lists.linux-m68k.org
References: <07811b26-677c-4d05-aeb4-996cd880b789@roeck-us.net>
 <0ccf5e42-63ec-a63d-9ee9-7043947637c3@gmail.com>
 <40205038-a7cd-2568-5f8e-2540aca2f84d@linux-m68k.org>
 <56f79fc8-1a62-48af-b2fb-cddace7c828f@gmail.com>
 <60029130-022e-8ec7-2dc5-678b077f1d69@linux-m68k.org>
 <6eeccba7-6877-dd3c-2a67-94ea448bead6@gmail.com>
 <cb98b504-0669-eb91-4da0-8ee7bb7663ba@linux-m68k.org>
 <5076e848-9bd3-3fea-0aca-5f62a8739a73@linux-m68k.org>
 <bd6eb981-0dfe-a9c9-7777-0cfa0703efc0@gmail.com>
 <fbc5d581-dcad-8627-3a19-6e2d10614870@linux-m68k.org>
 <2465c81d-d2dd-320e-cb4c-1c23fd485aed@gmail.com>
 <9e5ce055-8af4-4cca-3505-a3186b86926d@linux-m68k.org>
 <ad9a7be6-e2f4-f17b-04fe-393a409e523d@gmail.com>
 <745f844f-a100-5f38-99b3-97ace157b2a2@linux-m68k.org>
 <afcd0605-49e4-49c6-90a3-2d5b6a2cbf78@gmail.com>
 <CAMuHMdX-4kPgg99k7VJhnHNKp2F2w9+gStyvKnrDwB0NTm5EqA@mail.gmail.com>
From: Michael Schmitz <schmitzmic@gmail.com>
In-Reply-To: <CAMuHMdX-4kPgg99k7VJhnHNKp2F2w9+gStyvKnrDwB0NTm5EqA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Geert,

On 12/03/24 20:59, Geert Uytterhoeven wrote:
> On Tue, Mar 12, 2024 at 1:51 AM Michael Schmitz <schmitzmic@gmail.com> wrote:
>> On 11/03/24 21:35, Finn Thain wrote:
>>> I think spin_lock() reduces to preempt_disable() on UP.
>>> In include/linux/spinlock_api_up.h it says,
>>>
>>> /*
>>>    * In the UP-nondebug case there's no real locking going on, so the
>>>    * only thing we have to do is to keep the preempt counts and irq
>>>    * flags straight, to suppress compiler warnings of unused lock
>>>    * variables, and to add the proper checker annotations:
>>>    */
>> That's only true in the debug case - there, preempt_disable() is used
>> inside the spin loop. But m68k is one of the last CONFIG_PREEMPT_NONE
>> archs AFAIR, and preempt_disable() reduces to barrier() on those.
> M68k does have experimental preempt support. I have been running
> that for the last 5 months. Works fine most of the time, except for
> the one BUG[1] that happens every 10 boots or so.
>
> [1] https://lore.kernel.org/all/CAMuHMdUQ72KOPw5vxNfhjoTR-SsaELeKneBmyQPYEWa_o5OZZA@mail.gmail.com

Thanks for reminding me - I had forgotten that I had seen that bug report.

I'll give that a spin on ARAnyM - doubt it will work on my Falcon due to 
the extra kernel size.

Cheers,

     Michael


>
> Gr{oetje,eeting}s,
>
>                          Geert
>
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
>
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                  -- Linus Torvalds
