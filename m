Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0425279F6
	for <linux-m68k@vger.kernel.org>; Mon, 29 Apr 2024 03:09:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714360194; cv=none; b=dtXrjFX1WD0KzCUPuAHnqB0CH6TrofYuiTG3G6fyjQ6Z2sE9xZo1V1PfEpyKvqQp4PHNfyusP27CEw6WL7FBGXqHI7g92V1WYkV8TNvlfrXt1mVnrQDn0U3xG9QAngAxn4eUN25JGIwqeKjUbcbcqeWTaCcYeGfm5dvNMFMVauk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714360194; c=relaxed/simple;
	bh=Dp7dD+HzzprwxtZg58HcXgzYaS/Bwas1rFGtI98+gLQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=nCPV91MfTU4WyYU3yLXMo15d55HRSwdU0lL1c5V5pWLg0QI6eGpcv89ua7zfZQ9NQarqQ0YximVLeFGK4+uwT+SGhVGMZslEZPDTJewblMNDJosEaqJHtphw6BNd18pCke1ylPnVXto10um368UEJLCSIO0UZKGxPGp0ve4dLxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lNXtWLu9; arc=none smtp.client-ip=209.85.167.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lNXtWLu9"
Received: by mail-oi1-f169.google.com with SMTP id 5614622812f47-3c61486d3fcso2428063b6e.2
        for <linux-m68k@vger.kernel.org>; Sun, 28 Apr 2024 20:09:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714360192; x=1714964992; darn=vger.kernel.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0+VePpMBGZ6Mkxdb4IIrySRSK9uZWkD86DlI8rAYleU=;
        b=lNXtWLu9McqCikgJRdpGBZ6T5WYphY1SJOBdkeAdjeFmnfH4/7VYaC1fASARb22LM9
         dCD/ePErxYz1PE9r26JxYde05OMIBQKgjNW7dKUHt3A2EMOjWMb03j14QYrEe1zFiS7a
         N8EhFnAJqRni+5Cnt1ygc8g2d6IBL1dH6C+nbx7gtZYgNVumtdCC9iD5tv7S2b5EPC4x
         /6uimqFBiG8Is8vK+91fDSyiePW0zUaGCelPea2Z2L9vkOy+QQf7wFAxFt9eiW02iWIz
         kHTXWPbdUS4i92u9hgw+M5ancjMyhCEB3GMiISRD1sz/eU6MG5Ut6YAB8xvjEfhmfbr1
         5sLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714360192; x=1714964992;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0+VePpMBGZ6Mkxdb4IIrySRSK9uZWkD86DlI8rAYleU=;
        b=XeE0qccrEWoAWYnLnRloWvjelZrvfjJ76yxh3muAxZMO3BnNt7QZkq22paQIQGAMV0
         /khi/nrSwe0ppeF1ZNGMgyUq1UfJ9Xr7WQAknvW+UquPUUPMmqisXK9zLFktqcn+XJUW
         8shX/e+UUvSzouu54/UmXA7EObw1Vdw06+QWbx0V8vlPLm5bdHz+8/7WDPt8FfcQhbfH
         BAtn+UeIEEP3PlSyMw5No/rFIHv0BOaNOCJczFrr6fzXvijoDRCa1iMYrKFvJEnmYbFy
         UoJt3nTxGD76xRJaozI0IBeD+ZcsbHrDr95DFBZySMehlaYEZrllieA2yJuxXE3rS15C
         NMYQ==
X-Gm-Message-State: AOJu0YxOjJkvjfp+9PWyUUbsGp991qWTqNOVD6SWheRjfd+lAOdCMbDv
	XOceXvAy7pPUPAGWqg5c24PhezpVYQPWlnLjerXBsXICh387BqZZGizEPw==
X-Google-Smtp-Source: AGHT+IHHWpFa088/KLKxPl1f0YirAvIZnvggQSZd7uuN8f615Z1V9E8e5m4NERQivZpMVrcABVvZSw==
X-Received: by 2002:a05:6808:bcf:b0:3c7:5146:c4e5 with SMTP id o15-20020a0568080bcf00b003c75146c4e5mr11907080oik.41.1714360192045;
        Sun, 28 Apr 2024 20:09:52 -0700 (PDT)
Received: from xplor.waratah.dyndns.org (222-152-175-63-fibre.sparkbb.co.nz. [222.152.175.63])
        by smtp.gmail.com with ESMTPSA id y3-20020aa78543000000b006ed53b2652fsm18274867pfn.101.2024.04.28.20.09.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Apr 2024 20:09:51 -0700 (PDT)
Received: by xplor.waratah.dyndns.org (Postfix, from userid 1000)
	id 3EB3C360328; Mon, 29 Apr 2024 15:09:48 +1200 (NZST)
From: Michael Schmitz <schmitzmic@gmail.com>
To: linux-m68k@vger.kernel.org,
	geert@linux-m68k.org
Cc: gerg@linux-m68k.org,
	Michael Schmitz <schmitzmic@gmail.com>,
	Finn Thain <fthain@linux-m68k.org>,
	linux-m68k@lists.linux-m68k.org
Subject: [PATCH v4 1/2] m68k: Handle __generic_copy_to_user faults more carefully
Date: Mon, 29 Apr 2024 15:09:44 +1200
Message-Id: <20240429030945.22451-2-schmitzmic@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240429030945.22451-1-schmitzmic@gmail.com>
References: <20240429030945.22451-1-schmitzmic@gmail.com>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>

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

Tested on 68040 (Mac Quadra) and 68030 (Mac IIci) by Finn Thain.

A similar problem is present in __clear_user(); modify the
exception table for that function in the same way (tested by
Finn Thain).

Cc: Finn Thain <fthain@linux-m68k.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org
Tested-by: Finn Thain <fthain@linux-m68k.org>
Link: https://lore.kernel.org/all/e0f23460779e6d16e2633486ac4841790ef2aca0.1713176294.git.fthain@linux-m68k.org
Signed-off-by: Michael Schmitz <schmitzmic@gmail.com>

---

Changes from v3:

Finn Thain:

- correct exception table entry for movew instruction in
  __generic_copy_to_user

- add final NOP in __clear_user

Changes from RFC v2:

Finn Thain:

- add missing extension table entries and final NOP in
  __generic_copy_to_user faults in 040 tests

Michael Schmitz:

- add yet another exception table entry in __clear_user

Changes from RFC v1:

Michael Schmitz:

- use extended exception table instead of additional NOPs
---
 arch/m68k/lib/uaccess.c | 65 ++++++++++++++++++++++++-----------------
 1 file changed, 38 insertions(+), 27 deletions(-)

diff --git a/arch/m68k/lib/uaccess.c b/arch/m68k/lib/uaccess.c
index 86b6fed5151c..c63efa6ea4d4 100644
--- a/arch/m68k/lib/uaccess.c
+++ b/arch/m68k/lib/uaccess.c
@@ -62,35 +62,42 @@ unsigned long __generic_copy_to_user(void __user *to, const void *from,
 
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
+		"11:	"MOVES".b	%3,(%2)+\n"
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
-		"	.long	6b,50b\n"
+		"	.long	4b,20b\n"
+		"	.long	5b,20b\n"
+		"	.long	6b,20b\n"
 		"	.long	7b,50b\n"
 		"	.long	8b,50b\n"
+		"	.long	9b,50b\n"
+		"	.long	10b,50b\n"
+		"	.long	11b,50b\n"
+		"	.long	12b,50b\n"
 		"	.previous"
 		: "=d" (res), "+a" (from), "+a" (to), "=&d" (tmp)
 		: "0" (n / 4), "d" (n & 3));
@@ -109,32 +116,36 @@ unsigned long __clear_user(void __user *to, unsigned long n)
 
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
+		"9:	nop\n"
+		"10:\n"
 		"	.section .fixup,\"ax\"\n"
 		"	.even\n"
-		"10:	lsl.l	#2,%0\n"
+		"20:	lsl.l	#2,%0\n"
 		"40:	add.l	%4,%0\n"
-		"	jra	7b\n"
+		"	jra	10b\n"
 		"	.previous\n"
 		"\n"
 		"	.section __ex_table,\"a\"\n"
 		"	.align	4\n"
-		"	.long	1b,10b\n"
-		"	.long	2b,10b\n"
-		"	.long	4b,40b\n"
+		"	.long	1b,20b\n"
+		"	.long	2b,20b\n"
+		"	.long	3b,20b\n"
+		"	.long	4b,20b\n"
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

