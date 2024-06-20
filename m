Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAFD01CE9E6
	for <linux-m68k@lists.linux-m68k.org>; Thu, 20 Jun 2024 17:58:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718906319; cv=none; b=uq53zL10EtOEhnOMUHo1OoRLKE0QB1H2eGrNzFEe1mvO3nSMe/TTkKEsLqP23H5Zs2q/oOFyAKhrfaCazmdPWt3q+dp/lfkmNY1N2X2veVXG5UIoIce6OPjk2gPmK7MQ7MGRAg5p0VpYvCSxkYbo6l3hVjBV59mPI4RTWvlX3po=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718906319; c=relaxed/simple;
	bh=qDgzpvKMzB33HuJtkLcNWCvXNPeJ2JXa19MfPLKu4GA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=STvJMXMFfzrcueApUKgvAs5yp/n6nsxRK+rQwX0cIGCEnQl+0fJisEorr6eGQ2j0RcdNEuAgijhK4e76mnU9ApGfNF9BYHTjloUrjALSjuTTRmmayv2szUqvTqWJgPGL62TmPoXjHH5veJIetxwg395ZTBS0dWehOp4i+ws2sMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g4BrH3Fr; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g4BrH3Fr"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-70623ec42c2so958525b3a.0
        for <linux-m68k@lists.linux-m68k.org>; Thu, 20 Jun 2024 10:58:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718906317; x=1719511117; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5UeGLEmgFCwB7SfnnVFN7CY07bSxQRD2zzo6uHvh98Y=;
        b=g4BrH3FrAtWnxMJKXsfLaPVPC6YbuRCY45IUNuOHmi5Q7hczsJgg+/zbKcCEfNoTje
         jIcZlQwl/GbUQ8paA42hYq9OmKya3oWJveDRHvKmlHsHnGDQdd+qrNp1a3rby3se1Lff
         yHdAgH/CEb+1vr7mVt5IDuUbUEiUoKxT9Mf7mAyqkLgpq3ggwWosCdI3R80+qYWD/MDh
         kHaIle3o/gPq/DwqKBNcRk8j5MTnyiCZY+tJNEP67NNLzsPfbJncznSVRxHtKqAK8MEi
         56rJznk25f5wlshxMFMHRdgDSDyLd/6VUOG9QTWPD2aLTffayu2MZ3c9pSeesAyxB+Te
         Bt7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718906317; x=1719511117;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5UeGLEmgFCwB7SfnnVFN7CY07bSxQRD2zzo6uHvh98Y=;
        b=Wy3QTIFSzwlafbeC775ApBqCkMOpquC4Unh13s9QhFZfunicYCOGQaIh+L7Aw9d+dj
         C5/iQKDw+peCdqRnInSkBpHTNMS6HuYzbb/thv4MeyStU2bCzAJJzuj4uNZraPIKRMDG
         hSgTGS3liiXdk0FiNKtvAkMq24ALPkMjVngAyPMXPwsQmhCrqHOYK5caOYyGvEwo3+gv
         SnKWQXpKM7LZ2FaiDgk4Vz9Ix+zK807MMhrtUjqkHxhM7NlQRnXyRQn/Zryv8cIvga0x
         wCCfDTs7TH0pI3Oaf2raKqyhXvzTFSvqBFHRFghQ2izOH1+Ya3CZNLCtcy/JPrmKbk4u
         FBIQ==
X-Forwarded-Encrypted: i=1; AJvYcCX4oIDGfOMvj8N033aipHdFlmpVJC34GCXeWKLCTfwx6JGoU4VO2F2yzDnc3hDifkIkldOwc36SnoqB1/ti0oVqgXcZMTs92v24HGPUyS/9
X-Gm-Message-State: AOJu0YxRfW576lQmCabM6fURSspkKxUJwZUIcR3KsrNdac4DqEA9s8Zt
	KK1H4C4mnJu6W9Wvc4R6vZDBZr28jLOBQ3o1y+a9X+qihEkrAzDuKIP/bTdw3us=
X-Google-Smtp-Source: AGHT+IF2582ElUzYGc8sFWyeezew6KYJJtZelHSbtcwZADymS9B/iS/gSLgFlcKPRR5Z3cyEALz5Xw==
X-Received: by 2002:a05:6a20:a51b:b0:1ac:3b81:2b5a with SMTP id adf61e73a8af0-1bcba15b47bmr7898847637.8.1718906317030;
        Thu, 20 Jun 2024 10:58:37 -0700 (PDT)
Received: from localhost ([216.228.127.128])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-705e5fbe103sm9526573b3a.72.2024.06.20.10.58.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jun 2024 10:58:36 -0700 (PDT)
From: Yury Norov <yury.norov@gmail.com>
To: linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Hugh Dickins <hughd@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Yury Norov <yury.norov@gmail.com>,
	linux-m68k@lists.linux-m68k.org
Cc: Alexey Klimov <alexey.klimov@linaro.org>,
	Bart Van Assche <bvanassche@acm.org>,
	Jan Kara <jack@suse.cz>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Matthew Wilcox <willy@infradead.org>,
	Mirsad Todorovac <mirsad.todorovac@alu.unizg.hr>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Sergey Shtylyov <s.shtylyov@omp.ru>,
	Greg Ungerer <gerg@linux-m68k.org>
Subject: [PATCH v4 31/40] m68k: optimize get_mmu_context()
Date: Thu, 20 Jun 2024 10:56:54 -0700
Message-ID: <20240620175703.605111-32-yury.norov@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240620175703.605111-1-yury.norov@gmail.com>
References: <20240620175703.605111-1-yury.norov@gmail.com>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

get_mmu_context() opencodes atomic find_and_set_bit_wrap(). Simplify
it by using find_and_set_bit_wrap().

CC: Geert Uytterhoeven <geert@linux-m68k.org>
Signed-off-by: Yury Norov <yury.norov@gmail.com>
Acked-by: Greg Ungerer <gerg@linux-m68k.org>
---
 arch/m68k/include/asm/mmu_context.h | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/m68k/include/asm/mmu_context.h b/arch/m68k/include/asm/mmu_context.h
index 141bbdfad960..2e61063aa621 100644
--- a/arch/m68k/include/asm/mmu_context.h
+++ b/arch/m68k/include/asm/mmu_context.h
@@ -3,6 +3,7 @@
 #define __M68K_MMU_CONTEXT_H
 
 #include <asm-generic/mm_hooks.h>
+#include <linux/find_atomic.h>
 #include <linux/mm_types.h>
 
 #ifdef CONFIG_MMU
@@ -35,12 +36,11 @@ static inline void get_mmu_context(struct mm_struct *mm)
 		atomic_inc(&nr_free_contexts);
 		steal_context();
 	}
-	ctx = next_mmu_context;
-	while (test_and_set_bit(ctx, context_map)) {
-		ctx = find_next_zero_bit(context_map, LAST_CONTEXT+1, ctx);
-		if (ctx > LAST_CONTEXT)
-			ctx = 0;
-	}
+
+	do {
+		ctx = find_and_set_bit_wrap(context_map, LAST_CONTEXT + 1, next_mmu_context);
+	} while (ctx > LAST_CONTEXT);
+
 	next_mmu_context = (ctx + 1) & LAST_CONTEXT;
 	mm->context = ctx;
 	context_mm[ctx] = mm;
-- 
2.43.0

