Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DAC11B941
	for <linux-m68k@vger.kernel.org>; Tue,  6 Feb 2024 21:11:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707253892; cv=none; b=tFhHJ5azIhVbdUqNIlbeW9IPh+CELHWOWXQSQafSGI6X78O//jFEnVdkNuH/yr5PYoEjsBvHkAL4a08lPAnxJKILndWO6/oVCgzJRaFCtwXVRT2cPc7LJFmCa3xwqQxlUw66Jb8DEfQD/trSBLuhMuX5hVh/4G0hcU22SAop9Qw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707253892; c=relaxed/simple;
	bh=y+jUU5ryVouuZVRIZAQF8tIUCi5/CJ6816ZSTLcyJDs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=WQotS0jxSEhgfwN4PeRZdnA/JgPyFoiuqRn79RgOz2t9pvjD78Di6AXKXrGarjce08iLIM5/Utsu98YOMwhhJh0T15JUyTECUdZ+zKrVbeHD2dLABiwD75oLKBqP0xbNegjpRgPXfkjvfJrjXsv8XJlnLl/N3kM60pKJ/m0XhaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c2UGDFaB; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c2UGDFaB"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-1d7232dcb3eso46641815ad.2
        for <linux-m68k@vger.kernel.org>; Tue, 06 Feb 2024 13:11:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707253889; x=1707858689; darn=vger.kernel.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zEkVGjcaygh1vK+ux9W8nA0sI6zRg3ppOKoN4fJJ6BY=;
        b=c2UGDFaBZn0XANURgbpc1/NlazX49vLbIudL4SoxLiWfGDJzMt9v/+MAtysDl94c5u
         EoRxxeW+iaEkTpRA4v+H5F2P4JxJP/rLKKuL6WXn9g97KdWxBtWmjHTY5QX9rHJpWiFo
         MpD3qb1QwYwHMjrJSFwW+t0npCxAtOJNwaaFOsRRW8L005Xa7OghAaWFTR12Wv0USwjg
         1ppOqH6w3CB79ykhc7Go4LSqkZ+6Bw0N2t+smyJoNTWQCYpN7ANXnjyJ9PMsRBaNSU9D
         LpSlrSsg+Q410C5FW+CYZ32Yhb977HNY2sQ6T+z0ADcJ5n2ySAJ6UegDW9i9fv2NDH1Q
         1nQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707253889; x=1707858689;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zEkVGjcaygh1vK+ux9W8nA0sI6zRg3ppOKoN4fJJ6BY=;
        b=MfiTpNxYKuFQnoBp1yCeARc4/P7QNz/9YcXW1cKHx42jupzjY+zvPSG4O6R7rwGgLZ
         x2tVGiJe9oqSNd7r6b/JnHB3U7oiQsvE7326BLzONlZ0bts81W6MohX7r/+vLwjLHXtr
         yFaUO01l5WP5SJD78rNlOIA+MfLY+fRMdL2MBETtCykjQ7j1F1Z9B0atuGtwyRTTLoad
         UaDw69G5pd8CT9HsxGcbSa6d+ot2DYMqOqArbQKQjGjMHY7ifkcRNJr6CaDQsRj0tzvx
         hL10J3hadqCNN0jUJfNHyxIkR+hqpaRUz+h3/w3Cc86Z5k/UGJt8QKNPanOdL8TqRVe6
         L9ig==
X-Gm-Message-State: AOJu0YwC6fgV3IUXF819SYK1Ac5jy5FsNgPfopa+de5fziJ5BY42Bu6a
	E0DIYHstZ0UrBgyQt+94Y8jkjzNnvwSNyC06adZvBH5MjdWPMO3Rinsa9EW2
X-Google-Smtp-Source: AGHT+IEVQDpeGqRX22t/ElsW8RVyxONGy4C+c2+QfoHZNzG1ccDB+F+iYeDyXg7VzHseI/q1LvZGrA==
X-Received: by 2002:a17:902:efd2:b0:1d8:cd7b:85fa with SMTP id ja18-20020a170902efd200b001d8cd7b85famr2318976plb.68.1707253889636;
        Tue, 06 Feb 2024 13:11:29 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCXzLlR6223QIn6MzrC/9SXgXI21u6PCORwYuzJgobLZeAKGj3zgYW6clQvx+D3k2gsVQFSo9c5fPJU2Cqo435rbDD4pCeEJ3nvWskbpszt9OwiELhBLTdIr1tu/eS35/sh5PcjWOYhZgXzzdBzY7Pcj1kNjioeOZL23QNLJyJi9YuZdVHOpNnlAeOn6ns0UIik+D+LjDENvXdLZMbV9IVzbuQ==
Received: from xplor.waratah.dyndns.org (125-236-136-221-fibre.sparkbb.co.nz. [125.236.136.221])
        by smtp.gmail.com with ESMTPSA id mg3-20020a170903348300b001d91b617718sm2360050plb.98.2024.02.06.13.11.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Feb 2024 13:11:28 -0800 (PST)
Received: by xplor.waratah.dyndns.org (Postfix, from userid 1000)
	id 59652360444; Wed,  7 Feb 2024 10:11:24 +1300 (NZDT)
From: Michael Schmitz <schmitzmic@gmail.com>
To: linux-m68k@vger.kernel.org
Cc: geert@linux-m68k.org,
	uli@fpond.eu,
	fthain@linux-m68k.org,
	viro@zeniv.linux.org.uk,
	cip-dev@lists.cip-project.org,
	Michael Schmitz <schmitzmic@gmail.com>
Subject: [PATCH v3 7/8] m68k: fix livelock in uaccess
Date: Wed,  7 Feb 2024 10:11:03 +1300
Message-Id: <20240206211104.26421-8-schmitzmic@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240206211104.26421-1-schmitzmic@gmail.com>
References: <20240206211104.26421-1-schmitzmic@gmail.com>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>

From: Al Viro <viro@zeniv.linux.org.uk>

commit bd75497a77ccae9a5e1b0f1a3fa8283d67b21f4c upstream.

m68k equivalent of 26178ec11ef3 "x86: mm: consolidate VM_FAULT_RETRY handling"
If e.g. get_user() triggers a page fault and a fatal signal is caught, we might
end up with handle_mm_fault() returning VM_FAULT_RETRY and not doing anything
to page tables.  In such case we must *not* return to the faulting insn -
that would repeat the entire thing without making any progress; what we need
instead is to treat that as failed (user) memory access.

Tested-by: Finn Thain <fthain@linux-m68k.org>
Tested-by: Geert Uytterhoeven <geert@linux-m68k.org>
Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>
Signed-off-by: Al Viro <viro@zeniv.linux.org.uk>
[MSch: v4.4 backport compile errors fixes]
Cc: <cip-dev@lists.cip-project.org> # 4.4
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

