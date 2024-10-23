Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7B84433B3
	for <linux-m68k@lists.linux-m68k.org>; Wed, 23 Oct 2024 07:30:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729668621; cv=none; b=FUL9OhBvsRUTClEy4QkIcU3p3x0L5mxI6uBu9Zdq2D4P/d8UnHgjvh+NZZ1URb1ytSpc7xuYaB4aJpdZ7NI70G82+O1KQVmELMQGezLrd7A1TPbLDmYS08iDwU0YFkA55tFwW3cvWF6KoNZndrJWrUSZ5/INSLjA2n5/Cu8tUCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729668621; c=relaxed/simple;
	bh=HT9hdr1HhA4JLa9sLVtmtXtV5XytZ+POeU+pa6hsM2Q=;
	h=Subject:To:References:Cc:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=kMfYpZCNGKHoo9k5QQrIrWv0Mx6Tb648t4QF42NhTf0GOCH9ZrqpqKYQnLWUQBfd8YelF32Geq/CDpE4iyg56bgNmyTGFz8PXVHgikXj3MsYkNiSVKIBDoKqHY6sHJUKI6Vi/4lxredybFVxEcfLLBBJMyZQLyQDRBdt5z+uK+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lSrt8aJ7; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lSrt8aJ7"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-20cd76c513cso54318885ad.3
        for <linux-m68k@lists.linux-m68k.org>; Wed, 23 Oct 2024 00:30:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729668619; x=1730273419; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:cc:references:to:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lA1nMDMsWlQD+B40ofvHYxkBoWcOlOnfZfG83qeE0LY=;
        b=lSrt8aJ7sh8h9bTbiA45vgzZ8+MCDxiLno5ixkbW4+AQaA6VWdteXNNzg5/MWFDNYk
         Pt1DPNc+B6iJ1R1tNdU0KVl+F9mZTHmO+mRBu4q6sgEobPvV7TadN03FWPs808G/dFyl
         a23fI/yboujS7qngj+sdLGOpTmWP0G9k92LEsnd7C3ny2GZMBcpb46IgXSML2JiSFGr6
         2PL9wrxr0ahQIsVggvxOiC1XskljCFRUNv2vI+p+pnNZpDHXud7JzwM/aa0QFiwgDos3
         1Esh0JDZT4AOi9tyzY7b0wTFgutgS2d9USLuuS7ukeWT7DU6TuTLemS86WJrdFRFjFFG
         NOnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729668619; x=1730273419;
        h=content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:cc:references:to:subject:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lA1nMDMsWlQD+B40ofvHYxkBoWcOlOnfZfG83qeE0LY=;
        b=RH21ICxPk3ejh+N0tKGS8WiiLEf9RNNQ7YYrEXvbypkdWKHSWSvV70a8WMEDXgDpNU
         CPELK04Ud3sNuFPEoP8eT3rw/J5GlMaLZsxIGVz8AL2NqBwLjpP2w+DBcTrOxk24Cp/S
         UM1P+bofctag69IwXulcFeJoF6jVs7wDCw3KFbBZYbuDx5p44H1cR44H3x3FSlhbxhsm
         F+H64nFaFK+q9IPvZP3u3tTartoBMj1r9tp0j+PI7Ff7ciRqtkroD9HpPtvACRqnWrko
         ztr+Kg7ELVPmE4snX9XrazcdBRVQsW1EUxnqOQ+eJqHjMkY3DUKQSUAApPxBJFkKF2NJ
         NAww==
X-Gm-Message-State: AOJu0Yzb6u1hc5XBV5zz36y2o8iF8DKuYUdJi/kodzc54XJlvNwkofC8
	RvP2OvLou5fs2sf1q/+nTlAFikXb6aRBI/V1FI4Mpwf3bhbRjBTw
X-Google-Smtp-Source: AGHT+IEvy9kUhTBYp7/X6Rzlz0MPJuoFWY2gayJa2bEUdPqFmZ/r8VhHb9AbHnlNevIcSO1KFez51A==
X-Received: by 2002:a17:902:dacd:b0:20d:2e83:6995 with SMTP id d9443c01a7336-20fa9e99cdbmr20547165ad.47.1729668618846;
        Wed, 23 Oct 2024 00:30:18 -0700 (PDT)
Received: from [10.1.1.24] (125-238-248-82-fibre.sparkbb.co.nz. [125.238.248.82])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20e7f0f36c2sm52207775ad.256.2024.10.23.00.30.14
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 23 Oct 2024 00:30:18 -0700 (PDT)
Subject: Re: [PATCH RFC 1/2] m68k: Add tracirqs
To: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>
References: <20241021-add-m68k-tracing-support-v1-0-0883d704525b@yoseli.org>
 <20241021-add-m68k-tracing-support-v1-1-0883d704525b@yoseli.org>
 <4ab85330-5a50-bde1-f014-99a8e7cb28cc@gmail.com>
 <86eea4de-2696-4485-9c16-cd3fbbd1aae6@yoseli.org>
Cc: linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, rostedt@goodmis.org
From: Michael Schmitz <schmitzmic@gmail.com>
Message-ID: <4e93964e-bafb-0474-743f-8280c46898f4@gmail.com>
Date: Wed, 23 Oct 2024 20:30:11 +1300
User-Agent: Mozilla/5.0 (X11; Linux ppc; rv:45.0) Gecko/20100101
 Icedove/45.4.0
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <86eea4de-2696-4485-9c16-cd3fbbd1aae6@yoseli.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jean-Michel,

Am 23.10.2024 um 18:53 schrieb Jean-Michel Hautbois:
> Hi Michael,
>
> On 23/10/2024 05:53, Michael Schmitz wrote:
>> Jean-Michel,
>>
>> thanks for your patches!
>>
>> Am 21.10.2024 um 22:44 schrieb Jean-Michel Hautbois:
>>> The TRACE_IRQFLAGS_SUPPORT requires the architecture to call
>>> trace_hardirqs_off() when interrupts are disabled and
>>> trace_hardirqs_on() when they are enabled.
>>> Add those calls to do_IRQ function.
>>
>> You will also have to add these calls to the three sites in arch/m68k/
>> coldfire/head.S where interrupts are enabled or disabled.
>
> Thanks for this ! I prepared a v2 with those calls added. I am wondering

Good -

> if my second patch is ok, I think it is not, could you please review it

I'll have to read up on how arch_stack_walk is supposed to work - have 
never seen that code before.

> ? There may already be something related to the stack in the assembly
> part useful to implement arch_stack_walk() in a different way ?

I doubt it

>>
>> Here:
>>> ENTRY(system_call)
>>>         SAVE_ALL_SYS
>>>         move    #0x2000,%sr             /* enable intrs again */
>>>         GET_CURRENT(%d2)
>>
>> and here:
>>> ret_from_exception:
>>>         move    #0x2700,%sr             /* disable intrs */
>>>         btst    #5,%sp@(PT_OFF_SR)      /* check if returning to
>>> kernel */
>>>         jeq     Luser_return            /* if so, skip resched,
>>> signals */
>>
>> and here:
>>> Lwork_to_do:
>>>         movel   %a0@(TINFO_FLAGS),%d1   /* get thread_info->flags */
>>>         move    #0x2000,%sr             /* enable intrs again */
>>>         btst    #TIF_NEED_RESCHED,%d1
>>>         jne     reschedule
>>
>> There's one similar site in arch/m68k/kernel/head.S
>> (ret_from_exception) where interrupts are enabled that would need a
>> similar change, if you want to enable this for all m68k.
>
> I won't be able to test it though ;-).
> I see there are a few interrupts disabling in
> arch/m68k/include/asm/entry.h too ?

Right - that's different in the coldfire stack save/restore macros. I 
missed that before.

Looks like wherever SAVE_ALL_SYS, SAVE_ALL_INT and RESTORE_USER are 
used, calls to trace_irqs_on/off() are required as well.

RESTORE_USER only restores the IPL in the CONFIG_COLDFIRE_SW_A7, which 
makes this a little tricky ... you might have to add these calls to the 
macros to get the correct behaviour.

>
>>
>> Registers %d0-%d5 and %a0-%a2 are saved on the stack at this point and
>> can be clobbered if need be.
>
> I don't know if they need to be clobbered...

I meant to say that if you need registers to prepare function arguments 
for trace_irqs_on/off() on the stack, these can be used. But that may 
not be necessary in this case.

Cheers,

	Michael


>
> Thanks,
> JM
>
>>
>> Cheers,
>>
>>      Michael
>>
>>
>>>
>>> Signed-off-by: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
>>> ---
>>>  arch/m68k/Kconfig      | 1 +
>>>  arch/m68k/kernel/irq.c | 2 ++
>>>  2 files changed, 3 insertions(+)
>>>
>>> diff --git a/arch/m68k/Kconfig b/arch/m68k/Kconfig
>>> index
>>> cc26df907bfe3c8143a931d259eceabb16af7411..ab3375475721fa63418c40d4ba6ac76679ebc77d
>>> 100644
>>> --- a/arch/m68k/Kconfig
>>> +++ b/arch/m68k/Kconfig
>>> @@ -39,6 +39,7 @@ config M68K
>>>      select OLD_SIGSUSPEND3
>>>      select UACCESS_MEMCPY if !MMU
>>>      select ZONE_DMA
>>> +    select TRACE_IRQFLAGS_SUPPORT
>>>
>>>  config CPU_BIG_ENDIAN
>>>      def_bool y
>>> diff --git a/arch/m68k/kernel/irq.c b/arch/m68k/kernel/irq.c
>>> index
>>> 9ab4f550342e5de11c528f55781432675ffd66bf..74cf60ebbc4bca51f3caa4046dbd2bdb02355711
>>> 100644
>>> --- a/arch/m68k/kernel/irq.c
>>> +++ b/arch/m68k/kernel/irq.c
>>> @@ -21,9 +21,11 @@ asmlinkage void do_IRQ(int irq, struct pt_regs *regs)
>>>  {
>>>      struct pt_regs *oldregs = set_irq_regs(regs);
>>>
>>> +    trace_hardirqs_off();
>>>      irq_enter();
>>>      generic_handle_irq(irq);
>>>      irq_exit();
>>> +    trace_hardirqs_on();
>>>
>>>      set_irq_regs(oldregs);
>>>  }
>>>
>
