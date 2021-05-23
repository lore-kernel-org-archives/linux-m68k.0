Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A67C4C47085
	for <linux-m68k@archiver.kernel.org>; Sun, 23 May 2021 23:26:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7ED2661185
	for <linux-m68k@archiver.kernel.org>; Sun, 23 May 2021 23:26:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232058AbhEWX1e (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Sun, 23 May 2021 19:27:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56876 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231989AbhEWX1d (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Sun, 23 May 2021 19:27:33 -0400
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 21608C061756
        for <linux-m68k@lists.linux-m68k.org>; Sun, 23 May 2021 16:26:05 -0700 (PDT)
Received: by mail-lj1-x22b.google.com with SMTP id c15so31137781ljr.7
        for <linux-m68k@lists.linux-m68k.org>; Sun, 23 May 2021 16:26:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=pPiK1DfUxZZrTBI/5iz69l7qULP78LHErLsYFXd4x9o=;
        b=Wh4IAnNxXo994rOpcpBG1uHjyJm1icPsdNE7/2cIz+9OcmAv8x5QRPsjauEGrPNXiW
         RQkuH5Bx1P5mQmEgcSIo+dbZENJWfm+ttnjxO+s92XMY+RPBJ2+nun7R4NtaOHRkojvQ
         W5cyhqxNL775x1J4LWzOqkZigA/1vrCffMUNYpOkXrHm5cFJmaSSfTKIr13MI9bCY/Nq
         LR2+mcOUhyQTrJmbrtHh4CssW4Gvgsl5T+cpjBpF4kz2QpQPMu12h5jDZ0hMpEJyjgTp
         0ruHCtRGDigp05ZBlZJ/ZsD0UV5aaUlUx5toHznF4RKhugLSlHIIAWqhOg4k8RZwG5Gm
         lDow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=pPiK1DfUxZZrTBI/5iz69l7qULP78LHErLsYFXd4x9o=;
        b=mibRkIcyOPfJKOh3nCr8t5U/JFUIBW57L+JSM8Y7MjTDMCxfRz24700BskEXEEaD6N
         12R9DztImdY6HMx5ROa0Mag3+ghODvLTN4XBN+xaV9I/McRuq1JdkL4E1PKfpKLdIeMb
         zFCl1OfktWFOooix3a+5/TSjAn+RIe/Oh6bnIEdf8JywAPHcBzIb2qY06Z7nPTokaqDQ
         ZKHpK0uaWs2xlrTXxkxTbv85H62DbR+PtALeIFM61vJMUi6UGlxiQzblJBklecqXBb2i
         3Jhx3vz+1OWHS5nUOG1DTjo5BOw7hXh4ybcfnNMEdxf9JC0da3GKArojwppVGKGOBZIp
         B+hQ==
X-Gm-Message-State: AOAM532eSpsUuckssJTZXty169Q/voJogGXyISCFVoNEzqwAiBqkzv4g
        Y09dE+s4xJNpIUroYTqExss=
X-Google-Smtp-Source: ABdhPJzn0nkTvNJ4/y5/7O9Cpdv0X5iyxFW9w+e888CSbB1VKcAijfzu9imoGp+TgHIWvgjlKrqffQ==
X-Received: by 2002:a05:651c:1043:: with SMTP id x3mr14722134ljm.130.1621812363346;
        Sun, 23 May 2021 16:26:03 -0700 (PDT)
Received: from localhost.localdomain (109-252-193-110.dynamic.spd-mgts.ru. [109.252.193.110])
        by smtp.gmail.com with ESMTPSA id p7sm1489329ljg.61.2021.05.23.16.26.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 May 2021 16:26:02 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Tony Lindgren <tony@atomide.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Paul Burton <paul.burton@mips.com>,
        John Crispin <john@phrozen.org>
Cc:     linux-mips@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-omap@vger.kernel.org
Subject: [PATCH v1] kbuild: Disable compile testing if HAVE_LEGACY_CLK enabled
Date:   Mon, 24 May 2021 02:25:56 +0300
Message-Id: <20210523232556.15017-1-digetx@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

There are couple older platforms that can't be compile-tested because they
partially implement CLK API. It causes build failure of kernel drivers due
to the missing symbols of the unimplemented part of CLK API.

These platforms are: ARM EP93XX, ARM OMAP1, m68k ColdFire, MIPS AR7,
                     MIPS Ralink.

Disable compile-testing for HAVE_LEGACY_CLK=y.

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 init/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/init/Kconfig b/init/Kconfig
index 173a474012d7..42701b04be00 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -131,7 +131,7 @@ config INIT_ENV_ARG_LIMIT
 
 config COMPILE_TEST
 	bool "Compile also drivers which will not load"
-	depends on HAS_IOMEM
+	depends on HAS_IOMEM && !HAVE_LEGACY_CLK
 	help
 	  Some drivers can be compiled on a different platform than they are
 	  intended to be run on. Despite they cannot be loaded there (or even
-- 
2.30.2

