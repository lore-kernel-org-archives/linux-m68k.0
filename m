Return-Path: <SRS0=L7lY=EO=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 633CCC388F9
	for <linux-m68k@archiver.kernel.org>; Sun,  8 Nov 2020 16:34:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2169B206ED
	for <linux-m68k@archiver.kernel.org>; Sun,  8 Nov 2020 16:34:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=timesys-com.20150623.gappssmtp.com header.i=@timesys-com.20150623.gappssmtp.com header.b="ulm0+L1X"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728006AbgKHQet (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Sun, 8 Nov 2020 11:34:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57278 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727958AbgKHQer (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Sun, 8 Nov 2020 11:34:47 -0500
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44CB7C0613CF
        for <linux-m68k@vger.kernel.org>; Sun,  8 Nov 2020 08:34:47 -0800 (PST)
Received: by mail-wr1-x441.google.com with SMTP id p8so5470106wrx.5
        for <linux-m68k@vger.kernel.org>; Sun, 08 Nov 2020 08:34:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=timesys-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=BYcQRBtxIjvgBMwV7s++gFNzxPk2VJ7fLL837R7lgKY=;
        b=ulm0+L1XI6sPYUt3htbLZdTIAY6hxnxy7XiOJlGWnD254I/J0M8sBSSVOpp+dk88lx
         WhRgpRwPh1xpzyQaOOiivZpWEk54SLzh5sH1yq7cfQlkjXFse/5aglrbd3avWJ2i0crr
         MeOP3Se4OzDUa6QWN0Wv0bSNDwHa4zx0vtu/6p571Q6gLmTHsuBP7RtyahrQvWT0Z9wO
         SiZm/HR2nuwFKLCEP/SKMJ4ci5P45+o/5VCKnwqkvKqEG9IH2TZZLAl3mouAdM8wuaCG
         KSrsQSdG1A1OT+mLHmkoWoDW2jxQlUcFZBeAPM8OgQyDV4astrRodp98bjdVRq7csmmj
         9F5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=BYcQRBtxIjvgBMwV7s++gFNzxPk2VJ7fLL837R7lgKY=;
        b=Ev7iMX0yrmTRyl3L6MLOE9CZI92hTgtIp1OydUj6jqrIkL9T15ZoJoGCoeFMX19gwr
         3QMrbUhEox3i9TG/tvzMOJVABySITaydtibzlIu6yWptgh6OL4t5FZIMX8zk/VqV8AXZ
         l82MZa/8NzTkx0w7pUPAOsJJQMCo4zz/RidC5qXuCtX45pZr+uEdTgW191bJIbBfdYqM
         asndU0IGALx70uHfKYZNDbKDXBeqJlya+iEvXGCEXiq60lqQiZbkAURY8tJcbyTwbILf
         CoK4a2DuL4nZ+mMzjFQUJtnwm+a1zxzaMvSch4Hb1p6me5HA2LqY93Z5sixjsQF3LXdK
         EVng==
X-Gm-Message-State: AOAM532hHa7OHr/p0Bw+vNeogKBlLzt88kFZsCCiQXl6pf4rNYc0CeOc
        gTiVMy2Ii7iIFqUgGFjRPqXOHonDHhr+QA==
X-Google-Smtp-Source: ABdhPJzX9SK6jmYsTSWR3nIMBw74qiHvjuXdjlF2CW4DFEUNHZfVLzwI43ae6aSA/1bK00nAwjghsg==
X-Received: by 2002:a5d:4388:: with SMTP id i8mr3930018wrq.262.1604853285985;
        Sun, 08 Nov 2020 08:34:45 -0800 (PST)
Received: from localhost.localdomain (host-80-116-112-213.retail.telecomitalia.it. [80.116.112.213])
        by smtp.gmail.com with ESMTPSA id 130sm10342180wmd.18.2020.11.08.08.34.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2020 08:34:45 -0800 (PST)
From:   Angelo Dureghello <angelo.dureghello@timesys.com>
To:     gerg@linux-m68k.org
Cc:     linux-m68k@vger.kernel.org, geert@linux-m68k.org,
        Angelo Dureghello <angelo.dureghello@timesys.com>
Subject: [PATCH] m68k: mm: fix wrong m68k_fixup_info addresses
Date:   Sun,  8 Nov 2020 17:34:13 +0100
Message-Id: <20201108163413.1349641-1-angelo.dureghello@timesys.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

After rebasing today with mainline/master, i am hitting
this issue again:

https://www.spinics.net/lists/linux-m68k/msg15881.html

   Loading Ramdisk to 47ccc000, end 47d85544 ... OK
...
initrd at 0x47ccc000:0x47d85544
overlap at 1073741889 for chunk 0
overlap at 1073746200 for chunk 0
overlap at 1073746760 for chunk 0
overlap at 1073746761 for chunk 0
overlap at 1073746762 for chunk 0
overlap at 1073746763 for chunk 0
overlap at 1073746764 for chunk 0

This time i am using gcc-10.1.0-nolibc, but the issue
re-appeared. Add volatile again to solve the issue.

Signed-off-by: Angelo Dureghello <angelo.dureghello@timesys.com>
---
 arch/m68k/include/asm/page_mm.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/m68k/include/asm/page_mm.h b/arch/m68k/include/asm/page_mm.h
index e6b75992192b..1eff386cc64b 100644
--- a/arch/m68k/include/asm/page_mm.h
+++ b/arch/m68k/include/asm/page_mm.h
@@ -135,7 +135,7 @@ static inline __attribute_const__ int __virt_to_node_shift(void)
 {
 	int shift;
 
-	asm (
+	asm volatile (
 		"1:	moveq	#0,%0\n"
 		m68k_fixup(%c1, 1b)
 		: "=d" (shift)
-- 
2.28.0

