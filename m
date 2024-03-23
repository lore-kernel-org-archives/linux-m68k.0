Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D1CC1A38C6
	for <linux-m68k@lists.linux-m68k.org>; Sat, 23 Mar 2024 06:32:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711175541; cv=none; b=IVRQGn6lBRTfKIan0d7tdy564aMxonqYI50Pm1vhlch0BXTI5ivts0IMmc8OyPov6FoyXZMrY5C7In47I55eemrht+VPZzg+NDi0e/JrGRAJ3SGC+XIhxBrRaTNOAQcPTcQyiTYWG7FsnzPA7XQEbVq25++AU6e1gqRG35Ugfvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711175541; c=relaxed/simple;
	bh=cUjbYdeCAyU3gEEOEOwpeSBtuVVVNLp9k1ZY9/u6vlU=;
	h=Subject:To:References:Cc:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=Yqu7u3fT++HO8voap3E0C80Ja7PftxYeKzUtAvqc2PVaYGhk6zbUo1DpgC4Uh7U133VwvW9eOfAsZB0HpRnRLsKuhev13YCRCcIyzhZt0IMlR5g/tQhNHYEstsU7RFyvd4VZna+JQpvH+d+BEyJsfPLFnR19o39p92xAhgXJc4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l+1J1RcH; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l+1J1RcH"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-29df3333d30so1916685a91.1
        for <linux-m68k@lists.linux-m68k.org>; Fri, 22 Mar 2024 23:32:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711175538; x=1711780338; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:cc:references:to:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dVJID9tu9VFOTKptapxFInIveasDHplaLbqnCG8xPSA=;
        b=l+1J1RcHdFFGb1frf2Vx39bj9eT5rj2d2nKYi13UcY0TiVlrM4QCEN9ixsGYtMFb9L
         Y5NUc7k41Xq8OWp58T+82CkdMcm9zjj87pGk1e8BfTTCDuKQMn3AnaNwmQFuaY7/qL02
         Bc3DOOYA9KB5/5LauPH0Ff/Gy7xjvVqyNxuBTVBMLnwm8AvclFlN01Uvar+SEA2WdDnF
         Z7QBEHD/oNZ+v4aB7gLuVDIWX0T1IboC4a6mkmwORWN/rHp2MNWQ2jUhJdc/E/jwrmRy
         tZmKe4ofYEr/Gjzh0CiDd7Al1jAxyEfT4JuWyii3BhH5BED3+Yj0sgrwWJM32IRpRVVd
         YnJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711175538; x=1711780338;
        h=content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:cc:references:to:subject:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dVJID9tu9VFOTKptapxFInIveasDHplaLbqnCG8xPSA=;
        b=Dq6ZXhtGSwwg9UrmkvAfgIFClmPi1s40aRnBlNNtVjKMRM1zs2FSM67rz9gmeLF8Of
         +gktjBwqcamo4pZHjhdfUa6UKdMy6rzanad/B55RZjUM9Z/2m7pHgLtdUGv6I5chyOf2
         wSY01BSUYOw7plxJJwiXpmQDmf+CquiJ4UJj6HUWuFusdE6Fq/1fNMaA4ibVEeHED4bh
         19HcpKoQhhT3kIsoQ8Y/GHhyKem4w1v5sldMTFve3P8Oq2kqdOMbhz1V3RrqsU58EP40
         HKYahFtZWt5nGRudX8mDtCbD186Y1YFcEY9gTzTNQk/0Aluf01QEvHwqZSZJBW5h6YUb
         4DFw==
X-Gm-Message-State: AOJu0Ywfilmts/+Btk9uJaNS2IFQBo2bJV6UFsk9gXBzpHLIdFfR4LJE
	HYhGR8zxqD2PaObhqy9tTW7XOc0OOg2mThQ/1S6WwiRdARW6csCLKPqPT/2M
X-Google-Smtp-Source: AGHT+IHuVFV9fTHkrOx1Y3cvoMuk2Tc9XqMrlx2AkOe8Xkf1Xhi0uq6XsLeeH8pFc2fl+HGQqYTdYQ==
X-Received: by 2002:a17:90a:2c0e:b0:29e:c3d:c3fc with SMTP id m14-20020a17090a2c0e00b0029e0c3dc3fcmr1491683pjd.18.1711175538248;
        Fri, 22 Mar 2024 23:32:18 -0700 (PDT)
Received: from [10.1.1.24] (222-152-175-63-fibre.sparkbb.co.nz. [222.152.175.63])
        by smtp.gmail.com with ESMTPSA id fw17-20020a17090b129100b0029bc319f7c9sm6684664pjb.39.2024.03.22.23.32.15
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 22 Mar 2024 23:32:17 -0700 (PDT)
Subject: Re: [PATCH RFC] m68k: skip kernel premption if interrupts were
 disabled
To: Finn Thain <fthain@linux-m68k.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>
References: <20240322014805.30606-1-schmitzmic@gmail.com>
 <fcabda73-4b16-ee2c-e993-2bfcf392a26a@linux-m68k.org>
 <e89bf618-2fa8-7cbd-16ed-d021a9a7f740@gmail.com>
 <948c12e4-e85f-a86c-ae95-a1eb03ca026d@gmail.com>
 <40928e38-0de7-75a6-d5f7-8c913155da03@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org
From: Michael Schmitz <schmitzmic@gmail.com>
Message-ID: <5e344842-0b19-1f83-dc77-51210a8880c7@gmail.com>
Date: Sat, 23 Mar 2024 19:32:12 +1300
User-Agent: Mozilla/5.0 (X11; Linux ppc; rv:45.0) Gecko/20100101
 Icedove/45.4.0
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <40928e38-0de7-75a6-d5f7-8c913155da03@linux-m68k.org>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

Hi Finn,

Am 23.03.2024 um 17:35 schrieb Finn Thain:
> On Fri, 22 Mar 2024, Michael Schmitz wrote:
>
>> Am 22.03.2024 um 17:53 schrieb Michael Schmitz:
>>> Am 22.03.2024 um 17:39 schrieb Finn Thain:
>>>
>>>> I find that patch description to be a bit confusing, since
>>>> preempt_schedule_irq() requires that interrupts were disabled:
>>>>
>>>>         BUG_ON(preempt_count() || !irqs_disabled());
>>>>
>>>> Looking more closely I see that you're testing the IPL bits from the
>>>> stack not the status register...
>>>
>>> Yes - the problem appears to be that if we enter preemption when about
>>> to return to kernel code that had interrupts disabled, bad things may
>>> happen [...]
>>> That's independent from having interrupts disabled in the currently
>>> active exception.
>>>
>
> Is it? If interrupts were disabled by the code we're returning to, surely
> they must be disabled still (in the Status reg, for the BUG_ON above).

They would still be disabled, but by calling preempt_schedule_irq() they 
will be reenabled before calling schedule(). At that time, another 
interrupt may come in, and change things from under the piece of code 
that had interrupts disabled.

That won't happen without preemption.

What's more, I suspect schedule() may cause another process to exit that 
would otherwise first take a signal, and signal delivery then repeats 
the vma teardown on process exit. At least that is how I read those 
'table already freed' stack traces.

>
>>>>
>>>> It's not clear to me which pre-emption opportunities remain in
>>>> effect. E.g. is full preemption (in effect) the same as voluntary
>>>> preemption?
>>>
>>> Good question - I'll have to instrument preempt_schedule_irq() and see
>>> if it gets called at all with my patch.
>>
>> Can't see preempt_schedule_irq() entered with my patch ...
>>
>
> Neither can I: A quick "stress-ng --zombie -1 -t 100" test passed without
> ever calling preempt_schedule_irq() in QEMU.

Right. Whenever I allow preemption with IPL (in the saved frame's SR) > 
0, I eventually get the 'table already free' panic. Trying to save the 
whole frame for later printing in free_pointer_table() hasn't been too 
helpful though. The saved frame's PC does not appear anywhere in the trace.

>
>> In general, full preemption is not the same as voluntary preemption.
>> Full preemption attempts to preempt on every return from interrupt or
>> syscall (given certain constraints are fulfilled such as we're not
>> currently in any interrupt or already preempting, and there's other work
>> that needs scheduling).
>>
>> The constraint that interrupts must not be disabled in the saved stack
>> frame apparently is one constraint too many...
>>
>
> I dropped the mailing list from the recipients in my previous message.
> This might a good time to follow up on the list in case Geert can shed
> some light.

Adding Geert and list back in now ...

Cheers,

	Michael


>
