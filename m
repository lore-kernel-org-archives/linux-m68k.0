Received: from mail-yx2-f12.google.com (mail-yx2-f12.google.com [74.125.224.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B728B378D9F
	for <linux-m68k@lists.linux-m68k.org>; Sat, 12 Sep 2026 23:07:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789254430; cv=none; b=IT8d2C7+djlIg2tAosjWV2pE8lnmT5nwI/zY+z6ZO3gdX2egAJohAz0EpskbbCVfIcXXdIz5PC/+ntdG7C9IinZHi6IAow6m6goq3QbKP94aCHwk40tzYV7eNeKT/iDeUXl6+XGY81m0Deb4GRAWoNnNvtrywbNTNKsxPYtc4JA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789254430; c=relaxed/simple;
	bh=TdzRwhjQNVmDU9bqekeCy1JbqM5euo3ldm/AuhuZlxw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VoXTMu02mSW9W2A2GwKxrbzdFURWGug4INTEj6zuOzAvD9MSnaatWIRAf4oMREOVR6naNQst3N2kFztvHgYx9/HRPXot1DvCkO5H8s1N2DkE4L8YJBfykrozc9HFGM9OjH2STRRMrFWdq1g91CXhbvbHT6wm+sPxbCtZf0LamAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=northecho.dev; spf=none smtp.mailfrom=northecho.dev; dkim=pass (2048-bit key) header.d=northecho-dev.20251104.gappssmtp.com header.i=@northecho-dev.20251104.gappssmtp.com header.b=x4yjKW4L; arc=none smtp.client-ip=74.125.224.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=northecho.dev
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=northecho.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=northecho-dev.20251104.gappssmtp.com header.i=@northecho-dev.20251104.gappssmtp.com header.b="x4yjKW4L"
Received: by mail-yx2-f12.google.com with SMTP id 956f58d0204a3-66e610bd325so114404d50.3
        for <linux-m68k@lists.linux-m68k.org>; Sat, 12 Sep 2026 16:07:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=northecho-dev.20251104.gappssmtp.com; s=20251104; t=1789254427; x=1789859227; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=EjEDdvlxexIZGgyTpilEkHXXYYzPdhgUTGEAelW9epE=;
        b=x4yjKW4LroSIu9sG4fQq5WqVFYQqfFkogNTygUE3b4DU2sTQyOUrnRw9L1EshisQ0k
         KUKVBxvPXN22v2Xm3uWCI6mqXsgFQhjs5R323Bs9qY/5PW5ITAhqGu0ZIjSuRK6FN73X
         W0kFLfwNWPbGxOdlRn5LnFKJFoTrig0DgBrumfO9OMkbKAXSGKh7TgQwlmNjSTzDqF+v
         SPYh5YGoqnVO3jCtLLxQn26/oo9ZgU6P2Z1BmVACPn+2+08y8krgGaVCzeRAMnURdrET
         4dektSfevAJ+xW/1fIstGc4SvTx2+GlcvNuH7jLFlmmQJy0iKA4a22ttxL1nKHpGEBua
         MOmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789254427; x=1789859227;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EjEDdvlxexIZGgyTpilEkHXXYYzPdhgUTGEAelW9epE=;
        b=l7TE0fE7/corPFNeJLGx8Ljl7FpyM5Iy/a4DADHs3cNjF2GCml7TB9HTEyJWkAPyXq
         nLd55+mnmV8azPSv6+0Hd9Xe7w5Sz0SiSnzY7l3PcBSYtmvxWKWGHCEf2ZbG38XN+QZd
         V11GkyYU41xOwgI9zBV/sr4YL+HUeiKWaVS6WraT+FhYYj7SkCh1w8/VoTuBjzgM6M63
         9LLjNll/h5L13yJkv4CuvfooILi8bRWRaBM3IhAVQhI22hf7anw/2CV67BztYOtemHrF
         utTDS9oyUXti1V6SD4DQkXeMIFaVceBHz7KarwUHry3ddT0A5/BuhF3saEJ78wNfQ6UY
         q6WQ==
X-Forwarded-Encrypted: i=1; AKwUvBx9OEJgHS9UOuQ1UOfCMxet+Mae4q7nhGa4a0zjiWVIm0uCLUtBlb3usOUDjOVEya0QCus5pO+erwE/@lists.linux-m68k.org
X-Gm-Message-State: AFuF++khgi2pVYTIfalpYKTDemE97UirqBPKlncgEe61vIhVrybmzke7
	4VrMoWwBRzg/x6YQgzj5K8mC7oVXOfMsR46t/nuPgep/YUw3FWkX9Eim3WnGoSfqCE5v
X-Gm-Gg: AYBFou31coNoSJdZhiYvJNUonbLBOImhIBbnyr91CKSrS0smCt/ZB19BCjQL2oZUpVa
	UmIF5RMhIY+B+/8l63CHWUt40xpv/eljKnp96YlP3UxDZ9RJMcJkKKrFQcngnecG0LJUBJBeNiW
	Lrc45l8eJn4F8Lhlq2meco7ubPS6SxSov7qqJO+zytLGQa49gGUecrcorAPlfVoN0xQsXEIQtA8
	dWwWgy0rSCntuMbbD95wG0lNlE7CKfVWzHFEMxvwpLLQQMGDWf7i8uRkDXxk9GlQDLOYH8sQ/Zn
	8XFyeOwzCnw1n2TS3NIEDGTlqJJ7znOHVJkr2t9SyWPjAhmXkb9Vca7Nlgg7FRT47tefCS9q9MO
	asAlLDaqF+bO7I2SZYO3EdA2aNBSBnRZ/6M4zFwUNFN6mmKGgS36JWD5U8FRExG3W0ckUai7GI6
	bPjfG4PemGpSpY2HkTAICJPyhnD+0nJbAMfo44kVcxnzDvUHQ2vwPQ5V+RJEKO1EJOeM6pAqD65
	kP0NcxMmcCJfu257QZdRRVdarwwsRR+5LvRI6o=
X-Received: by 2002:a05:690c:2602:b0:820:18ab:ff72 with SMTP id 00721157ae682-884b6c2e93emr41536317b3.3.1789254427333;
        Sat, 12 Sep 2026 16:07:07 -0700 (PDT)
Received: from kelso (99-10-92-174.lightspeed.rlghnc.sbcglobal.net. [99.10.92.174])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-88488856486sm23622947b3.37.2026.09.12.16.07.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 16:07:06 -0700 (PDT)
From: Christopher Lusk <clusk@northecho.dev>
To: Greg Ungerer <gerg@linux-m68k.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Kees Cook <kees@kernel.org>,
	Andy Lutomirski <luto@kernel.org>,
	Will Drewry <wad@chromium.org>,
	Michael Schmitz <schmitzmic@gmail.com>,
	linux-m68k@lists.linux-m68k.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH] m68k: Fix seccomp filtering on ColdFire and 68000
Date: Sat, 12 Sep 2026 19:06:51 -0400
Message-ID: <20260912230651.461269-1-clusk@northecho.dev>
X-Mailer: git-send-email 2.55.0
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

Test TIF_SECCOMP in both paths and route it through the existing slow
path, matching the classic MMU syscall entry implementation.

Validated under QEMU mcf5208evb (ColdFire): a task installing a seccomp
filter denying getpid() still executed the syscall before this change and
returns -EPERM with it; likewise for a filter denying
openat/unlinkat/reboot. A classic-MMU control (q800) denied the filtered
syscall both before and after, confirming the gap is specific to the
ColdFire/68000 entry paths. The 68000 path shares the same source-level
omission and receives the identical fix but was not separately emulated.
Compile-tested W=1 with CONFIG_SECCOMP_FILTER=y on m5208evb_defconfig.

Fixes: 6baaade15594 ("m68k: Add kernel seccomp support")
Cc: stable@vger.kernel.org # v6.3+
Assisted-by: Claude:claude-opus-4-8
Assisted-by: Codex:gpt-5.6-sol
Signed-off-by: Christopher Lusk <clusk@northecho.dev>
---

Notes:
    No in-tree m68k defconfig selects the pure-68000/DragonBall path.
    Compile-tested W=1 with a custom no-MMU UCSIMM configuration and
    CONFIG_SECCOMP_FILTER=y; arch/m68k/68000/entry.o and vmlinux both built
    successfully. The added gate is form-identical to the ColdFire and
    classic-MMU gates.

 arch/m68k/68000/entry.S    | 2 ++
 arch/m68k/coldfire/entry.S | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/arch/m68k/68000/entry.S b/arch/m68k/68000/entry.S
index c257cc415..093be0a66 100644
--- a/arch/m68k/68000/entry.S
+++ b/arch/m68k/68000/entry.S
@@ -81,6 +81,8 @@ ENTRY(system_call)
 	getthreadinfo
 	btst	#(TIF_SYSCALL_TRACE%8),%a2@(TINFO_FLAGS+(31-TIF_SYSCALL_TRACE)/8)
 	jne	do_trace
+	btst	#(TIF_SECCOMP%8),%a2@(TINFO_FLAGS+(31-TIF_SECCOMP)/8)
+	jne	do_trace
 	cmpl	#NR_syscalls,%d0
 	jcc	badsys
 	lsl	#2,%d0
diff --git a/arch/m68k/coldfire/entry.S b/arch/m68k/coldfire/entry.S
index 4ea08336e..b73de9585 100644
--- a/arch/m68k/coldfire/entry.S
+++ b/arch/m68k/coldfire/entry.S
@@ -74,6 +74,8 @@ ENTRY(system_call)
 	movel	%sp,%a1@(TASK_THREAD+THREAD_ESP0)
 	btst	#(TIF_SYSCALL_TRACE%8),%a0@(TINFO_FLAGS+(31-TIF_SYSCALL_TRACE)/8)
 	bnes	1f
+	btst	#(TIF_SECCOMP%8),%a0@(TINFO_FLAGS+(31-TIF_SECCOMP)/8)
+	bnes	1f
 
 	movel	%d3,%a0
 	jbsr	%a0@
-- 
2.55.0

