Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A4C938DE5
	for <linux-m68k@lists.linux-m68k.org>; Wed, 24 Apr 2024 04:48:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713934111; cv=none; b=huNKFSDvCB1zfEYF7bjg0vE2p6v0Ny28n10Dr8tb+Rghl6P9cb5OvOu3kS7v7nY0Fr1sYYK9r6M6Pn85e6ARH73/zcY9QJuZxRNKfcWtKUigFooQnPbosyCFX7dH5ATO9xW9v+G3UtDBKmDsoEDzX1j5JHMg5oNLZ/+RLD9XGgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713934111; c=relaxed/simple;
	bh=Kvsk+K2iGLGamTKNOal5xBGPLG+HUT3qdkcqhV1o90I=;
	h=Subject:To:References:Cc:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=ENoKsHVym8hyUETQPBvEUqKukVC7nlebx/j4kfAbp/jH3YcmB4HlJGnkFXPYskgCXZ7/ICSIxWUQyJnvFHby2mmP836VleWo6SYxI6zHweooFw2WFy9tcz+gjbqmHHdTZX0SMQ6iuevoaD13hXdadM3CUHFHN2i+zXighpBiyg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ptv4vNNq; arc=none smtp.client-ip=209.85.210.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ptv4vNNq"
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-6ea0db2727bso3518613a34.2
        for <linux-m68k@lists.linux-m68k.org>; Tue, 23 Apr 2024 21:48:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713934108; x=1714538908; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:cc:references:to:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CttB2D1ezOAJU8ZuTasR56W8mA9eDPV+oQttuthi3E0=;
        b=Ptv4vNNq5GcYam1bScD6ge+QjKyjmII34r/c5XCnngp5WX3d8Gd/+wokmGdcy0k/Kr
         +J5sQ/4JL/dQwfosHKy7ln0xbk+KxckSvsq6/7zXgbrn5ygzC1vlWvTppNvggDyCLe4N
         m60ToGp3m33o1PHWeOOUzkU+MGLnHSgDLGtUnVHPSGzpsfaTApeEFoKKRT4HO+7JX3QH
         XLSyCQZztdAPpBw1BQdRhC+/QjtIQCChHYzNW/k5RZUcwu/EzlzOfuWasGS+mJtuJL4j
         +ulwr0tGnyZaXKdJjA86mCfT3d7zk01FwVvuxMh+WEALt3W1XfJqALQxy7Za2o/CaoBj
         CcBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713934108; x=1714538908;
        h=content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:cc:references:to:subject:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CttB2D1ezOAJU8ZuTasR56W8mA9eDPV+oQttuthi3E0=;
        b=aDtKqtHRdsJGzk+eScAVvkiptutQW65C5LJVNfnCxbW825VGC/pnxfBCIDZlYWa+yw
         ApJ3h7JBZrGuRdltc0KTb5v4RM6WS1IuCX8au1mYfgZ/0YnS0DfyAECYrfTigDy4Wrx7
         lNnevbOxGyAMUR7DnRobSR4dPJ4YnTgzM0orXQe5Y0HbtevtqHC45uK8ia3bvBiOPInS
         QS7QK1a2+h/aUJFsMuGZDhT9td6j38RxjjxrBPNuYVxA8OdfEhEFB8oejOJ/Qb01+GQ6
         1iSftVfUzFGfUXsSSiDUw0Ju08wiNRk/GernIlCgmnyVrzePmMr/EY/dQaYOZ4oeocG6
         Oxbg==
X-Gm-Message-State: AOJu0YzeJMMjqPwPpYAwpCZ0syj58lhBsnilXCgi97OJ4VRWeUVMVs9G
	VggwV+kZsBrONqfEF0jTuOJrq5OBIzUmLZCeonQw+lBM+LNFS9Nw
X-Google-Smtp-Source: AGHT+IHfkGqoXrto0+sUxYvgOrmg064vNQUmIJIKV5iaMUBbPbA1jZy6kAsPCjMXTnUz5zV39Ps+Hg==
X-Received: by 2002:a05:6870:d286:b0:22a:4f07:13cc with SMTP id d6-20020a056870d28600b0022a4f0713ccmr1410050oae.33.1713934108082;
        Tue, 23 Apr 2024 21:48:28 -0700 (PDT)
Received: from [10.1.1.24] (222-152-175-63-fibre.sparkbb.co.nz. [222.152.175.63])
        by smtp.gmail.com with ESMTPSA id s80-20020a632c53000000b005fe2f66f89fsm5303171pgs.75.2024.04.23.21.48.24
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 23 Apr 2024 21:48:27 -0700 (PDT)
Subject: Re: [RFC PATCH] m68k: Handle put_user faults more carefully
To: Finn Thain <fthain@linux-m68k.org>
References: <e0f23460779e6d16e2633486ac4841790ef2aca0.1713176294.git.fthain@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org, Geert Uytterhoeven
 <geert@linux-m68k.org>, Greg Ungerer <gerg@linux-m68k.org>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
From: Michael Schmitz <schmitzmic@gmail.com>
Message-ID: <45295679-d8ab-2413-e11d-2f31eba61d63@gmail.com>
Date: Wed, 24 Apr 2024 16:48:21 +1200
User-Agent: Mozilla/5.0 (X11; Linux ppc; rv:45.0) Gecko/20100101
 Icedove/45.4.0
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <e0f23460779e6d16e2633486ac4841790ef2aca0.1713176294.git.fthain@linux-m68k.org>
Content-Type: text/plain; charset=iso-8859-15; format=flowed
Content-Transfer-Encoding: 7bit

Hi Finn,

I've just seen this Oops when running the sysbadaddr stressor on 030, 
unpatched kernel.

Your patch, as expected, fixes the Oops.

Evidently, this is not just a 040 writeback issue.

Adrian: if you could test Finn's patch and mine on 060 with trhe 
sysbadaddr stressor in stress-ng 0.11.07 or later, that would add 
valuable test coverage on 060.

Any comments on how this all might work (or not) on Coldfire, Greg?

Cheers,

	Michael

Oops:

> [179135.960000] Unable to handle kernel access at virtual address 8a24992b
> [179136.030000] Oops: 00000000
> [179136.070000] Modules linked in: ne 8390p
> [179136.120000] PC: [<00049592>] sys_gettimeofday+0x2a/0x7e
> [179136.190000] SR: 2200  SP: 518b9580  a2: 00836220
> [179136.230000] d0: 00000000    d1: 66283bbc    d2: c0015001    d3: 800366b0
> [179136.280000] d4: 80036768    d5: 80036698    a0: 00000000    a1: 00c1e000
> [179136.330000] Process stress-ng (pid: 15409, task=6272aad3)
> [179136.380000] Frame format=A ssw=0709 isc=6644 isb=262e daddr=c0015000 dobuf=66283bbc
> [179136.430000] Stack from 00c1ffa8:
> [179136.430000]         c0015001 800366b0 80036768 8001f2ca 00000000 66283bbc 110de38e effffa38
> [179136.430000]         000026c6 c0015000 c0015001 800366b0 80036768 80036698 8002e4c8 800366b0
> [179136.430000]         8002e4cc 0000004e 0000004e 00000000 0208c011 22fe0080
> [179136.610000] Call Trace: [<000026c6>] syscall+0x8/0xc
> [179136.660000]
> [179136.690000] Code: 0004 b9ac 4280 222e fff8 0e93 1800 588f <4a80> 6644 262e fffc 2803 4c3c 4c01 1062 4dd3 ec81 d683 9783 9283 0eab 1800 0004

Disassambly of sys_gettimeofday:

> 00049568 <__se_sys_gettimeofday>:
>    49568:       4e56 fff4       linkw %fp,#-12
>    4956c:       48e7 3810       moveml %d2-%d4/%a3,%sp@-
>    49570:       242e 000c       movel %fp@(12),%d2
>    49574:       266e 0008       moveal %fp@(8),%a3
>    49578:       4a8b            tstl %a3
>    4957a:       673a            beqs 495b6 <__se_sys_gettimeofday+0x4e>
>    4957c:       486e fff4       pea %fp@(-12)
>    49580:       4eb9 0004 b9ac  jsr 4b9ac <ktime_get_real_ts64>
>    49586:       4280            clrl %d0
>    49588:       222e fff8       movel %fp@(-8),%d1
>    4958c:       0e93 1800       movesl %d1,%a3@
>    49590:       588f            addql #4,%sp
>    49592:       4a80            tstl %d0
>    49594:       6644            bnes 495da <__se_sys_gettimeofday+0x72>
>    49596:       262e fffc       movel %fp@(-4),%d3
>    4959a:       2803            movel %d3,%d4
>    4959c:       4c3c 4c01 1062  mulsl #274877907,%d1,%d4
>    495a2:       4dd3
>    495a4:       ec81            asrl #6,%d1
>    495a6:       d683            addl %d3,%d3
>    495a8:       9783            subxl %d3,%d3
>    495aa:       9283            subl %d3,%d1
>    495ac:       0eab 1800 0004  movesl %d1,%a3@(4)

C code for this is:

> SYSCALL_DEFINE2(gettimeofday, struct __kernel_old_timeval __user *, tv,
>                 struct timezone __user *, tz)
> {
>         if (likely(tv != NULL)) {
>                 struct timespec64 ts;
>
>                 ktime_get_real_ts64(&ts);
>                 if (put_user(ts.tv_sec, &tv->tv_sec) ||
>                     put_user(ts.tv_nsec / 1000, &tv->tv_usec))
>                         return -EFAULT;
>         }
>         if (unlikely(tz != NULL)) {
>                 if (copy_to_user(tz, &sys_tz, sizeof(sys_tz)))
>                         return -EFAULT;
>         }
>         return 0;
> }
>




Am 15.04.2024 um 22:18 schrieb Finn Thain:
> Running 'stress-ng --sysbadaddr -1' on my MC68040 system immediately
> produces an oops:
>
>     Unable to handle kernel access at virtual address f1c422fb
>     Oops: 00000000
>     Modules linked in:
>     PC: [<00005a1a>] do_040writeback1+0xae/0x160
>     SR: 2010  SP: 96087dc2  a2: 01500000
>     d0: 00000000    d1: 014e8000    d2: 00000081    d3: 00000000
>     d4: 00000481    d5: c043dfff    a0: 014e8000    a1: 00632fd5
>     Process stress-ng (pid: 221, task=1b729d30)
>     Frame format=7 eff addr=014e9eb8 ssw=0c81 faddr=c043dfff
>     wb 1 stat/addr/data: 0001 00000481 c043dfff
>     wb 2 stat/addr/data: 0081 c043dfff 2f746d70
>     wb 3 stat/addr/data: 0005 014e9ed4 2f746d70
>     push data: c043dfff 800daa70 00000000 014e9f1c
>     Stack from 014e9ed4:
>       2f740000 8017c000 014e9f10 00006830 00000081 c043dfff 2f746d70 2f746d70
>       0081a000 00000400 c043dfff 800daa70 c043dfff 80016a20 00000003 014e9f88
>       000026c8 014e9f1c 00000001 2f746d70 0081a000 00000400 c043dfff 0081afff
>       c043dfff 01500000 00000001 ffffffff 00000000 20000046 41d67008 014e9f58
>       04810005 00810045 c043dfff 014e9f84 2f746d70 c043dfff 2f746d70 c043dfff
>       80016a20 8017c000 00000000 0081affb 00000005 014e9fc4 00128bc6 c043dfff
>     Call Trace: [<00006830>] buserr_c+0x510/0x698
>       [<000026c8>] buserr+0x20/0x28
>       [<00128bc6>] sys_getcwd+0xc8/0x15a
>       [<000027a2>] syscall+0x8/0xc
>       [<0008800d>] sanity_check_segment_list+0x17/0x11e
>
>     Code: 000c 0e90 1800 220f 0281 ffff e000 2041 <2228> 0008 0281 00ff
>           ff00 67a4 6026 4280 122e 0013 206e 000c 0e10 1800 220f 0281
>
> 0000596c <do_040writeback1>:
>     596c:       4e56 fffc       linkw %fp,#-4
>     5970:       2f02            movel %d2,%sp@-
>     5972:       202e 0008       movel %fp@(8),%d0
>     5976:       4282            clrl %d2
>     5978:       3400            movew %d0,%d2
>     597a:       220f            movel %sp,%d1
>     597c:       0281 ffff e000  andil #-8192,%d1
>     5982:       2041            moveal %d1,%a0
>     5984:       2228 0008       movel %a0@(8),%d1
>     5988:       0281 00ff ff00  andil #16776960,%d1
>     598e:       6600 0104       bnew 5a94 <do_040writeback1+0x128>
>     5992:       4e7b 2000       movec %d2,%sfc
>     5996:       4e7b 2001       movec %d2,%dfc
>     599a:       0240 0060       andiw #96,%d0
>     599e:       0c40 0020       cmpiw #32,%d0
>     59a2:       6700 0084       beqw 5a28 <do_040writeback1+0xbc>
>     59a6:       0c40 0040       cmpiw #64,%d0
>     59aa:       6730            beqs 59dc <do_040writeback1+0x70>
>     59ac:       4a40            tstw %d0
>     59ae:       6752            beqs 5a02 <do_040writeback1+0x96>
>     59b0:       4280            clrl %d0
>     59b2:       220f            movel %sp,%d1
>     59b4:       0281 ffff e000  andil #-8192,%d1
>     59ba:       2041            moveal %d1,%a0
>     59bc:       2228 0008       movel %a0@(8),%d1
>     59c0:       0281 00ff ff00  andil #16776960,%d1
>     59c6:       6600 0086       bnew 5a4e <do_040writeback1+0xe2>
>     59ca:       7201            moveq #1,%d1
>     59cc:       4e7b 1000       movec %d1,%sfc
>     59d0:       4e7b 1001       movec %d1,%dfc
>     59d4:       242e fff8       movel %fp@(-8),%d2
>     59d8:       4e5e            unlk %fp
>     59da:       4e75            rts
>     59dc:       4280            clrl %d0
>     59de:       322e 0012       movew %fp@(18),%d1
>     59e2:       206e 000c       moveal %fp@(12),%a0
>     59e6:       0e50 1800       movesw %d1,%a0@
>     59ea:       220f            movel %sp,%d1
>     59ec:       0281 ffff e000  andil #-8192,%d1
>     59f2:       2041            moveal %d1,%a0
>     59f4:       2228 0008       movel %a0@(8),%d1
>     59f8:       0281 00ff ff00  andil #16776960,%d1
>     59fe:       67ca            beqs 59ca <do_040writeback1+0x5e>
>     5a00:       604c            bras 5a4e <do_040writeback1+0xe2>
>     5a02:       4280            clrl %d0
>     5a04:       222e 0010       movel %fp@(16),%d1
>     5a08:       206e 000c       moveal %fp@(12),%a0
>     5a0c:       0e90 1800       movesl %d1,%a0@
>     5a10:       220f            movel %sp,%d1
>     5a12:       0281 ffff e000  andil #-8192,%d1
>     5a18:       2041            moveal %d1,%a0
>     5a1a:       2228 0008       movel %a0@(8),%d1
>     5a1e:       0281 00ff ff00  andil #16776960,%d1
>     5a24:       67a4            beqs 59ca <do_040writeback1+0x5e>
>     5a26:       6026            bras 5a4e <do_040writeback1+0xe2>
>     ...
>
> The cause is a deliberately misaligned access in the 'bad_end_addr' test
> case in the 'sysbadaddr' stressor. The location being accessed here,
> 0xc043dfff, was contrived to span the boundary between a r/w anonymous page
> and an unmapped page. The address was then passed to the getcwd syscall
> which faulted in copy_to_user().
>
> The fault for the mapped page appears to be handled okay -- up until
> do_040writeback1() called put_user() which produced a second fault due to
> the unmapped page.
>
> Michael Schmitz helpfully deciphered the oops and explained the exception
> processing leading up to it.
>
>     "regs->pc does point to the PC in the format 7 frame which is the PC
>     the fault was detected at, but not (in case of a writeback fault)
>     the PC of the faulting instruction [that is, MOVES.L].
>
>     "The writeback would still cross the page boundary, and fault if the
>     unmapped page still isn't present. We would not see the PC of the
>     movesl in that case, and fail to find the PC in the exception
>     table."
>
> One solution is to add a NOP instruction after the MOVES.L to flush the
> pipeline and take the fault. That way, the PC value in the exception frame
> becomes dependable so the exception table works.
>
> Theoretically, there seems to be another bug in the existing code. If
> the instruction following the MOVES faulted, then after the fixup,
> execution would resume at the instruction which caused the fault. This
> appears to be a loop. After this patch, that cannot happen.
>
> ---
>
> In my testing, Aranym and Qemu were not affected by the bug. Perhaps that's
> because these emulated 68040 CPUs are not pipelined (?)
>
> No testing was done on MC68060. It would be nice to know whether stress-ng
> causes an oops on that CPU too.
>
> There is a similar oops on MC68030 that is not addressed by this patch.
> It was rather more difficult to trigger (stress-ng was insufficient) but
> it too can probably be solved by adding NOPs.
>
>     Oops: 00000000
>     Modules linked in:
>     PC: [<004641dc>] __generic_copy_to_user+0x26/0x46
>     SR: 2000  SP: bbc272eb  a2: 00ab4b20
>     d0: 00000001    d1: 00000001    d2: 2f766172    d3: 0081a000
>     d4: 00000400    d5: c0028fff    a0: 0081affb    a1: c0029003
>     Process ba-index4-getcw (pid: 58, task=2be598c4)
>     Frame format=B ssw=0739 isc=0801 isb=027c daddr=c0029000 dobuf=2f766172
>     baddr=004641e0 dibuf=2f766172 ver=f
>     Stack from 014e7f84:
>       00000009 014e7fc4 00128bc6 c0028fff 0081aff7 00000009 00000400 00000000
>       efafaeac ef9baa88 00986910 00c31600 00986910 00c16200 0081aff7 00000ff7
>       c0028fff 000027a2 c0028fff 00000400 00000000 efafaeac ef9baa88 c0023e8c
>       c002538c efafaea4 ffffffda 000000b7 00000000 0008c010 b1220080
>     Call Trace: [<00128bc6>] sys_getcwd+0xc8/0x15a
>       [<000027a2>] syscall+0x8/0xc
>       [<0008c010>] cgroup_path_ns_locked+0xac/0xb6
>
>     Code: 226e 0008 4a80 670a 2418 0e99 2800 5380 <66f6> 0801 0001 6706
>           3418 0e59 2800 0801 0000 6706 1418 0e19 2800 241f 4e5e 4e75
>
> 004641b6 <__generic_copy_to_user>:
>   4641b6:       4e56 0000       linkw %fp,#0
>   4641ba:       2f02            movel %d2,%sp@-
>   4641bc:       222e 0010       movel %fp@(16),%d1
>   4641c0:       2001            movel %d1,%d0
>   4641c2:       e488            lsrl #2,%d0
>   4641c4:       7403            moveq #3,%d2
>   4641c6:       c282            andl %d2,%d1
>   4641c8:       206e 000c       moveal %fp@(12),%a0
>   4641cc:       226e 0008       moveal %fp@(8),%a1
>   4641d0:       4a80            tstl %d0
>   4641d2:       670a            beqs 4641de <__generic_copy_to_user+0x28>
>   4641d4:       2418            movel %a0@+,%d2
>   4641d6:       0e99 2800       movesl %d2,%a1@+
>   4641da:       5380            subql #1,%d0
>   4641dc:       66f6            bnes 4641d4 <__generic_copy_to_user+0x1e>
>   4641de:       0801 0001       btst #1,%d1
>   4641e2:       6706            beqs 4641ea <__generic_copy_to_user+0x34>
>   4641e4:       3418            movew %a0@+,%d2
>   4641e6:       0e59 2800       movesw %d2,%a1@+
>   4641ea:       0801 0000       btst #0,%d1
>   4641ee:       6706            beqs 4641f6 <__generic_copy_to_user+0x40>
>   4641f0:       1418            moveb %a0@+,%d2
>   4641f2:       0e19 2800       movesb %d2,%a1@+
>   4641f6:       241f            movel %sp@+,%d2
>   4641f8:       4e5e            unlk %fp
>   4641fa:       4e75            rts
> ---
>  arch/m68k/include/asm/uaccess.h | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
>
> diff --git a/arch/m68k/include/asm/uaccess.h b/arch/m68k/include/asm/uaccess.h
> index 64914872a5c9..44e52d8323e5 100644
> --- a/arch/m68k/include/asm/uaccess.h
> +++ b/arch/m68k/include/asm/uaccess.h
> @@ -31,11 +31,12 @@
>  #define __put_user_asm(inst, res, x, ptr, bwl, reg, err) \
>  asm volatile ("\n"					\
>  	"1:	"inst"."#bwl"	%2,%1\n"		\
> -	"2:\n"						\
> +	"2:	nop\n"					\
> +	"3:\n"						\
>  	"	.section .fixup,\"ax\"\n"		\
>  	"	.even\n"				\
>  	"10:	moveq.l	%3,%0\n"			\
> -	"	jra 2b\n"				\
> +	"	jra 3b\n"				\
>  	"	.previous\n"				\
>  	"\n"						\
>  	"	.section __ex_table,\"a\"\n"		\
> @@ -53,11 +54,12 @@ do {								\
>  	asm volatile ("\n"					\
>  		"1:	"inst".l %2,(%1)+\n"			\
>  		"2:	"inst".l %R2,(%1)\n"			\
> -		"3:\n"						\
> +		"3:	nop\n"					\
> +		"4:\n"						\
>  		"	.section .fixup,\"ax\"\n"		\
>  		"	.even\n"				\
>  		"10:	movel %3,%0\n"				\
> -		"	jra 3b\n"				\
> +		"	jra 4b\n"				\
>  		"	.previous\n"				\
>  		"\n"						\
>  		"	.section __ex_table,\"a\"\n"		\
>
