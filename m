Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 660D33D47C6
	for <linux-m68k@lists.linux-m68k.org>; Thu, 21 May 2026 12:34:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779366885; cv=none; b=N1/pNng7pRp+6rFpSCtC6JzkHTeNGGWMh7Xn3P4OcoEyELyQdOXN9ligj9XKLZ+v0KApreWNcOAbxNIuSGbS3YXXpowGefdkq5Jpwr8KzruHte6jMDrUBG0gcl8t06ztbryJ/D/ktk/YMcYCSw4twNsetJ2MZ5ZIHvnAGkXEWCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779366885; c=relaxed/simple;
	bh=RX42IKvUQTV6WMHKbuFkLzcEWeRTFdf9qlpwIdsjjqs=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=Pxrst3Q6G6rI3Zc2nEEklxle0qfhBzP2z0GX50tUoUfop9AFGccO0u1N1jqg8dUWg1sTuh571RoVrUf1oAxy1588xn2E5T0sPAc38objB0+qk+ChdPLeEer+EohnoO4hSgSjQsFp1W3TVXmizjlKD7UdjtkVmc0Fo55wzjpL7iU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--elver.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Opjb/wQF; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--elver.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Opjb/wQF"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-48d1bc85bb3so22359425e9.0
        for <linux-m68k@lists.linux-m68k.org>; Thu, 21 May 2026 05:34:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779366883; x=1779971683; darn=lists.linux-m68k.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=30zwX92UDLp3WVrdLPg947prqG16XeA2s2EFLRkEXpo=;
        b=Opjb/wQF+mK+CW0pu1hMf3xA9IlXJvvAVR5QLtrtVDcMRFnHc2LabdR4/p9q2TdxEH
         RNzHoLFZqwWMMCxv0dvwECE3FFa8PRdS4R5RHowDGx/VykdsV5azy5Lyxsa/G09YPENm
         bOWR4hIIybj2+++new8NwvoFt0l7rhrCZMfhFmoSrETKKltDP4XYY4BoOoPLWmGJbK9K
         FO/W4BxdHKwAPFwGYD8Wqa5gMwQD3tU1uvjMfSbkYR0/65v6HHkwOZHCnp+zN8JIBjxf
         3mCuW2qxwj2DRLhjQtWCTNpOVLG/Of8bSubWgMPFpR2RJ8v7EAfDyqwj/iKmbBgiTrjJ
         4hiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779366883; x=1779971683;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=30zwX92UDLp3WVrdLPg947prqG16XeA2s2EFLRkEXpo=;
        b=cme4dDyFVSjtCSG46s0iIj+e7xeBLfJOwp6LUO6+1hlZWVqbmtNqbpISgZlgauu9tT
         6FBxRXK6DxiDysUB88gcqxzYIzcvP1KNT1IlFSalhSdEHkSimc/jI4JRQRzLYHuHoIk8
         m8wI3t1KpTHuEszEDeNF20Y/pbojUJs9EZl3kAws+k3jMCyrL/GU2LYF/lkW3rxT5Xp0
         sjscNMvFN0+zatEMdWvQxGCxWC4f4KiTnPHmOmeplbgguq/CQ2hDjQkVDEa48f9jfcbF
         TYEFiSkto+BfPFbO09ZLbPYtCPFlVAzR5Qrq+feANkNufPKbxY64UwMIN5hS/dTTUywq
         h1dw==
X-Forwarded-Encrypted: i=1; AFNElJ+8I0jnoBZwPKLqsA6SSoyMYGrzZl7VQfH8h+jm5fDRvjzMmI77wxejkpv8zYOl/KXSt76O8SwGRxBf@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YzwMApHvKbKJYAcveHcWSAfb0LJCMdBV5aKGsLfreT6261RLq3o
	kwLJ4EUbdDqSfVARRNgbUkPBYsR61s1S4II2G/dwiMG8SRt8/e0o0MwwsyGkY8SlmfHgKsW9vDr
	EKQ==
X-Received: from wmbf13.prod.google.com ([2002:a05:600c:594d:b0:48a:55cc:4954])
 (user=elver job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:4e02:b0:48f:d620:c27f
 with SMTP id 5b1f17b1804b1-49036053ec5mr32796905e9.4.1779366882474; Thu, 21
 May 2026 05:34:42 -0700 (PDT)
Date: Thu, 21 May 2026 14:34:30 +0200
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.54.0.746.g67dd491aae-goog
Message-ID: <20260521123438.147789-1-elver@google.com>
Subject: [PATCH] m68k: Implement _THIS_IP_ using inline asm
From: Marco Elver <elver@google.com>
To: elver@google.com
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k@lists.linux-m68k.org, 
	linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Both GCC [1] and Clang [2] consider the generic version of _THIS_IP_ to
be broken:

        #define _THIS_IP_  ({ __label__ __here; __here: (unsigned long)&&__here; })

In particular, the address of a label is only expected to be used with a
computed goto.

While the generic version more or less works today, it is known to be
brittle and may break with current and future optimizations. For
example, Clang -O2 always returns 1 when this function is inlined:

        static inline unsigned long get_ip(void)
        { return ({ __label__ __here; __here: (unsigned long)&&__here; }); }

Fix it by overriding _THIS_IP_ in <asm/linkage.h> (which is included by
<linux/instruction_pointer.h>) using an architecture-specific inline asm
version. Additionally, avoiding taking the address of a label prevents
compilers from emitting spurious indirect branch targets (e.g. ENDBR or
BTI) under control-flow integrity schemes.

Link: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=120071 [1]
Link: https://github.com/llvm/llvm-project/issues/138272 [2]
Signed-off-by: Marco Elver <elver@google.com>
---
 arch/m68k/include/asm/linkage.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/m68k/include/asm/linkage.h b/arch/m68k/include/asm/linkage.h
index c8b84282764c..9ed2f36830d0 100644
--- a/arch/m68k/include/asm/linkage.h
+++ b/arch/m68k/include/asm/linkage.h
@@ -35,4 +35,6 @@
 	__asmlinkage_protect_n(ret, "m" (arg1), "m" (arg2), "m" (arg3), \
 			      "m" (arg4), "m" (arg5), "m" (arg6))
 
+#define _THIS_IP_ ({ unsigned long __ip; asm volatile("lea %%pc@(.), %0" : "=a" (__ip)); __ip; })
+
 #endif
-- 
2.54.0.746.g67dd491aae-goog

