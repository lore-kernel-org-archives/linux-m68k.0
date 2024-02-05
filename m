Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B78A7493
	for <linux-m68k@vger.kernel.org>; Mon,  5 Feb 2024 02:32:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707100368; cv=none; b=okVTJQ+z15aILFgKVAAz5d0MHic+o7ffUET4FV2+KeyOgAwjNu0ZI4b4gtY84doyQQBTzSMN0s8rueqo9ogznANN3lMKF/Y7CZ2JMYPnk4k7yj5X+NpjswoKgHzIayIZKC94V7/uXBjA1L7j0R59tR45m0VlHzIdyk1pWKsgL+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707100368; c=relaxed/simple;
	bh=BAP/SWuQ1jaBb9NLDsxdTPQ02FfKV589nMIBACoj7is=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=pcskLN8ae7uSklUIHF/pHkcaXp4sx5Lkb+paHqR2klAvJVQBeg5qSRK+lpqQUlUTeUFQNdKaahhJcDddlsJyrWw1k3NVmY+VAouJKnGRT+wBrpimHsF3wy0cMW+DaghlJ1+36SFpPPzlQLqor/gcvTInn/PwxoIILfLokLn/Y4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DLsVdyJM; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DLsVdyJM"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-1d95d67ff45so24311185ad.2
        for <linux-m68k@vger.kernel.org>; Sun, 04 Feb 2024 18:32:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707100366; x=1707705166; darn=vger.kernel.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cLlzzwrWBbPKObkakMPsDcYqsm4mE0eXooJ6fOZZTnA=;
        b=DLsVdyJMGRf1vAbIU6w3dtgCiWv6t9vfbffaJoCpxu2KtvsfZ8xOyPE6XQn5KkHkfV
         BZEVQsYE2KyZHH+vtcKPN1DzTmF1wDAGZN/5TMn1tLXmmJEt7IKBTmS3sJKg/dWdFUpl
         mZDlpGqfwMXIxTeSIV/CaRqy7c2aqxtxW6NcaUMNwMzxy8S4Bx7iuk6ZDp08/5sNkwN4
         SUao8VRgk7Yzc6ndiHBIayLtA3abDq1MA9JJN2n9CiD2u10jc+dHOTsYXK3tHsmydSyP
         j429XP61C44EOfqP40PY7bMUKWArbcoybaNkyALfJ7qecP/Pp6cgQA+gLlks7M2p7wE+
         ElRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707100366; x=1707705166;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cLlzzwrWBbPKObkakMPsDcYqsm4mE0eXooJ6fOZZTnA=;
        b=Otdpqr6musNf/wP3ZyN4ze2o8G3sQbWxElUleSjTRNKesHiT5dfoyTyHRmPKTk5GyN
         JvtBCgTydqnwnQgQnjn+5I18l49eEYExkNuBG78f2E490RKmvuUPpw4mbcL7IBEWqm4M
         QVofLQCax2FP8tFhGFEQnWrnMCzoASXZgOj52Pcx+kSOdR+SwmPjkpxzGnRdKKTY5pTS
         L5SXjqGHBSzN9JJ4iGmbXzlba2kEZ74PWI/iE68FnPon9in6342U+Mr9D5VjtXSXXsE4
         UO+FlmROmcRV2qQh+reYHtA2tCyiIuiLMvgamN+nHPzaNbrZ/QaA7BB0fGFh3qTn6fWg
         g13w==
X-Gm-Message-State: AOJu0YxRxdcHCsInVWoWy9ByPszES3rbZ/FYPcq2T6CwjT8WHdTD9LUn
	VmH8ztGUSv8Z83Jy1JOYEiHxkFf5eEggQmz67PsqDbeJ31iDRdru
X-Google-Smtp-Source: AGHT+IGif5o5YC1EVvMTdmH8dYw0Fydd3vFR0SI5k6SWWpr1T7cDtNIrWHtIvWTp6/rhSCEDmACZJg==
X-Received: by 2002:a17:903:2284:b0:1d9:924c:c9cb with SMTP id b4-20020a170903228400b001d9924cc9cbmr3759855plh.37.1707100365912;
        Sun, 04 Feb 2024 18:32:45 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCVyOzKcpLsXSiaufwe8uk7A8A665s9Beqw3KS/cMiWLaBPl09jXr4uLv+bidYyxa87x1Sr8jr9atTqRCeT+ix00BGgIzHDtbi/Bf9TUbj25bA/99CV8XEdckk/dKr0BadCQSeuFdQNCxRLgKTJou8WqBN/Kw/owdsqw8HxcLW6NnA+p
Received: from xplor.waratah.dyndns.org (125-236-136-221-fibre.sparkbb.co.nz. [125.236.136.221])
        by smtp.gmail.com with ESMTPSA id u1-20020a17090282c100b001d8f81ece98sm5071018plz.104.2024.02.04.18.32.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Feb 2024 18:32:45 -0800 (PST)
Received: by xplor.waratah.dyndns.org (Postfix, from userid 1000)
	id 2936F36027A; Mon,  5 Feb 2024 15:32:42 +1300 (NZDT)
From: Michael Schmitz <schmitzmic@gmail.com>
To: linux-m68k@vger.kernel.org
Cc: geert@linux-m68k.org,
	uli@fpond.eu,
	fthain@linux-m68k.org,
	viro@zeniv.linux.org.uk,
	Michael Schmitz <schmitzmic@gmail.com>
Subject: [PATCH RFC v2 7/8] m68k: fix livelock in uaccess
Date: Mon,  5 Feb 2024 15:32:35 +1300
Message-Id: <20240205023236.9325-8-schmitzmic@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240205023236.9325-1-schmitzmic@gmail.com>
References: <20240205023236.9325-1-schmitzmic@gmail.com>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>

From: Al Viro <viro@zeniv.linux.org.uk>

m68k equivalent of 26178ec11ef3 "x86: mm: consolidate VM_FAULT_RETRY handling"
If e.g. get_user() triggers a page fault and a fatal signal is caught, we might
end up with handle_mm_fault() returning VM_FAULT_RETRY and not doing anything
to page tables.  In such case we must *not* return to the faulting insn -
that would repeat the entire thing without making any progress; what we need
instead is to treat that as failed (user) memory access.

MSch: v4.4 backport compile errors fixes.

Tested-by: Finn Thain <fthain@linux-m68k.org>
Tested-by: Geert Uytterhoeven <geert@linux-m68k.org>
Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>
Signed-off-by: Al Viro <viro@zeniv.linux.org.uk>
Signed-off-by: Michael Schmitz <schmitzmic@gmail.com>
---
 arch/m68k/mm/fault.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/m68k/mm/fault.c b/arch/m68k/mm/fault.c
index 6a94cdd0c830..f94df64c3784 100644
--- a/arch/m68k/mm/fault.c
+++ b/arch/m68k/mm/fault.c
@@ -139,8 +139,11 @@ good_area:
 	fault = handle_mm_fault(mm, vma, address, flags);
 	pr_debug("handle_mm_fault returns %d\n", fault);
 
-	if ((fault & VM_FAULT_RETRY) && fatal_signal_pending(current))
+	if ((fault & VM_FAULT_RETRY) && fatal_signal_pending(current)) {
+		if (!user_mode(regs))
+			goto no_context;
 		return 0;
+	}
 
 	if (unlikely(fault & VM_FAULT_ERROR)) {
 		if (fault & VM_FAULT_OOM)
-- 
2.17.1

