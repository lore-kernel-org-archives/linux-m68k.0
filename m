Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 916AC1B946
	for <linux-m68k@vger.kernel.org>; Tue,  6 Feb 2024 21:11:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707253888; cv=none; b=CziUCNkWezIwTrkSHlFIPsxau9lOYMo4GHMym2VVFA9vfwN6MBwrfneUTgm2HGTcABoLU3XzqOqLTRiZTgapA0NGp12efMEk9RcAmQtn3zywZrdgim9RUA4iIuHW4BbJSN/GxFIFm7NFlZPeBlj+yUGAl+BOOAwBuk+TABbJ5oQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707253888; c=relaxed/simple;
	bh=tpMg/EBe7U1SigMRHLPr9qvAHXv+iYSQ2JPTu6rDBJw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=F0Jjuz0nVIKpr5vVBGqJpKz2oc0rPWFOOSXu/4fybUb9ORsHqASTCA3xYfOu880X2JvGpBs0ko/i6cYvjBYshNlGQ3J06tekW5p8Mt2JobpHF8b4mm+L7ELa3LTQ8laecV4Cx8JSqoACZgJoN9NNDHJR/4roDZqSJ/jSChB3kpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PMIDI50U; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PMIDI50U"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-1d74045c463so48802665ad.3
        for <linux-m68k@vger.kernel.org>; Tue, 06 Feb 2024 13:11:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707253886; x=1707858686; darn=vger.kernel.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PqE6uH8/Cq6TCWIinemSe0QCaBK2NUC2RCn1iBCFHF4=;
        b=PMIDI50UAROzeBhFz6mhdXn4DRvQmIdLlg/H82lRNe8dzs4VkupUwy/UbD3wVh4hsR
         wyAZRncP4muVNZw21UpU9LeUoKHoML4SqHPB2pcv4qVjKBnfLx5gHHLi4dPJ3jMReTEC
         WWmGxsnhdbm1pvub8M3rDYFyE7JU8G2sT2JpU3NPnoF+IudNdp8EsuDzi0qR9dcZ7EoY
         tAzrh6Unj5tQXITsjdQqjN/mYJjYsHjrk6XHbtNr2Ikj6zPFbGTldorBQFGAwHMgOaL5
         vaNlv3OPdwg2XX7v9DyqWhMYG68c45qGrOqhC01tNwqJQ+HZRHepc5S63OuAnESSV0qi
         vyoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707253886; x=1707858686;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PqE6uH8/Cq6TCWIinemSe0QCaBK2NUC2RCn1iBCFHF4=;
        b=aVR9FWt/prC9WW8+/GSzevfO6T2iYIr9Qce/LZwTPpOmVIb7EP1xZllsnI8twgYQqu
         jU2K4w/PVMoareUKusJS2QN5uMCHAVfUcVi2wuYy3p8MwVNaShWi183xcS42iJKTk3WJ
         QvK9HM/8xOgvbF9zbgwRk7140fWXLlWKxd8q1DTZoW/444t7xRr71f6/y4b6c1jzUapV
         dQQBuICRNLdYQsQMcKsiH2h0tBAEetWyh7IllzhF/8tQKJ4GTL1777G9vH0S/mYUTBaG
         v2HkyJ4zVSLt4uZ9asz0uni8FhNxngLJnDbgyhYpKhXCuow0JNzrIDoplLCq9gtxH9a5
         lzsg==
X-Gm-Message-State: AOJu0YycaGNQFWCATD7TyfkS6Uezo9lOJDD51M96H4sfaeaQm6eP86D7
	kb/hfFfwNO2QKWsHp2bEW2hr65KeXi17YVbMxrTN2VxO1CVDPHTW
X-Google-Smtp-Source: AGHT+IGmwQSPPVAt+TE0g2WV2ikuAiWW1r5pv64s3VnqEsrnUBfJD2yzCMTBgUZsPlSokFKOt089Fg==
X-Received: by 2002:a17:903:2288:b0:1d9:a50f:90eb with SMTP id b8-20020a170903228800b001d9a50f90ebmr2527928plh.38.1707253884921;
        Tue, 06 Feb 2024 13:11:24 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCVhe+1o7MZf0ZSLPDZ89G3eyIBq8NltOXhakk3m26xDrJwW4qI7QoVVnk8nsn8yXic0ptWCm4BtqEEpC63k7SXFYDWL0F7v6CpArw4roTs9lTrQ3VClGvkvr+sgbx23CMJ6S1K9xzafRTONIiq3PSrR3BtkPS9nEja//QnuY5ccxgszJXjtVlPsRVz7omfIXAElZLt8r/xgRSwb4gzb7BCSvA==
Received: from xplor.waratah.dyndns.org (125-236-136-221-fibre.sparkbb.co.nz. [125.236.136.221])
        by smtp.gmail.com with ESMTPSA id kv4-20020a17090328c400b001d9df9589e5sm1661523plb.10.2024.02.06.13.11.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Feb 2024 13:11:24 -0800 (PST)
Received: by xplor.waratah.dyndns.org (Postfix, from userid 1000)
	id 4072136031F; Wed,  7 Feb 2024 10:11:21 +1300 (NZDT)
From: Michael Schmitz <schmitzmic@gmail.com>
To: linux-m68k@vger.kernel.org
Cc: geert@linux-m68k.org,
	uli@fpond.eu,
	fthain@linux-m68k.org,
	viro@zeniv.linux.org.uk,
	Michael Schmitz <schmitzmic@gmail.com>,
	cip-dev@lists.cip-project.org
Subject: [PATCH v3 3/8] m68k: include module.h to make use of exception handling in traps.c
Date: Wed,  7 Feb 2024 10:10:59 +1300
Message-Id: <20240206211104.26421-4-schmitzmic@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240206211104.26421-1-schmitzmic@gmail.com>
References: <20240206211104.26421-1-schmitzmic@gmail.com>
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

