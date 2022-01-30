Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46C5EC35274
	for <linux-m68k@archiver.kernel.org>; Sun, 30 Jan 2022 23:38:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1357477AbiA3XiT (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Sun, 30 Jan 2022 18:38:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34396 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1357337AbiA3XiA (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Sun, 30 Jan 2022 18:38:00 -0500
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9367BC061756
        for <linux-m68k@lists.linux-m68k.org>; Sun, 30 Jan 2022 15:37:59 -0800 (PST)
Received: by mail-lf1-x134.google.com with SMTP id p27so23343614lfa.1
        for <linux-m68k@lists.linux-m68k.org>; Sun, 30 Jan 2022 15:37:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6m8P3WoXpjmgm4wPv3Z7h5cBjPxfBSCYucbGZeGzChw=;
        b=pw0lvBk+dTz3ObiHx+Tziue58w6zUuZQVNJvU9S7GB+pTzwAHhgcj/iJlwXXxw2erP
         SjJaIXCKqSP4ZUdeywJtZKFLRYiUBBH6flK45216wEu+kAKbGqsUiHPKIi82YM1bz/wq
         bMKu0rK0969KEuxg/PSMaDE+zRgG2hxtPkS3M1mFIZPAgYW4ktfU2t1MzGq6fvtQ0WCp
         Y+7PFXh6gcLp4xF5Q6p6cFH24zY5vWjbmW+bewwmKwBTNzJ37xEIcDLIFgNsMgKiVVBl
         Kl81Cxsay4XTPckhsJ1WeXkyEjcWdoSjNX8wa8Lm2Ykdw2ly2wOfBD20u+sG0elmdIGM
         o1xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6m8P3WoXpjmgm4wPv3Z7h5cBjPxfBSCYucbGZeGzChw=;
        b=L1ooAoSGS03j8nVZnPQN5ubzR/HNCQZboxgWQ8JTJWHgJIw+i4MOUVJ/3b5NTigimG
         LfWD4rHTDhwuWKB+ENl6dFcBQ8eMXwlpM+MqA6JvaN5RT4EeWQtiRGd+SDno4KDeDc1H
         tPlWNXGhUM2MyyRMNrjEcojEeD7LhTI7OMEg7HqgfwaX/6MtnQoZ0EGxI8PPI3qJJri0
         NniY+oyysz13bsNlIEL+Vi7+O33RFzUq38mD1edvaJzc1EE8eVUYZBV1rGQwljLuLb/W
         doIr4BUkkrja+80Fnxx02bB4JMILkBM6M0gRoDQOmO/FInvlvnwZpq2LEgGgQiyda/Fe
         DdzA==
X-Gm-Message-State: AOAM532Tl7bijLSAd7pioMk1OLWh3zPouKA6wgiEAYDgr6Kv0s2KgnNo
        K5/VHPemscroZ52vA00sIqQ=
X-Google-Smtp-Source: ABdhPJym+9e+qz3b9Eox6rk6EROG58IYAq1gwBJQdx3IJq9mRqA6OUoE67/3HvdiOb6Vb5OIHzS4jw==
X-Received: by 2002:a05:6512:10c4:: with SMTP id k4mr13546209lfg.63.1643585878009;
        Sun, 30 Jan 2022 15:37:58 -0800 (PST)
Received: from localhost.localdomain (109-252-138-126.dynamic.spd-mgts.ru. [109.252.138.126])
        by smtp.gmail.com with ESMTPSA id a24sm1262950ljp.112.2022.01.30.15.37.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Jan 2022 15:37:57 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Russell King <linux@armlinux.org.uk>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Guo Ren <guoren@kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Greg Ungerer <gerg@linux-m68k.org>,
        Joshua Thompson <funaho@jurai.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Sebastian Reichel <sre@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Greentime Hu <green.hu@gmail.com>,
        Vincent Chen <deanbo422@gmail.com>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        Helge Deller <deller@gmx.de>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
        "H. Peter Anvin" <hpa@zytor.com>,
        Boris Ostrovsky <boris.ostrovsky@oracle.com>,
        Juergen Gross <jgross@suse.com>,
        Stefano Stabellini <sstabellini@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Len Brown <lenb@kernel.org>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, Pavel Machek <pavel@ucw.cz>,
        Lee Jones <lee.jones@linaro.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Ulf Hansson <ulf.hansson@linaro.org>, alankao@andestech.com,
        "K . C . Kuen-Chern Lin" <kclin@andestech.com>,
        =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>
Cc:     linux-kernel@vger.kernel.org, linux-csky@vger.kernel.org,
        linux-ia64@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
        linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
        linux-riscv@lists.infradead.org, linux-sh@vger.kernel.org,
        xen-devel@lists.xenproject.org, linux-acpi@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: [PATCH v6 18/21] memory: emif: Use kernel_can_power_off()
Date:   Mon, 31 Jan 2022 02:37:15 +0300
Message-Id: <20220130233718.21544-19-digetx@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220130233718.21544-1-digetx@gmail.com>
References: <20220130233718.21544-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Replace legacy pm_power_off with kernel_can_power_off() helper that
is aware about chained power-off handlers.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/memory/emif.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/memory/emif.c b/drivers/memory/emif.c
index 762d0c0f0716..cab10d5274a0 100644
--- a/drivers/memory/emif.c
+++ b/drivers/memory/emif.c
@@ -630,7 +630,7 @@ static irqreturn_t emif_threaded_isr(int irq, void *dev_id)
 		dev_emerg(emif->dev, "SDRAM temperature exceeds operating limit.. Needs shut down!!!\n");
 
 		/* If we have Power OFF ability, use it, else try restarting */
-		if (pm_power_off) {
+		if (kernel_can_power_off()) {
 			kernel_power_off();
 		} else {
 			WARN(1, "FIXME: NO pm_power_off!!! trying restart\n");
-- 
2.34.1

