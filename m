Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CB762EF653
	for <linux-m68k@lists.linux-m68k.org>; Fri,  2 Oct 2026 23:55:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790985309; cv=none; b=Dp+3EqVrIt210P7aOH1xmCo4894t/1yEZsomVLwi8T7Xi8CxfJtnPxdP1evA6WwnNCthFIIQE+fcDWormWcd3t1SMYZRk3eKUz0bRmoeCAG2xJurycrL6SnbuHVyO+HXgQVCTic10+Q5IJtNMkwyy5y2sL5Vv3EZFrp6dh19dQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790985309; c=relaxed/simple;
	bh=d1yL2ASqz1i37LWySYu0XkDqjLn0Fw9ZcE6OeAYmhy4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eC4vjLVv5i1XHyc1zquy81JyKEO7Y3Ln8hVWRtSHBVCkqJCvw7XOEtgyDFX29dL/DjU7YWmQcPsf1K03nAeBXU4VmBBLNizCeNRshzavmLvJfWxM8jztLNccgIcaeKdqqBPlTNBRfUMDplW2MUUMfz+oNYlAXAEtKHXEsdXaoM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NmbURkRo; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NmbURkRo"
Received: by mail-pj2-f43.google.com with SMTP id 98e67ed59e1d1-396ccc02279so38127a91.1
        for <linux-m68k@lists.linux-m68k.org>; Fri, 02 Oct 2026 16:55:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790985307; x=1791590107; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hoBO2WK85oCmZccbEsmXMTSLw+8SanEvgGm4FSV7LA8=;
        b=NmbURkRojplzldqx/GAG8lt8fnc1ChMihbXFAIiWEg3fmQ5FGKpi18xHfJCbw3hdYB
         Os6D0H5Qv4kosArasEJ97tTUCWhRAtiDLEr7JEvO+Yjjv8K6u8BAUuMlBx6WZfOCdup9
         H9Yi58I6sGfpdlkn3m6f9TgjLDXrkSjl/t3E0qVqZGXcC0QLAxD8UJli/+03/LbrA+PZ
         CdiZW5cmMLiALbxdc67HrtKI70JucoG8uKJELaXxLmgzO0BgbciBpio44y/ILHhJB/2w
         aUBY9S8Jcz1bJ90d1W8XiTbH+BUYFCkgR/QUTpkDkwx/n2nngge96OyIGy1WHaX4mD3y
         I24w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790985307; x=1791590107;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hoBO2WK85oCmZccbEsmXMTSLw+8SanEvgGm4FSV7LA8=;
        b=hmws7YfL3UUlrJUSCdfFhyFpngBrXLFBODsxTGtbwqxI8XM9+qP0D9rZy9jrWfFdP7
         rkUN8viMLs0nz4k1Qq+iXjpjl0i2IofEs6N04ipc4XSsZpPUFqV2Ix06RKfqGmF+UzD3
         UrIc9gDQF9qDlRkgmvhW7yUUyZA4E1ANQ/oYSJ2EpSfaAbH7myhj3oxP8Uj38ODB4nCH
         nfb27tcVUTRgDJ+LLaZdWYiH/QbB4NWmKCglimaI5AnhOhCaZPUrnmvml4hOnXvbEy7d
         IOdYC+VmwN7BH5nwnk4hJANBNFSEyN/5KFkShmI1VSiqOSYtE4njMEPhYshtIbA6vz8C
         lpZw==
X-Gm-Message-State: AFq9FYJVcHB+NWIxJ54NEq+oQ5oaQraDlRODRrAB/daKb9eQ5VIR3MGN
	GH4N3jl3g93y4tuSxqphLNv1t6cSnydIT2Rv+FYfQsKdLutTd4mWMW2W
X-Gm-Gg: AYBFou3DHDskdJZBEy4gYg/OIdUzKZY0/kTJ9OxIRvEOs3hwg/3ayQxRYPDNDlkZyCh
	DjP59bK+7kp1BbpOtAACfKptc2H9LonVsPLBvmmMEJ+N0iYw3aVClLLC8Vqdir/xUxjlYgKD6tg
	kklzigbzTMyYE3O6Rr6Xx3SAQgYATFp4QHozRwTDlt8AZlg1R9vjMYEAC8rdU9R50t65dnUmpPK
	V2cr9Hp5Lrx1sVnzStzLNIbzTlnvRJRo7NccrvpGLEP/JoWzCeipIGE9vw8s2GtoZ3nn2sIUsxk
	JCS3JndnCYVeWTHwDoBj12cBflBEOTDkClGOeiUu5zFHU/mnVdN0AKo2MXN3FwtGyI44mgKOU6h
	ufPXGaAWr6jLxgS7A0hvf0A3cBpuK8x8Djw3//OtdxA2B3ox1GmcRml8w4mfMIAWdzFJTof/EvK
	CpU6wwD7ysK3/Noylc501QtqG761hkkvLYxd31HfsM2aE/M7QDe9h/1cWaXppNuyj/KnZS7d1YQ
	qu4VsS8VgBwwdnabTbl2BMvryl0xFh6v0GO+jViQjEAsq6rxtsx
X-Received: by 2002:a17:90b:1c86:b0:3a4:d5c0:f826 with SMTP id 98e67ed59e1d1-3a6ce9b0fe4mr3982968a91.65.1790985306510;
        Fri, 02 Oct 2026 16:55:06 -0700 (PDT)
Received: from [10.1.1.100] (122-59-250-182-adsl.sparkbb.co.nz. [122.59.250.182])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a78d7cd47csm567741a91.17.2026.10.02.16.55.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Oct 2026 16:55:05 -0700 (PDT)
Message-ID: <dfcbbc59-4204-478b-b8da-867621056c62@gmail.com>
Date: Sat, 3 Oct 2026 12:55:02 +1300
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND] m68k: Handle put_user faults more carefully
To: Geert Uytterhoeven <geert@linux-m68k.org>,
 Finn Thain <fthain@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org
References: <88e752e0bca92c7b65533cc1b334052dd272f8ef.1790842086.git.fthain@linux-m68k.org>
 <02c53c37-d2ee-4c03-a8f9-0a757c3af59e@gmail.com>
 <CAMuHMdVbfUH1ZoFcS64t=gyE_cskMWv6gGvL8pjGirSGvAKu2w@mail.gmail.com>
Content-Language: en-US
From: Michael Schmitz <schmitzmic@gmail.com>
In-Reply-To: <CAMuHMdVbfUH1ZoFcS64t=gyE_cskMWv6gGvL8pjGirSGvAKu2w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Geert,

On 03/10/2026 5:28 AM, Geert Uytterhoeven wrote:

> Hi Michael, Finn,
>
> On Thu, 1 Oct 2026 at 20:57, Michael Schmitz <schmitzmic@gmail.com> wrote:
>> On 1/10/26 22:08, Finn Thain wrote:
>>> Running 'stress-ng --sysbadaddr -1' on my MC68040 system immediately
>>> produces an oops:
>>>
>>>       Unable to handle kernel access at virtual address f1c422fb
>>>       Oops: 00000000
>>>       Modules linked in:
>>>       PC: [<00005a1a>] do_040writeback1+0xae/0x160
>>>       SR: 2010  SP: 96087dc2  a2: 01500000
>>>       d0: 00000000    d1: 014e8000    d2: 00000081    d3: 00000000
>>>       d4: 00000481    d5: c043dfff    a0: 014e8000    a1: 00632fd5
>>>       Process stress-ng (pid: 221, task=1b729d30)
>>>       Frame format=7 eff addr=014e9eb8 ssw=0c81 faddr=c043dfff
>>>       wb 1 stat/addr/data: 0001 00000481 c043dfff
>>>       wb 2 stat/addr/data: 0081 c043dfff 2f746d70
>>>       wb 3 stat/addr/data: 0005 014e9ed4 2f746d70
>>>       push data: c043dfff 800daa70 00000000 014e9f1c
>>>       Stack from 014e9ed4:
>>>         2f740000 8017c000 014e9f10 00006830 00000081 c043dfff 2f746d70 2f746d70
>>>         0081a000 00000400 c043dfff 800daa70 c043dfff 80016a20 00000003 014e9f88
>>>         000026c8 014e9f1c 00000001 2f746d70 0081a000 00000400 c043dfff 0081afff
>>>         c043dfff 01500000 00000001 ffffffff 00000000 20000046 41d67008 014e9f58
>>>         04810005 00810045 c043dfff 014e9f84 2f746d70 c043dfff 2f746d70 c043dfff
>>>         80016a20 8017c000 00000000 0081affb 00000005 014e9fc4 00128bc6 c043dfff
>>>       Call Trace: [<00006830>] buserr_c+0x510/0x698
>>>         [<000026c8>] buserr+0x20/0x28
>>>         [<00128bc6>] sys_getcwd+0xc8/0x15a
>>>         [<000027a2>] syscall+0x8/0xc
>>>         [<0008800d>] sanity_check_segment_list+0x17/0x11e
>>>
>>>       Code: 000c 0e90 1800 220f 0281 ffff e000 2041 <2228> 0008 0281 00ff
>>>             ff00 67a4 6026 4280 122e 0013 206e 000c 0e10 1800 220f 0281
>>>
>>> 0000596c <do_040writeback1>:
>>>       596c:       4e56 fffc       linkw %fp,#-4
>>>       5970:       2f02            movel %d2,%sp@-
>>>       5972:       202e 0008       movel %fp@(8),%d0
>>>       5976:       4282            clrl %d2
>>>       5978:       3400            movew %d0,%d2
>>>       597a:       220f            movel %sp,%d1
>>>       597c:       0281 ffff e000  andil #-8192,%d1
>>>       5982:       2041            moveal %d1,%a0
>>>       5984:       2228 0008       movel %a0@(8),%d1
>>>       5988:       0281 00ff ff00  andil #16776960,%d1
>>>       598e:       6600 0104       bnew 5a94 <do_040writeback1+0x128>
>>>       5992:       4e7b 2000       movec %d2,%sfc
>>>       5996:       4e7b 2001       movec %d2,%dfc
>>>       599a:       0240 0060       andiw #96,%d0
>>>       599e:       0c40 0020       cmpiw #32,%d0
>>>       59a2:       6700 0084       beqw 5a28 <do_040writeback1+0xbc>
>>>       59a6:       0c40 0040       cmpiw #64,%d0
>>>       59aa:       6730            beqs 59dc <do_040writeback1+0x70>
>>>       59ac:       4a40            tstw %d0
>>>       59ae:       6752            beqs 5a02 <do_040writeback1+0x96>
>>>       59b0:       4280            clrl %d0
>>>       59b2:       220f            movel %sp,%d1
>>>       59b4:       0281 ffff e000  andil #-8192,%d1
>>>       59ba:       2041            moveal %d1,%a0
>>>       59bc:       2228 0008       movel %a0@(8),%d1
>>>       59c0:       0281 00ff ff00  andil #16776960,%d1
>>>       59c6:       6600 0086       bnew 5a4e <do_040writeback1+0xe2>
>>>       59ca:       7201            moveq #1,%d1
>>>       59cc:       4e7b 1000       movec %d1,%sfc
>>>       59d0:       4e7b 1001       movec %d1,%dfc
>>>       59d4:       242e fff8       movel %fp@(-8),%d2
>>>       59d8:       4e5e            unlk %fp
>>>       59da:       4e75            rts
>>>       59dc:       4280            clrl %d0
>>>       59de:       322e 0012       movew %fp@(18),%d1
>>>       59e2:       206e 000c       moveal %fp@(12),%a0
>>>       59e6:       0e50 1800       movesw %d1,%a0@
>>>       59ea:       220f            movel %sp,%d1
>>>       59ec:       0281 ffff e000  andil #-8192,%d1
>>>       59f2:       2041            moveal %d1,%a0
>>>       59f4:       2228 0008       movel %a0@(8),%d1
>>>       59f8:       0281 00ff ff00  andil #16776960,%d1
>>>       59fe:       67ca            beqs 59ca <do_040writeback1+0x5e>
>>>       5a00:       604c            bras 5a4e <do_040writeback1+0xe2>
>>>       5a02:       4280            clrl %d0
>>>       5a04:       222e 0010       movel %fp@(16),%d1
>>>       5a08:       206e 000c       moveal %fp@(12),%a0
>>>       5a0c:       0e90 1800       movesl %d1,%a0@
>>>       5a10:       220f            movel %sp,%d1
>>>       5a12:       0281 ffff e000  andil #-8192,%d1
>>>       5a18:       2041            moveal %d1,%a0
>>>       5a1a:       2228 0008       movel %a0@(8),%d1
>>>       5a1e:       0281 00ff ff00  andil #16776960,%d1
>>>       5a24:       67a4            beqs 59ca <do_040writeback1+0x5e>
>>>       5a26:       6026            bras 5a4e <do_040writeback1+0xe2>
>>>       ...
>>>
>>> The cause is a deliberately misaligned access in the 'bad_end_addr' test
>>> case in the 'sysbadaddr' stressor. The location being accessed here,
>>> 0xc043dfff, was contrived to span the boundary between a r/w anonymous page
>>> and an unmapped page. The address was then passed to the getcwd syscall
>>> which faulted in copy_to_user().
>>>
>>> The fault for the mapped page appears to be handled okay -- up until
>>> do_040writeback1() called put_user() which produced a second fault due to
>>> the unmapped page.
>>>
>>> Michael Schmitz helpfully deciphered the oops and explained the exception
>>> processing leading up to it.
>>>
>>>       "regs->pc does point to the PC in the format 7 frame which is the PC
>>>       the fault was detected at, but not (in case of a writeback fault)
>>>       the PC of the faulting instruction [that is, MOVES.L].
>>>
>>>       "The writeback would still cross the page boundary, and fault if the
>>>       unmapped page still isn't present. We would not see the PC of the
>>>       movesl in that case, and fail to find the PC in the exception
>>>       table."
>>>
>>> One solution is to add a NOP instruction after the MOVES.L to flush the
>>> pipeline and take the fault. That way, the PC value in the exception frame
>>> becomes dependable so the exception table works.
>>>
>>> Theoretically, there seems to be another bug in the existing code. If
>>> the instruction following the MOVES faulted, then after the fixup,
>>> execution would resume at the instruction which caused the fault. This
>>> appears to be a loop. After this patch, that cannot happen.
>>>
>>> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
>>> Signed-off-by: Finn Thain <fthain@linux-m68k.org>
>>> ---
>>>    arch/m68k/include/asm/uaccess.h | 10 ++++++----
>>>    1 file changed, 6 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/arch/m68k/include/asm/uaccess.h b/arch/m68k/include/asm/uaccess.h
>>> index 31d133faa45e..728a6dfb7414 100644
>>> --- a/arch/m68k/include/asm/uaccess.h
>>> +++ b/arch/m68k/include/asm/uaccess.h
>>> @@ -31,11 +31,12 @@
>>>    #define __put_user_asm(inst, res, x, ptr, bwl, reg, err) \
>>>    asm volatile ("\n"                                  \
>>>        "1:     "inst"."#bwl"   %2,%1\n"                \
>>> -     "2:\n"                                          \
>>> +     "2:     nop\n"                                  \
>>> +     "3:\n"                                          \
>>>        "       .section .fixup,\"ax\"\n"               \
>>>        "       .even\n"                                \
>>>        "10:    moveq.l %3,%0\n"                        \
>>> -     "       jra 2b\n"                               \
>>> +     "       jra 3b\n"                               \
>>>        "       .previous\n"                            \
>>>        "\n"                                            \
>>>        "       .section __ex_table,\"a\"\n"            \
>>> @@ -53,11 +54,12 @@ do {                                                              \
>>>        asm volatile ("\n"                                      \
>>>                "1:     "inst".l %2,(%1)+\n"                    \
>>>                "2:     "inst".l %R2,(%1)\n"                    \
>>> -             "3:\n"                                          \
>>> +             "3:     nop\n"                                  \
>>> +             "4:\n"                                          \
>>>                "       .section .fixup,\"ax\"\n"               \
>>>                "       .even\n"                                \
>>>                "10:    movel %3,%0\n"                          \
>>> -             "       jra 3b\n"                               \
>>> +             "       jra 4b\n"                               \
>>>                "       .previous\n"                            \
>>>                "\n"                                            \
>>>                "       .section __ex_table,\"a\"\n"            \
>>> Reviewed-by: Michael Schmitz <schmitzmic@gmail.com>
>>>
>>> in case it helps.
>>>
>>> Anecdotally, I've seen similar uaccess faults causing kernel oops on 030
>>> as well, so this may not merely be an artificial unaligned access issue.
> Shouldn't this include
> https://lore.kernel.org/20240429030945.22451-3-schmitzmic@gmail.com
> ?

Along with 
https://lore.kernel.org/20240429030945.22451-2-schmitzmic@gmail.com, 
perhaps.

Can't recall the details, but Finn's solution was to add a nop in order 
to make the fault PC reliable. That's not a great deal of overhead in 
the case of put_user(). My changes to copy_to_user try to avoid flushing 
the pipeline inside of a loop, and only use the nop after exiting the 
loop. The cost of that is larger exception tables. Not sure which is worse.

What's more, I can't be certain that my 'fault is taken two instructions 
past faulting instruction' observation is 100% reliable. AFAIK this has 
only been tested on 030 and 040. Coldfire(MMU) and 060 tests are still 
missing.

Adding nop's after each of the MOVES in these macros might be the only 
deterministic way to always detect uaccess faults, no matter the 
performance impact.

I think the copy_to_user() and clear_user() cases need more testing and 
discussion.

Cheers,

     Michael


>
> Gr{oetje,eeting}s,
>
>                          Geert
>
