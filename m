Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BBAF14E2D5
	for <linux-m68k@lists.linux-m68k.org>; Tue, 21 May 2024 21:11:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716325877; cv=none; b=N4Oiq3Bs/RQAF4i1INsDhV4Gg6Uh/xWUlEBPmO2YO6cbXcniaotZuU/pQor8/CtQH216uf+wjRQzgNKgyoEYnHkJ6XnrEmWebTeu8EU6CEpW1ib2T/z5ORh3Diy3IMuzxGKzlA+IwwqaeMKBCToygthNhFN7EPa3PgsgYEAZb78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716325877; c=relaxed/simple;
	bh=54k+GxMsDUToSaVUz6ct/SHOTc7pPOaSe8lyYar2JeI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kwKjjgh+AmHnImWG7XiJCcVU4Y5wGTuReo1Kf6GiHcGAFOeWAxcxRWWFOMTYelxs7648HEFxODgN8LKKYneBChz0WdjmurN7rCGLx1Cs6OjdRQv0WZQpnwnzb3/l6yATGlhyQ2bdLj4Gdosu5JIoV0SOmBTVgM9vAO1AOhUjmFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XTJUM62x; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XTJUM62x"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-6f467fb2e66so1927244b3a.1
        for <linux-m68k@lists.linux-m68k.org>; Tue, 21 May 2024 14:11:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716325875; x=1716930675; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QDUU5OMJrmkawr9tPeYRqaMmAlYgEX47V+AcsCOfSWs=;
        b=XTJUM62xRGhbi53eQ/9Xu4s4Yw4o2J/zWJ6Oc0qR2J9QS90lxrOVcBN1KkmWi2vE9R
         L68MDzVhn+fOzjvyrkwRhJmSXJdUxtjFkthCqEz34kYTiRzW2WoYfYRFu1zYetumCzWx
         DuB8Ad9pjPrIbdP2Rph6QB/lJO0Ci080RkGqddLwpOJ6Z65arvUoY/4NYENEKb4cBX/K
         wR5FurLCmRrtrLBaa2NrOe7zgXvfBBTk2U3ac5Nw5gaaAgtw10ErOTVrpph6mUxAXo7i
         yQGPszdHPMVatiLng8ZB3GkrIe2QWZxanoW4ZR8dfUocWnbdg0JYn2wSg/rXb+lHY9hG
         Abdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716325875; x=1716930675;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QDUU5OMJrmkawr9tPeYRqaMmAlYgEX47V+AcsCOfSWs=;
        b=G4t9lKvmKN6Yto6ZuUrPqobA7Maem3kO0Mg4Svc4JWkIeIoZpgzN0CaV9WsH/V0mF+
         j3aa8cDsZfIbvNRO3IwydgyY4wN59pBnBPe7hZ2Q+X6UGyPbLuf+wFeUYymHTV2XmZkr
         4C5W7lFRKYrLUMSG1njd+3GtQlFEabRbnMED5PfWZxxe5UFh/5BpYcsFGnxFu2sA1MSU
         GixyXbvhVcMq/14zFi9SrG45QF6nLtfIhzfG2Np1XsJ8K3P83da6aFCR0KK/zan7RrfS
         oWspLSQo1E+tM2ACbo22FvMCDc/BK+BWZB8WQcHDV0zDixREywL+fOijC1q0PCFS1hER
         CGnw==
X-Forwarded-Encrypted: i=1; AJvYcCVcKf1tWvsNkrglLPyU7ubxAtSB7qBJGa3UdvhHVG/3Gh9W8FF6ut89dTBdv8jgGT+MU91jgFc7IE8MjQ++G0Hxzkne5k5qwtFSRAiWNtHr
X-Gm-Message-State: AOJu0YzU9LxCFCjKzdcSMW7X2wfpZr+6/f1Ojj0QyFKe3+pn7b8Nx9MG
	CuutiwySfx4oltS4sf07t2PzsSwJdBDv1ghoUbt9jilV1jAmjLTz
X-Google-Smtp-Source: AGHT+IHPbZgmukCcFqyusmlF4zJbT3FTWDvbzfqbm0Wc3ZFrmN0OmddLnN5fpCMq6/z9KGkLjlw9nA==
X-Received: by 2002:a05:6a20:7f90:b0:1af:ccd9:4b1d with SMTP id adf61e73a8af0-1b1f8792264mr241087637.22.1716325874544;
        Tue, 21 May 2024 14:11:14 -0700 (PDT)
Received: from ?IPV6:2001:df0:0:200c:cce2:5e6b:f484:1b3f? ([2001:df0:0:200c:cce2:5e6b:f484:1b3f])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-660ab682716sm7372773a12.88.2024.05.21.14.11.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 May 2024 14:11:13 -0700 (PDT)
Message-ID: <514487d7-08be-43f7-b31d-d38818607766@gmail.com>
Date: Wed, 22 May 2024 09:11:16 +1200
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Amiga, serial and SYSRQ
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Paolo Pisati <p.pisati@gmail.com>,
 linux-m68k <linux-m68k@lists.linux-m68k.org>
References: <ZkjwzVwYeQtyAPrL@amaterasu.local>
 <CAMuHMdXnsXk+MuGUCnPcQVbOdSGJAHiK6TBZE2r5_h15qs_azg@mail.gmail.com>
 <ZkuFrTQDw6iM9Z7K@amaterasu.local>
 <3f1fc752-52c1-4b00-aaef-b917be083718@gmail.com>
 <CAMuHMdXAovcF8rhAeWjDVqQsnQPzMaBmNrQ+bQHe=35hcznTEA@mail.gmail.com>
Content-Language: en-US
From: Michael Schmitz <schmitzmic@gmail.com>
In-Reply-To: <CAMuHMdXAovcF8rhAeWjDVqQsnQPzMaBmNrQ+bQHe=35hcznTEA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Geert,

On 21/05/24 19:07, Geert Uytterhoeven wrote:
>> The interrupt vector number will tell us what interrupt level is causing
>> the storm (if it's an autovector int).
> If it's _not_ an autovector int?
If it isn't an autovector interrupt, the vector address were generated 
by the interrupting hardware, and its offset from the vector base 
register won't tell us anything about the IPL.
>
> Anyway, unlike Atari, Amiga only uses autovector interrupts, and most
> expansion boards use IRQ_AMIGA_PORTS (IRQ_AUTO_2) (some can be jumpered
> for IRQ_AMIGA_EXTER (IRQ_AUTO_6).  As lots of other components use
> IRQ_AUTO_2, these are all shared interrupts.  Hence handle_badint()
> is never called, the "bad" interrupt is never disabled by the irq core
> code, and you end up with an eternal interrupt storm.

Makes perfect sense now. And Paolo's report on successful boot with 
IRQ_AUTO_2 never getting enabled confirms this.

Shame the generic IRQ handlers do not return information about whether 
an interrupt could be handled ...

Cheers,

Michael

>
>>> that didn't change a bit. I understand it requires a new fw from the board
>>> manufacturer or a quirk in the bootloader, but i would like to get something more
>>> verbose before i ping them.
>> Interrupt level and vector number would help the manufacturer to give us
>> the information required to disable the problematic interrupt source.
> IRQ_AMIGA_PORTS :-)
>
> I guess the system would boot if you hack arch/m68k/amiga/amiints.c
> to never enable IRQ_AMIGA_PORTS in amiga_custom.intena, but then you
> would also lose the ability to use e.g. the builtin A1200 IDE.
>
> BTW, code to reset/silence the hardware components on Warp 1260
> could not only be added to Amiboot, but also to e.g.
> arch/m68k/amiga/config.c:amiga_parse_bootinfo().
> Reverse-engineering the AmigaOS interrupt handlers for the board may
> also help.
>
> Gr{oetje,eeting}s,
>
>                          Geert
>
