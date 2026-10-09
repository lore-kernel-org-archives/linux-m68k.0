Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DA2144471C
	for <linux-m68k@lists.linux-m68k.org>; Fri,  9 Oct 2026 06:56:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791528986; cv=none; b=Eqh89OPrnvKMHPQZe84lC3P06zH8jli/NzEmIzgn0OprUHTGwF93qg+uit46juubDhHHwif9NIZkzbkIHbCsmvszSxEz4HtL/YX/P1yvek5R7HNwPxbaKZ8WeH7eck3umA8Z7CQagsdV4kapoMFtY2DAUOPb4Sj7MdTGv3yNbiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791528986; c=relaxed/simple;
	bh=GDgBbloQN04f4A82cyLxmgC+/u5d0gVhGtEbdXIm8jM=;
	h=From:Subject:To:References:Cc:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=X9m3MxiJWrnf6GQfFY7pp6ajLSCV+ZVA31n19qf76CUPpkhkVv373GyoiYYeUePnRzKNYxhcGPIq6ftjQzbEYHC2xvJ37Ci8BdszrWq0boBvexPjKKI4YIF+ghuZTff4bN1uGZ8ZkqWX5McRyOpNMT0aew0GgJOOVonqQ3T4Ulk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oS3ZBwKj; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oS3ZBwKj"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-cc1bc88a20eso4153748a12.3
        for <linux-m68k@lists.linux-m68k.org>; Thu, 08 Oct 2026 23:56:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791528983; x=1792133783; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:content-type:in-reply-to:mime-version
         :user-agent:date:message-id:cc:references:to:subject:from:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=+K1VYG9wQXWNnC2iRdrr0hThNqS4rjeLkFP1gwIdP+8=;
        b=oS3ZBwKjS64dwENepgT5Bbh54PUcRwp8eNYMQPuUj4u/soqJcqHCuWEkgLhrfY9OBR
         y/UULybyhYxtowvjJxKz6EmTgsQ28OJHH+46AE1GWoYGBOGHT4FRHeQVsGfyfd6GA13k
         BtK/hsA84p5jWw1Ra43GalehgL1a8mFsz0FKar3Xd2lbmP40/m54VXUZ4Q/761v+L8lW
         H88cJCgkT7T+r9fHkc8rXjCOIbt+dcUZJnNMxeGPtQEA8+U+nlCd7EDSoxI408nQNSiD
         ZHPfi1vPkpSaQkhYUR24mncE7GLa8cSCHDcZMBidjaxYW5k6XYZQy8fxxWxYPhNz58IX
         sQKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791528983; x=1792133783;
        h=content-transfer-encoding:content-type:in-reply-to:mime-version
         :user-agent:date:message-id:cc:references:to:subject:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+K1VYG9wQXWNnC2iRdrr0hThNqS4rjeLkFP1gwIdP+8=;
        b=rEWcShuHZ2+Qm86w0vaAfKG2Gv8NXUR4fPuKJLaFrw5kUzMKxVtzBaGr/roM6VVuDd
         qcsaAaUxrcW44gQJbj/cCfszVXcwJ8FrE565N3y+gsmNDHpAjjmGYwavoot1VYVxkCny
         RzlN1F0a3DzPM6SX6mAbrv3HuD56ZXDzCW2yfIDh1riuv9Yyp6jcjSSpdJxrb0/0UdKV
         r7LUMpAE2Kt1V6FhKzP38c8KC4rMCai6pi/hXDZi+kTs7IbKworySBKaQccD3bVHcAdW
         aghfUwwGKvCuXaxtYBERz+sfx0dwFuVerNVZJ4uNcQMhFj0Xbr0OVhWqYhbW0vrJ6stm
         yykA==
X-Gm-Message-State: AFq9FYKxkJ20+VkBMxjevBFFyRB0A5L4On/IqYPJCI4jAgYRh9vcl084
	c1ijnNBzUxY0NX8BHVMMbVBa2lFy5wo/W3vTZRAUdD8Q9GNlF6Re/+Pg
X-Gm-Gg: AYBFou1p4SK5y/y68VXCVjS8kSnkVWabJGVzwcaf+NVWxbYAD33Vkdeso7hjdGICmZu
	CMpa4cBDc0WXK8JxEEdrMKx237h1eDsUH7i8eOPMnZKALr9FMIdSP4uzIa+IyivJwK5OrqGoPMv
	zal5lWLmDFtL8Ha7wnogT1/PueshUWmrd/uz0QjJuWcLLxZM+GlX5Jw9Q3hvJKKoLLS0lZbfvzT
	ldkHnjzE587A19ZCC5N68swpDRE/GWs0mUytSTzLyHISCjFpKWAS66iZ2z2ZMNtAWeINaBenvKI
	zbdXGcQyW/6sr0fQYpzDmZztGTPm0OHRufQMTH90kEzbCz69n/mrCmY5h/yyr/mLrozCg2MEVLw
	8apg9icyVupHFRdG2tE+n+qoCXSqZudQp2yyZzODZLby4BhSHPX+Zd9IRdJG4sjvkf/FuoxLwMC
	bYSUam+AlNjGKlKc5e4HN7DORrLK4pgJkQbHKEcj2ZvwDqgnRDpM8FfDzlG6r4v8wou1j3Rynku
	vWDE9nkFj3I0aLdLupArOV+oiTQ/yLumFIz50M/
X-Received: by 2002:a17:90b:4b92:b0:3ab:36c4:b506 with SMTP id 98e67ed59e1d1-3ab3a3a1b41mr1172013a91.1.1791528982558;
        Thu, 08 Oct 2026 23:56:22 -0700 (PDT)
Received: from [10.1.1.24] (122-59-250-182-adsl.sparkbb.co.nz. [122.59.250.182])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab36ed053csm2200071a91.4.2026.10.08.23.56.17
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 08 Oct 2026 23:56:22 -0700 (PDT)
From: Michael Schmitz <schmitzmic@gmail.com>
Subject: Re: [PATCH RESEND] m68k: Handle put_user faults more carefully
To: Greg Ungerer <gerg@linux-m68k.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Finn Thain <fthain@linux-m68k.org>
References: <88e752e0bca92c7b65533cc1b334052dd272f8ef.1790842086.git.fthain@linux-m68k.org>
 <02c53c37-d2ee-4c03-a8f9-0a757c3af59e@gmail.com>
 <CAMuHMdVbfUH1ZoFcS64t=gyE_cskMWv6gGvL8pjGirSGvAKu2w@mail.gmail.com>
 <dfcbbc59-4204-478b-b8da-867621056c62@gmail.com>
 <5bb9f586-6939-433e-9e06-a9bbc08a69a0@polyxeno.com>
 <d52fd72d-fe72-4fd3-9ae8-5ed999d18b5f@gmail.com>
 <92bfc41e-3c37-4485-b633-f41f58f0b0bd@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org
Message-ID: <767e716d-4957-0d5e-43cc-803d5e3a3df3@gmail.com>
Date: Fri, 9 Oct 2026 19:56:13 +1300
User-Agent: Mozilla/5.0 (X11; Linux ppc; rv:45.0) Gecko/20100101
 Icedove/45.4.0
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <92bfc41e-3c37-4485-b633-f41f58f0b0bd@linux-m68k.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Greg,

On 9/10/26 02:41, Greg Ungerer wrote:
> Hi Michael,
>
> On 8/10/26 09:54, Michael Schmitz wrote:
>> Hi Greg,
>>
>> thanks for running these tests!
>>
>> On 6/10/26 01:42, Greg Ungerer wrote:
>>> Hi Michael,
>>>
>>> On 3/10/26 09:55, Michael Schmitz wrote:
>>>> Hi Geert,
>>>>
>>>> On 03/10/2026 5:28 AM, Geert Uytterhoeven wrote:
>>>>
>>>>> Hi Michael, Finn,
>>>>>
>>>>> On Thu, 1 Oct 2026 at 20:57, Michael Schmitz 
>>>>> <schmitzmic@gmail.com> wrote:
>>>>>> On 1/10/26 22:08, Finn Thain wrote:
>>>>>>> Running 'stress-ng --sysbadaddr -1' on my MC68040 system 
>>>>>>> immediately
>>>>>>> produces an oops:
>>>>>>>
>>>>>>>        Unable to handle kernel access at virtual address f1c422fb
>>>>>>>        Oops: 00000000
>>>>>>>        Modules linked in:
>>>>>>>        PC: [<00005a1a>] do_040writeback1+0xae/0x160
>>>>>>>        SR: 2010  SP: 96087dc2  a2: 01500000
>>>>>>>        d0: 00000000    d1: 014e8000    d2: 00000081 d3: 00000000
>>>>>>>        d4: 00000481    d5: c043dfff    a0: 014e8000 a1: 00632fd5
>>>>>>>        Process stress-ng (pid: 221, task=1b729d30)
>>>>>>>        Frame format=7 eff addr=014e9eb8 ssw=0c81 faddr=c043dfff
>>>>>>>        wb 1 stat/addr/data: 0001 00000481 c043dfff
>>>>>>>        wb 2 stat/addr/data: 0081 c043dfff 2f746d70
>>>>>>>        wb 3 stat/addr/data: 0005 014e9ed4 2f746d70
>>>>>>>        push data: c043dfff 800daa70 00000000 014e9f1c
>>>>>>>        Stack from 014e9ed4:
>>>>>>>          2f740000 8017c000 014e9f10 00006830 00000081 c043dfff 
>>>>>>> 2f746d70 2f746d70
>>>>>>>          0081a000 00000400 c043dfff 800daa70 c043dfff 80016a20 
>>>>>>> 00000003 014e9f88
>>>>>>>          000026c8 014e9f1c 00000001 2f746d70 0081a000 00000400 
>>>>>>> c043dfff 0081afff
>>>>>>>          c043dfff 01500000 00000001 ffffffff 00000000 20000046 
>>>>>>> 41d67008 014e9f58
>>>>>>>          04810005 00810045 c043dfff 014e9f84 2f746d70 c043dfff 
>>>>>>> 2f746d70 c043dfff
>>>>>>>          80016a20 8017c000 00000000 0081affb 00000005 014e9fc4 
>>>>>>> 00128bc6 c043dfff
>>>>>>>        Call Trace: [<00006830>] buserr_c+0x510/0x698
>>>>>>>          [<000026c8>] buserr+0x20/0x28
>>>>>>>          [<00128bc6>] sys_getcwd+0xc8/0x15a
>>>>>>>          [<000027a2>] syscall+0x8/0xc
>>>>>>>          [<0008800d>] sanity_check_segment_list+0x17/0x11e
>>>>>>>
>>>>>>>        Code: 000c 0e90 1800 220f 0281 ffff e000 2041 <2228> 0008 
>>>>>>> 0281 00ff
>>>>>>>              ff00 67a4 6026 4280 122e 0013 206e 000c 0e10 1800 
>>>>>>> 220f 0281
>>>>>>>
>>>>>>> 0000596c <do_040writeback1>:
>>>>>>>        596c:       4e56 fffc       linkw %fp,#-4
>>>>>>>        5970:       2f02            movel %d2,%sp@-
>>>>>>>        5972:       202e 0008       movel %fp@(8),%d0
>>>>>>>        5976:       4282            clrl %d2
>>>>>>>        5978:       3400            movew %d0,%d2
>>>>>>>        597a:       220f            movel %sp,%d1
>>>>>>>        597c:       0281 ffff e000  andil #-8192,%d1
>>>>>>>        5982:       2041            moveal %d1,%a0
>>>>>>>        5984:       2228 0008       movel %a0@(8),%d1
>>>>>>>        5988:       0281 00ff ff00  andil #16776960,%d1
>>>>>>>        598e:       6600 0104       bnew 5a94 
>>>>>>> <do_040writeback1+0x128>
>>>>>>>        5992:       4e7b 2000       movec %d2,%sfc
>>>>>>>        5996:       4e7b 2001       movec %d2,%dfc
>>>>>>>        599a:       0240 0060       andiw #96,%d0
>>>>>>>        599e:       0c40 0020       cmpiw #32,%d0
>>>>>>>        59a2:       6700 0084       beqw 5a28 
>>>>>>> <do_040writeback1+0xbc>
>>>>>>>        59a6:       0c40 0040       cmpiw #64,%d0
>>>>>>>        59aa:       6730            beqs 59dc 
>>>>>>> <do_040writeback1+0x70>
>>>>>>>        59ac:       4a40            tstw %d0
>>>>>>>        59ae:       6752            beqs 5a02 
>>>>>>> <do_040writeback1+0x96>
>>>>>>>        59b0:       4280            clrl %d0
>>>>>>>        59b2:       220f            movel %sp,%d1
>>>>>>>        59b4:       0281 ffff e000  andil #-8192,%d1
>>>>>>>        59ba:       2041            moveal %d1,%a0
>>>>>>>        59bc:       2228 0008       movel %a0@(8),%d1
>>>>>>>        59c0:       0281 00ff ff00  andil #16776960,%d1
>>>>>>>        59c6:       6600 0086       bnew 5a4e 
>>>>>>> <do_040writeback1+0xe2>
>>>>>>>        59ca:       7201            moveq #1,%d1
>>>>>>>        59cc:       4e7b 1000       movec %d1,%sfc
>>>>>>>        59d0:       4e7b 1001       movec %d1,%dfc
>>>>>>>        59d4:       242e fff8       movel %fp@(-8),%d2
>>>>>>>        59d8:       4e5e            unlk %fp
>>>>>>>        59da:       4e75            rts
>>>>>>>        59dc:       4280            clrl %d0
>>>>>>>        59de:       322e 0012       movew %fp@(18),%d1
>>>>>>>        59e2:       206e 000c       moveal %fp@(12),%a0
>>>>>>>        59e6:       0e50 1800       movesw %d1,%a0@
>>>>>>>        59ea:       220f            movel %sp,%d1
>>>>>>>        59ec:       0281 ffff e000  andil #-8192,%d1
>>>>>>>        59f2:       2041            moveal %d1,%a0
>>>>>>>        59f4:       2228 0008       movel %a0@(8),%d1
>>>>>>>        59f8:       0281 00ff ff00  andil #16776960,%d1
>>>>>>>        59fe:       67ca            beqs 59ca 
>>>>>>> <do_040writeback1+0x5e>
>>>>>>>        5a00:       604c            bras 5a4e 
>>>>>>> <do_040writeback1+0xe2>
>>>>>>>        5a02:       4280            clrl %d0
>>>>>>>        5a04:       222e 0010       movel %fp@(16),%d1
>>>>>>>        5a08:       206e 000c       moveal %fp@(12),%a0
>>>>>>>        5a0c:       0e90 1800       movesl %d1,%a0@
>>>>>>>        5a10:       220f            movel %sp,%d1
>>>>>>>        5a12:       0281 ffff e000  andil #-8192,%d1
>>>>>>>        5a18:       2041            moveal %d1,%a0
>>>>>>>        5a1a:       2228 0008       movel %a0@(8),%d1
>>>>>>>        5a1e:       0281 00ff ff00  andil #16776960,%d1
>>>>>>>        5a24:       67a4            beqs 59ca 
>>>>>>> <do_040writeback1+0x5e>
>>>>>>>        5a26:       6026            bras 5a4e 
>>>>>>> <do_040writeback1+0xe2>
>>>>>>>        ...
>>>>>>>
>>>>>>> The cause is a deliberately misaligned access in the 
>>>>>>> 'bad_end_addr' test
>>>>>>> case in the 'sysbadaddr' stressor. The location being accessed 
>>>>>>> here,
>>>>>>> 0xc043dfff, was contrived to span the boundary between a r/w 
>>>>>>> anonymous page
>>>>>>> and an unmapped page. The address was then passed to the getcwd 
>>>>>>> syscall
>>>>>>> which faulted in copy_to_user().
>>>>>>>
>>>>>>> The fault for the mapped page appears to be handled okay -- up 
>>>>>>> until
>>>>>>> do_040writeback1() called put_user() which produced a second 
>>>>>>> fault due to
>>>>>>> the unmapped page.
>>>>>>>
>>>>>>> Michael Schmitz helpfully deciphered the oops and explained the 
>>>>>>> exception
>>>>>>> processing leading up to it.
>>>>>>>
>>>>>>>        "regs->pc does point to the PC in the format 7 frame 
>>>>>>> which is the PC
>>>>>>>        the fault was detected at, but not (in case of a 
>>>>>>> writeback fault)
>>>>>>>        the PC of the faulting instruction [that is, MOVES.L].
>>>>>>>
>>>>>>>        "The writeback would still cross the page boundary, and 
>>>>>>> fault if the
>>>>>>>        unmapped page still isn't present. We would not see the 
>>>>>>> PC of the
>>>>>>>        movesl in that case, and fail to find the PC in the 
>>>>>>> exception
>>>>>>>        table."
>>>>>>>
>>>>>>> One solution is to add a NOP instruction after the MOVES.L to 
>>>>>>> flush the
>>>>>>> pipeline and take the fault. That way, the PC value in the 
>>>>>>> exception frame
>>>>>>> becomes dependable so the exception table works.
>>>>>>>
>>>>>>> Theoretically, there seems to be another bug in the existing 
>>>>>>> code. If
>>>>>>> the instruction following the MOVES faulted, then after the fixup,
>>>>>>> execution would resume at the instruction which caused the 
>>>>>>> fault. This
>>>>>>> appears to be a loop. After this patch, that cannot happen.
>>>>>>>
>>>>>>> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
>>>>>>> Signed-off-by: Finn Thain <fthain@linux-m68k.org>
>>>>>>> ---
>>>>>>>     arch/m68k/include/asm/uaccess.h | 10 ++++++----
>>>>>>>     1 file changed, 6 insertions(+), 4 deletions(-)
>>>>>>>
>>>>>>> diff --git a/arch/m68k/include/asm/uaccess.h 
>>>>>>> b/arch/m68k/include/ asm/uaccess.h
>>>>>>> index 31d133faa45e..728a6dfb7414 100644
>>>>>>> --- a/arch/m68k/include/asm/uaccess.h
>>>>>>> +++ b/arch/m68k/include/asm/uaccess.h
>>>>>>> @@ -31,11 +31,12 @@
>>>>>>>     #define __put_user_asm(inst, res, x, ptr, bwl, reg, err) \
>>>>>>>     asm volatile ("\n"                                  \
>>>>>>>         "1:     "inst"."#bwl" %2,%1\n"                \
>>>>>>> -     "2:\n" \
>>>>>>> +     "2:     nop\n" \
>>>>>>> +     "3:\n" \
>>>>>>>         "       .section .fixup,\"ax\"\n"               \
>>>>>>>         " .even\n"                                \
>>>>>>>         "10:    moveq.l %3,%0\n"                        \
>>>>>>> -     "       jra 2b\n" \
>>>>>>> +     "       jra 3b\n" \
>>>>>>>         " .previous\n"                            \
>>>>>>> "\n"                                            \
>>>>>>>         "       .section __ex_table,\"a\"\n"            \
>>>>>>> @@ -53,11 +54,12 @@ do { \
>>>>>>>         asm volatile ("\n"                                      \
>>>>>>>                 "1:     "inst".l %2,(%1)+\n"                    \
>>>>>>>                 "2:     "inst".l %R2,(%1)\n"                    \
>>>>>>> - "3:\n"                                          \
>>>>>>> +             "3: nop\n"                                  \
>>>>>>> + "4:\n"                                          \
>>>>>>>                 "       .section .fixup,\"ax\"\n"               \
>>>>>>>                 " .even\n"                                \
>>>>>>>                 "10:    movel %3,%0\n"                          \
>>>>>>> -             "       jra 3b\n"                               \
>>>>>>> +             "       jra 4b\n"                               \
>>>>>>>                 " .previous\n"                            \
>>>>>>> "\n"                                            \
>>>>>>>                 "       .section __ex_table,\"a\"\n"            \
>>>>>>> Reviewed-by: Michael Schmitz <schmitzmic@gmail.com>
>>>>>>>
>>>>>>> in case it helps.
>>>>>>>
>>>>>>> Anecdotally, I've seen similar uaccess faults causing kernel 
>>>>>>> oops on 030
>>>>>>> as well, so this may not merely be an artificial unaligned 
>>>>>>> access issue.
>>>>> Shouldn't this include
>>>>> https://lore.kernel.org/20240429030945.22451-3-schmitzmic@gmail.com
>>>>> ?
>>>> Along with https://lore.kernel.org/20240429030945.22451-2- 
>>>> schmitzmic@gmail.com, perhaps.
>>>>
>>>> Can't recall the details, but Finn's solution was to add a nop in 
>>>> order to make the fault PC reliable. That's not a great deal of 
>>>> overhead in the case of put_user(). My changes to copy_to_user try 
>>>> to avoid flushing the pipeline inside of a loop, and only use the 
>>>> nop after exiting the loop. The cost of that is larger exception 
>>>> tables. Not sure which is worse.
>>>>
>>>> What's more, I can't be certain that my 'fault is taken two 
>>>> instructions past faulting instruction' observation is 100% 
>>>> reliable. AFAIK this has only been tested on 030 and 040. 
>>>> Coldfire(MMU) and 060 tests are still missing.
>>> ColdFire seems to have more, or maybe just different problems for 
>>> "stress-ng --sysbadaddr -1".
>>> Running a kernel with and without this patch resulted in:
>>>
>>> # stress-ng --sysbadaddr -1process '/usr/bin/stress-ng' started with 
>>> executable stack
>>> stress-ng: info:  [40] defaulting to a 86400 second (1 day, 0.00 
>>> secs) run per stressor
>>> stress-ng: info:  [40] dispatching hogs: 1 sysbadaddr
>>> *** ILLEGAL INSTRUCTION ***   FORMAT=4
>>> Current process id is 250
>>> BAD KERNEL TRAP: 00000000
>>> Modules linked in:
>>> PC: [<00000000>] 0x0
>>> SR: 2004  SP: 013da6cc  a2: bfccd950
>>> d0: 00000000    d1: 00000002    d2: bfccd814    d3: 00000001
>>> d4: 80174c1e    d5: 800bd9ac    a0: 800bd9ac    a1: 800bdb54
>>> Process stress-ng-sysba (pid: 250, task=f7e050bd)
>>> Frame format=4 eff addr=44090004 pc=80115870
>>> Stack from 013ea000:
>>> Call Trace:
>>> Code: 0000 0000 0000 0000 0000 0000 0000 0000 <0000> 0000 0000 0000 
>>> 0000 0000 0000 0000 0002 a6c4 0002 a6c4 0002 a6c4 0002 a6c4
>>> Disabling lock debugging due to kernel taint
>>> note: stress-ng-sysba[250] exited with irqs disabled
>>> *** ILLEGAL INSTRUCTION ***   FORMAT=4
>>> Current process id is 42
>>> BAD KERNEL TRAP: 00000000
>>> Modules linked in:
>>> PC: [<00000000>] 0x0
>>> SR: 2004  SP: affae50f  a2: 012d1f80
>>> d0: 00000000    d1: 0000000b    d2: 01057db0    d3: 00035b9a
>>> d4: 00000000    d5: bfccd814    a0: bfccd814    a1: 0050c21c
>>> Process stress-ng-sysba (pid: 42, task=1b5bfafe)
>>> Frame format=4 eff addr=480a2004 pc=00035ab2
>>> Stack from 013d3f28:
>>>          00000000 000000fa 00000000 00000004 01057db0 00000000 
>>> 0000000b 00000000
>>>          00000000 012d1f80 000336b4 00000100 00000122 fffffff6 
>>> bfccd76c 00035c1c
>>>          000000fa bfccd814 00000000 00000000 bfccd76c 00000000 
>>> 0000000a 000000fa
>>>          00000000 8011685e 80119990 00935414 0002ce18 013d3fcc 
>>> 00000000 00000000
>>>          00000000 00000000 8011685e 013d3fcc 00000005 bfccd7a0 
>>> 80010686 0002a6bc
>>>          0002df3c 000000fa bfccd814 00000000 00000000 bfccd814 
>>> 00000000 800bdb54
>>> Call Trace: [<000336b4>] child_wait_callback+0x0/0x86
>>>   [<00035c1c>] sys_wait4+0x82/0x92
>>>   [<0002ce18>] buserr_c+0x130/0x1dc
>>>   [<0002a6bc>] buserr+0x28/0x30
>>>   [<0002df3c>] system_call+0x58/0xac
>>>
>>>
>>> I have not debugged any further yet.
>>
>> This rather looks like stack corruption - does that ColdFire system 
>> pass signal tests OK?
>
> I am not sure. I can run them and find out.
> I am traveling at the moment, so don't have access to the board
> right now. As soon as I get to my lab I will check.
>
>
>> That said - the register dump is misleading - from what I've read, 
>> ColdFire only has a single exception frame format, 2 longwords in 
>> size. The first longword of that frame contains frame format code, 
>> fault status, vector no. and status register. This is what's shown in 
>> the 'eff addr' longword here. The following longword is the actual 
>> faulting instruction PC as saved in the exception frame by the 
>> processor - this does not match what is given as PC at the start of 
>> the register dump (saved by the kernel on exceptio processing entry).
>
> I noticed that. It all looks a bit inconsistent.

I've decoded the two exception frames printed as format 4 frame above.

For the first exception, the vector number (bits 18-25 of 'eff addr') is 
2 i.e. access error, and the fault status (bits 16-17/26-27) is 0101 
i.e. TLB miss on instruction opword fetch. For the second one, we get 
the same vector number but fault status 1010 i.e. TLB miss on data read. 
Neither is consistent with what we expect to happen in the sysbadaddr test.

For access errors, we ought to have ended up in buserr_c, not trap_c.  
An illegal instruction exception would be vector number 4 (which calls 
trap_c).

The problem with this stack dump is that an exception frame on ColdFire, 
though format 4, does not have extra information saved on the stack - 
the two longwords interpreted as format 4 frame in the dump above are 
probably simply the previous exception frame. So the PC and fault code 
should be correct.

I'll fix the format 4 case in show_registers to report the exception 
frame data from pt_regs directly, and not advance the pointer by two 
longwords before calling show_stack.  We'll see what we get then.

>
>
>> I don't know what kind of ColdFire processor you used, so can't work 
>> out what happened on exception entry and in particular, where the PC 
>> in the kernel stack frame was taken from. No matter what, I think we 
>> ought to clean up the frame format 4 section in show_registers() to 
>> account for the different frame format on ColdFire, then perhaps also 
>> use the correct PC to dump the infringing code section. Makes no 
>> sense to try and debug this without correct debug info ...
>>
>> I can prepare a patch to show what I mean, but can neither compile or 
>> test that...
>
> I can try anything you want - at least once I get back to the lab.
>
> FWIW I am testing on a M5475 processor (on a M5475-EVB board).
> That is the m5475evb_defconfig in mainline kernels. So if you want to
> compile check any code changes just build for that.
At this point I don't even have a compiler recent enough to build 7.x 
kernels, so I'll have to leave compiling to you...

Cheers,

     Michael
>
> Regards
> Greg
>
>
