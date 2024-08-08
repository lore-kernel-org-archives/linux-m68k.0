Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB14C148307
	for <linux-m68k@vger.kernel.org>; Thu,  8 Aug 2024 14:52:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723128730; cv=none; b=amGffHpdqDaq8OZ597W/xCgjNdcgmVOm4IEkJzMQjSUwTMHFsUAuvxIfQqURwJVZRfDPNK0/5rjEXunNMYNLQF+oGTK7Fm/dZxk4qGub1/s/M96uieAZp+QRtd5/aui689JXfXcnyvNyCp1MlEPwb1CTh9VsF70wWx8ENpsWoSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723128730; c=relaxed/simple;
	bh=tdshl2aK5un2AP1/Q2s/F7pGRaNDyLxVwymesEdqQQA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZKgPkcfe7qAJeLA9H2NBMhY+IJOWSO7p3tCgONXZ1RdpsJ8WbunhSY8GlePo60JsP/6v3Hyo0TQFXdVq7hCzUA9QFsubLq6uYVvKPN3Bujokp9E5sM8yC7y2ABMBjqx55ZG77SlkKg+kqef6Z9coDkxVCasvg4L5wjpQzyy2PpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36983C32782;
	Thu,  8 Aug 2024 14:52:09 +0000 (UTC)
Message-ID: <00ccfc03-9032-435b-8082-905e225c7a0f@linux-m68k.org>
Date: Fri, 9 Aug 2024 00:52:06 +1000
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] m68k: Handle __generic_copy_to_user faults more
 carefully
To: Finn Thain <fthain@linux-m68k.org>
Cc: Michael Schmitz <schmitzmic@gmail.com>, linux-m68k@vger.kernel.org,
 geert@linux-m68k.org, linux-m68k@lists.linux-m68k.org
References: <20240429030945.22451-1-schmitzmic@gmail.com>
 <20240429030945.22451-2-schmitzmic@gmail.com>
 <e0d53477-1646-9504-2382-f8793d078704@linux-m68k.org>
 <42dfdef0-88d1-4c15-b04b-174f12bd8f3f@gmail.com>
 <de7c9ac4-cb6f-e2a4-59e4-26fd7e260d4e@linux-m68k.org>
 <ae5facc5-4b10-481b-9f76-f9b007309d8f@linux-m68k.org>
 <727be0d7-a3ed-d3eb-2a13-c6ac316cd25d@linux-m68k.org>
Content-Language: en-US
From: Greg Ungerer <gerg@linux-m68k.org>
In-Reply-To: <727be0d7-a3ed-d3eb-2a13-c6ac316cd25d@linux-m68k.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Finn,

On 8/8/24 16:56, Finn Thain wrote:
> On Thu, 8 Aug 2024, Greg Ungerer wrote:
>> On 8/8/24 11:57, Finn Thain wrote:
>>>> I'm afraid I've lost track of where we're at with this patch series.
>>>> Does it need more work, or more bug reports such as the one below?
>>>
>>> Apparently the series is waiting for some testing on a Coldfire system
>>> with MMU.
>>
>> Ok, I am in a state that I can do that now (I managed to fix my M5475EVB
>> board).
> 
> Thanks, Greg.
> 
>> If I test the v4 versions of this patch set that should do the job?
>>
> 
> There are 3 patches that need some more testing, one from me and two from
> Michael:
> 
> [PATCH] m68k: Handle put_user() faults more carefully
> [PATCH v4 1/2] m68k: Handle __generic_copy_to_user faults more carefully
> [PATCH v4 2/2] m68k: improve __constant_copy_to_user_asm() fault handling
> 
> They were posted in two threads:
> 
> https://lore.kernel.org/linux-m68k/1ed9c4c753395510c1a8df9c35e2ad4c31c90f95.1714265926.git.fthain@linux-m68k.org/T/
> https://lore.kernel.org/linux-m68k/CAMuHMdVrOnOQwCxk42YCjEkbfL-YDSvpf_xTaouv9hUs2bO+qg@mail.gmail.com/T/
> 
> On 680x0, one of the bugs was brought to light with 'stress-ng
> --sysbadaddr -1'. The others required special test programs.
> 
> I've no idea whether Coldfire silicon is susceptable at all, and if it is,
> whether the same reproducers would work. But that's neither here nor there
> from a regression testing standpoint.

Ok, thanks for the links. I have applied and tested those, no obvious regressions.
So for all of these patches:

Tested-by: Greg Ungerer <gerg@linux-m68k.org>

I tried out the "stress-ng --sysbadaddr -1" test, and that didn't go so well for me:

# stress-ng --sysbadaddr -1
stress-ng: info:  [37] defaulting to a 86400 second (1 day, 0.00 secs) run per stressor
stress-ng: info:  [37] dispatching hogs: 1 sysbadaddr
*** ILLEGAL INSTRUCTION ***   FORMAT=4
Current process id is 39
BAD KERNEL TRAP: 00000000
Modules linked in:
PC: [<00000000>] 0x0
SR: 2004  SP: 6504e563  a2: 008ee380
d0: 000000f7    d1: 00000000    d2: 00000000    d3: 00000000
d4: 00a87b80    d5: bfbf3814    a0: 00000000    a1: bfbf3814
Process stress-ng-sysba (pid: 39, task=4dbb2ec5)
Frame format=4 eff addr=480a2004 pc=0002b154
Stack from 00adff20:
         00ade000 00000000 00000000 000000f7 00000000 00000004 00a87b80 00000000
         00000000 00000000 00000000 008ee380 0002ab5c 00000100 00000122 fffffff6
         bfbf376c 0002b29e 000000f7 bfbf3814 00000000 00000000 00ade000 0002b222
         00ae0800 80118988 00000000 00000005 bfbf37a0 00000005 bfbf3814 00adffcc
         00023d2c 00adffcc 00000000 00000000 00000000 00000000 000000f7 00000000
         80118b46 00021850 00024b00 000000f7 bfbf3814 00000000 00000000 bfbf3814
Call Trace: [<0002ab5c>] child_wait_callback+0x0/0x24
  [<0002b29e>] sys_wait4+0x7c/0x8e
  [<0002b222>] sys_wait4+0x0/0x8e
  [<00023d2c>] buserr_c+0xb0/0x152
  [<00021850>] buserr+0x28/0x30
  [<00024b00>] system_call+0x54/0xa8

But that is the same with and without these patches.

Regards
Greg

