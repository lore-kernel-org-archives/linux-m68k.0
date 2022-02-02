Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A001EC433F5
	for <linux-m68k@archiver.kernel.org>; Wed,  2 Feb 2022 19:47:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239295AbiBBTrQ (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 2 Feb 2022 14:47:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59106 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229889AbiBBTrP (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Wed, 2 Feb 2022 14:47:15 -0500
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D991C061714
        for <linux-m68k@vger.kernel.org>; Wed,  2 Feb 2022 11:47:15 -0800 (PST)
Received: by mail-ed1-x529.google.com with SMTP id u24so685521eds.11
        for <linux-m68k@vger.kernel.org>; Wed, 02 Feb 2022 11:47:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=timesys-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Yo7fve2rPJw84nZGy1GrLBy7qR3uzJswuDrzXjo8tF8=;
        b=X5n0H5BxW7GGXs/ft5iaWQETU1VV9KdQ0uXFEzXw+rfWLwnoKEH7aBgujsJ6/ZhGTN
         Z40/GRhxaPAJV9qYV1CMS4p9wUhop7yiCQJSWOcNnJtN76+V8uzMpVJQbXkpQJM/Jul7
         wFLfZ/vtPLjd/G6vSfZql8OfCrvZUbE6Jz2Q8JwGtEJaCPLfKX6aiLlXCt//azWpwoW4
         hFSaSfsuwhxHw9DGrNhtgYL/kLaUqX+vO4k3TffrkDDNijutSBh4OyG61jMmmLw/F0rN
         4MRZ3VV6OwCSF5bUpYHikkl4SIgzGGekOve5QFymyjoSsz0LAsiMLT9KiftOx/x4iixj
         vhCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Yo7fve2rPJw84nZGy1GrLBy7qR3uzJswuDrzXjo8tF8=;
        b=ozBvIul+JD+9Z5quit0tDDLRrBU8T9vr2h1S185StXDACS2YNLUeX7tg3xD5bOwexL
         TPSK96sGO1tuFuOV+CUTKC5rM+OF7t3vTkdLDen8g0kd8ja04LIv6TjxRA/4N8ital61
         QBOTYO5+ZBauJAyEiDqYkoJ5qP4fk7W2ODQoNQ/AllYpcps9S5ChrEg7vm6AK2v8iblG
         /ZACjkllFY9hIue2GzXRoLikbZU+GytJoF7MBqd/albgxC5dwu8NaninrHKJ1dJ0ws3m
         qOHOlN9BQ7VMLaaCvkCVkpaWED9QcqelPIP0LPgV4gEi9R2kAKRbKDCcFzfTGgrTEBDG
         ljow==
X-Gm-Message-State: AOAM5306eMHFSqdxT/7fu8Ca3Pchbdbh19jyvoEMuNQo5w2yMGr9SYlG
        zjwrqGXCpu04RHzNQ2bafpWKlcZnTUkTfnN5
X-Google-Smtp-Source: ABdhPJzJIGgjVW0sT1yOlSkIrTVXj7voxopvR69eNdAPr/zM3D4sPCBA39KcxvucG0W76Hl0INM9XA==
X-Received: by 2002:a05:6402:278f:: with SMTP id b15mr32333171ede.103.1643831234122;
        Wed, 02 Feb 2022 11:47:14 -0800 (PST)
Received: from localhost.localdomain (host-79-25-62-48.retail.telecomitalia.it. [79.25.62.48])
        by smtp.gmail.com with ESMTPSA id n2sm5819304ejl.55.2022.02.02.11.47.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Feb 2022 11:47:12 -0800 (PST)
From:   Angelo Dureghello <angelo.dureghello@timesys.com>
To:     gerg@linux-m68k.org
Cc:     linux-m68k@vger.kernel.org,
        Angelo Dureghello <angelo.dureghello@timesys.com>
Subject: [RESEND] m68k: m5441x: remove erroneous clock disable
Date:   Wed,  2 Feb 2022 20:47:00 +0100
Message-Id: <20220202194700.289942-1-angelo.dureghello@timesys.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Remove erroneous esdhc clock disable.

Signed-off-by: Angelo Dureghello <angelo.dureghello@timesys.com>
---
 arch/m68k/coldfire/m5441x.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/m68k/coldfire/m5441x.c b/arch/m68k/coldfire/m5441x.c
index 02922ced19cb..b13fb3d8a14e 100644
--- a/arch/m68k/coldfire/m5441x.c
+++ b/arch/m68k/coldfire/m5441x.c
@@ -181,7 +181,6 @@ static struct clk * const disable_clks[] __initconst = {
 	&__clk_0_47, /* ssi.0 */
 	&__clk_0_49, /* rng */
 	&__clk_0_50, /* ssi.1 */
-	&__clk_0_51, /* eSDHC */
 	&__clk_0_53, /* enet-fec */
 	&__clk_0_54, /* enet-fec */
 	&__clk_0_55, /* switch.0 */
-- 
2.34.1

