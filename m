Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BAEC6EB58
	for <linux-m68k@lists.linux-m68k.org>; Thu, 25 Apr 2024 08:20:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714033244; cv=none; b=QINaSjDE0JQ1RBZlzSDOVCQ5zGnBBMcD+gg3bcx6G1epDxEcYg2j/j02fn1P26bxuHT2dRFfN6kjOoekIUBiIOhVS+vgrgdP5gayidbI/571puvFhqBZyu7AkFR8Yzi7m1MzZ8EfpT29y/vGkP6WyNn1z+roCqSZuFde+Ho7zvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714033244; c=relaxed/simple;
	bh=0p6mwvLP1gp05XZT4/1/VAV4OZ3uOr/zcfArlv7Is34=;
	h=Subject:To:References:Cc:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=TQ0QRYxW56VkhHYhx4ga0y5F1CVXotD2vYKVQwu1z9UtoD4iGvwoPDrv2K0Jpe56qQwfTyj9P2iNekFn7zY4JgcNlGwR5RHBEKfHiPkO0KjUvIc3xIlq1gl1g1Qxyh9LMORxjHU1Fjss+tveellIK8eS/CRaGGBwlQnex58K8NI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TLjahtpF; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TLjahtpF"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-2ae6c8745ffso538193a91.2
        for <linux-m68k@lists.linux-m68k.org>; Thu, 25 Apr 2024 01:20:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714033241; x=1714638041; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:cc:references:to:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mOyxVqfr41W6MeqkaVq7WW1FwFM6oQU38qI4M0M2d4s=;
        b=TLjahtpFnHoILnIlI+otBdsxyioNisQCbDIUf59pUd6Ecgx7vBqmXRESjop1ogGL23
         nhBv1HlIafl8h31jBxWWVcibUBonxHIz7MjQg3rv11IQkRDAsHCIhEUkHnh2WnIPCckH
         xQp4kCUai9Ehn1qB9yl8tGHWYuVvpgd3MQbTL9AefgrPXqHR7hXnNk7b3dOC+sbYealr
         BS7oaG9aK/or2XmhHVjl1twUIlgfITRDxiFR8uZlAGtdEv++MwNOA3tqnCo0rIfkMl8a
         V8p1JJGkvl8pGbRjEtnWnmo0HIdo5P0TWKv0WMUUzoJzZRH91z+m0RnrYNC+pfyAQBuV
         8gNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714033241; x=1714638041;
        h=content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:cc:references:to:subject:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mOyxVqfr41W6MeqkaVq7WW1FwFM6oQU38qI4M0M2d4s=;
        b=PjsqNIcynANfI4d1b079CPPuN7y/JX8I146h5VVkqcv+1PP6MOwVou9I1TMtdzdKaH
         pc1Co/RLU52DLm4TITksnbt4pOl/LnlbK0O1LUnc0pdu9oU8tsT1FDoO4XfpRuqP089b
         LsYWafzoLj3G3Y61RPePx8+Bf7TK52HBYUD+9AGRo79Pm9A/qApX3CfyI8cfDmxpK6em
         8JMSKQ6pclXrsSDMi/aIOHu7aZXla3+uQGOi+tsUFfTKN2MnIYUyrqvYD8FNOJqPzJUG
         N83i8VdX1nICqRiZ3FCr+jWqfrLI58NXvMKrNDuqMjPs54tJW+zcynnaOj3ZIvirkkTy
         bbag==
X-Forwarded-Encrypted: i=1; AJvYcCUzmQLvBdmJpuvu96/n08Wi7h/FHoYgI/sqQwR3TYSZ+1L2H7boNPe/mrNWtoLECz5bUQrw73nNDWgxw6Mh6VvdtakxRW6Edey+ycMKaB0g
X-Gm-Message-State: AOJu0YxRGyzyV8Ak6ndJkzRs9zckcuWuCAffZA3yEnTudnn7V7nDcirz
	U/wnwoul0Yk4+K8tkZAMFNvozFNgA+5B4nKClq7VRLXmwmsVdYbvrRYqwQ==
X-Google-Smtp-Source: AGHT+IF62bLjPf0gjY/+osJuJcLn4pUEl4JI4eP2we/RtJt2jGVaxnj21JaxJxXHKnrqV7dMr5CFSQ==
X-Received: by 2002:a17:90a:1150:b0:2a4:9836:aa2c with SMTP id d16-20020a17090a115000b002a49836aa2cmr4691897pje.28.1714033241363;
        Thu, 25 Apr 2024 01:20:41 -0700 (PDT)
Received: from [10.1.1.24] (222-152-175-63-fibre.sparkbb.co.nz. [222.152.175.63])
        by smtp.gmail.com with ESMTPSA id ck16-20020a17090afe1000b002a2f6da006csm12490487pjb.52.2024.04.25.01.20.38
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 25 Apr 2024 01:20:40 -0700 (PDT)
Subject: Re: [PATCH RFC v2 1/2] m68k: Handle __generic_copy_to_user faults
 more carefully
To: Finn Thain <fthain@linux-m68k.org>
References: <20240422022943.13775-1-schmitzmic@gmail.com>
 <20240422022943.13775-2-schmitzmic@gmail.com>
 <6fbf4809-dec2-84b9-3b83-86084ed19a20@linux-m68k.org>
Cc: geert@linux-m68k.org, linux-m68k@lists.linux-m68k.org
From: Michael Schmitz <schmitzmic@gmail.com>
Message-ID: <4b4212d8-9fb6-b041-f434-9881b901535e@gmail.com>
Date: Thu, 25 Apr 2024 20:20:36 +1200
User-Agent: Mozilla/5.0 (X11; Linux ppc; rv:45.0) Gecko/20100101
 Icedove/45.4.0
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <6fbf4809-dec2-84b9-3b83-86084ed19a20@linux-m68k.org>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

Hi Finn,

Am 25.04.2024 um 16:16 schrieb Finn Thain:
>
> On Mon, 22 Apr 2024, Michael Schmitz wrote:
>
>> As mentioned by Finn Thain in his patch to improve put_user exception
>> handling on 040, a similar problem exists on 030 processors.
>>
>> A moves instruction that crosses a page boundary from a mapped page into
>> an unmapped one will cause a mid-instruction bus error exception (frame
>> format b), with the PC pointing (usually) two instructions past the
>> faulting movesl instruction.
>>
>> Our exception handling in __generic_copy_to_user only covers the
>> instruction immediately following the faulting one. As a result,
>> fixup_exception in send_fault_sig does not detect this case, and cause
>> send_fault_sig to oops.
>>
>> Extend the exception table to cover one additional instruction beyond
>> the moves[lwb] instructions.
>>
>> Tested on 68030 (Atari Falcon 030) with a transfer beginning at a single
>> byte at the end of a mapped page followed by further bytes on an
>> unmapped page (testcase derived from stress-ng sysbadaddr stressor by
>> Finn Thain).
>>
>> A similar problem exists in __clear_user(); modify the exception table
>> for that function in the same way (untested)
>>
> I've just tested this on a Motorola 68040 and I got an oops in
> __generic_copy_to_user(). It appears that we need more entries in the
> exception table. (I also tested in QEMU and it did not oops.)

I've tried the same access pattern (one longword access, then continue 
to word or byte access) on 030  by running the old testcase in /tmp, and 
I get a fault on the first btst instruction. The label on that one isn't 
in the exception table, as it was only used as a branch target. I'll add 
that one and retry.

Cheers,

	Michael

> This oops indicates that we are going to need the final NOP that was in
> the first version of your patch. My test program seems inadequate to show
> that it is safe to omit that NOP -- we would need a test which doesn't
> jump over the MOVES.B.
>
> Unable to handle kernel access at virtual address c0029000
> Oops: 00000000
> Modules linked in:
> PC: [<0046454c>] __generic_copy_to_user+0x48/0x5c
> SR: 2000  SP: 0152df10  a2: 01502160
> d0: 00000000    d1: 00000001    d2: 2f746d70    d3: c0028fff
> d4: 00000400    d5: c0028fff    a0: c0029003    a1: 0081bfff
> Process badaddr-3syscal (pid: 83, task=01502160)
> Frame format=7 eff addr=0152df6c ssw=0c81 faddr=c0028fff
> wb 1 stat/addr/data: 0001 20000046 fcae0008
> wb 2 stat/addr/data: 0081 c0028fff 2f746d70
> wb 3 stat/addr/data: 0045 0152df64 2f746d70
> push data: fcae0008 00000005 0152df88 0046451e
> Stack from 0152df78:
>         c0028fff 00000005 00000005 0081b000 0152dfc4 00128cf6 c0028fff 0081bffb
>         00000005 00000400 efd92d5c 8000087a 8000408c 0099dd90 00c29900 0099d910
>         00c0c400 0081bffb 00000ffb efd92d48 000027a2 c0028fff 00000400 efd92d5c
>         8000087a 8000408c 8000408c 00000000 efd92ea4 ffffffda 000000b7 00000000
>         0000c011 a5100080
> Call Trace: [<00128cf6>] sys_getcwd+0xc8/0x15a
>  [<000027a2>] syscall+0x8/0xc
>  [<0000c011>] mac_reset+0x16d/0x170
>
> Code: 0001 6706 3419 0e58 2800 0801 0000 6706 <1419> 0e18 2800 242e fff8 262e fffc 4e5e 4e75 4e75 4e56 0000 48e7 2018 242e 0008
> Disabling lock debugging due to kernel taint
>
> 00464504 <__generic_copy_to_user>:
>   464504:       4e56 0000       linkw %fp,#0
>   464508:       2f03            movel %d3,%sp@-
>   46450a:       2f02            movel %d2,%sp@-
>   46450c:       262e 0008       movel %fp@(8),%d3
>   464510:       242e 0010       movel %fp@(16),%d2
>   464514:       2f02            movel %d2,%sp@-
>   464516:       2f03            movel %d3,%sp@-
>   464518:       4eb9 0046 44c6  jsr 4644c6 <__clear_user>
>   46451e:       2002            movel %d2,%d0
>   464520:       e488            lsrl #2,%d0
>   464522:       7203            moveq #3,%d1
>   464524:       c282            andl %d2,%d1
>   464526:       226e 000c       moveal %fp@(12),%a1
>   46452a:       2043            moveal %d3,%a0
>   46452c:       4a80            tstl %d0
>   46452e:       670a            beqs 46453a <__generic_copy_to_user+0x36>
>   464530:       2419            movel %a1@+,%d2
>   464532:       0e98 2800       movesl %d2,%a0@+
>   464536:       5380            subql #1,%d0
>   464538:       66f6            bnes 464530 <__generic_copy_to_user+0x2c>
>   46453a:       0801 0001       btst #1,%d1
>   46453e:       6706            beqs 464546 <__generic_copy_to_user+0x42>
>   464540:       3419            movew %a1@+,%d2
>   464542:       0e58 2800       movesw %d2,%a0@+
>   464546:       0801 0000       btst #0,%d1
>   46454a:       6706            beqs 464552 <__generic_copy_to_user+0x4e>
>   46454c:       1419            moveb %a1@+,%d2
>   46454e:       0e18 2800       movesb %d2,%a0@+
>   464552:       242e fff8       movel %fp@(-8),%d2
>   464556:       262e fffc       movel %fp@(-4),%d3
>   46455a:       4e5e            unlk %fp
>   46455c:       4e75            rts
>   46455e:       4e75            rts
>
