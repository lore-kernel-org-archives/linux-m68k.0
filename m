Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C37310A0A
	for <linux-m68k@lists.linux-m68k.org>; Mon, 11 Mar 2024 07:06:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710140775; cv=none; b=aZ/DmOjJpnmsdszCstKFZVfy77+Sk0bcYCmUVB3BYoUfllGYPKfBC4rqK4o6RfZr19guPF2vYfN7jwSkCgNuja/Aes09SgokHR2E9wBhW/BefejSuraujwinVoAWTPYIAM5zYVGDZVqLiy1oWqmP45Xy1B98LaKEsMZ+SQNCJqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710140775; c=relaxed/simple;
	bh=CBX6e4G8hMRTg6ZCBD75VIdlJlAQSYefavMx9oYWFxE=;
	h=Subject:To:References:Cc:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=cNDQumfoOwgC7F3EMfFT0CwBRrHz7Ai4svEP6iaICC2IOiQ4SWaFgjqK4MfcEZMGJydPZkehr0eqzQ4M4UW3NQjvqCprD2lUejVPFdUQtB9TL/z4/CdqkQyrWuKXyhffY+oq1lV8bdDLxwIAOUCfi3AD8b3mUYU82gzpoo/CSbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hLo9Ge2E; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hLo9Ge2E"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-6e622b46f45so1944259b3a.1
        for <linux-m68k@lists.linux-m68k.org>; Mon, 11 Mar 2024 00:06:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710140772; x=1710745572; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:cc:references:to:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2utyRXg2bKlBgtgBwkAr2+mciWzSuxzTJPH1x3vlIVY=;
        b=hLo9Ge2E3/KkFdHwl5Wi7RlcDIk4RydGxzjh2i1aQ1srMzXbQSExZeiZM8wAiDUeOv
         lhJoowUeMt9FTVYcjNkWdSRvZIvTcyaQddB20QQ/CeFZptpR6xE2G6eh8kOj0OAyNpG7
         K2TMkd1ooShDYa2+4lS3aN0oms0VIr34XR/uFK0v5JvSiy2dPoAPB+h/BbN5wBVgsrjL
         D3uEsA9Kugy2V9V5dp+VGq200RHEhD4BOytmS9aWtbwwKTf18VY3DDqhC1SnfxgzzzF9
         sTV8ccQPjpsJQ5tDrYWBKSBRAA6P47+vab2BoyLiUqShnDpENmEDgueuD+dhzghTOUz/
         zzbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710140772; x=1710745572;
        h=content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:cc:references:to:subject:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2utyRXg2bKlBgtgBwkAr2+mciWzSuxzTJPH1x3vlIVY=;
        b=iXPJKRbBnd7KLXIeEAR7iGv33OFgjShXBAmQikg4h8C0FxfmKA98hTvnOxJKcOtDTe
         Kleqbd3fcC9kBULmHXNbUWK9WLiyznnsuQ2etHsHP8i4Rwspucozz9OGGvgyWpdT+cXS
         jIXnk8Nf2LxRsD/0k1gAwbYVkRnHdNcXC0Ygre14GZ2AMzoO2ODlClna6zGvrrTIfF33
         vMom2KFL5EOcGC05W+CxcyfkB/skPaVy5JolQ2lM9FUuW4D9j8QewzavUCt23abSNkp6
         C2Tm2+VWyRHiXXAHL4sagfv1hsQEjsBM1V0hO+CV+k/O6hpdurDl0FDoVAbWIJXsyDjj
         tSbQ==
X-Forwarded-Encrypted: i=1; AJvYcCUIDUacB91FX14ZSFf9/7kBsvRJKUBnow3DOJF0JQRH3cfy1kyGyDLuSwf8xs7Ouf4b6c/v13uVEbU2D59YB6o9l4cVP2qBHxeWHqTE0wOv
X-Gm-Message-State: AOJu0YxvaZFsoKx9/AJQIu2ViAFnWx0T9ylZ7LYp84gNT0lA3nxl6q3+
	ORO1xEVtn4478J6tY6VWD2xSbLjtCJwgqmY83kfNcL4e923eCJYsp825O8Ab
X-Google-Smtp-Source: AGHT+IF7/yhFxQhisHx+xWAJDy5GTYsK6PqpALK12QmvLQFdD3svexAAcNwXEcjsVpmvyVIh/i22UA==
X-Received: by 2002:a05:6a20:e118:b0:1a1:4da9:8d76 with SMTP id kr24-20020a056a20e11800b001a14da98d76mr3572324pzb.13.1710140772471;
        Mon, 11 Mar 2024 00:06:12 -0700 (PDT)
Received: from [10.1.1.24] (222-152-175-63-fibre.sparkbb.co.nz. [222.152.175.63])
        by smtp.gmail.com with ESMTPSA id c8-20020a056a00008800b006e6541de250sm3610188pfj.119.2024.03.11.00.06.06
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 11 Mar 2024 00:06:11 -0700 (PDT)
Subject: Re: spinlock recursion when running q800 emulation in qemu
To: Finn Thain <fthain@linux-m68k.org>
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
Cc: Guenter Roeck <linux@roeck-us.net>,
 Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k@lists.linux-m68k.org
From: Michael Schmitz <schmitzmic@gmail.com>
Message-ID: <ad9a7be6-e2f4-f17b-04fe-393a409e523d@gmail.com>
Date: Mon, 11 Mar 2024 20:06:02 +1300
User-Agent: Mozilla/5.0 (X11; Linux ppc; rv:45.0) Gecko/20100101
 Icedove/45.4.0
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <9e5ce055-8af4-4cca-3505-a3186b86926d@linux-m68k.org>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

Hi Finn,

Am 10.03.2024 um 11:18 schrieb Finn Thain:
> On Sun, 10 Mar 2024, Michael Schmitz wrote:
>
>> But I've now got this in ARAnyM:
>>
>> BUG: spinlock recursion on CPU#0, pool_workqueue_/3
>> ...
>
> OK. I am unable to reproduce the BUG, unfortunately.

Looping over 178 boots (using init=/sbin/reboot), I see eight of the 
spinlock recursion messages in ARAnyM on my old PowerBook G4:

BUG: spinlock recursion on CPU#0, swapper/1
BUG: spinlock recursion on CPU#0, swapper/1
BUG: spinlock recursion on CPU#0, pool_workqueue_/3
BUG: spinlock recursion on CPU#0, swapper/2
BUG: spinlock recursion on CPU#0, pool_workqueue_/3
BUG: spinlock recursion on CPU#0, pool_workqueue_/3
BUG: spinlock recursion on CPU#0, swapper/2
BUG: spinlock recursion on CPU#0, pool_workqueue_/3

Trying the same on a much faster Intel system, no messages are seen. 
I'll try locking the PowerBook on half CPU clock rate next.

>> mfp_timer_c_hander() has a local_irq_save() / local_irq_restore() pair
>> around the legacy_timer_tick() invocation so this spinlock recursion
>> does appear to work even without reentering the scheduling timer routine
>>
>
> IIUC it is not spinlock usage that's at issue. IIUC the problem is either
> the implementation of the locking primitives or the tests to verify their
> properties.

The tests on unlocking certainly aren't atomic, but those are not the 
ones we see in the messages. The test on locking use READ_ONCE() so 
ought to be safe.

The locking primitives are not atomic at all, by design ('No atomicity 
anywhere, we are on UP'. While not debugging, spinlocks are NOPs on UP.)

I wonder whether CONFIG_DEBUG_SPINLOCK was ever meant to work at all on UP?

Cheers,

	Michael






