Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77FBC1CAAF
	for <linux-m68k@lists.linux-m68k.org>; Wed,  6 Mar 2024 23:42:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709768529; cv=none; b=G/J/EBSSXImbr71I6lZpQemBpGSTBQO6hJR+uPRjBvIYe7mipjSzjYFFrdvuLzkwtoHGoS6xiGlEii5QS/IxQulM4Y5hLobzqY6INXeDSp2IQxZRe7+dfP+29yK5KHyKiPYN/LAdQuGuTa9ZnBgmMpfDtcNiWS1GrCYKZZof3b8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709768529; c=relaxed/simple;
	bh=nB8Mjv7yApm/3U44Mh++aqMhYQcUiBnEdvPhaV9fAU4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qk3uFHQcEQv+Jm94Z/TNZaacKwG+eL0EHoCeBzfDwVjAtO+F1wq99RtCxuKFpbYtolkLGEKWa8bNARzYPb22v3G1GgaxssI2M+opJfARBS90ylsJ2eek5o3e6Ssvx7TNhIz1Tp3WtOw6ZQiMClnyP8S259Jdrg7OKL/yYBE0wFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XfoADKug; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XfoADKug"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-517ab9a4a13so228603a12.1
        for <linux-m68k@lists.linux-m68k.org>; Wed, 06 Mar 2024 15:42:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709768526; x=1710373326; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=D06RO/iB+lySEGD0vpgDb8SJP4q4lhTOPAfjOBx3FN4=;
        b=XfoADKug1z4yXylZEXLS6x9EYDUQwhg9ivIebkfP8cmrWQu1qVsiZGHoC6ZAOv1p1W
         hvN80pQVjOqKDMJIw4g50ezX2TcQktDWkSCE5sutb+cPyS1WNc2R/QMRS3Z6ufOLYnZ/
         y74nh2o8Cd72erYmrDq9u7ULyTP/JvnNgWQrr8p48XIhumANjhhkO3Ff2ryFP61IO5ie
         wvSYDzWHN73Tlr0zUh3dgof5U/QYR/GU56mu9Sm3vEmhBfitkZu1xF9FnEUYMZWR3Ppd
         Q4Vqtpq+tEe8QPn2hQ8KZ85UWwTerlzswiNX2aCoAGZqQTAosEV/i1fyYCnXV9o88Wyr
         GY1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709768526; x=1710373326;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=D06RO/iB+lySEGD0vpgDb8SJP4q4lhTOPAfjOBx3FN4=;
        b=Xy5qcOQhp1ZG6jHzt8op3ojTyiIKp6emAXSeMfqiAJx2u9GyCT5gqY8erB/COwLek4
         JuB5Ttasm9sH9CVwH1fLSoCK9JlDSnMD5Fe7bZQNMydtyMQXxcm+F0Kk5N51YEQUw1mH
         2tqcAGCXQ1H1rNX2oEHLBR5dnBWmahoqscGKAHlstQ0JFiMOckRakhkyxHmLAI8AXWAA
         0lcGfDnZCUKj3HerB0dAYNSnZp18K3VyLSSVi9TzIFYKblr2kK/Zvapz59HvOS6XfBKN
         GmRXXxzF5cxFUIElSBtWRkX+FXeXW789KM080WBVlH1Fr96HOxDsGKmFfAUV/13HV4Yc
         IfhQ==
X-Forwarded-Encrypted: i=1; AJvYcCUVWTYRfpJoTbLlk7Q+XRdAlJ03RqxiUzRtVtJbCCUIF0qTcTFa2N3TL64bZZqbvASPCW3dajOVPL3MpYUDTxSpxHy2brXGTt2Ju6/YtApo
X-Gm-Message-State: AOJu0YwHbgp8dSn7vq+IymXlsw6Aw9pVtSDDM1Li3r9fkOFpZ8dHvqXm
	imhTrz7aEbzydMpGYVU3OOhS152VF1pBLM+rWQdmJgvqXCW6n8wS
X-Google-Smtp-Source: AGHT+IHeRlLA4p7UsIMbtxwnVi81RGLvh+nSzdjjHcGGywcw/Wu8eruq6QOfxQCkFsrpTeAjHE1KjQ==
X-Received: by 2002:a17:90a:bc8b:b0:299:699b:c5de with SMTP id x11-20020a17090abc8b00b00299699bc5demr13864991pjr.19.1709768526457;
        Wed, 06 Mar 2024 15:42:06 -0800 (PST)
Received: from ?IPV6:2001:df0:0:200c:adb8:c71:a09c:347f? ([2001:df0:0:200c:adb8:c71:a09c:347f])
        by smtp.gmail.com with ESMTPSA id nk4-20020a17090b194400b0029b28e6ef26sm293735pjb.11.2024.03.06.15.42.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Mar 2024 15:42:06 -0800 (PST)
Message-ID: <2f4e8b3b-9980-43d1-a2d2-d62a9c9a7d6b@gmail.com>
Date: Thu, 7 Mar 2024 12:42:01 +1300
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: spinlock recursion when running q800 emulation in qemu
Content-Language: en-US
To: Brad Boyer <flar@allandria.com>
Cc: Guenter Roeck <linux@roeck-us.net>,
 Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k@lists.linux-m68k.org
References: <07811b26-677c-4d05-aeb4-996cd880b789@roeck-us.net>
 <0ccf5e42-63ec-a63d-9ee9-7043947637c3@gmail.com>
 <20240306083054.GA20607@allandria.com>
From: Michael Schmitz <schmitzmic@gmail.com>
In-Reply-To: <20240306083054.GA20607@allandria.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Thanks Brad,

On 6/03/24 21:30, Brad Boyer wrote:
> On Wed, Mar 06, 2024 at 08:14:31PM +1300, Michael Schmitz wrote:
>> Looking at the backtraces some more, I think what happens here is that the
>> swapper kernel task is stalled for long enough here that on the next
>> scheduler tick, it is still running. With no other tasks scheduled to run in
>> the meantime, it may still be the current task.
>>
>> The stalled swapper task still holds the run queue lock, hence the recursion
>> message.
>>
>> I do not think this is a bug, just a reflection of a slow system with
>> nothing much to do.
>>
>> There does not appear to be any interrupt nesting here. I cannot recall the
>> interrupt level assignment on the Q800, in particular as regards disk
>> interrupts and whether both VIAs are using the same interrupt level. I'd
>> suppose they would, as these chips date back a long time and probably cannot
... that should have been 'would not', of course. Autovectoring can't 
work otherwise.
>> place a vector number on the bus as part of the interrupt stack frame?
> No, a Mac with 2 VIA chips should always have them on separate interrupt
> levels. The exact mapping varies by model, but every model supported
> by Linux uses at least three different hardware IRQ levels.
>
> On most Mac models, VIA1 is IRQ1, VIA2 is IRQ2, and the SCC is IRQ4.
> VIA1 would handle the timer and ADB while VIA2 handles NuBus and SCSI.
> It looks like the Q800 supports switching VIA1 to IRQ6 through the
> alternate IRQ mapping. Most models also are using various other chips
> emulating a real VIA for VIA2 with varying levels of compatibility.
>
> Apple always used autovectoring and the three IPL pins to determine
> the interrupt vector. Older models just have three external IRQ
> sources, one matching each pin (thus the 1, 2, 4 pattern). I presume
> they had some external circuit to make sure only one line is being
> pulled low at a time since we never get other IRQ levels by accident.

Makes sense - thanks for refreshing my memory!

Cheers,

     Michael


>
> The AV macs and the IIfx are the only models with more complex
> interrupt controllers as separate chips (PSC or OSS).
>
> 	Brad Boyer
> 	flar@allandria.com
>
>
