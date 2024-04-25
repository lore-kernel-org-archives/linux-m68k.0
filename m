Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B7702940B
	for <linux-m68k@lists.linux-m68k.org>; Thu, 25 Apr 2024 05:45:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714023957; cv=none; b=uYxozm9ckS8QqosVmYbImtD90pGouMoW6VcFuAyMxoNUTPw8OzC1YRtmm8vzDhXk2ZN02k3t+cSfA0K98B5e2Z+m0hsLuc85iUFqnq/6sFkO4otMQjPCMfGACt90AEikco+2/N7LaZ/1Zh2p83pDaAeYx20qyjaHaaYrzwjAiDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714023957; c=relaxed/simple;
	bh=4hgIjLAyJr0Jv9A+Lb7ymu/TTJE/qWbf+OiMC0YH5Pc=;
	h=Subject:To:References:Cc:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=JqHVDY+e8VmX2Hjq/F6v23HBLRGXpcnKDEQjhA10ivYCoqgWkhSSA9Wbth7KWEZVVTervAeXCpt79TnJJYMGJJaryvo9pETXH9KqHkIjw6hQpre48L1/zT9lGU56vkIBI734nYUTxCs/gGknFU93ug/FZJp4z3iwQ4Q4pyOQzQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AZbQHIAL; arc=none smtp.client-ip=209.85.160.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AZbQHIAL"
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-22f746c56a2so281739fac.0
        for <linux-m68k@lists.linux-m68k.org>; Wed, 24 Apr 2024 22:45:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714023954; x=1714628754; darn=lists.linux-m68k.org;
        h=in-reply-to:mime-version:user-agent:date:message-id:from:cc
         :references:to:subject:from:to:cc:subject:date:message-id:reply-to;
        bh=blyna2hOWn4utJ0Oc+Cefh8iYzicKjysoLpo1EgluCU=;
        b=AZbQHIALCxBO8OdR02N8Wq6vaCUIVT4bayT6rQKVIOjYa3kgQEvBST1E2ddSslxeFF
         EerA42FpMQKQhhfkKPX2Zs1w0yhuOHmBhkFShAidDHn8JxgyGi3F0Sl9den4KNmtQU+m
         NW+Gp6X8RcbOnOOJOFmQFPtjHux0OmY4ilc3F7yDtME22Tuo9HK99rIufJbwxM2WIP35
         zGklFZf99CVHIlTgkGSDLYZsHnJ5DKexxpd+aEdxKHBgLykSzrBfFtbHQv8sQoJNc7Zb
         s21v20jI2lAPFr6z21/t+9w3Zo+rkM9XmDoVTk0bttR8uS8Ggu8gloffYolUi/WnV4kN
         EVqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714023954; x=1714628754;
        h=in-reply-to:mime-version:user-agent:date:message-id:from:cc
         :references:to:subject:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=blyna2hOWn4utJ0Oc+Cefh8iYzicKjysoLpo1EgluCU=;
        b=jqxIpI0xQaz3Qm8tqIXfJ2VZUhzuDd5BtuXDlruiyZgRbNIIH3U+5oS08zijWrvKzz
         bEWWYvovSuUrULxFUJJMjpLpwBRWG+Z0n1dena0anI5K8lSBe536LuHp2DkuLsRHeS7r
         UGxu3luXiNPMsx00a5jLY+NWx9RfsGhltmtgQVykCEIs3jJZoU8D5X+jdmjY3cZrPoyE
         zUHmcXBHCzEaTXDuHRmQVAxgflTNImMDAeraXDrMH/RYF0hs/7rL1BGbGBHuwaENpNve
         jBPzV+wVURzx+y2eC/u0vqii0d67lRJ3VIRweJ6ebvNhIO3+TVz9mwVXYIOIKowsHURJ
         Prkw==
X-Forwarded-Encrypted: i=1; AJvYcCWWZtpdP7GYh5dJpDK+yqiBTLOIGuC9HOmsjEOQ39xBH43Pn1FdavmEUEKLECvE6H9Hu0D2EZr3MhGv+RUDcWP72vmID9+NuwKv57EyHxQb
X-Gm-Message-State: AOJu0Yzh0aD2RqE7C2MMFmYI0zRpScH5z+bM2SIG6QhI0XK29L2kQeBu
	QCWYTS1it3vpPp0q+L6Qaa+o2qsTZVMQSNkEHLAucjC5XIaYRTPtOukHBw==
X-Google-Smtp-Source: AGHT+IEiymqUhQHtkHzBxyM25sObiw9T/GZkFlDeC5UO5H6KavIEXJxq8cqbt9ICi/VZH9tvDrML9g==
X-Received: by 2002:a05:6870:3328:b0:21f:d2a2:7ff4 with SMTP id x40-20020a056870332800b0021fd2a27ff4mr6513729oae.17.1714023954200;
        Wed, 24 Apr 2024 22:45:54 -0700 (PDT)
Received: from [10.1.1.24] (222-152-175-63-fibre.sparkbb.co.nz. [222.152.175.63])
        by smtp.gmail.com with ESMTPSA id h3-20020a056a00218300b006ed4aa9d48esm12312264pfi.212.2024.04.24.22.45.50
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 24 Apr 2024 22:45:53 -0700 (PDT)
Subject: Re: [PATCH RFC v2 1/2] m68k: Handle __generic_copy_to_user faults
 more carefully
To: Finn Thain <fthain@linux-m68k.org>
References: <20240422022943.13775-1-schmitzmic@gmail.com>
 <20240422022943.13775-2-schmitzmic@gmail.com>
 <6fbf4809-dec2-84b9-3b83-86084ed19a20@linux-m68k.org>
Cc: geert@linux-m68k.org, linux-m68k@lists.linux-m68k.org
From: Michael Schmitz <schmitzmic@gmail.com>
Message-ID: <989ec316-69c3-d5e6-8312-9a62e78be547@gmail.com>
Date: Thu, 25 Apr 2024 17:45:47 +1200
User-Agent: Mozilla/5.0 (X11; Linux ppc; rv:45.0) Gecko/20100101
 Icedove/45.4.0
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <6fbf4809-dec2-84b9-3b83-86084ed19a20@linux-m68k.org>
Content-Type: multipart/mixed;
 boundary="------------0483C274D033E5DAC1927AD5"

This is a multi-part message in MIME format.
--------------0483C274D033E5DAC1927AD5
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

Hi Finn,

untested patch (to go on top of my v2 patch 1/2) attached. Compiles , 
but I haven't had a chance to test on 030 yet.

Cheers,

	Michael


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
>
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

--------------0483C274D033E5DAC1927AD5
Content-Type: text/x-diff;
 name="0001-m68k-add-more-exception-handling-to-__generic_copy_t.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename*0="0001-m68k-add-more-exception-handling-to-__generic_copy_t.pa";
 filename*1="tch"

From 23b973a077467818793a7aad89fde5eaf55cbd7f Mon Sep 17 00:00:00 2001
From: Michael Schmitz <schmitzmic@gmail.com>
Date: Thu, 25 Apr 2024 17:39:07 +1200
Subject: [PATCH] m68k: add more exception handling to __generic_copy_to_user

---
 arch/m68k/lib/uaccess.c | 22 +++++++++++++---------
 1 file changed, 13 insertions(+), 9 deletions(-)

diff --git a/arch/m68k/lib/uaccess.c b/arch/m68k/lib/uaccess.c
index ef761fc10981..5e27d5d3f10f 100644
--- a/arch/m68k/lib/uaccess.c
+++ b/arch/m68k/lib/uaccess.c
@@ -66,23 +66,25 @@ unsigned long __generic_copy_to_user(void __user *to, const void *from,
 		"3:	subq.l	#1,%0\n"
 		"4:	jne	1b\n"
 		"5:	btst	#1,%5\n"
-		"	jeq	7f\n"
-		"	move.w	(%1)+,%3\n"
-		"6:	"MOVES".w	%3,(%2)+\n"
-		"7:	btst	#0,%5\n"
-		"8:	jeq	10f\n"
-		"	move.b	(%1)+,%3\n"
-		"9:	"MOVES".b  %3,(%2)+\n"
-		"10:\n"
+		"	jeq	8f\n"
+		"6:	move.w	(%1)+,%3\n"
+		"7:	"MOVES".w	%3,(%2)+\n"
+		"8:	btst	#0,%5\n"
+		"9:	jeq	13f\n"
+		"10:	move.b	(%1)+,%3\n"
+		"11:	"MOVES".b  %3,(%2)+\n"
+		"12:	nop\n"
+		"13:\n"
 		"	.section .fixup,\"ax\"\n"
 		"	.even\n"
 		"20:	lsl.l	#2,%0\n"
 		"50:	add.l	%5,%0\n"
-		"	jra	10b\n"
+		"	jra	13b\n"
 		"	.previous\n"
 		"\n"
 		"	.section __ex_table,\"a\"\n"
 		"	.align	4\n"
+		"	.long	1b,20b\n"
 		"	.long	2b,20b\n"
 		"	.long	3b,20b\n"
 		"	.long	4b,20b\n"
@@ -91,6 +93,8 @@ unsigned long __generic_copy_to_user(void __user *to, const void *from,
 		"	.long	8b,50b\n"
 		"	.long	9b,50b\n"
 		"	.long	10b,50b\n"
+		"	.long	11b,50b\n"
+		"	.long	12b,50b\n"
 		"	.previous"
 		: "=d" (res), "+a" (from), "+a" (to), "=&d" (tmp)
 		: "0" (n / 4), "d" (n & 3));
-- 
2.17.1


--------------0483C274D033E5DAC1927AD5--
