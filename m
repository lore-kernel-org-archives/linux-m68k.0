Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0A893D387
	for <linux-m68k@vger.kernel.org>; Sat, 27 Apr 2024 08:48:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714207705; cv=none; b=hNnL322YJ2euZY07JAWUdaWSVvdPUHC4PjqwrVHLe2QikMoNy/hgwN5+6lFniWlNFBB7lSuzHoS7pUuPUOmUnv5GPWtynv44YpI5M9hzObhX9txq1w3KbtZkdeKGuQCq5MpFvJQ0iVjUw9skRD71Kj+ShKuyPtQST34CwMjw174=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714207705; c=relaxed/simple;
	bh=/f02ivN2TzzxQTvb43wIT/w+kiou1C+DK6FbUfHFhD8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=eNmFBUW+xMrgzWUBhN29i2VhUw0lHWvbK5dLUsWOdZQ+1EbT2XMBPeRwj4+ZwjxlFhpknl+LxUgS+H5hjA7N+SRE7OXTQCGziwdnrZC1ItJHZgDyNR1fihWRMsNSLl2LNl7tmc6tLOJfaea/aD1F0ByMg6oYMK/BVmgGdIMr7PE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X8/2oldF; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X8/2oldF"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-5bdbe2de25fso2165044a12.3
        for <linux-m68k@vger.kernel.org>; Sat, 27 Apr 2024 01:48:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714207703; x=1714812503; darn=vger.kernel.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xOuqPq7xbMZXEJS+4NCqplDI3KYicJPpNtCiMyKqMFM=;
        b=X8/2oldFtDO5cV8SZ0SqurMptCs5k9X0V3hepwwFIsZ+hT6KP86JvIPJwfo8xW6lPA
         U+BHedLce4f4KvFq6HLZfmTsPPsek/k8eEJGGAsCnl9+H8PDJIypbXC7tn+Q2fn6kEsx
         5NiQWNbtWe1aehvCquld/l2yZ5TSANW2XYsvpvBnJFv5TcGiNDiD5gp+aci02Y5b5Y+9
         Y/TUX9khC4RzwSuG8mC0T6e1hQ8d7ueE8GKVwuv8r1QFtPTmEnXVusKfr4WmtXYupGzM
         htDEJ6Dh8EaY7TKBFmiapOGnqNlvbCybBliNh6D0B/7PDbuShPNxvanKw1lEJstxAKYu
         WgSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714207703; x=1714812503;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xOuqPq7xbMZXEJS+4NCqplDI3KYicJPpNtCiMyKqMFM=;
        b=iN2sA+DB9wByhYetkmDnsgIAIxHhT3Yzt18ajC5CnMMHn3RK8IB+m68mzfBH4+9u3E
         NH1GOTGJP1q9BYxFocEkXdYwG8tcnJWF2G1IusAnIYl0ZBWCKDyklldtTOYBaJgifLoS
         j6Q13TB8T12h4ijMgFMNvDaB5xq/DRn/2AqsnO9FjOOdWfmC+9wqkj7mumxD5MglaNid
         bR+H3BWPfjAh7b7z01z6Al4FAvMiDqoPGpila4Vo5dcUZJDqXqskaFDsvUqZxbb9fXhb
         W+V35oB4jrqN78WdWPjHZTbFs4P6SjGFJs0HHMER018ljLbvtpu0kwNGp4bbbmT/Wf8v
         5rkA==
X-Gm-Message-State: AOJu0YyUb7N0vutIujWVrPAUTNj4n1mzKo4BF10sHiBeaT1x55Cg1OaS
	mUuFJWJaj64DANe9uWL0IzoyIYfP7t8VKGRQtZmD9LVY57p3I9XxaEG58A==
X-Google-Smtp-Source: AGHT+IH+4V9Xpjr+RxBFRVuQ9H5S0wQd4dZLABzX7g1VJrl7QIfRH7efh6WqmHJ0yRF1vAkwwBvgUw==
X-Received: by 2002:a05:6a20:3d8d:b0:1a7:3b4a:3e8 with SMTP id s13-20020a056a203d8d00b001a73b4a03e8mr6347940pzi.7.1714207703008;
        Sat, 27 Apr 2024 01:48:23 -0700 (PDT)
Received: from xplor.waratah.dyndns.org (222-152-175-63-fibre.sparkbb.co.nz. [222.152.175.63])
        by smtp.gmail.com with ESMTPSA id j18-20020a170902c3d200b001eab1a1a752sm4359115plj.120.2024.04.27.01.48.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Apr 2024 01:48:22 -0700 (PDT)
Received: by xplor.waratah.dyndns.org (Postfix, from userid 1000)
	id 2809A360328; Sat, 27 Apr 2024 20:48:19 +1200 (NZST)
From: Michael Schmitz <schmitzmic@gmail.com>
To: linux-m68k@vger.kernel.org,
	geert@linux-m68k.org
Cc: gerg@linux-m68k.org,
	Michael Schmitz <schmitzmic@gmail.com>,
	Finn Thain <fthain@linux-m68k.org>,
	linux-m68k@lists.linux-m68k.org
Subject: [PATCH v3 1/2] m68k: Handle __generic_copy_to_user faults more carefully
Date: Sat, 27 Apr 2024 20:48:14 +1200
Message-Id: <20240427084815.1449-2-schmitzmic@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240427084815.1449-1-schmitzmic@gmail.com>
References: <20240427084815.1449-1-schmitzmic@gmail.com>
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
 arch/m68k/lib/uaccess.c | 56 ++++++++++++++++++++++++-----------------
 1 file changed, 33 insertions(+), 23 deletions(-)

diff --git a/arch/m68k/lib/uaccess.c b/arch/m68k/lib/uaccess.c
index 86b6fed5151c..e3ed893047f8 100644
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
@@ -109,32 +116,35 @@ unsigned long __clear_user(void __user *to, unsigned long n)
 
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
+		"	.long	4b,10b\n"
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

