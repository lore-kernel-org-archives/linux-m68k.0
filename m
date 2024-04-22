Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B79AF468E
	for <linux-m68k@lists.linux-m68k.org>; Mon, 22 Apr 2024 02:29:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713752992; cv=none; b=T+tJNDKSdUiqwrN4hycrA76eQ/oNHKkP66dXphqRX0CjLVO2glWP0pVF84oNiGq8lHAZVbirp8MMlUWv5AiWmsxE1t+mB9iVrLVykdv4AzbL3ETW0PMLY/7Iy4FfkxBhM3WQNhsC9hCb1l46KWDrYXYO32b3bQTYbDJfI4dLkl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713752992; c=relaxed/simple;
	bh=CwHkLAxEhqDJ0iuU0tPEauHEKcLb8+/G9QssCEXnUpM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=tr4UYGSYcZiHWFxxKp0/3Fwl9wdocK0JxojMASf3U2gbXyCgqf2N/gt0cVOTOGq0p6kof03PQSAndag1MOABKyokszEYzJzJLRGA+EpLssC4c1MIS75ufq1ard5Nke0SPVb8f1pBZD01h1ESwSwE8NGN/4bi8DvkRXBW6qsuVTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CsPcIYDL; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CsPcIYDL"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-2a2d248a2e1so3365649a91.0
        for <linux-m68k@lists.linux-m68k.org>; Sun, 21 Apr 2024 19:29:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713752990; x=1714357790; darn=lists.linux-m68k.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TSWCmAFYwuIFeVc943HSfPoMrsU/PEUSPiyfHNpeXrg=;
        b=CsPcIYDL7xYpMEd2ZdyPp7gNwzh897EqXooUJzFedrsIzO45T47XCkqiE3V4OHZ2yd
         QgAFdwE5mrzdHmt+YUTybJkX+Dvis8/UcMjMNFjdVwotg8OKYQlcXNlnTkZBGUZ7ewMk
         gDm19iQKmNRqNXyW927n2OZNK9bCJwJnbyTu0AVTej9BENIAFDlb/FVanSC/nvucwskq
         xDjYIhPmelLCEu7qB1r4kr11C0+ctu4MSEDSGzC6s+AArSFZmYEAh0FZgZbpfMnTQ4sH
         zxnxYyIyTNUcvwxCkWKoLxfa6epZgZFZdYYy2bFvl6sO3QncSYP+wDUdGYoKOIqh547j
         CMyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713752990; x=1714357790;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TSWCmAFYwuIFeVc943HSfPoMrsU/PEUSPiyfHNpeXrg=;
        b=LPAThO5rBok3xYhguKXrtf/jcOjS2At53mMt7jhqKRcUhEYj/xZlk8bprgwOlngfWT
         YHyG/NKfjtM5gEito+5eLLlMqog0dM2M0PATG+bG32vy0iGLWkBzmTL9oSvC4rmZv8A0
         1Dj4z63RgIhF6V3nUX8C2Hz2dNvSw618IXpFc4Kf1qTdCP5elplxtQ/+TwBn+pVKWPYI
         HscGzKKElVistOBMRPvJ2mDATHMBwRyMPmnPF8wgIZ9RUnXgop11wKMnIA+SKO0c0lmZ
         5UJ0Iw51e1JdtcDPEbvKNIR5yyEvyHhq5w/cgfRiXSlHaiJvLHvhC2YvLenk4Md+PLY8
         ivSg==
X-Forwarded-Encrypted: i=1; AJvYcCV0Fn4Y5/rpJMomz91/nWPUeK27as4i21Q74OG+74pc5di9Lg8U+cIs2Lq6Y5iq1pY0WL/dW01KSdyO5mL+43uIGiVukufl7XnDkdxb77EE
X-Gm-Message-State: AOJu0YxsnBUxKorb7xb+f782tmWRlLD2iGGMzvqv5fNvisgeRwadN0Zl
	WnaUMWpdPcwBybpi7xufaqbrNHsM9jNf4KwYeDZeQgM1eN4qhEes
X-Google-Smtp-Source: AGHT+IHmbIZd2qPWmhdskVtraBRRGuZFijX0A80ZIk0qxtmbYWPkZ6ZZbIGEx0g15AamblAQQZBFPg==
X-Received: by 2002:a17:90a:53a1:b0:2a2:da08:67db with SMTP id y30-20020a17090a53a100b002a2da0867dbmr16911365pjh.6.1713752989833;
        Sun, 21 Apr 2024 19:29:49 -0700 (PDT)
Received: from xplor.waratah.dyndns.org (222-152-175-63-fibre.sparkbb.co.nz. [222.152.175.63])
        by smtp.gmail.com with ESMTPSA id dt3-20020a17090afa4300b002a51a01f447sm8226113pjb.49.2024.04.21.19.29.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Apr 2024 19:29:49 -0700 (PDT)
Received: by xplor.waratah.dyndns.org (Postfix, from userid 1000)
	id 65EA0360332; Mon, 22 Apr 2024 14:29:45 +1200 (NZST)
From: Michael Schmitz <schmitzmic@gmail.com>
To: linux-m68k@vger.kernel.org,
	geert@linux-m68k.org
Cc: schmitzmic@gmail.com,
	Finn Thain <fthain@linux-m68k.org>,
	linux-m68k@lists.linux-m68k.org
Subject: [PATCH RFC v2 1/2] m68k: Handle __generic_copy_to_user faults more carefully
Date: Mon, 22 Apr 2024 14:29:42 +1200
Message-Id: <20240422022943.13775-2-schmitzmic@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240422022943.13775-1-schmitzmic@gmail.com>
References: <20240422022943.13775-1-schmitzmic@gmail.com>
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

Tested on 68030 (Atari Falcon 030) with a transfer beginning
at a single byte at the end of a mapped page followed by
further bytes on an unmapped page (testcase derived from
stress-ng sysbadaddr stressor by Finn Thain).

A similar problem exists in __clear_user(); modify the exception
table for that function in the same way (untested)

Cc: Finn Thain <fthain@linux-m68k.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org
Link: https://lore.kernel.org/all/e0f23460779e6d16e2633486ac4841790ef2aca0.1713176294.git.fthain@linux-m68k.org
Signed-off-by: Michael Schmitz <schmitzmic@gmail.com>

---

Changes from RFC v1:

Michael Schmitz:

- use extended exception table instead of additional NOPs
---
 arch/m68k/lib/uaccess.c | 48 ++++++++++++++++++++++-------------------
 1 file changed, 26 insertions(+), 22 deletions(-)

diff --git a/arch/m68k/lib/uaccess.c b/arch/m68k/lib/uaccess.c
index 7646e461aa62..ef761fc10981 100644
--- a/arch/m68k/lib/uaccess.c
+++ b/arch/m68k/lib/uaccess.c
@@ -60,35 +60,37 @@ unsigned long __generic_copy_to_user(void __user *to, const void *from,
 
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
+		"4:	jne	1b\n"
+		"5:	btst	#1,%5\n"
+		"	jeq	7f\n"
 		"	move.w	(%1)+,%3\n"
-		"5:	"MOVES".w	%3,(%2)+\n"
-		"6:	btst	#0,%5\n"
-		"	jeq	8f\n"
+		"6:	"MOVES".w	%3,(%2)+\n"
+		"7:	btst	#0,%5\n"
+		"8:	jeq	10f\n"
 		"	move.b	(%1)+,%3\n"
-		"7:	"MOVES".b  %3,(%2)+\n"
-		"8:\n"
+		"9:	"MOVES".b  %3,(%2)+\n"
+		"10:\n"
 		"	.section .fixup,\"ax\"\n"
 		"	.even\n"
 		"20:	lsl.l	#2,%0\n"
 		"50:	add.l	%5,%0\n"
-		"	jra	8b\n"
+		"	jra	10b\n"
 		"	.previous\n"
 		"\n"
 		"	.section __ex_table,\"a\"\n"
 		"	.align	4\n"
 		"	.long	2b,20b\n"
 		"	.long	3b,20b\n"
-		"	.long	5b,50b\n"
+		"	.long	4b,20b\n"
 		"	.long	6b,50b\n"
 		"	.long	7b,50b\n"
 		"	.long	8b,50b\n"
+		"	.long	9b,50b\n"
+		"	.long	10b,50b\n"
 		"	.previous"
 		: "=d" (res), "+a" (from), "+a" (to), "=&d" (tmp)
 		: "0" (n / 4), "d" (n & 3));
@@ -107,32 +109,34 @@ unsigned long __clear_user(void __user *to, unsigned long n)
 
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

