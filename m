Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7522813AD0E
	for <linux-m68k@lists.linux-m68k.org>; Fri, 26 Apr 2024 07:10:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714115419; cv=none; b=oxT1cjtpuz1rFc4rzQIhuEtxH8ySl8LxvNFOXHT3sAz6USgQpGaO6tmSBflnnV05ZcBePYjTTxW+nxm4PzQf44hyzwVYo5q5oF8oOEfQ8KfsUul+Yr6+47bbXu7z4O+Q2b8K1rjb3qCI5X5q58yNa1PLnYxkqtuhKatgHpymI3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714115419; c=relaxed/simple;
	bh=FaTAguwY/bdb9fU0VZobBcrvrv1LPyD6anehyKyUdMQ=;
	h=Subject:To:References:Cc:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=URS1BtF9rTbyJnob1Xnoz4f1bcNIb5US+JVCnKlyce/ENqVv5NLHGMoww798oH6C/62gQNCP7mquOZcCTExNO6ICxBo4d9N0cHuiFi1oApmxyhspn706AtzW0POO1S74v3SeODDYvVETj03vx15PgQEWZIUKxtUkNx8g45hsy2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J0k4n56X; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J0k4n56X"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-6ee0642f718so2187089b3a.0
        for <linux-m68k@lists.linux-m68k.org>; Fri, 26 Apr 2024 00:10:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714115417; x=1714720217; darn=lists.linux-m68k.org;
        h=in-reply-to:mime-version:user-agent:date:message-id:from:cc
         :references:to:subject:from:to:cc:subject:date:message-id:reply-to;
        bh=TMO/a9uv1i58b3APm4V6HEAuzIPBTKbjDTST3ebaWZw=;
        b=J0k4n56XEpSPxYNFrhlVByd0Ba1hO40JJTcVh8rhwYvOwYm5lhxqnddAZk68zS4k7O
         93i9wFNL6R8ikyUctycgfoSBGgRDb5tza5a+zkjQv/SuUx9L5Ymrr4uxYPBV4+KkFhy1
         bCZYEhgbMBHEomscAT0ZqCr+7v3z0dDuj0hfXIxg+KyIj+b+q/muYy7c//0jw0u1kNzC
         plKLGuH50Fo4zVlH9DbS4pCICfoz7WZTxxlY26XxiGAWOkugURu/XDhYHhIDht5rvF3z
         37fWJhj9Mc/1WotF0Nsqgrsccl4Wb537ORNEzjReVyTXWgBO4c3fxWlVciYmADl+69MU
         OBsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714115417; x=1714720217;
        h=in-reply-to:mime-version:user-agent:date:message-id:from:cc
         :references:to:subject:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TMO/a9uv1i58b3APm4V6HEAuzIPBTKbjDTST3ebaWZw=;
        b=Okh6jYVBxUI4frk3nr5eJGgekjUIqvfHPvwFkE++v4aabHB8je6R1NJnhngsskf/q3
         8yeoN6TfGUKysaOhk/SgniwTJXpTluFulFiORV/nu4sg8a9slvh2WHEzmtN+3oHZQdH2
         Eh8HupcmgkUbvTk1cgvyiTW3Ak/N14ZCEwdFo+Fjq3Xdudki0OX4orB2aEJepbuooxLo
         uFYLNWcp7lBxfNyeyMPt9ilBBRiYKNj3L3uLhPeuGnGGqwHLmvWLH/QvzBgaRJtwcqKV
         Bqf3r3de0ZeJa0yKYghNkTOrMVaZYrahJmtSTmMjJevIvR3zwpsWhw+AFliGsCFoe7CM
         ueRw==
X-Forwarded-Encrypted: i=1; AJvYcCWgV9LfHkiOVCAgcuPudiyAESef0Glk4lEIKbVxoK+fGlWIk93PO9e3J/BRJdthNWvR7AY3LqQkNnOeU8pja3Yee0xa7EuQSjqAJiIRXzR9
X-Gm-Message-State: AOJu0Yx4LLtBQRFK2Y0xVLc/5+8Iqwo8JaHFtbDBfsJBE/Nx/0nShC7R
	z1t8Jd0bwpp2fzK2EwdQk9CtDH88eK1ra/Vthfm9Zt0e3yrEMcE6bk4u/A==
X-Google-Smtp-Source: AGHT+IGoFSEZG26c9Sq15YzqIGlkpfi55/gjK1N8kwvwsANC8Eqy0ZWSWgbK6p/pHiKE8geXH6pPyw==
X-Received: by 2002:a05:6a20:2589:b0:1a7:8115:d0c6 with SMTP id k9-20020a056a20258900b001a78115d0c6mr8358220pzd.11.1714115416963;
        Fri, 26 Apr 2024 00:10:16 -0700 (PDT)
Received: from [10.1.1.24] (222-152-175-63-fibre.sparkbb.co.nz. [222.152.175.63])
        by smtp.gmail.com with ESMTPSA id g7-20020a632007000000b005e83b64021fsm13981978pgg.25.2024.04.26.00.10.13
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 26 Apr 2024 00:10:16 -0700 (PDT)
Subject: Re: [PATCH RFC v2 1/2] m68k: Handle __generic_copy_to_user faults
 more carefully
To: Finn Thain <fthain@linux-m68k.org>
References: <20240422022943.13775-1-schmitzmic@gmail.com>
 <20240422022943.13775-2-schmitzmic@gmail.com>
 <6fbf4809-dec2-84b9-3b83-86084ed19a20@linux-m68k.org>
 <57b70e03-2672-4f27-87f9-481208173a20@gmail.com>
 <b9d281db-c06e-0eb3-0f49-b95f576a9891@linux-m68k.org>
 <1b49c8a1-c753-428d-b526-06b6eb3e551c@gmail.com>
Cc: geert@linux-m68k.org, linux-m68k@lists.linux-m68k.org
From: Michael Schmitz <schmitzmic@gmail.com>
Message-ID: <fbaaf75c-c4e9-7fee-bb8d-9fd0fd25b197@gmail.com>
Date: Fri, 26 Apr 2024 19:10:10 +1200
User-Agent: Mozilla/5.0 (X11; Linux ppc; rv:45.0) Gecko/20100101
 Icedove/45.4.0
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <1b49c8a1-c753-428d-b526-06b6eb3e551c@gmail.com>
Content-Type: multipart/mixed;
 boundary="------------F58B88AF28A71598D55EF19C"

This is a multi-part message in MIME format.
--------------F58B88AF28A71598D55EF19C
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Finn,

Am 26.04.2024 um 13:22 schrieb Michael Schmitz:
> Hi Finn,
>
> yes, that would explain that.
>
> Using a start address of badpage-4 and path '/tmp' or '/temp' in order
> to use either the movesw or movesb branches of the code (and force a
> fault on the first byte in the movesw case), I see no more Oops. Still
> have to test forcing the fault on the second byte of a movesw (making it
> a misaligned access again).

Similar tests with start address five or six bytes before the start of 
the unmapped page, and corresponding path length to be returned by 
getcwd have shown no more Oops on 030 using the attached corrected 
version of my patch.

Please give that some testing if you can, and (hoping it won't show any 
new faults on 040) I'll post another version of the series with your 
Tested-by added.

Cheers,

	Michael


--------------F58B88AF28A71598D55EF19C
Content-Type: text/x-diff;
 name="0001-m68k-Handle-__generic_copy_to_user-faults-more-caref.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename*0="0001-m68k-Handle-__generic_copy_to_user-faults-more-caref.pa";
 filename*1="tch"

From d91cf6c8d282e61e57c03e9614ed64eecce54e10 Mon Sep 17 00:00:00 2001
From: Michael Schmitz <schmitzmic@gmail.com>
Date: Wed, 17 Apr 2024 08:47:55 +1200
Subject: [PATCH 1/2] m68k: Handle __generic_copy_to_user faults more carefully

As mentioned by Finn Thain in his patch to improve put_user
exception handling on 040, a similar problem exists on 030
processors.

A moves instruction that crosses a page boundary from a
mapped page into an unmapped one will cause a mid-instruction
bus error exception (frame format b), with the PC pointing
(usually) two instructions past the faulting movesl instruction.

Our exception handling in __generic_copy_to_user only covers
the instruction immediately following the faulting one. As
a result, fixup_exception in send_fault_sig does not detect
this case, and cause send_fault_sig to oops.

Extend the exception table to cover one additional instruction
beyond the moves[lwb] instructions.

Tested on 68030 (Atari Falcon 030) with transfers beginning
at one to six bytes offset from the end of a mapped page,
followed by further bytes on an unmapped page (testcase
derived from stress-ng sysbadaddr stressor by Finn Thain).

Tested on 68040 (Mac Quadra) by Finn Thain.

A similar problem exists in __clear_user(); modify the exception
table for that function in the same way (tested by Finn Thain).

Cc: Finn Thain <fthain@linux-m68k.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org
Link: https://lore.kernel.org/all/e0f23460779e6d16e2633486ac4841790ef2aca0.1713176294.git.fthain@linux-m68k.org
Signed-off-by: Michael Schmitz <schmitzmic@gmail.com>

---

Changes from RFC v2:

Finn Thain:

- add missing extension table entries and final NOP after
  faults in 040 tests

Changes from RFC v1:

Michael Schmitz:

- use extended exception table instead of additional NOPs
---
 arch/m68k/lib/uaccess.c | 55 ++++++++++++++++++++++++-----------------
 1 file changed, 32 insertions(+), 23 deletions(-)

diff --git a/arch/m68k/lib/uaccess.c b/arch/m68k/lib/uaccess.c
index 7646e461aa62..1ad4be5f90e9 100644
--- a/arch/m68k/lib/uaccess.c
+++ b/arch/m68k/lib/uaccess.c
@@ -60,35 +60,42 @@ unsigned long __generic_copy_to_user(void __user *to, const void *from,
 
 	asm volatile ("\n"
 		"	tst.l	%0\n"
-		"	jeq	4f\n"
+		"	jeq	5f\n"
 		"1:	move.l	(%1)+,%3\n"
 		"2:	"MOVES".l	%3,(%2)+\n"
 		"3:	subq.l	#1,%0\n"
-		"	jne	1b\n"
-		"4:	btst	#1,%5\n"
-		"	jeq	6f\n"
-		"	move.w	(%1)+,%3\n"
-		"5:	"MOVES".w	%3,(%2)+\n"
-		"6:	btst	#0,%5\n"
+		"4:	jne	1b\n"
+		"5:	btst	#1,%5\n"
 		"	jeq	8f\n"
-		"	move.b	(%1)+,%3\n"
-		"7:	"MOVES".b  %3,(%2)+\n"
-		"8:\n"
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
-		"	jra	8b\n"
+		"	jra	13b\n"
 		"	.previous\n"
 		"\n"
 		"	.section __ex_table,\"a\"\n"
 		"	.align	4\n"
+		"	.long	1b,20b\n"
 		"	.long	2b,20b\n"
 		"	.long	3b,20b\n"
-		"	.long	5b,50b\n"
+		"	.long	4b,20b\n"
+		"	.long	5b,20b\n"
 		"	.long	6b,50b\n"
 		"	.long	7b,50b\n"
 		"	.long	8b,50b\n"
+		"	.long	9b,50b\n"
+		"	.long	10b,50b\n"
+		"	.long	11b,50b\n"
+		"	.long	12b,50b\n"
 		"	.previous"
 		: "=d" (res), "+a" (from), "+a" (to), "=&d" (tmp)
 		: "0" (n / 4), "d" (n & 3));
@@ -107,32 +114,34 @@ unsigned long __clear_user(void __user *to, unsigned long n)
 
 	asm volatile ("\n"
 		"	tst.l	%0\n"
-		"	jeq	3f\n"
+		"	jeq	4f\n"
 		"1:	"MOVES".l	%2,(%1)+\n"
 		"2:	subq.l	#1,%0\n"
-		"	jne	1b\n"
-		"3:	btst	#1,%4\n"
-		"	jeq	5f\n"
-		"4:	"MOVES".w	%2,(%1)+\n"
-		"5:	btst	#0,%4\n"
-		"	jeq	7f\n"
-		"6:	"MOVES".b	%2,(%1)\n"
-		"7:\n"
+		"3:	jne	1b\n"
+		"4:	btst	#1,%4\n"
+		"	jeq	6f\n"
+		"5:	"MOVES".w	%2,(%1)+\n"
+		"6:	btst	#0,%4\n"
+		"7:	jeq	9f\n"
+		"8:	"MOVES".b	%2,(%1)\n"
+		"9:\n"
 		"	.section .fixup,\"ax\"\n"
 		"	.even\n"
 		"10:	lsl.l	#2,%0\n"
 		"40:	add.l	%4,%0\n"
-		"	jra	7b\n"
+		"	jra	9b\n"
 		"	.previous\n"
 		"\n"
 		"	.section __ex_table,\"a\"\n"
 		"	.align	4\n"
 		"	.long	1b,10b\n"
 		"	.long	2b,10b\n"
-		"	.long	4b,40b\n"
+		"	.long	3b,10b\n"
 		"	.long	5b,40b\n"
 		"	.long	6b,40b\n"
 		"	.long	7b,40b\n"
+		"	.long	8b,40b\n"
+		"	.long	9b,40b\n"
 		"	.previous"
 		: "=d" (res), "+a" (to)
 		: "d" (0), "0" (n / 4), "d" (n & 3));
-- 
2.17.1


--------------F58B88AF28A71598D55EF19C--
