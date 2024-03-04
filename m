Received: from bg1.exmail.qq.com (bg1.exmail.qq.com [114.132.77.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75412947A
	for <linux-m68k@lists.linux-m68k.org>; Mon,  4 Mar 2024 08:55:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.132.77.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709542541; cv=none; b=tyeLzzq9QFbLyL51X43NEXj+rRLCvMudHuWhQb4vQxMt1N1umrm7CJ76hGyjMuQovxnHO0so9FIvQORXOtHPFXQItIhsO8IP/DhMSrUcyj5AAgx1BvP5GSj9idZuHYrFIBTsTjjvhdSn8BPRIDM4rMW6Mk9qcWERXjCQxWe3U+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709542541; c=relaxed/simple;
	bh=BCVH8caV3eJZnst0zjGp6cLMi/unVfiC59OWDvK3zu0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=lnB0SW2JFKDl0hV13TjbAqDXfx/yejItLT0qfU063dEbv7SWRMgv2iHq6+66m+GxGluQgDUxnR5A7jBhiGCApuda8e0t+5BvXXtnUnTHsla6iIY5yin1MJlx13H5wkjdGhb95MMthwxG0kRe7L+Oz57oT08G9ACLRqv3RCcVNIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=shingroup.cn; spf=pass smtp.mailfrom=shingroup.cn; arc=none smtp.client-ip=114.132.77.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=shingroup.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shingroup.cn
X-QQ-mid: bizesmtp69t1709542507tx60w49v
X-QQ-Originating-IP: j/t1lN4+T/EzHFlHMLaia4UWmdXBjku6RWJFXoUD+6s=
Received: from localhost ( [112.22.30.30])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 04 Mar 2024 16:55:05 +0800 (CST)
X-QQ-SSF: 01400000000000505000000A0000000
X-QQ-FEAT: 807rdhwoR6uy/+E3pBfzXZHZy374eWAo5dxa5PXnJBGPu1CMZTVkYdBWZ1Rfn
	WRqfAAXfqNtSoWjBKfW/UauMfOls/5n3cxyhJMpVSLNZEjIoTx0j+9wU8/Vvxi9VWknITPV
	ImI+R4cnzFhLl6gUbp5nL3pHJzR3fLr694h12Jtenim6uPNQWlgb/QRAlj3Kel9oqaQaRjm
	gvr03M1QiRV16oOlxNHUvHLE2r6rpkPlh6x/RfhmBHtCM3pvREXb05qEdDxCGek73M4FkRj
	NNM6c76GRXN/b4awzygIS2psbOwdspDed5M+oPqsdyfcWs++go01Sxghl+0sNzk95CXgxkA
	cbrEecG0CpIxp2gEEiuXSlBkSUoOfcm9MyzUFUiz2+rxPDmba89TDqTDYSA/b99YSCGG8jq
	RzOpGcW/epU=
X-QQ-GoodBg: 2
X-BIZMAIL-ID: 2245615275566401135
From: Dawei Li <dawei.li@shingroup.cn>
To: geert@linux-m68k.org
Cc: linux-m68k@lists.linux-m68k.org,
	linux-kernel@vger.kernel.org,
	Dawei Li <dawei.li@shingroup.cn>
Subject: [PATCH] m68k: Calculate THREAD_SIZE from THREAD_SIZE_ORDER
Date: Mon,  4 Mar 2024 16:54:55 +0800
Message-Id: <20240304085455.125063-1-dawei.li@shingroup.cn>
X-Mailer: git-send-email 2.27.0
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:shingroup.cn:qybglogicsvrgz:qybglogicsvrgz5a-1

Current THREAD_SIZE_OERDER implementatin is not generic for common case.

Improve it by:
- Define THREAD_SIZE_ORDER by specific platform configs.
- Calculate THREAD_SIZE by THREAD_SIZE_ORDER.

Suggested-by: Geert Uytterhoeven <geert@linux-m68k.org>
Signed-off-by: Dawei Li <dawei.li@shingroup.cn>
---

V1 -> V2:
- Remove ilog2().
- Calculate THREAD_SIZE by THREAD_SIZE_ORDER.

V1:
https://lore.kernel.org/lkml/20240228085824.74639-1-dawei.li@shingroup.cn/

 arch/m68k/include/asm/thread_info.h | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/arch/m68k/include/asm/thread_info.h b/arch/m68k/include/asm/thread_info.h
index 31be2ad999ca..3e31adbddc75 100644
--- a/arch/m68k/include/asm/thread_info.h
+++ b/arch/m68k/include/asm/thread_info.h
@@ -12,14 +12,15 @@
  */
 #if PAGE_SHIFT < 13
 #ifdef CONFIG_4KSTACKS
-#define THREAD_SIZE	4096
+#define THREAD_SIZE_ORDER	0
 #else
-#define THREAD_SIZE	8192
+#define THREAD_SIZE_ORDER	1
 #endif
 #else
-#define THREAD_SIZE	PAGE_SIZE
+#define THREAD_SIZE_ORDER	0
 #endif
-#define THREAD_SIZE_ORDER	((THREAD_SIZE / PAGE_SIZE) - 1)
+
+#define THREAD_SIZE	(PAGE_SIZE << THREAD_SIZE_ORDER)
 
 #ifndef __ASSEMBLY__
 
-- 
2.27.0

