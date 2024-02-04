Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56467250E2
	for <linux-m68k@vger.kernel.org>; Sun,  4 Feb 2024 19:21:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707074476; cv=none; b=hepfGaBanVXKELejIh1tQ+WAd7y1FtpPflpP59f3r1G1gJVXT4j18ALXtPRO3vCCcFxagGaU1Tj03tgc3Ljqn3QW/eQXqenSE1bxa1zX37UIsxoosX05ZQHcP05RgSuKCDsWI4LmRjQoMoQtMS2/ByAvfMWNSHlVmdStEcfWypo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707074476; c=relaxed/simple;
	bh=/36POhqG8Wsy/L0DpyRvT3qEhUnOuLzW+JHGTHYaXoU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=p1k+uVVfI7eDiAOO7pQ76QIFUppSomfK2pVuxUCrIWE/gCvvIvw8JYoDilf1hrOI2Bq89fao3HU2y9LyLq98MEvzqtQoi/daCayvBwqPp+juDsjekquJ3oO5LuGc/qGuW5bR1TZ4ZdcQHfcPTSijTwCn49ecRY6RvRYLphYu11I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HYShdvTr; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HYShdvTr"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-1d98fc5ebceso1816075ad.1
        for <linux-m68k@vger.kernel.org>; Sun, 04 Feb 2024 11:21:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707074474; x=1707679274; darn=vger.kernel.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vwGYoS9/QCEkd/lET6tTUf6RW4FBCBofgAr0ZU0koKA=;
        b=HYShdvTrV1zBdnIfan34+dzPlrTQgFLxHd+LRFbMRfzuXv0/9gw0lAxfdp0+Kq9i7V
         PaR+STp5TetV8yHYzydDeCkGe/Ks4UEeQzOBK2g18IS2FZAVRahrCmoPd/5imv0yqdyQ
         WpJFE/Tq4GO+s5Wo4JWlL4TmjwLVMwGbnCk9/MuJYoDYPgz2v6sIfD4pOk6TNAgn8cl+
         +ExTMYxvGHjalLq+CuXu2uZ7SyuB7REcDkRcebdcpAMK+jdLH18vlvIeFSbIxGFjje/Y
         RYVASHGDZoUoAIURBr9Av8Udcs6sjJx9iVa1jSxHH96U/abAnKd6RsS+mmq8JCibJZ0r
         ov4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707074474; x=1707679274;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vwGYoS9/QCEkd/lET6tTUf6RW4FBCBofgAr0ZU0koKA=;
        b=IPJLosl6dzm+gOD3BQnvAPJLp/CqW5HdC4RdExqN68C4kU3tx4/9aj69pPCTJvP66H
         0MTOWNNbDlqrsdGkGs72VzIyCdq7t4MkSSdWJPIW9vIPLyURvVDBjQ9w/fZf9EWtF3YL
         KtPx+MH4KiJN8cJ669ewAwtcgA+ZcZZEbbVhmPm9XLQH8IWsSynPNgmW3Dni9lIM5YWH
         5Fn3BXW2ed0dVXfm6Hh9O2YscOlID+RFC50XfwrTgjwzfGsDoJ8L40dOGAn9sYsjfAhT
         JWXYOKN0hlvKDbQ6eOcTDT4o16UEYNLdoL7Vbz1CH2z1C+cdushNtokoLT+MTiro5lmQ
         JImA==
X-Gm-Message-State: AOJu0YxS+pNm4FJPRkQclgwn9vu8Nsfz1UJyhnXWqopnJP57c5/564mg
	WH2lgcDtnn/SytJjsaPnToAIL/M9myH1dB64hYDddvoWe1E5itOX
X-Google-Smtp-Source: AGHT+IGJC2US0/0QBXu+wwColw52ZsfBXIIR0eVthzovPxKZkc3Fk3QjPbLTVlbQL9zx8Oens1yz/Q==
X-Received: by 2002:a17:903:298d:b0:1d9:b751:4752 with SMTP id lm13-20020a170903298d00b001d9b7514752mr1041312plb.62.1707074474603;
        Sun, 04 Feb 2024 11:21:14 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCU0dRTBnDP/0ACQRroafK2uWwLXoFZ1d+JdYWx+UWLew5fdIWGpktopykrRmnRGFWPykrKdHa+Drvf0+GKV7KlHjajtm7pI8DdSc2GE+Xs6m3dCBQSMjV88dkEDbPFu+TmMskq1OL/rgAWiqtcxuvqv8rKERcrnhX4FTPNHHOxStddJ
Received: from xplor.waratah.dyndns.org (125-236-136-221-fibre.sparkbb.co.nz. [125.236.136.221])
        by smtp.gmail.com with ESMTPSA id p4-20020a170902eac400b001d92c29d6bbsm4862131pld.83.2024.02.04.11.21.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Feb 2024 11:21:13 -0800 (PST)
Received: by xplor.waratah.dyndns.org (Postfix, from userid 1000)
	id 210CC360361; Mon,  5 Feb 2024 08:21:10 +1300 (NZDT)
From: Michael Schmitz <schmitzmic@gmail.com>
To: linux-m68k@vger.kernel.org
Cc: geert@linux-m68k.org,
	uli@fpond.eu,
	fthain@linux-m68k.org,
	viro@zeniv.linux.org.uk,
	Michael Schmitz <schmitzmic@gmail.com>
Subject: [PATCH RFC 4/4] m68k equivalent of 26178ec11ef3 "x86: mm: consolidate VM_FAULT_RETRY handling" If e.g. get_user() triggers a page fault and a fatal signal is caught, we might end up with handle_mm_fault() returning VM_FAULT_RETRY and not doing anything to page tables.  In such case we must *not* return to the faulting insn - that would repeat the entire thing without making any progress; what we need instead is to treat that as failed (user) memory access.
Date: Mon,  5 Feb 2024 08:21:05 +1300
Message-Id: <20240204192105.5677-5-schmitzmic@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240204192105.5677-1-schmitzmic@gmail.com>
References: <20240204192105.5677-1-schmitzmic@gmail.com>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>

From: Al Viro <viro@zeniv.linux.org.uk>

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

