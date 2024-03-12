Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74769567D
	for <linux-m68k@lists.linux-m68k.org>; Tue, 12 Mar 2024 00:51:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710204712; cv=none; b=n/GqXWXRrYfNHCfJYIizIAG3koNBIpXoKOAlzC/q70HeylN7mYmODGWuhVjwjzjvJYxRohBmtm37pPVTdfNK41AG6X5lL96xAfRJxhd1NaAHf4V/xMBl6Jj+pDrYo+Hs8KTt9Fz9Jzyk+DSJb8pYjDukPzbA4xLBf2xdyUkV4QE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710204712; c=relaxed/simple;
	bh=FzfvYgnOMsal7fQxayzr/nUoh+nWFt6lBqk0rePz2ZU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZT1BEdUiBNMYbLAthbGRKnouzJeuH3GMVz+8u4Q4/0yZ+unm+FPeYyE1cNRNSWY0mhAIZIyWXnGafLZ4UHUqhw14XZqXI/KF3iFJwHd9bBhfUiFlXGEgg0KVdOUAAGf/1lcKD50pXoh/wqDC67cAPxbf9I1uVpnkL0/UM/iYqNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KVdfbVLF; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KVdfbVLF"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-53fbf2c42bfso3251248a12.3
        for <linux-m68k@lists.linux-m68k.org>; Mon, 11 Mar 2024 17:51:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710204710; x=1710809510; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=N2bVuvmUkLf5R97WG62Niwh8OVWpJDkjR2tNCUIazyg=;
        b=KVdfbVLFDcSEUr+XVGiznFafsZvDrXrW5uYN8QV/PtNtJeRqE593Al+jQ6/mfIdST9
         ct4PCdHP0+qS+7pL8+vGiSLLyjrpFhp/cf672G5hJ5J1bj/XJPg9kAga3M5Tn/r6hsAa
         dz9liT3aMHAfMCTm+27G8zvOQnRDZ0/dEpB7LrFh+i97RzfyW2WL1udkLXiYY/40vSRX
         U3wp2qFGLr7J8pmPLzvEbBBpPccAVXQP6zYj47NHZsdKDYADvesU0G3sTlMBlqwaLgPX
         UqdtqFqmOtJmeVcQ25ajX1Qnyp/CvAzlQQIkYl7gKzsbFMWDCWT7a9Qz1o3tMP+NhQPT
         KM4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710204710; x=1710809510;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=N2bVuvmUkLf5R97WG62Niwh8OVWpJDkjR2tNCUIazyg=;
        b=E5uc0fwIBqMfpESRQyUqiox7e70nE4aB+Yr/uoUlzrx+oeQ7nLQSlJ0zrwjqwj2xsS
         AbstKgHtafHJJ040dMs4khEWi2MdWVBTrBjom18td1lx3MH9vd+01cnHJAXYtDpCel39
         YEH7aLvav008uvynFwqcco1QdK9f+gEZa2gt6s4iRKNIfuSj2zUdB6qhDNF/M8/2lwRH
         6l/AGqCtv6/H+A5WjY1270fUE+LTVabi+yw3nELyNCTmYXjYN1+pQk4bONtg/YXW239j
         EALfXmZQTFZYIZnGIK62Z1mO327lXE4ZMWZ6/lZHD6D0I3yRVKQendltsCJd4NFdWi7p
         Xjzw==
X-Forwarded-Encrypted: i=1; AJvYcCVusw72BHXTrabMfzw1g6tkRYWWs3Gngkz/H1u+UazjQdcSy5kIk1z7ou5cvEr7pe7uDb1HWdjy1hAlX1zhmjXZG1gxp5zcvoCEW+dywDlL
X-Gm-Message-State: AOJu0YwY3KrotFcYlV6P/qXEcVLxiazu0tEjLuxgCa9gM7WErWY+p53b
	zzqsDEfDWlzWv0ArDZfKWLEcWk6G4Ymhy5q0BSL9zE2W4CCUEVI9
X-Google-Smtp-Source: AGHT+IFudIfc+/8k0DVRb/5eoXdMpcKzS7Xs0fVQuIV/0kl7xR71pBLrz6yAFig7PzDblmT3Fvgi8w==
X-Received: by 2002:a05:6a20:2447:b0:1a3:1771:34e5 with SMTP id t7-20020a056a20244700b001a3177134e5mr5154107pzc.37.1710204710285;
        Mon, 11 Mar 2024 17:51:50 -0700 (PDT)
Received: from ?IPV6:2001:df0:0:200c:cce2:5e6b:f484:1b3f? ([2001:df0:0:200c:cce2:5e6b:f484:1b3f])
        by smtp.gmail.com with ESMTPSA id x6-20020a17090a46c600b0029996fd70e2sm4561591pjg.45.2024.03.11.17.51.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Mar 2024 17:51:49 -0700 (PDT)
Message-ID: <afcd0605-49e4-49c6-90a3-2d5b6a2cbf78@gmail.com>
Date: Tue, 12 Mar 2024 13:51:33 +1300
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: spinlock recursion when running q800 emulation in qemu
Content-Language: en-US
To: Finn Thain <fthain@linux-m68k.org>
Cc: Guenter Roeck <linux@roeck-us.net>,
 Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k@lists.linux-m68k.org
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
From: Michael Schmitz <schmitzmic@gmail.com>
In-Reply-To: <745f844f-a100-5f38-99b3-97ace157b2a2@linux-m68k.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Finn,

On 11/03/24 21:35, Finn Thain wrote:
> On Mon, 11 Mar 2024, Michael Schmitz wrote:
>   
>> Looping over 178 boots (using init=/sbin/reboot), I see eight of the
>> spinlock recursion messages in ARAnyM on my old PowerBook G4:
>>
>> BUG: spinlock recursion on CPU#0, swapper/1
>> BUG: spinlock recursion on CPU#0, swapper/1
>> BUG: spinlock recursion on CPU#0, pool_workqueue_/3
>> BUG: spinlock recursion on CPU#0, swapper/2
>> BUG: spinlock recursion on CPU#0, pool_workqueue_/3
>> BUG: spinlock recursion on CPU#0, pool_workqueue_/3
>> BUG: spinlock recursion on CPU#0, swapper/2
>> BUG: spinlock recursion on CPU#0, pool_workqueue_/3
>>
> Not the reliable reproducer I was hoping for but it is progress. We now
> know the problem shows up in both Aranym and Qemu.

Yep - no large impact by dropping the CPU clock (and BogoMIPS) by half 
though. One boot in sixteen shows the recursion message now.

Still running the test with local_irq_save() / local_irq_restore() 
protecting the spinlock debug tests.

>
>> Trying the same on a much faster Intel system, no messages are seen.
>> I'll try locking the PowerBook on half CPU clock rate next.
>>
>> ...
>>
>> The tests on unlocking certainly aren't atomic, but those are not the
>> ones we see in the messages. The test on locking use READ_ONCE() so
>> ought to be safe.
>>
>> The locking primitives are not atomic at all, by design ('No atomicity
>> anywhere, we are on UP'. While not debugging, spinlocks are NOPs on UP.)
>>
> I think spin_lock() reduces to preempt_disable() on UP.
> In include/linux/spinlock_api_up.h it says,
>
> /*
>   * In the UP-nondebug case there's no real locking going on, so the
>   * only thing we have to do is to keep the preempt counts and irq
>   * flags straight, to suppress compiler warnings of unused lock
>   * variables, and to add the proper checker annotations:
>   */

That's only true in the debug case - there, preempt_disable() is used 
inside the spin loop. But m68k is one of the last CONFIG_PREEMPT_NONE 
archs AFAIR, and preempt_disable() reduces to barrier() on those.

>> I wonder whether CONFIG_DEBUG_SPINLOCK was ever meant to work at all on UP?
>>
> I've no idea, sorry. The people who would be able to help would be found
> in MAINTAINERS in the "LOCKING PRIMITIVES" section.

I'll ask around once I've done a few more tests.

Cheers,

     Michael


