Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B93A11B941
	for <linux-m68k@vger.kernel.org>; Tue,  6 Feb 2024 21:11:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707253890; cv=none; b=DV/ECJhcettEapNVRBjwT5V/S17V8BNxo3ISrv4t+Ls4tVsMlgor7Eyxlr3NYsR22Yy8wzyIHVSnilaNsgDE8xQVYMNx3DGm6hRf/HsyKHga7Mv7YF8wADSicdj5nUB/XopVy2grLOW77Y5WFzQWlnh0nxtiYYK2jmd/k5WO8UQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707253890; c=relaxed/simple;
	bh=F77Id1/VzhOa4ZcA7JFo8Ywu53re/ouJvYswJ+3ftnI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=uYIo9m53qqExWX+jiIhd1wY2QDqGgPDFD8MQ3A7qoNLL0nDzFqjmGqO7Xk2w47DtoABqNkaye3ElPuHZILGt81cnrCrmEAM9BGx9BCpwA1pTs0i/0iq8+u4IzfsWxAV4aLJDtjd73E5pS3yAZl8dlcz66Z640ffjR2EFhgZ8JNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f5YIufMa; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f5YIufMa"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-5d4d15ec7c5so5540865a12.1
        for <linux-m68k@vger.kernel.org>; Tue, 06 Feb 2024 13:11:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707253888; x=1707858688; darn=vger.kernel.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dGqIsAq8M3OyZBp1sy4dZz2sGDg3iZRmY3s8GmeRm7w=;
        b=f5YIufMa6P0vY9/RuY6uuwRH6CBkGgYeBC12AE3CGdyG76rSnftzDxuBVGDL6Z2Xeq
         MxfMehsjD8hMgFA4g3id6MkJ8GJ85GwI/jydr+w8U09XUv99oRmn8xCXZ5NCzBubsGr9
         KkzZ4VCdL7w1AHkodl5N4/FdATWm2xxdo2/p4OqJgIARh31r2d5DfHV60hlANR765iqn
         2T/RxhAyARm5qhHJWt0+nohdn91O4ZxUX6dHIsKb4VNWEDX2KKWIBJKxxopsG5GJ71jt
         HdG9aVu/0PBVOK+qZOJiB8YcWTnXEWDhEPkZzELEnAsn1R20M42qTcG0Bf7791VYCmmG
         Ttcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707253888; x=1707858688;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dGqIsAq8M3OyZBp1sy4dZz2sGDg3iZRmY3s8GmeRm7w=;
        b=Kltk7ZmIFBKiEPG/9Mc6E8UyVWFJwn7XwcuAtIqXhjAhDlOtDyRo2FUVdyK9S8gY+G
         yOtcqxeKh159KPrmm/4moyMRfPr3a+ehPqWYN4IIf1xoj0e12LKi2gwpDr4TY2RASZJY
         eG23lgORNfyNpBYllrJ948GK94/c752xtduhPO9x7+9AXKXPp+xA02SZYTIzNsuEnn0G
         lI1Zanc6PI1W0NuZKY9lQPLXz8YQjXfFBUQjh+yMFKXl2kFjRwJtn1J04CnnGw3zWcqB
         ajDX+HApClwfE1UqK5RZ7HYM+TAKvtOfKhId2UBFXL0juSE2vzT56Fqg2QnuWzuvL0VI
         Fe0g==
X-Gm-Message-State: AOJu0YwzB/IhhB2WxZ4ermXhTF8TX8UMroY0T02aiKWLKLI4R4m0mG4m
	OCLD7jUmySBSuWaxu794yR8rbJD4O18D3YdWjUOqgHhlLjDgGB/S
X-Google-Smtp-Source: AGHT+IH+QT+iIUzRQ5L3D+fdqUUCQUSYHYayCHZOru0HudI73qg4Za4o4/+PZss825mYq5VG/3ntuA==
X-Received: by 2002:a05:6a20:94cf:b0:19c:a887:e945 with SMTP id ht15-20020a056a2094cf00b0019ca887e945mr3285646pzb.45.1707253887962;
        Tue, 06 Feb 2024 13:11:27 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCUWgSG2vQUtABNHYDEEK8r/AD4F8FwL0+d86HtZAXEtm3maMn8ROfffQrMoZVXb9Lu8mdYaRgx0Qb5Nun3d+DwZWB449TREWxZzmdwQ1P+Vb3uVgSU4PogZFhvvXhHQPYhArLaoZIqQ/NQn0EFr/DBLWS2MfsJi2e5OA8XeQJcnhfEsQaRpQUL2NyJNTppzGz5ihi6ET26WKPZx6Ztksf6rRQ==
Received: from xplor.waratah.dyndns.org (125-236-136-221-fibre.sparkbb.co.nz. [125.236.136.221])
        by smtp.gmail.com with ESMTPSA id p12-20020a62ab0c000000b006dffb3e4d78sm2434433pff.85.2024.02.06.13.11.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Feb 2024 13:11:26 -0800 (PST)
Received: by xplor.waratah.dyndns.org (Postfix, from userid 1000)
	id DD91236035C; Wed,  7 Feb 2024 10:11:22 +1300 (NZDT)
From: Michael Schmitz <schmitzmic@gmail.com>
To: linux-m68k@vger.kernel.org
Cc: geert@linux-m68k.org,
	uli@fpond.eu,
	fthain@linux-m68k.org,
	viro@zeniv.linux.org.uk,
	cip-dev@lists.cip-project.org,
	Michael Schmitz <schmitzmic@gmail.com>
Subject: [PATCH v3 5/8] m68k: Update ->thread.esp0 before calling syscall_trace() in ret_from_signal
Date: Wed,  7 Feb 2024 10:11:01 +1300
Message-Id: <20240206211104.26421-6-schmitzmic@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240206211104.26421-1-schmitzmic@gmail.com>
References: <20240206211104.26421-1-schmitzmic@gmail.com>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>

From: Al Viro <viro@zeniv.linux.org.uk>

commit 50e43a57334400668952f8e551c9d87d3ed2dfef upstream.

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

