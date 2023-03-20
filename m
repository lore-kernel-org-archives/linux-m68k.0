Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D4ECC6FD1D
	for <linux-m68k@archiver.kernel.org>; Mon, 20 Mar 2023 12:32:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231365AbjCTMcK (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 20 Mar 2023 08:32:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33442 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229971AbjCTMcI (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 20 Mar 2023 08:32:08 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA7BF126EC
        for <linux-m68k@lists.linux-m68k.org>; Mon, 20 Mar 2023 05:32:05 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id t5so9251122edd.7
        for <linux-m68k@lists.linux-m68k.org>; Mon, 20 Mar 2023 05:32:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679315524;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tRSq0b1sTFzr8ws1GQ+q4eOf3VxKeSr0xYhVTY1jp3k=;
        b=BCAkygqH0WEvytHMINnIwYyzn2RyLBZ86EK6i7DZfpErm3mA9QCOkErcWDUZ9DyfPQ
         0NURWCU8HMDvgTiuOWRkt3/l2pJUWS3jGSUvkWscQyQBEnTlkHLdfrmmLyrZFLmORZuD
         YES8gPtdn/bo8gNm27Uujd8yJqTcMaBm9+hehhCz4sqoqxkIctWQMOXfW+seOzvS/4ER
         mRR/r/h8NlGo60OiS7wpt+EErZB/g2pob5VWQAkEpRwLJMnVH12RaJTBR9QZvIIYw5A5
         shblSWkrGGs3nRDxbi0VFLvYITB1qXB3BiNAxhdGrFRDw0QMUGTADl7itgBwShHlKTyJ
         DP9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679315524;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tRSq0b1sTFzr8ws1GQ+q4eOf3VxKeSr0xYhVTY1jp3k=;
        b=kg1NTSbcJUMNOEJxJDos+5MoMbw7XYzORQKtQpQb/cHhXl8hpOldlgyaGmPKJALZYS
         pIyva9yu5z0YDXtgEl14ST7Hz2RbtyIrXkCn9YgOPVIwsOQHVmBxv2E0TBuec1ruR7VB
         yftAxpo+5QLsXOSGnAIeP368YzTEqq+0k+mtkTBKT/K5aRyY26HaqO1SyGBwM/jDdxo/
         sVmhg8fv6XtS6Dfz4MTZnwg9gmdOMckrJ8ZIWGUdTOVTY48ngZeMp2d7kcbyX+H1VUOc
         PPH6uWMx2nJGggykk2cmKs4WuIrNt65vvWVRgbg38dF6R0LkfPTJ4a6CL4+Xns7l4alb
         L3EA==
X-Gm-Message-State: AO0yUKWwfz780NwIdgmLr87Lz9CxQTF+YbjZ9lze90UZ9TORrmJu8E78
        M95pbaIsjb8EkGsfqIz0xqw=
X-Google-Smtp-Source: AK7set8p85JMiX22HyE0zxyzElUR9zJVe57o+rBNFBkNVLtp44uQIaJkP6OepruGyMmyk9cJYigx0w==
X-Received: by 2002:a17:906:2e8e:b0:913:ff28:59bd with SMTP id o14-20020a1709062e8e00b00913ff2859bdmr8415010eji.52.1679315524146;
        Mon, 20 Mar 2023 05:32:04 -0700 (PDT)
Received: from felia.fritz.box ([2a02:810d:2a40:1104:394b:6c53:31d8:7b18])
        by smtp.gmail.com with ESMTPSA id 11-20020a170906318b00b008d606b1bbb1sm4348436ejy.9.2023.03.20.05.32.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Mar 2023 05:32:03 -0700 (PDT)
From:   Lukas Bulwahn <lukas.bulwahn@gmail.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-m68k@lists.linux-m68k.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>
Subject: [PATCH] m68k: remove obsolete config NO_KERNEL_MSG
Date:   Mon, 20 Mar 2023 13:32:02 +0100
Message-Id: <20230320123202.14474-1-lukas.bulwahn@gmail.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

The use of the config NO_KERNEL_MSG is long gone. Remove this config from
m68k's debug kernel configuration setup.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
 arch/m68k/Kconfig.debug | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/arch/m68k/Kconfig.debug b/arch/m68k/Kconfig.debug
index 465e28be0ce4..30638a6e8edc 100644
--- a/arch/m68k/Kconfig.debug
+++ b/arch/m68k/Kconfig.debug
@@ -36,11 +36,6 @@ config HIGHPROFILE
 	help
 	  Use a fast secondary clock to produce profiling information.
 
-config NO_KERNEL_MSG
-	bool "Suppress Kernel BUG Messages"
-	help
-	  Do not output any debug BUG messages within the kernel.
-
 config BDM_DISABLE
 	bool "Disable BDM signals"
 	depends on COLDFIRE
-- 
2.17.1

