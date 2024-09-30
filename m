Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68C0E4A29
	for <linux-m68k@vger.kernel.org>; Mon, 30 Sep 2024 02:08:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727662131; cv=none; b=H7IDhKgFy6OWisESO7DDPk9yHjyVPI3akku3j1F/h60v/nhy3XXENgU/kzSaRO1GKJZ6RMxw6SaBv/fsdaUtXBWynLOrQ1SSka8iOD8hVzo+cGnlt2xG+doHuKcqyz5UwoRK7Db6UmkkwzR1Hq5vMfIXxomMxdakzNKtnhzLr8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727662131; c=relaxed/simple;
	bh=D3JCxAF8aTpjoIXw+qPgA/Ql1SFb6HJEw4yteBbjFtU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=KsCc+SEY2DFBF2mZOSazZnTOu/hi/RNBlhZwVAQZUyYfGkq1EEhnDHfv10W0TbvypeLY6gedamosh7cwdQfEExWAfXYkfD4+yzP41Zb/568vjGmHgf0klVdQEGgGDZKaWotzSpo+WxZ+wpmbgIwBzACKVSOhm6wacs/POavuJkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AijuxUlJ; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AijuxUlJ"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-206aee40676so31411435ad.0
        for <linux-m68k@vger.kernel.org>; Sun, 29 Sep 2024 19:08:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727662129; x=1728266929; darn=vger.kernel.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/70Zs3YHFHg9RhOzKW5Rn7Mss8iTVJTOhn7H6pZSJvg=;
        b=AijuxUlJ6uY+/zhLQ6dtlMSoaMOW2ZeZQ7aL+2XgBJ5Dm8vXz2w5wHZ7sRJ8eBNw/I
         Lctnzc+EgXBJqfdzzhc201gnZSJxKOH8Qo/xN330jHJKuSluaZ+QHYtuVfG45R8fM4kq
         Cw1L5SO0Z00goBgax1qqB8JXIWhW7gTbp1cR11OA+ta0DgPcBmqiORuUybgF2GGQEofe
         tWukTc9NWEtO7P1XqOW6/vpCd/glZVYwCVtpGVHlinKJaD4BePQutpnCZjurhoxc2uYP
         pu5Vo59zxd802z3CgvMxQ9kYHuWlNK/wCn3fe2NMeeNHAxAPeTEy6iFBLFt2ZDgaWEVF
         Ywxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727662129; x=1728266929;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/70Zs3YHFHg9RhOzKW5Rn7Mss8iTVJTOhn7H6pZSJvg=;
        b=Hep5cljE3Vcan17Jmag2vSn+bNrdx1ctUC3xf6zPCP0qpgoIk0BOFxfh8ry30b50Yx
         neI7v9+VbDeFyC2gzYUPgBrTsKz5zqb1MyJsibCIwCMKbSQCFvFA4J2QdGaXHa+Eg0HU
         zqjY1z3DQxHtIQg81QnAvST5Zc7Rx8sHviIyUkvH5Ftfr1zWOirjI4sVjF7YZMVL6JR+
         OqRg/X64EYo3N/gSEMMI/+jZ7W2z9CA24EApnYO/+A1FKyMiypn4jYsp4skTyHo+PTW/
         jJSeaDv/OlvrooCwCR+QR1akTcdxLzsqxoHoGxhjHGtu+SDuRh7h0y8PDYubXmbN1QH2
         fFFg==
X-Forwarded-Encrypted: i=1; AJvYcCUki9DYicohdwh5Cv1xyydMk05oWVMBp3p8shFQkqknkBf/iCkSuyK/Zt3Cgs60lqex05oLjGEFtwwD@vger.kernel.org
X-Gm-Message-State: AOJu0YzQZ0Efz4BEV5JdGD8fOjWQc6i8I7jPG9vNYJ6V2WBPupKxf0SF
	LM3jrnrWlyRdoRBb5idUOIVIyS4YJSG7qKDHo5iGX4LLOQRDZFIG
X-Google-Smtp-Source: AGHT+IF5049lFqXnzcP9ynG6rXNLrZJr15+AT37SC24CuRYmHNihPseVPyS0lZtO2D0o43hS8656yg==
X-Received: by 2002:a17:902:e5cf:b0:1fa:1dd8:947a with SMTP id d9443c01a7336-20b37b91636mr141715945ad.46.1727662129435;
        Sun, 29 Sep 2024 19:08:49 -0700 (PDT)
Received: from xplor.waratah.dyndns.org (125-238-248-82-fibre.sparkbb.co.nz. [125.238.248.82])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20b37e0ef3asm44954785ad.121.2024.09.29.19.08.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Sep 2024 19:08:48 -0700 (PDT)
Received: by xplor.waratah.dyndns.org (Postfix, from userid 1000)
	id 84CC43603D9; Mon, 30 Sep 2024 15:08:44 +1300 (NZDT)
From: Michael Schmitz <schmitzmic@gmail.com>
To: uli@fpond.eu
Cc: cip-dev@lists.cip-project.org,
	linux-m68k@vger.kernel.org,
	geert@linux-m68k.org,
	fthain@linux-m68k.org,
	viro@zeniv.linux.org.uk,
	Michael Schmitz <schmitzmic@gmail.com>
Subject: [PATCH v4 2/2] m68k: Update ->thread.esp0 before calling syscall_trace() in ret_from_signal
Date: Mon, 30 Sep 2024 15:08:40 +1300
Message-Id: <20240930020840.15226-3-schmitzmic@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240930020840.15226-1-schmitzmic@gmail.com>
References: <20240930020840.15226-1-schmitzmic@gmail.com>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>

From: Al Viro <viro@zeniv.linux.org.uk>

[Upstream commit 50e43a57334400668952f8e551c9d87d3ed2dfef]

We get there when sigreturn has performed obscene acts on kernel stack;
in particular, the location of pt_regs has shifted.  We are about to call
syscall_trace(), which might stop for tracer.  If that happens, we'd better
have task_pt_regs() returning correct result...

Fucked-up-by: Al Viro <viro@zeniv.linux.org.uk>
Fixes: bd6f56a75bb2 ("m68k: Missing syscall_trace() on sigreturn")
Signed-off-by: Al Viro <viro@zeniv.linux.org.uk>
Tested-by: Michael Schmitz <schmitzmic@gmail.com>
Reviewed-by: Michael Schmitz <schmitzmic@gmail.com>
Tested-by: Finn Thain <fthain@linux-m68k.org>
Link: https://lore.kernel.org/r/YP2dMWeV1LkHiOpr@zeniv-ca.linux.org.uk
Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: <cip-dev@lists.cip-project.org> # 4.4
Signed-off-by: Michael Schmitz <schmitzmic@gmail.com>
---
 arch/m68k/kernel/entry.S | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/m68k/kernel/entry.S b/arch/m68k/kernel/entry.S
index b54ac7aba850..dbeba043b703 100644
--- a/arch/m68k/kernel/entry.S
+++ b/arch/m68k/kernel/entry.S
@@ -173,6 +173,8 @@ ENTRY(ret_from_signal)
 	movel	%curptr@(TASK_STACK),%a1
 	tstb	%a1@(TINFO_FLAGS+2)
 	jge	1f
+	lea	%sp@(SWITCH_STACK_SIZE),%a1
+	movel	%a1,%curptr@(TASK_THREAD+THREAD_ESP0)
 	jbsr	syscall_trace
 1:	RESTORE_SWITCH_STACK
 	addql	#4,%sp
-- 
2.17.1

