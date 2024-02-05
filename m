Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0550879D8
	for <linux-m68k@vger.kernel.org>; Mon,  5 Feb 2024 02:32:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707100368; cv=none; b=e+qLY7vU1+wyzHcEa6ajKBHR9pmsqnKH0QeWLTiowpfcZfiP6oMQfPoSHpt43uVbywJ2q7lYuygbZKjJoSttOagukZtsFbTJ9UQpoN1FJZM5p7B/+3HQ6HjKwc3TacMMpnTwLrOJ3BFANv47nvqXygGmqe0TVd40WrtJeBHdtN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707100368; c=relaxed/simple;
	bh=47E7XF4a4WJJzikKz2n9XzsrrKWGgXHjrlXvy6/eydM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=aQw7SU/SqV8UAGng0ujte3UFz7m7DISIfrsHCBsv7yFVCk2/Xhw7IhvkdAHNCzVWokOi5CTdXjtM06I8wowjfOjxM0ILY7uj0pPDqjVrGXobP08mqTvYB5bvAsKo8OTk23AUL0wCUQK22sdz5OaKmIwOOLiPQhGTDRCPnKNcbLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A1QZ+fxJ; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A1QZ+fxJ"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-1d71cb97937so34569445ad.3
        for <linux-m68k@vger.kernel.org>; Sun, 04 Feb 2024 18:32:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707100366; x=1707705166; darn=vger.kernel.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3bLDaEJpXblLiAtHM3Qc83oF1O6fVgO3YK3b189d/Fc=;
        b=A1QZ+fxJN39i88IHlUgvbiTmLjqTXETVB/zyPqJfOBA3Z+ZRr+BXHiakq3mnjhz50y
         L7t1Ge5Yl3Nz93ZRqvABtfZg3IYKacDp5zh0bcYERhyLxRZFPgL8J+rMIhNTLOsOVd+Y
         bh/S6UphaXBf7XFBxq9uiORbvveZBWYc1kix8b1xQARV9dmCTB40jynkVv6lVgOjAb4l
         U/gCKWlmjZTKcLKe61tuvuRogPGskU7BKLWcd3U0neHtFmETRhrL61ApLTZ1V4dNgQ+m
         aXQ2KWVi49d0wUj3ILpW/GhLlO0tibeFl6Y/KtgHGBJn1YlkvTLVrElEu2dOQiZn6lO+
         8LVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707100366; x=1707705166;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3bLDaEJpXblLiAtHM3Qc83oF1O6fVgO3YK3b189d/Fc=;
        b=ACsmyWJFyujAClGcwPep5ZOmA1hPxzPJl88xhCQqrpW9GmjZy2+fdhuj6xqrtyOaMB
         i/YEeXTLY8x8boD6q7aqaVU8o7WKmY4di+V8FT7xEUL4/IUtKkPg4vy97v1A3BvdZX1n
         NvgYelErXsqb4+IMDHA4r/HOFSte+fWZEwaURwdSewEemfSbTT5T42GFl4izvC8lq1Gy
         mG4z6FSpI4+IBFbxUJXyejjY88AN1DlsAqONf/8Hb3ERUhdyj5OnTa0EGZySIjbkPqAr
         CDf0RLY9HqLflKRH9td0xNIbMiW5iqpJ7WYtesxdTtgcplKOZcdxb0thzbHU0+mKXF9M
         A49g==
X-Gm-Message-State: AOJu0YzhJtdNT1pg51WhREYKNnpWJRvd5HuBsubULXxPO2Ht/ChvYr58
	1Zeii1WYmWENDJRystQGLrdjVqYEFm3Ra2b60Pu/jJft0rWM/oVX
X-Google-Smtp-Source: AGHT+IFbhz99CSbQp73ol0Ub+QEKMSkVm2+KO2nmVSorxXsiAmr4iO0tCBub2yF/SbBE98dw5IU08g==
X-Received: by 2002:a17:903:32cc:b0:1d9:591b:227a with SMTP id i12-20020a17090332cc00b001d9591b227amr12145151plr.48.1707100366293;
        Sun, 04 Feb 2024 18:32:46 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCUgLoI6WGsc9vpT7e8nYNHk7ifV6/z6fK6wwN4/K+hjOh55GN8k/rOBsDa+JvQdM+wgOT0TOKOonHMe5nj5hEiWBc0MFKOeGShcd6gkDN+1YVszIBzfaYT2KtFbc5/I7H9VklftfrRfvJYHNbg=
Received: from xplor.waratah.dyndns.org (125-236-136-221-fibre.sparkbb.co.nz. [125.236.136.221])
        by smtp.gmail.com with ESMTPSA id v7-20020a170903238700b001d960a29da2sm5149808plh.62.2024.02.04.18.32.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Feb 2024 18:32:45 -0800 (PST)
Received: by xplor.waratah.dyndns.org (Postfix, from userid 1000)
	id 02139360366; Mon,  5 Feb 2024 15:32:40 +1300 (NZDT)
From: Michael Schmitz <schmitzmic@gmail.com>
To: linux-m68k@vger.kernel.org
Cc: geert@linux-m68k.org,
	uli@fpond.eu,
	fthain@linux-m68k.org,
	viro@zeniv.linux.org.uk
Subject: [PATCH RFC v2 5/8] m68k: Update ->thread.esp0 before calling syscall_trace() in ret_from_signal
Date: Mon,  5 Feb 2024 15:32:33 +1300
Message-Id: <20240205023236.9325-6-schmitzmic@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240205023236.9325-1-schmitzmic@gmail.com>
References: <20240205023236.9325-1-schmitzmic@gmail.com>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>

From: Al Viro <viro@zeniv.linux.org.uk>

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

