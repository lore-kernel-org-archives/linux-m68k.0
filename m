Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 592E4146586
	for <linux-m68k@vger.kernel.org>; Fri,  9 Aug 2024 12:58:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723208294; cv=none; b=ptTRhf01VbUMkQUuzh/kLprwG/z+XQZa/0Znf5+BUEZd/LCadfQ4RHRPjnrR98+40pfbxpzIApsHh0PywjhbnFsgRz9BgnBXbJWtFW0BPBGZD0GtZz8FnaisU2alWn9d4Oaay+KnzuEEtR4HmiKo1S3RiY0AHDzipzAf1YW3SRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723208294; c=relaxed/simple;
	bh=WyJcN/XkP5VI01szEQx4+eNER/N6tUMsBs5O44z3hYk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RIIuY/P/tr16zTbVV24Zn36vXh9C7/TqmNsI40Mm3/yJrRenZ8AYLE7MFnLwUWdzzbPRS27rxEdegU2ZrQhajcEZd6T1XLJMJm7XotdYsTky+SuGiEKpvZaDHAhpAHklt/5hrel966Yqts0TczZw/LdgiIy+oWqjPjNri754K7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BEF26C32782;
	Fri,  9 Aug 2024 12:58:12 +0000 (UTC)
Message-ID: <64ae53d5-57fb-4b72-997c-c5158bea04fa@linux-m68k.org>
Date: Fri, 9 Aug 2024 22:58:09 +1000
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] m68k: Handle __generic_copy_to_user faults more
 carefully
To: Michael Schmitz <schmitzmic@gmail.com>, Finn Thain <fthain@linux-m68k.org>
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
 <17d1fcdd-3b25-4401-a98d-3c676abb903d@gmail.com>
 <b2c65af6-1aa4-4e4f-fdf5-600e1d48ef72@linux-m68k.org>
 <5c737af5-4ba6-a6f4-c468-7d7b291c6781@gmail.com>
Content-Language: en-US
From: Greg Ungerer <gerg@linux-m68k.org>
In-Reply-To: <5c737af5-4ba6-a6f4-c468-7d7b291c6781@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


Hi Michael, Finn,

On 9/8/24 18:03, Michael Schmitz wrote:
> Hi Finn,
> 
> Am 09.08.2024 um 15:34 schrieb Finn Thain:
>>
>> On Fri, 9 Aug 2024, Michael Schmitz wrote:
>>
>>>>
>>>> I tried out the "stress-ng --sysbadaddr -1" test, and that didn't go
>>>> so well for me:
>>>>
>>>> # stress-ng --sysbadaddr -1
>>>> stress-ng: info:  [37] defaulting to a 86400 second (1 day, 0.00 
>>>> secs) run
>>>> per stressor
>>>> stress-ng: info:  [37] dispatching hogs: 1 sysbadaddr
>>>> *** ILLEGAL INSTRUCTION ***   FORMAT=4
>>>> Current process id is 39
>>>> BAD KERNEL TRAP: 00000000
>>>> Modules linked in:
>>>> PC: [<00000000>] 0x0
>>>> SR: 2004  SP: 6504e563  a2: 008ee380
>>>> d0: 000000f7    d1: 00000000    d2: 00000000    d3: 00000000
>>>> d4: 00a87b80    d5: bfbf3814    a0: 00000000    a1: bfbf3814
>>>> Process stress-ng-sysba (pid: 39, task=4dbb2ec5)
>>>> Frame format=4 eff addr=480a2004 pc=0002b154
>>>> Stack from 00adff20:
>>>>         00ade000 00000000 00000000 000000f7 00000000 00000004 00a87b80
>>>> 00000000
>>>>         00000000 00000000 00000000 008ee380 0002ab5c 00000100 00000122
>>>> fffffff6
>>>>         bfbf376c 0002b29e 000000f7 bfbf3814 00000000 00000000 00ade000
>>>> 0002b222
>>>>         00ae0800 80118988 00000000 00000005 bfbf37a0 00000005 bfbf3814
>>>> 00adffcc
>>>>         00023d2c 00adffcc 00000000 00000000 00000000 00000000 000000f7
>>>> 00000000
>>>>         80118b46 00021850 00024b00 000000f7 bfbf3814 00000000 00000000
>>>> bfbf3814
>>>> Call Trace: [<0002ab5c>] child_wait_callback+0x0/0x24
>>>>  [<0002b29e>] sys_wait4+0x7c/0x8e
>>>>  [<0002b222>] sys_wait4+0x0/0x8e
>>>>  [<00023d2c>] buserr_c+0xb0/0x152
>>>>  [<00021850>] buserr+0x28/0x30
>>>>  [<00024b00>] system_call+0x54/0xa8
>>>>
>>>> But that is the same with and without these patches.
>>>
>>> I wonder if recent signal handling changes (e.g. commit
>>> 0d4276cfbe6fd4c4a21acdee803b05a3a6192082) have rare unexpected side 
>>> effects on
>>> Coldfire here ... OTOH, signal handling as such works just fine, right?
>>>
>>
>> That would be commit b845b574f86d ("m68k: Move signal frame following
>> exception on 68020/030") on mainline. If it caused a regression, that
>> would have first appeared in v6.4. I can't imagine how that commit could
>> affect Coldfire but that's no reason not to test an older kernel.
> 
> Yes, testing older kernels is certainly the fastest way to rule out 
> involvement of that commit.

I will go back a few revisions and see if I can shed some light on it.

Regards
Greg


> On a closer look, there is no possible way in that this commit can be 
> responsible for the bug unless Coldfire does use frame format B for 
> access errors. I don't think that's likely?
> 
>> FWIW, my hunch is that the other stressors which call wait4() will
>> probably crash too (regardless of kernel version).
> 
> Quite likely ...
> 
> Cheers,
> 
>      Michael
> 
> 
> 

