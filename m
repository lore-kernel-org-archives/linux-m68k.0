Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C82B250E2
	for <linux-m68k@vger.kernel.org>; Sun,  4 Feb 2024 19:21:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707074474; cv=none; b=gO0bMDT8KYLm+k9Z7LTq/bAaVOMY7Fe/TMxsNDRBDV7wmlmAYFJjEKYwrE5/ADaeNVMz8QdXZ4rRpyaLBA9ADDe7/x7rxmi3avGyBB3reLk+vw4LQ31XNVmP8MieAzyKcq8q6/PuCrSGoUokYzOMrCUhnArlD3uFScBU9AxQQss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707074474; c=relaxed/simple;
	bh=47E7XF4a4WJJzikKz2n9XzsrrKWGgXHjrlXvy6/eydM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=dzbcWUIorLipZ03bx55P+VIbCAMDrrBOV1zekxeZzw8LuMYBYTQz7HBRrWak55egHzxOqoczhRC6WQOZpmZ3fRY492tGIjHB359maoR2oVV6lEcVyGKpOd7rC8IT57EWVeQbF70YRqeRM4+xdUu8dz4Savzk0eCGk7smiYqoDRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BaCfhXQ4; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BaCfhXQ4"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-1d7881b1843so32616795ad.3
        for <linux-m68k@vger.kernel.org>; Sun, 04 Feb 2024 11:21:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707074473; x=1707679273; darn=vger.kernel.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3bLDaEJpXblLiAtHM3Qc83oF1O6fVgO3YK3b189d/Fc=;
        b=BaCfhXQ4KO/i+TiiF/ng5tFHLBTMYr2ndD+3yfbl1TDwtQEvOezqnnh66sD4brPMD0
         klqRTdFllM3k/5Wwbr5/Fl2Oerhm4GjY0QZRPx2xOgnCjx1+l189V+l/0pfKjtA2IUKa
         DMHwbuYJPkFP+lobmzvG5P8OsjRxiTisg36kZzLwvhh/31a8Lpm1PBFKbfTdVPQL9W17
         PP2yk6z8bzVfrG441ZRdUXPpOumNJo0gYooSWX5nqKeye1JaSgBX00bgaLa6YS0zjYvQ
         0iGjwihrW5zZcz04owitCsAYFe2G/S5d+D20CHiFljDVv/0cpXsUbFgtNwGhxeJ8LGVy
         l4/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707074473; x=1707679273;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3bLDaEJpXblLiAtHM3Qc83oF1O6fVgO3YK3b189d/Fc=;
        b=c7hJd1FUe/unfQa9izOdTFOz6WHDQY+xdNZc2gsOCEqF3cf3ypcOoW8AKFUrjGYImA
         D9HpYU9WiJJYglRrd24jspUAOI7kqF47QSfP4VfvaCrfOVF7mSb2+RmXWRJw/xkxuFVo
         58MASJnRSP9JqCc7+lIU3rwwQOxr7ZtdI/O/p5Bm3zC0/w+mas0NVF+IaoOI28gLCFRA
         jNcBS6QjPwoebUhFlXjg6hG5QlCjMcoQ5CtIr1gJgpqiv9185Ws2nnLScdB8W9oFifWz
         4qeCrwf8CZeGz1N8wQkMGDf4kG+LLLJW911MlpY4+nsiCy55klOFeQCwbYgmIk9D6isq
         hZ/g==
X-Gm-Message-State: AOJu0YxPRzs9VDMDe2M6louhN9rBw0sbbPQSheVLQ/bjTr1xStSGSB5i
	swwf2OY0yAT3tpvgK8iIiYZ6wnitTEeupf1J+DQmVxhTvA3fcQ0Se5vlgUCb
X-Google-Smtp-Source: AGHT+IESGh78cdY13x2xRIYf/UEMaXp+i3GXoW+ez2LGDOBW4KDsQtTGYKscNvvYmWosmMzAFLy87Q==
X-Received: by 2002:a17:903:40c1:b0:1d9:af81:8b2b with SMTP id t1-20020a17090340c100b001d9af818b2bmr2397730pld.67.1707074472623;
        Sun, 04 Feb 2024 11:21:12 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCUG2MX+tE/uRojwz/I4mYMsY+PGdin//TtN6QbjreoG/qwbZKu9PYMJOmVUpT9yb83vAa/VUWHMOvU7p5Ebt9iran0Crw8x0LJA9JIt1eak3rj/I6MQ8Ird22bKLuyF1BupD7gdI1jU8pgffWQ=
Received: from xplor.waratah.dyndns.org (125-236-136-221-fibre.sparkbb.co.nz. [125.236.136.221])
        by smtp.gmail.com with ESMTPSA id kt5-20020a170903088500b001d93a85ae13sm4856391plb.309.2024.02.04.11.21.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Feb 2024 11:21:12 -0800 (PST)
Received: by xplor.waratah.dyndns.org (Postfix, from userid 1000)
	id B34CB360332; Mon,  5 Feb 2024 08:21:08 +1300 (NZDT)
From: Michael Schmitz <schmitzmic@gmail.com>
To: linux-m68k@vger.kernel.org
Cc: geert@linux-m68k.org,
	uli@fpond.eu,
	fthain@linux-m68k.org,
	viro@zeniv.linux.org.uk
Subject: [PATCH RFC 2/4] m68k: Update ->thread.esp0 before calling syscall_trace() in ret_from_signal
Date: Mon,  5 Feb 2024 08:21:03 +1300
Message-Id: <20240204192105.5677-3-schmitzmic@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240204192105.5677-1-schmitzmic@gmail.com>
References: <20240204192105.5677-1-schmitzmic@gmail.com>
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

