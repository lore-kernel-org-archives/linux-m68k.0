Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B4871B94D
	for <linux-m68k@vger.kernel.org>; Tue,  6 Feb 2024 21:11:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707253885; cv=none; b=UxKxkkRivlOKmUw/C+jggDq2n40m0jTtDPobjfac4NOeIL0yL+3LEwW3UUOsxsdSYmPah5fB+DRmdoQunrnfWb2XLSndyr8OLN+Gw2MJbOM5Ggk0W8RIkpFpj8huCqZ/fSUO8LP76shy7t5XdWyAOV159KKpY1TvIV1ABWmMnyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707253885; c=relaxed/simple;
	bh=BWsWqyz1blA+TRl1jYyuY4H2R3U/VTPI6HqjB0o20sY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=ln5iS78RpPHGbyeTUS4WIHNdR0c6PoXsnbSA/HYKGvMRs9ECZFOs2gBcQ9As7VfVNGKlVTsAnPcfo0MXz21FDfkEF4i+ToLa163WkTbs+gQBcCuwpTAICie4CrGF14Zi6pKnOgzm9kpd5ADizQMcz+l+A2DVbmsayy0woc80NPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lu+MTzB6; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lu+MTzB6"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1d953fa3286so44240035ad.2
        for <linux-m68k@vger.kernel.org>; Tue, 06 Feb 2024 13:11:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707253883; x=1707858683; darn=vger.kernel.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GFF8vC7r8XusyZDgQUYf/pE8/Yo6kYAPsSmPJdF37Z8=;
        b=lu+MTzB6ASYmmcHhdWyIE2GtMqY28uN3Kk2rx6FYSk1fZUmkatYI3qHUerB8ttyTFN
         AZErgVkQ0LCY++mLvvfrPC06tTtpeAGsRuwDrjrkW475InC5/8TdxjPW37xlL7LAXcbU
         GdCmqpe68gWZmA1o4Kfk/5p0HJ4NdLYPrTrJNgTIPVxqlbUEcHDKgYIIWpKszbT09mLk
         XQ1EQKTU8xOd83lhbY5j+pWXSbbHGeyARscr+tjIhxadZK0ct+Fp6gFCwrfksPPK4Cpa
         +XSmuaQ6s4fEMslTIDMBC80/af1nHWG9jbyDJAXIjMjCPrs8fZMmEc2X+1qDBf1h0nWt
         xvQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707253883; x=1707858683;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GFF8vC7r8XusyZDgQUYf/pE8/Yo6kYAPsSmPJdF37Z8=;
        b=wQBrtHV24r7oZ+YWN7mR2b24cffAt6vqhmL8CUDk8ITW0x1T44+j7xMWBo1u66JpFY
         K9d4Sv5gW7cmWd7Y6dHobTaDrxfVasIRKYsVJ/Lbmbu4/gH4JMCRNRqL+tBdlMMMKx1/
         6qJkdlCMc/2Qw5OBEwIonLzduAgLYdYtqnhPkE6HVFSpzX0VG9kmIpUbgxwrqheXSeGb
         RgngyxjpvUi+j6PambS6FsF3LGBM7omU4qVO1LPCfc0FE3i20b4oKtrGBgrLiWtrt+oq
         4iV3jCjICg/ulMCbeXPiALm4LuPirJTrQk/R5MKfLfWIAibS7sRz5dRPauhiDTYNKrHt
         GDwA==
X-Gm-Message-State: AOJu0Yzn2MJak4Bjy4Zp0LAdWbYZS/g7JKMs47+qmS0FRxaH7hdxIJOt
	1lrE/+T6WALuII/rHPxxVgGxCVAQdOwmKQ4xC4W91aAw54RGv6AH
X-Google-Smtp-Source: AGHT+IGKW1/+UlOaJuHilemedzVzmVBl6PwSF7H4Jrk8td7Oxzh8odBd6IKuYGVpuHYroeW35upkpQ==
X-Received: by 2002:a17:90a:8a88:b0:296:1127:ceca with SMTP id x8-20020a17090a8a8800b002961127cecamr810328pjn.6.1707253882835;
        Tue, 06 Feb 2024 13:11:22 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCW2f259l6w9vDz+edE/JK+w2+LUG+XaxYMMK94BVefiBXVw9qrIOiGzpDksrD4eU6OHVxX2+AVbC6+ECeD0fLYNl72lWORHCxLU12a4nc6UFpvdgQDxBbEPY/QQCwQI5BA/MN07fFugmGOLI3Bh1G6YVpzixm9BQAPx+WSsFE+UrjFc
Received: from xplor.waratah.dyndns.org (125-236-136-221-fibre.sparkbb.co.nz. [125.236.136.221])
        by smtp.gmail.com with ESMTPSA id cz11-20020a17090ad44b00b00296bf413fd0sm2199733pjb.35.2024.02.06.13.11.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Feb 2024 13:11:22 -0800 (PST)
Received: by xplor.waratah.dyndns.org (Postfix, from userid 1000)
	id 17FBE36031A; Wed,  7 Feb 2024 10:11:19 +1300 (NZDT)
From: Michael Schmitz <schmitzmic@gmail.com>
To: linux-m68k@vger.kernel.org
Cc: geert@linux-m68k.org,
	uli@fpond.eu,
	fthain@linux-m68k.org,
	viro@zeniv.linux.org.uk,
	Michael Schmitz <schmitzmic@gmail.com>
Subject: [PATCH v3 2/8] m68k: Only force 030 bus error if PC not in exception table
Date: Wed,  7 Feb 2024 10:10:58 +1300
Message-Id: <20240206211104.26421-3-schmitzmic@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240206211104.26421-1-schmitzmic@gmail.com>
References: <20240206211104.26421-1-schmitzmic@gmail.com>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>

commit 513138a14063760ef611f18ba76c5c7915ff8cdd upstream.

__get_kernel_nofault() does copy data in supervisor mode when
forcing a task backtrace log through /proc/sysrq_trigger.
This is expected cause a bus error exception on e.g. NULL
pointer dereferencing when logging a kernel task has no
workqueue associated. This bus error ought to be ignored.

Our 030 bus error handler is ill equipped to deal with this:

Whenever ssw indicates a kernel mode access on a data fault,
we don't even attempt to handle the fault and instead always
send a SEGV signal (or panic). As a result, the check
for exception handling at the fault PC (buried in
send_sig_fault() which gets called from do_page_fault()
eventually) is never used.

In contrast, both 040 and 060 access error handlers do not
care whether a fault happened on supervisor mode access,
and will call do_page_fault() on those, ultimately honoring
the exception table.

Add a check in bus_error030 to call do_page_fault() in case
we do have an entry for the fault PC in our exception table.

I had attempted a fix for this earlier in 2019 that did rely
on testing pagefault_disabled() (see link below) to achieve
the same thing, but this patch should be more generic.

Tested on 030 Atari Falcon.

Reported-by: Eero Tamminen <oak@helsinkinet.fi>
Link: https://lore.kernel.org/r/alpine.LNX.2.21.1904091023540.25@nippy.intranet
Link: https://lore.kernel.org/r/63130691-1984-c423-c1f2-73bfd8d3dcd3@gmail.com
Signed-off-by: Michael Schmitz <schmitzmic@gmail.com>
Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
Link: https://lore.kernel.org/r/20230301021107.26307-1-schmitzmic@gmail.com
Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 arch/m68k/kernel/traps.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/m68k/kernel/traps.c b/arch/m68k/kernel/traps.c
index 6c9ca24830e9..c547140b8325 100644
--- a/arch/m68k/kernel/traps.c
+++ b/arch/m68k/kernel/traps.c
@@ -29,6 +29,7 @@
 #include <linux/init.h>
 #include <linux/ptrace.h>
 #include <linux/kallsyms.h>
+#include <linux/extable.h>
 
 #include <asm/setup.h>
 #include <asm/fpu.h>
@@ -549,7 +550,8 @@ static inline void bus_error030 (struct frame *fp)
 			errorcode |= 2;
 
 		if (mmusr & (MMU_I | MMU_WP)) {
-			if (ssw & 4) {
+			/* We might have an exception table for this PC */
+			if (ssw & 4 && !search_exception_tables(fp->ptregs.pc)) {
 				pr_err("Data %s fault at %#010lx in %s (pc=%#lx)\n",
 				       ssw & RW ? "read" : "write",
 				       fp->un.fmtb.daddr,
-- 
2.17.1

