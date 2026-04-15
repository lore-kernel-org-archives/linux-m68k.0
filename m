Received: from mail.kernel-space.org (v2202511311555398556.powersrv.de [46.38.245.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26BC319D8BC
	for <linux-m68k@vger.kernel.org>; Wed, 15 Apr 2026 21:17:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.38.245.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776287863; cv=none; b=EifcJ5qambGG8y27Hf5up401NV70JaedH1xw++4SvNSKBsZDmYuzBbSrtbrcbtYVKg40M6VI7Jzv2PspuGdr32bH4r/0QwddZxROvZutFAER6yI5eJ9TET92+3JU9YJaZML8bL+7amEu+VSD46PrvWRfQCNEp2qbjlbZxq2glWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776287863; c=relaxed/simple;
	bh=mfygBt/UBm9KywlzLA/yONxTULVOK/uKhLupH7Bjdwc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=K2w0F4w3jjfK6IhwmAHg2xuMJiWT3K56LIKX3ivI7coNm9lvfzH7NsMekmtLppnYvq02xBQnByhOvQmE4fvmmPfTfYPJQFnmwx1lKqOCJ/1rDQE+Fzm7UoAY78tc8eu7wtYl7kaXKc7htq0WPZYRum8nOt29NhyDKZbvlmfEDFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernel-space.org; spf=pass smtp.mailfrom=kernel-space.org; dkim=pass (1024-bit key) header.d=kernel-space.org header.i=@kernel-space.org header.b=yLlwqQsT; arc=none smtp.client-ip=46.38.245.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernel-space.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel-space.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=kernel-space.org header.i=@kernel-space.org header.b="yLlwqQsT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel-space.org;
	s=s1; t=1776286258;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hAwIhXdrbOe2QiJVNlPENyMpYXQOshqiN2xR2v1UFiw=;
	b=yLlwqQsTpIzJ957yehjjPj6QkDJzcPxxMbvT2Tuh8agmrn7kIua3thsr7X4zHYT1EIz6LG
	7NjOQeilGsuvJuvehkNwnAnl1BbuiXX05o3OEwxpaeYImC2OvRnlIeG8ofK9rG/JM3ZDfN
	+1cIExHxypZBE+KTgdxmwyLeXX7Pvwo=
Received: from archlinux (<unknown> [2a07:7e81:7daa:0:62cf:84ff:feee:627])
	by oreshnik (OpenSMTPD) with ESMTPSA id 180e9c2b (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO);
	Wed, 15 Apr 2026 20:50:58 +0000 (UTC)
From: Angelo Dureghello <angelo@kernel-space.org>
To: gerg@linux-m68k.org
Cc: geert@linux-m68k.org,
	linux-m68k@vger.kernel.org,
	Angelo Dureghello <angelo@kernel-space.org>
Subject: [PATCH 2/2] m68k: update boards company name
Date: Wed, 15 Apr 2026 22:50:42 +0200
Message-ID: <20260415205042.20930-2-angelo@kernel-space.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260415205042.20930-1-angelo@kernel-space.org>
References: <20260415205042.20930-1-angelo@kernel-space.org>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Sysam name has changed to Kernelspace, updating each reference.

Signed-off-by: Angelo Dureghello <angelo@kernel-space.org>
---
 arch/m68k/Kconfig.machine    | 8 ++++----
 arch/m68k/coldfire/amcore.c  | 4 ++--
 arch/m68k/coldfire/stmark2.c | 4 ++--
 3 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/m68k/Kconfig.machine b/arch/m68k/Kconfig.machine
index de39f23b180e..f3f3c7871ad1 100644
--- a/arch/m68k/Kconfig.machine
+++ b/arch/m68k/Kconfig.machine
@@ -275,16 +275,16 @@ config M5407C3
 	  Support for the Motorola M5407C3 board.
 
 config AMCORE
-	bool "Sysam AMCORE board support"
+	bool "Kernelspace AMCORE board support"
 	depends on M5307
 	help
-	  Support for the Sysam AMCORE open-hardware generic board.
+	  Support for the Kernelspace AMCORE open-hardware generic board.
 
 config STMARK2
-	bool "Sysam stmark2 board support"
+	bool "Kernelspace stmark2 board support"
 	depends on M5441x
 	help
-	  Support for the Sysam stmark2 open-hardware generic board.
+	  Support for the Kernelspace stmark2 open-hardware generic board.
 
 config FIREBEE
 	bool "FireBee board support"
diff --git a/arch/m68k/coldfire/amcore.c b/arch/m68k/coldfire/amcore.c
index c6cb1a5cc1a5..6531ef62bc01 100644
--- a/arch/m68k/coldfire/amcore.c
+++ b/arch/m68k/coldfire/amcore.c
@@ -1,7 +1,7 @@
 /*
- * amcore.c -- Support for Sysam AMCORE open board
+ * amcore.c -- Support for Kernelspace AMCORE open board
  *
- * (C) Copyright 2016, Angelo Dureghello <angelo@sysam.it>
+ * (C) Copyright 2026, Angelo Dureghello <angelo@kernel-space.org>
  *
  * This file is subject to the terms and conditions of the GNU General Public
  * License.  See the file COPYING in the main directory of this archive
diff --git a/arch/m68k/coldfire/stmark2.c b/arch/m68k/coldfire/stmark2.c
index 036a6ae5f599..85502b81175e 100644
--- a/arch/m68k/coldfire/stmark2.c
+++ b/arch/m68k/coldfire/stmark2.c
@@ -1,7 +1,7 @@
 /*
- * stmark2.c -- Support for Sysam AMCORE open board
+ * stmark2.c -- Support for Kernelspace AMCORE open board
  *
- * (C) Copyright 2017, Angelo Dureghello <angelo@sysam.it>
+ * (C) Copyright 2026, Angelo Dureghello <angelo@kernel-space.org>
  *
  * This file is subject to the terms and conditions of the GNU General Public
  * License.  See the file COPYING in the main directory of this archive
-- 
2.53.0

