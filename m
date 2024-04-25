Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A1832B9C8
	for <linux-m68k@lists.linux-m68k.org>; Thu, 25 Apr 2024 05:32:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714023163; cv=none; b=QhhNZgD34wX8NrJqaZVtuVAImyi/LHTuFaKf6Sk69EO3qADfw3xSb3F7wx+MKXTjE3Dgco+RpFg03zkViBdiK9RdSKy1yjxfGFesjEO5a3rkZZRQKDFdMyuTaNQmPWvA28IM1kIwDdDHuo5IAr3Melbg/7l+WkkqcRfElq9fHzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714023163; c=relaxed/simple;
	bh=gp9IY8j9k4OvNBRbbJGZSWbp2uQbUPeJdnq6KTg/kpg=;
	h=Subject:To:References:Cc:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=IAEF3qD8QrFf5wHrKOFMsXxFfNW23ZdNx4TCkf6cUNwZxc60tJ4NIjV+pBjySgX3D+DuzHu9VcUCiHSCAWu2C62EhK+vf8hvmoLhxYyWN64rYJDlpuAzwzwyQ6sovERBGaZAon12gEBxPTCEVDsZc0tLJJayzFDXPYmAidG3g90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZUd9dDsh; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZUd9dDsh"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-6ecf05fd12fso592381b3a.2
        for <linux-m68k@lists.linux-m68k.org>; Wed, 24 Apr 2024 22:32:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714023160; x=1714627960; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:cc:references:to:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CX/Sj6vnpJtS4EzXr9zjTA1/0/HLhdhPHfBwid69/tw=;
        b=ZUd9dDshZV5aQThTthgPSS8mFTIijIwu9VbPqmMi6aAci2Re5y6lCzs10g3m+3OJ8V
         GTXMf8HmEvRILRIJo/UysSdnNiXa/YuWC8ZA/mdTExEJjItTjMb2eKpDXRiXZTd3xk1U
         EDgTxn/AoI3wumOLi/wOFsA1ozXdTKeFZEGPyeSC9hBM6XkXq54CUxa2RjdVa7S6mWTP
         AaaxK2PZ0NCXWG3BMtai2XyGPErE4bSwSGqxvaUXux0qy9MOMkSqZWt5NlSMcf4RuhY/
         4uw1Ok9fxHdVS/Lc4n+rqr3d+OU5tJHXN7/Qa049ZtYm2AWf95XGi7Aqmgeokt9fyjEd
         3plQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714023160; x=1714627960;
        h=content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:cc:references:to:subject:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CX/Sj6vnpJtS4EzXr9zjTA1/0/HLhdhPHfBwid69/tw=;
        b=bcDPDpBvaW2Bx2zkg5zMe8YMtwUA6oYeXC3tPPWbssx80i/Y16r38eKn+wh+I72byo
         FgeigYxs5fKRn13sXs3yEi8lNiEZNXtygqYN+2z/OOu+OSwLbCSS4T8kwUR8WGpIUuRO
         GiyJXNhYGbm8zRFKc6tOqXbcjW24stSgFwpoTq0OFNQqBHDdG/+El3fqZlgoOzGN8x6I
         1bSy6EHuxcpFm6Ju9p/XkNpln+bB8ieLM7rs3wU7x+V+DWtgk2CxiI4ci3AI5XalbDNb
         JZamM0MnnCyKurA7guUNS2bqnpsNJtk7aTNV/7Lct9px5WPhAiZJ4WyhqRXkzRiAKhbG
         Bpbg==
X-Forwarded-Encrypted: i=1; AJvYcCXVpuwN61aq3I6DUQwIFmwbyFzrAoKI6xPAWfpgZx4YsvgLu1L00VHKJYG4Hm5/nwFt2yTjXokNrQqMuFJvcsRq9EDd/0UYZdUs6XM3yq74
X-Gm-Message-State: AOJu0Yz1RIKgEMCYoBLZmMuO11goLDcphjpPf+WnBCi3aLfKqbaKG44M
	3rBAIR3xzr8SBod17C7JqUSVbetsLClu2G6cNpus0+uhHP1FYG6tdfAJeg==
X-Google-Smtp-Source: AGHT+IHzX2tDbuk7mob0xHjcfJ+O7CLLmEq2fPfh5fQWeAnIm19MvaIU3C9pjJ5G13Y98FPrm12bLQ==
X-Received: by 2002:a05:6a00:194b:b0:6ef:a0fe:c478 with SMTP id s11-20020a056a00194b00b006efa0fec478mr6456244pfk.34.1714023160480;
        Wed, 24 Apr 2024 22:32:40 -0700 (PDT)
Received: from [10.1.1.24] (222-152-175-63-fibre.sparkbb.co.nz. [222.152.175.63])
        by smtp.gmail.com with ESMTPSA id fy11-20020a056a00828b00b006ee1e2eedf3sm12336091pfb.27.2024.04.24.22.32.37
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 24 Apr 2024 22:32:39 -0700 (PDT)
Subject: Re: [PATCH RFC v2 1/2] m68k: Handle __generic_copy_to_user faults
 more carefully
To: Finn Thain <fthain@linux-m68k.org>
References: <20240422022943.13775-1-schmitzmic@gmail.com>
 <20240422022943.13775-2-schmitzmic@gmail.com>
 <6fbf4809-dec2-84b9-3b83-86084ed19a20@linux-m68k.org>
Cc: geert@linux-m68k.org, linux-m68k@lists.linux-m68k.org
From: Michael Schmitz <schmitzmic@gmail.com>
Message-ID: <5d1a552e-f66d-dbbb-5630-42d22870dd15@gmail.com>
Date: Thu, 25 Apr 2024 17:32:35 +1200
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

thanks for testing!

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
>
> I've just tested this on a Motorola 68040 and I got an oops in
> __generic_copy_to_user(). It appears that we need more entries in the
> exception table. (I also tested in QEMU and it did not oops.)

I'm a bit puzzled about the location of the fault.

The values of faddr and a0 from the exception frame indicate that the 
transfer leading up to the fault was a longword transfer. Both ssw and 
wbs2 suggest the same. Yet we don't take the fault on the longword 
moves, but apparently on the word moves right after.

That can't be right either - d1 is 1 so the word moves would have been 
skipped. It appears that we only take the movesl fault the next time any 
bus cycle is initiated on 040 (the moveb at 0x46454c).

That's different from how the 030 faulted in the same situation. I 
expect we'll have to add exception table entries on the movew and moveb 
instructions, too. I'll do that next.

> This oops indicates that we are going to need the final NOP that was in
> the first version of your patch. My test program seems inadequate to show
> that it is safe to omit that NOP -- we would need a test which doesn't
> jump over the MOVES.B.

We'd need a test using any number of longword moves expected to succeed, 
followed by a byte move which is expected to fault. The current test 
would attempt to do a byte move, but faults during the longword moves.

This requires running the test program in a directory whose absolute 
path is a multiple of four characters long, and setting the start 
address for the getcwd test accordingly, so the newline at the end of 
the string is the single byte left to copy. Does that make sense?

Incidentally - what is the path this tests is run in? Any path longer 
than five characters (including the newline) would have to had looped 
back to the first movel, and faulted there?

As you said before - we'd need to know a lot more about 
microarchitectural details here.

Cheers,

	Michael


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
