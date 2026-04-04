Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE18014EC73
	for <linux-m68k@lists.linux-m68k.org>; Sat,  4 Apr 2026 02:31:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775269904; cv=none; b=EllRQAZ81f3P2T63YXvAkvhRhb45cXc4/xUMwFqUH+7KeHH7NHy8XwykR0xpE5bCGAlfH5CAPO23DUL0YRtG/exRCIc1jNAOdUgWXRi+FSY/4ECHYr0Ddf3d/kyoUEbthlqAi79ILy5FZ0ZKZuXH9DXzmuOgajdaccfqLTKCusA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775269904; c=relaxed/simple;
	bh=uEdG4RE9oAAy1I1CrVj9QNxkodCET/GAH86iVq0Up78=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=b2LMC2ojLzioGKoCImbUGmMMY8i70f9puc9OVGOUSwKx5P1rPawz0ae2DQT9DQU2h/2UYo02n4nNVdENaVOC2AjbujRPjBKuBIoaGRCZv8qX7YZgQo5IAjp/F+RwjSgrowsoBfJHw6gxezXBQLrf93W1Qf46JXZU/d/hHn6g+6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com; spf=pass smtp.mailfrom=0x0f.com; dkim=pass (1024-bit key) header.d=0x0f.com header.i=@0x0f.com header.b=aLAOGZJe; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0x0f.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=0x0f.com header.i=@0x0f.com header.b="aLAOGZJe"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-35dac556bb2so1531332a91.1
        for <linux-m68k@lists.linux-m68k.org>; Fri, 03 Apr 2026 19:31:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google; t=1775269902; x=1775874702; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=h5NziYcKOVo7Uumfi9SQ/ACvnOT/ieelouTjz/KaE3M=;
        b=aLAOGZJecTwTsPrxmYFwVjiYmvH1JBL1+GY47PfJbaUmIYk5X1SFAA0ADvJFD3f5Rd
         eHltfuzD0Q21RIBkiJKjZQLl7tFEzYS+HvBgGHUn9e7Eiy/MwFmpQWlwFZeZpGmhYsEX
         Pzx9qHgN/PLadpXpgzytluLouy9VupqY8p8bM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775269902; x=1775874702;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h5NziYcKOVo7Uumfi9SQ/ACvnOT/ieelouTjz/KaE3M=;
        b=D8xI82BS5PZ+RTuieTvxgYutQLrt4aCUwLanaQAM7x8uqWRGdVTv6KSNgj90UZataW
         l7KrEZRqFQ+WLOtpATRY6gpckPDulYeIlZ+oBXR1w24sTPF5PwYG7Qaf66fjDvduQ3By
         Zkz0JZCyGzoMYAPLlDONP68QohQ8vVpAG2Ym7gJXBE9SYkuPGlLxV4/HkHUEQ6rYa7tL
         qKTVm7LTYjFg/WuSNJss9q9HUE980qV2YDotwwjqcVV11Fe1gEUqqA7bg6hseKgMM+/m
         zIxLdAhyUXKeg56IbEtFUJf2Q1jSBnw2Kfl7oZZOT1OEmbRyOCuegVh5nZfsPaqum/tu
         uFvA==
X-Forwarded-Encrypted: i=1; AJvYcCVHnxDRC3Kei9bcV7vI6QeAI4wWw005DUm9wBQN4dM8HCN9bUAHnsCxSg8VREbMUhEkQSkG+/oprQyu@lists.linux-m68k.org
X-Gm-Message-State: AOJu0Yw8IGIa4BhHYZP8+q5g3DAGAz+kKdQLVDdmZZ8iHGaDOEA2qOce
	8AGYa0syEk2p3CgXlqHNCPN/Es/3A+lW06rrnmA6AoweimgxH2LDs+731061ckg9vHc=
X-Gm-Gg: AeBDievEiMb6tPd/wD+Hwe0ei9Gn/Z4R7RzuFpEtIErQYGemjdLIHWDhCsn3sDqd/W1
	aLRGgNJDkDXd6T4A4oDvJZPDOd7AMo/HlK4RqFceo3gPpNO5ToS0ZZg6MN0JaysA6uy36dfCXcq
	3/cHfWw4Qps6wj5w3odT8n0va8JDmGPrK5jlK470DWZ/n4xtw45XrApixJ3/fENAalSI62Y9pRV
	hVV611FsBwBjgjrG04fwQp9H9U+ladc1dTBfVs8/XFSLYQMXf7Qiy52D1/MnL3PMnTb8moc3/Io
	Mxsr0iUsOHaxSvl+olfSl1LBEjE5fpVxtyChV/nFhNC9St6H80+EoHe8K1BQLXQwQqAUMI/d7sW
	hMiSJcXDbI/f6io9yQc5at/HR8D8YSIw7lf7CwSfmW6LuMSEykgyK6DFVY9fkqBeoTkT6WUPrmX
	x3Vw22pboaBtYlcX+AApWNoMgbrQX9ZJ/Xo8UbQNW+veIgjuz3mhek3q4vUZ/E
X-Received: by 2002:a17:90b:48c6:b0:35b:9ab6:1d4a with SMTP id 98e67ed59e1d1-35de697359emr4372534a91.18.1775269902154;
        Fri, 03 Apr 2026 19:31:42 -0700 (PDT)
Received: from shiro (p1866070-ipxg00f01sizuokaden.shizuoka.ocn.ne.jp. [180.1.30.70])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-35dbe937925sm16440543a91.12.2026.04.03.19.31.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 19:31:41 -0700 (PDT)
From: Daniel Palmer <daniel@0x0f.com>
To: gerg@linux-m68k.org,
	christoph.plattner@gmx.at
Cc: geert@linux-m68k.org,
	linux-m68k@lists.linux-m68k.org,
	linux-kernel@vger.kernel.org,
	sashal@kernel.org,
	Daniel Palmer <daniel@0x0f.com>
Subject: [PATCH v2] m68k: Fix task info flags handling for 68000
Date: Sat,  4 Apr 2026 11:31:08 +0900
Message-ID: <20260404023108.2495351-1-daniel@0x0f.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The logic for deciding what to do after a syscall should be checking
if any of the lower byte bits are set and then checking if the reschedule
bit is set.

Currently we are loading the top word, checking if any bits are set
(which never seems to be true) and thus jumping over loading the
whole long and checking if the reschedule bit is set.

We get the thread info in two places so split that logic out in
a macro and then fix the code so that it loads the byte of the flags
we need to check, checks if anything is set and then checks if
the reschedule bit in particular is set.

Reported-by: Christoph Plattner <christoph.plattner@gmx.at>
Signed-off-by: Daniel Palmer <daniel@0x0f.com>
---
v2: Only load the lower byte of the flags as that's all we need.
    This change was suggested by Greg and I tested it still works.

 arch/m68k/68000/entry.S | 21 +++++++++++++--------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/arch/m68k/68000/entry.S b/arch/m68k/68000/entry.S
index 72e95663b62f..c257cc415c47 100644
--- a/arch/m68k/68000/entry.S
+++ b/arch/m68k/68000/entry.S
@@ -18,6 +18,13 @@
 
 .text
 
+/* get thread_info pointer into a2 */
+ .macro getthreadinfo
+	movel	%sp,%d1
+	andl	#-THREAD_SIZE,%d1
+	movel	%d1,%a2
+ .endm
+
 .globl system_call
 .globl resume
 .globl ret_from_exception
@@ -70,9 +77,8 @@ ENTRY(system_call)
 
 	movel	%sp@(PT_OFF_ORIG_D0),%d0
 
-	movel	%sp,%d1			/* get thread_info pointer */
-	andl	#-THREAD_SIZE,%d1
-	movel	%d1,%a2
+	/* Doing a trace ? */
+	getthreadinfo
 	btst	#(TIF_SYSCALL_TRACE%8),%a2@(TINFO_FLAGS+(31-TIF_SYSCALL_TRACE)/8)
 	jne	do_trace
 	cmpl	#NR_syscalls,%d0
@@ -96,16 +102,15 @@ Luser_return:
 	/* heavy interrupt load*/
 	andw	#ALLOWINT,%sr
 
-	movel	%sp,%d1			/* get thread_info pointer */
-	andl	#-THREAD_SIZE,%d1
-	movel	%d1,%a2
+	getthreadinfo
 1:
-	move	%a2@(TINFO_FLAGS),%d1	/* thread_info->flags */
+	/* check if any of the flags are set */
+	moveb	%a2@(TINFO_FLAGS + 3),%d1	/* thread_info->flags (low 8 bits) */
 	jne	Lwork_to_do
 	RESTORE_ALL
 
 Lwork_to_do:
-	movel	%a2@(TINFO_FLAGS),%d1	/* thread_info->flags */
+	/* check if reschedule needs to be called */
 	btst	#TIF_NEED_RESCHED,%d1
 	jne	reschedule
 
-- 
2.51.0


