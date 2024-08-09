Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6278C8D1
	for <linux-m68k@vger.kernel.org>; Fri,  9 Aug 2024 08:03:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723190634; cv=none; b=Cs1kWCaUuvapwanBmc9AkOJU9SATI6AcaDx/JCJbbe2vDfeZkk4ZaPLFLySrvvmW2JfmychzYrlWm0hKcxO6RrTZNU6/bmFcf2SLqZ+sMdc0WucQUXXkKSdfQpMLiUA04UW2SACD0MbZlt7Lv53TaODyTFBPqOvMZ6K/ib2SKbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723190634; c=relaxed/simple;
	bh=EjULTJb8Oi46+uGitzGguDD4D8JoQ1zCQXeyRqLs17Y=;
	h=Subject:To:References:Cc:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=uFoYKbqdefZBz2wnjTwbhK8aTqNapoaHgHt3ISXbbxtsmFhLXXfEo5reflf3Ac1PorbRl1BYBTkpQ10e9GKwNYnGvqJAYp2vDGveTdmwwTZRU1KYWJ841NI8HM8dqL6Jhi1M0RyBTsMiEH8+0SCa+sZJB2nVCqGLWtmv3qniVWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i/cPZuLa; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i/cPZuLa"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-7ae3d7222d4so1293270a12.3
        for <linux-m68k@vger.kernel.org>; Fri, 09 Aug 2024 01:03:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723190632; x=1723795432; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:cc:references:to:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hI81fGkWKE3/pFqXn5r84Y+xSe3yBKvcZYLhP9wyaRs=;
        b=i/cPZuLaEGJ8Bn7fYSQkhDxRm6vTgm//pPmHZAWy7blJruoG3lx3dtK8/Ng7UNtUxv
         pKqh54TYJa+hrm1PCcRM/Wd0BuUUiFB4WZhRR6cM3AG/27eXB5Qo0WhXb+LKZAfdNTSU
         IQQXu2uCAfjQj4pACPc/5rs+qnCVZJzPZ6tc5UloK+90/owVlCmVyMMbV6m18b+/em68
         SFQyno6eLCwG7Ehcuv7zwbb1FFzeWq7cU0H64OLvH14+tDukKSIL4eJ7JfcbgLMRsjLi
         +T24yTUeVMBGwrqg5aCTmiLkaLQK2OaDIelRQgBg9dSxCUhd4hTSBGk2Ljfpff9BoVKm
         aiWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723190632; x=1723795432;
        h=content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:cc:references:to:subject:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hI81fGkWKE3/pFqXn5r84Y+xSe3yBKvcZYLhP9wyaRs=;
        b=KhCDOZZbruecRcW3isVAqN3rCm5nb0q9eah/s+6vkB8No4CbOSUIv+uEMwCKnvFmmx
         axvZnJzznd/Uq2jxCqmq3LoC+oQqjr/KoOjJ0gkCPRxtc2NWEP9eqRUz1fa98V8BAVHe
         8KtBZ7FqEFMM73dwUavsnVXBzv63oZZAzl52YY0lG+Bp2+M507mbQ9vvuk6K42hlNouo
         kM95e+YOZhdfeweGcMMsWUMOwQA3o0i4oLtdMLsndFdZt7nZHrMeiXXA3U2toogICZkA
         Dt8Fe5RUG+ibZ4s5KOghaXcbQq0SRRRVpKZEi1Q/fJuN19UAU95owxPRpHP3BoZgpngQ
         47kA==
X-Forwarded-Encrypted: i=1; AJvYcCXq6fXOywvkfNzsiblZQKl39anVUpFKye7iEcpBs9sSqOyTa4znLMadrVvQ9+3o9GtOIR3MhlDSosuZ+PMTvTjSIML8fGNgAX+vIg==
X-Gm-Message-State: AOJu0YwiTvCb0V5ZnlvdxO33i8YhcFCoBcHOBgoasmTQeLRDmAsO2gpY
	LKSguTQ7q7D6RLNlbsfZgNmwJDMhfVi4dvipj9b145RptiW9/WsaK6Wukw==
X-Google-Smtp-Source: AGHT+IEQ3jTRUtYpRBwH2eOA0ZLYTqLUn/kintFGD34KTL9nQtTfbsj1tA3chpIcjPpCr6xRQVFHcA==
X-Received: by 2002:a05:6a20:e68d:b0:1c8:961c:4140 with SMTP id adf61e73a8af0-1c8a0138ae4mr1085575637.53.1723190631750;
        Fri, 09 Aug 2024 01:03:51 -0700 (PDT)
Received: from [10.1.1.24] (222-152-175-63-fibre.sparkbb.co.nz. [222.152.175.63])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ff592b6cfbsm136236075ad.306.2024.08.09.01.03.47
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 09 Aug 2024 01:03:51 -0700 (PDT)
Subject: Re: [PATCH v4 1/2] m68k: Handle __generic_copy_to_user faults more
 carefully
To: Finn Thain <fthain@linux-m68k.org>
References: <20240429030945.22451-1-schmitzmic@gmail.com>
 <20240429030945.22451-2-schmitzmic@gmail.com>
 <e0d53477-1646-9504-2382-f8793d078704@linux-m68k.org>
 <42dfdef0-88d1-4c15-b04b-174f12bd8f3f@gmail.com>
 <de7c9ac4-cb6f-e2a4-59e4-26fd7e260d4e@linux-m68k.org>
 <ae5facc5-4b10-481b-9f76-f9b007309d8f@linux-m68k.org>
 <727be0d7-a3ed-d3eb-2a13-c6ac316cd25d@linux-m68k.org>
 <00ccfc03-9032-435b-8082-905e225c7a0f@linux-m68k.org>
 <17d1fcdd-3b25-4401-a98d-3c676abb903d@gmail.com>
 <b2c65af6-1aa4-4e4f-fdf5-600e1d48ef72@linux-m68k.org>
Cc: Greg Ungerer <gerg@linux-m68k.org>, linux-m68k@vger.kernel.org,
 geert@linux-m68k.org, linux-m68k@lists.linux-m68k.org
From: Michael Schmitz <schmitzmic@gmail.com>
Message-ID: <5c737af5-4ba6-a6f4-c468-7d7b291c6781@gmail.com>
Date: Fri, 9 Aug 2024 20:03:45 +1200
User-Agent: Mozilla/5.0 (X11; Linux ppc; rv:45.0) Gecko/20100101
 Icedove/45.4.0
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <b2c65af6-1aa4-4e4f-fdf5-600e1d48ef72@linux-m68k.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Finn,

Am 09.08.2024 um 15:34 schrieb Finn Thain:
>
> On Fri, 9 Aug 2024, Michael Schmitz wrote:
>
>>>
>>> I tried out the "stress-ng --sysbadaddr -1" test, and that didn't go
>>> so well for me:
>>>
>>> # stress-ng --sysbadaddr -1
>>> stress-ng: info:  [37] defaulting to a 86400 second (1 day, 0.00 secs) run
>>> per stressor
>>> stress-ng: info:  [37] dispatching hogs: 1 sysbadaddr
>>> *** ILLEGAL INSTRUCTION ***   FORMAT=4
>>> Current process id is 39
>>> BAD KERNEL TRAP: 00000000
>>> Modules linked in:
>>> PC: [<00000000>] 0x0
>>> SR: 2004  SP: 6504e563  a2: 008ee380
>>> d0: 000000f7    d1: 00000000    d2: 00000000    d3: 00000000
>>> d4: 00a87b80    d5: bfbf3814    a0: 00000000    a1: bfbf3814
>>> Process stress-ng-sysba (pid: 39, task=4dbb2ec5)
>>> Frame format=4 eff addr=480a2004 pc=0002b154
>>> Stack from 00adff20:
>>>         00ade000 00000000 00000000 000000f7 00000000 00000004 00a87b80
>>> 00000000
>>>         00000000 00000000 00000000 008ee380 0002ab5c 00000100 00000122
>>> fffffff6
>>>         bfbf376c 0002b29e 000000f7 bfbf3814 00000000 00000000 00ade000
>>> 0002b222
>>>         00ae0800 80118988 00000000 00000005 bfbf37a0 00000005 bfbf3814
>>> 00adffcc
>>>         00023d2c 00adffcc 00000000 00000000 00000000 00000000 000000f7
>>> 00000000
>>>         80118b46 00021850 00024b00 000000f7 bfbf3814 00000000 00000000
>>> bfbf3814
>>> Call Trace: [<0002ab5c>] child_wait_callback+0x0/0x24
>>>  [<0002b29e>] sys_wait4+0x7c/0x8e
>>>  [<0002b222>] sys_wait4+0x0/0x8e
>>>  [<00023d2c>] buserr_c+0xb0/0x152
>>>  [<00021850>] buserr+0x28/0x30
>>>  [<00024b00>] system_call+0x54/0xa8
>>>
>>> But that is the same with and without these patches.
>>
>> I wonder if recent signal handling changes (e.g. commit
>> 0d4276cfbe6fd4c4a21acdee803b05a3a6192082) have rare unexpected side effects on
>> Coldfire here ... OTOH, signal handling as such works just fine, right?
>>
>
> That would be commit b845b574f86d ("m68k: Move signal frame following
> exception on 68020/030") on mainline. If it caused a regression, that
> would have first appeared in v6.4. I can't imagine how that commit could
> affect Coldfire but that's no reason not to test an older kernel.

Yes, testing older kernels is certainly the fastest way to rule out 
involvement of that commit.

On a closer look, there is no possible way in that this commit can be 
responsible for the bug unless Coldfire does use frame format B for 
access errors. I don't think that's likely?

> FWIW, my hunch is that the other stressors which call wait4() will
> probably crash too (regardless of kernel version).

Quite likely ...

Cheers,

	Michael


