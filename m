Received: from out30-101.freemail.mail.aliyun.com (out30-101.freemail.mail.aliyun.com [115.124.30.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C097132464
	for <linux-m68k@lists.linux-m68k.org>; Tue, 18 Jun 2024 07:32:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718695938; cv=none; b=JMZHijQFj69gf91RP03UjqqM5mZo+SHXbsCLFu69aGNH6jnFV3qgRGS9M2S6T/3vAmRt0OIEoBkFXY00BJoZ3cMfURtUtZmDxRbxRio7pGRDdYQI7j7hoJbPhudiHgtX5WdoaerMpEpXJloMaI4ITvPWuFKLKOTRup7nWHU8JpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718695938; c=relaxed/simple;
	bh=ZktBFOwRuY4aazY7UdEZiHGUio1mtMqQO3qrKch905U=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Pomxc+4HC/jotRAh9t4g1/9AK+A63Ogk2CtQBrRHi9ugq1HoIna7H3Eg8e4N8bQxh5u5xCS2CV694zENnzICC2ROQiklamJnyvS2s3f/oCqLylWn0ZjPHL2WByr8jDjGBadkZYGkhx9TMBsZ6vSqOvNpcl26zKFcthgurnzk9so=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=DQAWRcSW; arc=none smtp.client-ip=115.124.30.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="DQAWRcSW"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1718695933; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=2Bh1cp4ZF0UufDuRsrdOwB5rxLCrk3UpNkP4y2knrHg=;
	b=DQAWRcSWAHQdzzUiYqAlts1+1wKFYm7X/5PFiNrT7ahqJ5zxSAAAr5gS7vlysEOrWA6UhmoGIJ7gpLsKPsuxg+EgUT0hLo/91qsC6OStJx/3IQH5e/wMFQzlLNlIBcQwrYBezwnJEvyq/2NYdroT6takI5pLDPcuKcldSu35aQc=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R191e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033032014031;MF=jiapeng.chong@linux.alibaba.com;NM=1;PH=DS;RN=5;SR=0;TI=SMTPD_---0W8jQc3J_1718695926;
Received: from localhost(mailfrom:jiapeng.chong@linux.alibaba.com fp:SMTPD_---0W8jQc3J_1718695926)
          by smtp.aliyun-inc.com;
          Tue, 18 Jun 2024 15:32:12 +0800
From: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
To: geert@linux-m68k.org
Cc: linux-m68k@lists.linux-m68k.org,
	linux-kernel@vger.kernel.org,
	Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
	Abaci Robot <abaci@linux.alibaba.com>
Subject: [PATCH] zorro: Use str_plural() in amiga_zorro_probe()
Date: Tue, 18 Jun 2024 15:32:05 +0800
Message-Id: <20240618073205.65303-1-jiapeng.chong@linux.alibaba.com>
X-Mailer: git-send-email 2.20.1.7.g153144c
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use existing str_plural() function rather than duplicating its
implementation.

./drivers/zorro/zorro.c:155:22-39: opportunity for str_plural(zorro_num_autocon).

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Closes: https://bugzilla.openanolis.cn/show_bug.cgi?id=9350
Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
---
 drivers/zorro/zorro.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/zorro/zorro.c b/drivers/zorro/zorro.c
index 2196474ce6ef..2fca9115fc73 100644
--- a/drivers/zorro/zorro.c
+++ b/drivers/zorro/zorro.c
@@ -152,7 +152,7 @@ static int __init amiga_zorro_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, bus);
 
 	pr_info("Zorro: Probing AutoConfig expansion devices: %u device%s\n",
-		 zorro_num_autocon, zorro_num_autocon == 1 ? "" : "s");
+		 zorro_num_autocon, str_plural(zorro_num_autocon));
 
 	/* First identify all devices ... */
 	for (i = 0; i < zorro_num_autocon; i++) {
-- 
2.20.1.7.g153144c

