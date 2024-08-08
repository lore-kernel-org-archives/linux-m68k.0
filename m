Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A38A433AD
	for <linux-m68k@vger.kernel.org>; Thu,  8 Aug 2024 19:27:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723145259; cv=none; b=m8aEYbAkY+Af8qjlq/6MWtH3Fb0aRvOw6UW/hiStnuTKcEqrZpQ49QkolLGUEEcqI5lLcbO/F4/1+6P4xxLunxdhSME9ZO5IzEHiAZwFJvzlpC2qWZhJ9MaY/182pmfbVwzNznhugwe1YkTnmqpEtYbQIC89r3t9+Z0oxtsqZCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723145259; c=relaxed/simple;
	bh=iz3jZCB11duxAb0mXAMIyNONAJz1YFyXNgW/6SymeZw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qX7EXEtvIjZmQU/rNT+fxK8OumiofJg6rRorAUGo67x4XNjprURljoaKu/W1aHAZMocbsflydEMfLiJ4N6sNeVxIcrsoznjSehJ5eBYvLU+cwXLvbBhgwWL51QoEbZvx5nAS65CeH9PcjAEBs3FGJj0DheWF71qACfF3GMXGu4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GHLJiuV7; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GHLJiuV7"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-70ea2f25bfaso1076112b3a.1
        for <linux-m68k@vger.kernel.org>; Thu, 08 Aug 2024 12:27:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723145257; x=1723750057; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2ndLd5O47OV0DPIghbuXdW8j35FjFwAqXS9BGu8lCGk=;
        b=GHLJiuV7au8Tgw7jqPSOB9wojMXqdKYckz19pFLn1iAAuSbE0jK2/Se/MPHeK7CFJz
         Bjk82hv8bJw2l2c7Q1xGP3iuKhenF3W0E9NcTDPqq0GjAHVRiu+CoA+8P13ONZU19kbi
         wODtusEzmrKpDXaUEDMFKHKHlWwK8O2M9ER/y1X6OLKiAhbkVZLDKihcYGXNCIvimXIn
         vt2585iVgBQqVhuOuWgyjOhG2LNMFgiA8Y7xH3kOQGasPSi/hQTCdjE13dbJUObbSE4P
         B7vVHCFQVh4BIEjp9dRNgLnbdNzcnW1fr+6G2DbSUKTrnVaB/slrh/YQnUXzNbL7jbVJ
         ZdPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723145257; x=1723750057;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2ndLd5O47OV0DPIghbuXdW8j35FjFwAqXS9BGu8lCGk=;
        b=ullOVPqcI5S23JUmzXBPnElX5SsNZMb1q9cD8/mw2fLsjxYnnZayXlol266ubyJ95a
         SZYF/CYmLfsHpkkHsKAOJMwEGwPmDLencEhOwDH20QMD5RZwUcnbJT8iiIjpyp2D5U0w
         rQiTZA67PCfLMswMNjuxOrZZD6qDC86xjcOHvBngiIGroeh0I2J9gTgd4Uj1E7wmw0y9
         G+Q7DoZ8Neoj7PWI3ne7SR4uj18ZjLPaDcI9TZmsbNzivbVt6gu/ExcXdICZko1HYB6V
         Fa0C8zAm63EamfFqFvixKeRokODllE5PONzJIWAx7mlXFD4Cm5lmwRX0q8H8lgvvf89k
         RmaA==
X-Gm-Message-State: AOJu0YzURx2+18ZUZ3Od3CsuzKCmaTkKauoiYQvmUfm821CWjzBh0PXA
	5L5WJqoHNzUJ+Wh9IHFQJmu5dV3R4zagGJSQ2I5iOvbYpT9/ZcZnb/PFyQ==
X-Google-Smtp-Source: AGHT+IGtSu0PUOCZhQN05J7HlLdFntt0Q1LDhaApoXp82Y2voQMQDF7zy3s8rspU++l45xyJK5aX+Q==
X-Received: by 2002:a05:6a21:8197:b0:1c0:bd9c:adf with SMTP id adf61e73a8af0-1c6fcfe53cfmr2581012637.50.1723145257082;
        Thu, 08 Aug 2024 12:27:37 -0700 (PDT)
Received: from ?IPV6:2001:df0:0:200c:6141:468:b3ab:b10c? ([2001:df0:0:200c:6141:468:b3ab:b10c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-710cb2d376csm1452263b3a.111.2024.08.08.12.27.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Aug 2024 12:27:36 -0700 (PDT)
Message-ID: <17d1fcdd-3b25-4401-a98d-3c676abb903d@gmail.com>
Date: Fri, 9 Aug 2024 07:27:51 +1200
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] m68k: Handle __generic_copy_to_user faults more
 carefully
To: Greg Ungerer <gerg@linux-m68k.org>, Finn Thain <fthain@linux-m68k.org>
Cc: linux-m68k@vger.kernel.org, geert@linux-m68k.org,
 linux-m68k@lists.linux-m68k.org
References: <20240429030945.22451-1-schmitzmic@gmail.com>
 <20240429030945.22451-2-schmitzmic@gmail.com>
 <e0d53477-1646-9504-2382-f8793d078704@linux-m68k.org>
 <42dfdef0-88d1-4c15-b04b-174f12bd8f3f@gmail.com>
 <de7c9ac4-cb6f-e2a4-59e4-26fd7e260d4e@linux-m68k.org>
 <ae5facc5-4b10-481b-9f76-f9b007309d8f@linux-m68k.org>
 <727be0d7-a3ed-d3eb-2a13-c6ac316cd25d@linux-m68k.org>
 <00ccfc03-9032-435b-8082-905e225c7a0f@linux-m68k.org>
Content-Language: en-US
From: Michael Schmitz <schmitzmic@gmail.com>
In-Reply-To: <00ccfc03-9032-435b-8082-905e225c7a0f@linux-m68k.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Greg,

tanks for testing!

On 9/08/24 02:52, Greg Ungerer wrote:
> Hi Finn,
>
> On 8/8/24 16:56, Finn Thain wrote:
>> On Thu, 8 Aug 2024, Greg Ungerer wrote:
>>> On 8/8/24 11:57, Finn Thain wrote:
>>>>> I'm afraid I've lost track of where we're at with this patch series.
>>>>> Does it need more work, or more bug reports such as the one below?
>>>>
>>>> Apparently the series is waiting for some testing on a Coldfire system
>>>> with MMU.
>>>
>>> Ok, I am in a state that I can do that now (I managed to fix my 
>>> M5475EVB
>>> board).
>>
>> Thanks, Greg.
>>
>>> If I test the v4 versions of this patch set that should do the job?
>>>
>>
>> There are 3 patches that need some more testing, one from me and two 
>> from
>> Michael:
>>
>> [PATCH] m68k: Handle put_user() faults more carefully
>> [PATCH v4 1/2] m68k: Handle __generic_copy_to_user faults more carefully
>> [PATCH v4 2/2] m68k: improve __constant_copy_to_user_asm() fault 
>> handling
>>
>> They were posted in two threads:
>>
>> https://lore.kernel.org/linux-m68k/1ed9c4c753395510c1a8df9c35e2ad4c31c90f95.1714265926.git.fthain@linux-m68k.org/T/ 
>>
>> https://lore.kernel.org/linux-m68k/CAMuHMdVrOnOQwCxk42YCjEkbfL-YDSvpf_xTaouv9hUs2bO+qg@mail.gmail.com/T/ 
>>
>>
>> On 680x0, one of the bugs was brought to light with 'stress-ng
>> --sysbadaddr -1'. The others required special test programs.
>>
>> I've no idea whether Coldfire silicon is susceptable at all, and if 
>> it is,
>> whether the same reproducers would work. But that's neither here nor 
>> there
>> from a regression testing standpoint.
>
> Ok, thanks for the links. I have applied and tested those, no obvious 
> regressions.
> So for all of these patches:
>
> Tested-by: Greg Ungerer <gerg@linux-m68k.org>
>
> I tried out the "stress-ng --sysbadaddr -1" test, and that didn't go 
> so well for me:
>
> # stress-ng --sysbadaddr -1
> stress-ng: info:  [37] defaulting to a 86400 second (1 day, 0.00 secs) 
> run per stressor
> stress-ng: info:  [37] dispatching hogs: 1 sysbadaddr
> *** ILLEGAL INSTRUCTION ***   FORMAT=4
> Current process id is 39
> BAD KERNEL TRAP: 00000000
> Modules linked in:
> PC: [<00000000>] 0x0
> SR: 2004  SP: 6504e563  a2: 008ee380
> d0: 000000f7    d1: 00000000    d2: 00000000    d3: 00000000
> d4: 00a87b80    d5: bfbf3814    a0: 00000000    a1: bfbf3814
> Process stress-ng-sysba (pid: 39, task=4dbb2ec5)
> Frame format=4 eff addr=480a2004 pc=0002b154
> Stack from 00adff20:
>         00ade000 00000000 00000000 000000f7 00000000 00000004 00a87b80 
> 00000000
>         00000000 00000000 00000000 008ee380 0002ab5c 00000100 00000122 
> fffffff6
>         bfbf376c 0002b29e 000000f7 bfbf3814 00000000 00000000 00ade000 
> 0002b222
>         00ae0800 80118988 00000000 00000005 bfbf37a0 00000005 bfbf3814 
> 00adffcc
>         00023d2c 00adffcc 00000000 00000000 00000000 00000000 000000f7 
> 00000000
>         80118b46 00021850 00024b00 000000f7 bfbf3814 00000000 00000000 
> bfbf3814
> Call Trace: [<0002ab5c>] child_wait_callback+0x0/0x24
>  [<0002b29e>] sys_wait4+0x7c/0x8e
>  [<0002b222>] sys_wait4+0x0/0x8e
>  [<00023d2c>] buserr_c+0xb0/0x152
>  [<00021850>] buserr+0x28/0x30
>  [<00024b00>] system_call+0x54/0xa8
>
> But that is the same with and without these patches.

I wonder if recent signal handling changes (e.g. commit 
0d4276cfbe6fd4c4a21acdee803b05a3a6192082) have rare unexpected side 
effects on Coldfire here ... OTOH, signal handling as such works just 
fine, right?

Cheers,

     Michael


>
> Regards
> Greg
>
