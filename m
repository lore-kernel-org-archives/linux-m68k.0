Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0105929AF
	for <linux-m68k@vger.kernel.org>; Mon,  5 Feb 2024 02:32:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707100366; cv=none; b=XpxCbooR3g1tkR0/XJDbS0wp8qZeGzGXzSGhucHPUbeBQfr/pBFvKYBi9ZAX4jkH2gD/deLUGk1kFPt91cC7v3z0DEZhXid20AMlcAzl4wz1GpMrxZ4BoBUwVgni+CX7TOqa38jUdo3ICNDGF3KYzZfbx39uZbkyShC/IQ5GdMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707100366; c=relaxed/simple;
	bh=tpMg/EBe7U1SigMRHLPr9qvAHXv+iYSQ2JPTu6rDBJw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=LmTQHkkR/ZSEJEHSTSrymh14+OUiKzYUySkM/NaDTTVBFkkW7/yzQisPOLOm8B3sw+TdPwZOX71puOckGibSMt/M2gy4Zb2PRFvHYacgcNZt4o8wgJHzzdMNF9CnFgyZSZ8NFgc6yxz4Zuzx/8Nm8KZ7E+o6N0pVwKJNlYOUbKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XBca13p6; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XBca13p6"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-5cddfe0cb64so3125613a12.0
        for <linux-m68k@vger.kernel.org>; Sun, 04 Feb 2024 18:32:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707100364; x=1707705164; darn=vger.kernel.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PqE6uH8/Cq6TCWIinemSe0QCaBK2NUC2RCn1iBCFHF4=;
        b=XBca13p6AxteuVdK2+SHsrTYrkDBIBtlG4ZBL8EA/F/lKkAebKh69Pm9WPT88wjnX0
         EhY52zMZc7ttIbUSG8WV5PVwo8lvZkTmNu3RDvK4mjslwyW33NH1EMuwbEBfFVNUDsek
         7ulYXTH/kcvf52u8/fq8pTXbt4eBOKnNjEYq9QM3tGPK3jTOjm+3833jsq4NoLpBP9Vf
         gWAoN+6JPmpFgqJ3C1lTDCY67D7ht0KTCfkJa/apyEX/zx3HXK2u2IJoKqD4mQAAf4Z4
         fU+4TgniHBP4a7MGT9429Dq6g12A45HrUgi0Fed66JALVDJGu3Tk7CmSprxfQq4IgjGU
         gPeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707100364; x=1707705164;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PqE6uH8/Cq6TCWIinemSe0QCaBK2NUC2RCn1iBCFHF4=;
        b=ADSryW/tVWRgTtjdJY4WoiFS33b5ZOteYz70XvE3St9JvyfCzMRmoKP0F65S9P0umU
         VWvMIdvpMWmNDVg5mbMJkM/zd1cy9bIFqObzVhuYraNCvBygULkwLkvbQwONIlNWntZL
         ct1bAfO8V5sEgI3gSKNSZRdBVry/M2QAkEHh+wUVMFb/NhfCHx93MoYqyn/HRZ97pcGD
         RfOTL/YHzW3oHl9OZ8DFpUOpEf2wl4U1B0Ll0WwLRGBmgm1cPPoIYUqLSveRnTNakeHm
         MU9nUHcmuwVgATjnd7inIdxtPqIRNv/NX/yV3uaXE615n4OF87H5vRCIvYXmvQsQv7hD
         PANw==
X-Gm-Message-State: AOJu0Yx+F1axinDhck6YDDJtIw7OzE1i0zSZj4ZDuA8G9u/5euM/uzY9
	CWDt2780FUf2s+SnXa61JjB2kxXBDG8e2ESjYilpXlYUHaXz0Y6F
X-Google-Smtp-Source: AGHT+IEPRBZ8aEhOP+55baxn1zYfWFn8N0/EEv9JPS7OqFm9rR0QoylZUqHPdtvj2iqiQaEiIkqsjA==
X-Received: by 2002:a05:6a20:289d:b0:19b:81be:34e4 with SMTP id q29-20020a056a20289d00b0019b81be34e4mr9439625pzf.50.1707100364237;
        Sun, 04 Feb 2024 18:32:44 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCXezBHIlyJOQ/bYNCP6CDaHuyj4OwZZYcDLha5EicTIEkJueTrd86bG5MXiGwXd03kfYEKQZtjC+7HBpGYC2nymy31qIPlkwDijv5QD3z8fW0fvIbNX8PH1YYKo3PbEIs3SSmr8SN0TVud4d07zZCNv4ol6oqS6R5wDixIXYklmFgmVnT+7YB/hDRlVrPXgX7EjXpIAyb/lDafnfHBLUhOwwA==
Received: from xplor.waratah.dyndns.org (125-236-136-221-fibre.sparkbb.co.nz. [125.236.136.221])
        by smtp.gmail.com with ESMTPSA id ln14-20020a056a003cce00b006e03b82016asm1652200pfb.33.2024.02.04.18.32.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Feb 2024 18:32:43 -0800 (PST)
Received: by xplor.waratah.dyndns.org (Postfix, from userid 1000)
	id CD62236034E; Mon,  5 Feb 2024 15:32:39 +1300 (NZDT)
From: Michael Schmitz <schmitzmic@gmail.com>
To: linux-m68k@vger.kernel.org
Cc: geert@linux-m68k.org,
	uli@fpond.eu,
	fthain@linux-m68k.org,
	viro@zeniv.linux.org.uk,
	Michael Schmitz <schmitzmic@gmail.com>,
	cip-dev@lists.cip-project.org
Subject: [PATCH RFC v2 3/8] m68k: include module.h to make use of exception handling in traps.c
Date: Mon,  5 Feb 2024 15:32:31 +1300
Message-Id: <20240205023236.9325-4-schmitzmic@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240205023236.9325-1-schmitzmic@gmail.com>
References: <20240205023236.9325-1-schmitzmic@gmail.com>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>

Backporting commit 513138a14063760e (m68k: Only force 030
bus error if PC not in exception table) to v4.4 by the CIP
project revealed a build error due to extable.h not yet
available.

extable.h was split off module.h in v4.8 (commit
0ef7653797addea8) so amend 513138a14063760e accordingly.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202401302324.d3o6tgup-lkp@intel.com/
Cc: <cip-dev@lists.cip-project.org> # 4.4
Cc: Ulrich Hecht <uli@fpond.eu>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>
Signed-off-by: Michael Schmitz <schmitzmic@gmail.com>
---
 arch/m68k/kernel/traps.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/m68k/kernel/traps.c b/arch/m68k/kernel/traps.c
index c547140b8325..2209214cf91c 100644
--- a/arch/m68k/kernel/traps.c
+++ b/arch/m68k/kernel/traps.c
@@ -29,7 +29,7 @@
 #include <linux/init.h>
 #include <linux/ptrace.h>
 #include <linux/kallsyms.h>
-#include <linux/extable.h>
+#include <linux/module.h>
 
 #include <asm/setup.h>
 #include <asm/fpu.h>
-- 
2.17.1

