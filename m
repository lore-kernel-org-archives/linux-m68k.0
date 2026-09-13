Received: from mail-yx2-f12.google.com (mail-yx2-f12.google.com [74.125.224.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81BA32E1EFC
	for <linux-m68k@lists.linux-m68k.org>; Sun, 13 Sep 2026 13:18:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789305494; cv=none; b=WjjsFogKyRvZTo5s6GdzOyPHtJw96d5DR+6Pc39YXKpMZRECVtc2JHHp3O+jVFKKqX1oNcdf5ygQNTxX+v3dpZrf7FgH8pZ8XeBVKTBcvXjOpCj8VdhpK7TgRoZZaKSaUm7HWmneDZfYgG6a9A7y3rnxJsV0/LPj6h/ITf4FVt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789305494; c=relaxed/simple;
	bh=4PBfJSsN7kfeIgqBGeuu+hMW/kpXMUAKD5X6y3N1qrk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WygSsQJ6l9lU89l0MG1OYjtyLmZePXNqPKDRrB5KWC+X5YTu2p4xkQ+Ngi098GSMs8JvzVmBO1S7n4NhmSSZ/AkkAZr4eZYshYW0o08B8Vl5SeleLcqYaHcEzfieYXM4iCdqd3lZnQMzkpj/DImmAtRATW3KadHNTWY7kHrSEH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=northecho.dev; spf=none smtp.mailfrom=northecho.dev; dkim=pass (2048-bit key) header.d=northecho-dev.20251104.gappssmtp.com header.i=@northecho-dev.20251104.gappssmtp.com header.b=i72D81uR; arc=none smtp.client-ip=74.125.224.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=northecho.dev
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=northecho.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=northecho-dev.20251104.gappssmtp.com header.i=@northecho-dev.20251104.gappssmtp.com header.b="i72D81uR"
Received: by mail-yx2-f12.google.com with SMTP id 956f58d0204a3-66d20c35ffcso121360d50.3
        for <linux-m68k@lists.linux-m68k.org>; Sun, 13 Sep 2026 06:18:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=northecho-dev.20251104.gappssmtp.com; s=20251104; t=1789305491; x=1789910291; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LSb+qxGlYbynh0pp1CPDDM0oB9qczgGLF2ehmN4RM+4=;
        b=i72D81uRoNwg44FWYiWiSXQnLB1kq1UgU1dE7HRLcCm+DDtvkqSrfIMmRSU9AiM1f6
         GcoYbQ4LfqXtuzNL/w+mLN++MdflKF0Myj56pltrcWyiRSEYAVqZIbSWcZw9OMUt/ZQw
         ACJxEFoYH07lOmEJeBbemVDBpSEXRYubO4UCDGfKSDHpPAsULzqSAHNkuoEa6lJ6LB1M
         B4A59Df2VSo52bl36lKvOnLWiGDv7Fgv28TvQs+DVq6hU8xWgTMmbK1fRwj0Kkrjw74L
         8NlbrZOc9ekzH49VBsXwByMCoeEAvcziw+ojJPRj/4P8jh8c3kJKM/z0IVpOnO1jVWLd
         UTlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789305491; x=1789910291;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LSb+qxGlYbynh0pp1CPDDM0oB9qczgGLF2ehmN4RM+4=;
        b=J58VEHbc1AvV8ylJi8+VzxSslpgYWI8cB4+rgmIM037d7jrS5xpson4sU4YV7wM0tc
         wBJNd11U/1TT4Mv4JSpHjG7IGuGnWzIqPcz60JBA+wTdNYdyAZNvkoQzUzhvpgVuTXy2
         2J7H6F6crgpxWWfQQQBe6vbIO363dWkI9MKBmbp00lx0fGIT4nsUZWus+pwMlEfK+sgc
         eRLU3ws02C3olptpkmRdI/N9r1bIxF+c0TYeVzDf3/c/pJnmV6Kr7DlNZHXr6E3BQMO5
         YAUnmXlNcETeT27uUILy8XxGgUBK3tFatdqNKUk+SA1sl2vR5S4DI1uI521908VActIX
         wLOw==
X-Forwarded-Encrypted: i=1; AKwUvByBrl+wmuf6zo7VQTPZE/W5EG+FsRbzQVShoqTuzeV+rmx+45tX4NnYo04FWfapjgQrtFFD9fAXTcp2@lists.linux-m68k.org
X-Gm-Message-State: AFuF++nD4vkMyZ8LLf84619xnw11s6q+8wonNqNRoJ9+V/fjm62zJ3N2
	3331pxzys42F17HZX0hFgV5OyS8a+pJ2jcJinx6bbulEqoiR3YEcTlNo++YqE9xjbYaP
X-Gm-Gg: AYBFou0bLzp5TGC8PcJUaWrmdIfLn+AUBKIcjFQmeVCEuG78D0E/iojBirMg/qljYEE
	srQe/sWQ31X0gGXyG/OrqddoGhY0MniO+Dtux+oqrlccpC9LE9hB2yVCMzvzBBnDXIlp7ngM5au
	LLcQcbTv6fLtB7/YWRiQbE6lH63B7VuImFtU2ik9hWxdpF5MFmJ9w57yfGu2Belz5I7Dr3jVzGd
	9pA21B9dKy8Q0/9DYcQxJXhz8m144Q1hLtXSlaf4B5MospCFUudzqLT2VpT62ToR0Qc7aiWvlZX
	EqVrnn8W9Cg+eFWFGR5dn3GoI0/9BgAwi84Kuj3s6NpOlZXBAMkrN6OCyOowO7JyQzkPtd5ShEk
	hCD+AlbvBqD1XlnFtJekvWU3Ky1rr8373LOlRZW0dA7Td4FH6doX3w8gbCLiSqENOB3nRDPgNEP
	qHCQgIdBpuvJEfm9wGzoWpljb4td95M/q5/MCLBFK/T0BmqOZEwD+wkb0uyZ85GS/+5BWP83DKM
	CJP6DSB0pEgM/cPOhh8x9wtk8KGhs4H4QhsRQYg
X-Received: by 2002:a05:690c:b06:b0:862:1f26:d489 with SMTP id 00721157ae682-884b1a2f84bmr50752127b3.3.1789305491416;
        Sun, 13 Sep 2026 06:18:11 -0700 (PDT)
Received: from kelso (99-10-92-174.lightspeed.rlghnc.sbcglobal.net. [99.10.92.174])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-88488c3ab26sm27731697b3.40.2026.09.13.06.18.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 06:18:10 -0700 (PDT)
From: Christopher Lusk <clusk@northecho.dev>
To: Greg Ungerer <gerg@linux-m68k.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Kees Cook <kees@kernel.org>,
	Andy Lutomirski <luto@kernel.org>,
	Will Drewry <wad@chromium.org>,
	Michael Schmitz <schmitzmic@gmail.com>,
	Andreas Schwab <schwab@linux-m68k.org>,
	linux-m68k@lists.linux-m68k.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v2] m68k: Fix seccomp filtering on ColdFire and 68000
Date: Sun, 13 Sep 2026 09:17:53 -0400
Message-ID: <20260913131753.605893-1-clusk@northecho.dev>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260912230651.461269-1-clusk@northecho.dev>
References: <20260912230651.461269-1-clusk@northecho.dev>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

m68k selects HAVE_ARCH_SECCOMP_FILTER for all configurations, but the
ColdFire and 68000 syscall entry paths only branch to
syscall_trace_enter() for TIF_SYSCALL_TRACE. TIF_SECCOMP alone falls
through to syscall dispatch, leaving installed filters ineffective.

Test the combined TIF_SYSCALL_TRACE and TIF_SECCOMP mask in both paths
and route either flag through the existing slow path. Leave the classic
MMU syscall entry implementation unchanged.

Validated the combined test under QEMU mcf5208evb (ColdFire): filters
denying getpid, openat, unlinkat, and reboot each returned -EPERM. A
classic-MMU control (q800) denied the filtered getpid syscall both before
and after this change. The 68000 path shares the same source-level
omission and receives the identical masked test but was not separately
emulated. Compile-tested W=1 with CONFIG_SECCOMP_FILTER=y on both
m5208evb_defconfig and a custom no-MMU UCSIMM configuration; the latter
built arch/m68k/68000/entry.o and vmlinux.

Fixes: 6baaade15594 ("m68k: Add kernel seccomp support")
Cc: stable@vger.kernel.org # v6.3+
Suggested-by: Andreas Schwab <schwab@linux-m68k.org>
Assisted-by: Claude:claude-opus-4-8
Assisted-by: Codex:gpt-5.6-sol
Signed-off-by: Christopher Lusk <clusk@northecho.dev>
---

Notes:
    Changes in v2:
    - Combine the TRACE/SECCOMP tests into a single masked branch per Andreas
      Schwab; scoped to the ColdFire/68000 paths, classic MMU unchanged.
    
    No in-tree m68k defconfig selects the pure-68000/DragonBall path.
    Compile-tested W=1 with a custom no-MMU UCSIMM configuration and
    CONFIG_SECCOMP_FILTER=y; arch/m68k/68000/entry.o and vmlinux both built
    successfully. The combined gate uses the same flags byte as the classic-MMU
    entry path.

 arch/m68k/68000/entry.S    | 3 ++-
 arch/m68k/coldfire/entry.S | 3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/m68k/68000/entry.S b/arch/m68k/68000/entry.S
index c257cc415..0d3cbeded 100644
--- a/arch/m68k/68000/entry.S
+++ b/arch/m68k/68000/entry.S
@@ -79,7 +79,8 @@ ENTRY(system_call)
 
 	/* Doing a trace ? */
 	getthreadinfo
-	btst	#(TIF_SYSCALL_TRACE%8),%a2@(TINFO_FLAGS+(31-TIF_SYSCALL_TRACE)/8)
+	moveb	%a2@(TINFO_FLAGS+2),%d1
+	andl	#((_TIF_SYSCALL_TRACE + _TIF_SECCOMP) >> 8),%d1
 	jne	do_trace
 	cmpl	#NR_syscalls,%d0
 	jcc	badsys
diff --git a/arch/m68k/coldfire/entry.S b/arch/m68k/coldfire/entry.S
index 4ea08336e..d658abdc5 100644
--- a/arch/m68k/coldfire/entry.S
+++ b/arch/m68k/coldfire/entry.S
@@ -72,7 +72,8 @@ ENTRY(system_call)
 	movel	%d2,%a0
 	movel	%a0@,%a1		/* save top of frame */
 	movel	%sp,%a1@(TASK_THREAD+THREAD_ESP0)
-	btst	#(TIF_SYSCALL_TRACE%8),%a0@(TINFO_FLAGS+(31-TIF_SYSCALL_TRACE)/8)
+	moveb	%a0@(TINFO_FLAGS+2),%d2
+	andl	#((_TIF_SYSCALL_TRACE + _TIF_SECCOMP) >> 8),%d2
 	bnes	1f
 
 	movel	%d3,%a0
-- 
2.55.0

