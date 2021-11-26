Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B10BC4321E
	for <linux-m68k@archiver.kernel.org>; Fri, 26 Nov 2021 18:26:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240700AbhKZS34 (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Fri, 26 Nov 2021 13:29:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59092 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240716AbhKZS1y (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Fri, 26 Nov 2021 13:27:54 -0500
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7F49C0613B3
        for <linux-m68k@lists.linux-m68k.org>; Fri, 26 Nov 2021 10:02:40 -0800 (PST)
Received: by mail-lj1-x233.google.com with SMTP id z8so20238760ljz.9
        for <linux-m68k@lists.linux-m68k.org>; Fri, 26 Nov 2021 10:02:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4OWbCpLiTrW70NMTPpPUNVkhVF3RKPzG5GTofMVph+0=;
        b=U69ILAbrhbxcINYnpRQtUq6JxYWnIXttphxdlME9mX9uCA1JhL5g9P+cnao4IWTUqr
         9tPjsTZbw0wHPRnIaR2kuXc+6SuT1qdSxK1er9g80is33Nv4fNybvJeDFb+59wZ6/jA9
         lKnEss0hQGNpzJDmSzIVrPcWrzOYo8XEDeBsPuLSgtY/cdbTAUaYPsMA9QVRSCsMpWjK
         1CeUN4i4UFobttYFMLMl85bmb+/I+XpEOavkYcgGHHLEq9EDDoV4gjylJLb2WQn+vkHq
         yNteEWHoeUyiUUjoXV7o0YPYgF/rr0dWmS9D0ywrrfynL0aziDEWAvzpSp7yO/ZE2I4q
         +yjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4OWbCpLiTrW70NMTPpPUNVkhVF3RKPzG5GTofMVph+0=;
        b=RuKFgnReJY02Dnh5amgzeJpCdRm+Rx+HVrkGzhYuoReeP2cl4wlEeSlJmhWMylc/Ae
         b2gVqNStfQQbs7GcQcOOY0G4UfDVZ7mrZRm9QP171ADz/Y024c0LS+PiGmhX9syNNZR6
         ZHUynpaVMd+0p2Ll16eF5wPNuHsskxJ7HpMQkEBpvxnTxgeFWEZ36Ds6Y1qmFD06uQeJ
         H/qOA5BeobaYQu3ReLPtCckJ0xD4HwXHT4E+zbUR3a86lMoYr1PRH/CZESXiDj68iOJK
         KbqovmQ9t4ZhU39kCHbpJlo3ujcObJqjMApI4ZSR7z+cGPPLuD26GSprIYIiO/WYMh5/
         G4UA==
X-Gm-Message-State: AOAM530yTF/ikOnwpyivY9UuiN2Oe2IRDJKUEF7e56ENWQ0PBMeanCri
        preafw2HwrXWhF9f+6SpWrc=
X-Google-Smtp-Source: ABdhPJz1GbkyYg9nMRW5huA9uUFPfXiNfeSRqTr9xzo7mRAD3m0tvpkkS1ciqVKYkPFDmEUOR5tJqw==
X-Received: by 2002:a2e:a58d:: with SMTP id m13mr33700861ljp.281.1637949757713;
        Fri, 26 Nov 2021 10:02:37 -0800 (PST)
Received: from localhost.localdomain (94-29-48-99.dynamic.spd-mgts.ru. [94.29.48.99])
        by smtp.gmail.com with ESMTPSA id i32sm553831lfv.295.2021.11.26.10.02.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Nov 2021 10:02:37 -0800 (PST)
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
        "K . C . Kuen-Chern Lin" <kclin@andestech.com>
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-csky@vger.kernel.org, linux-ia64@vger.kernel.org,
        linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
        linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-riscv@lists.infradead.org, linux-sh@vger.kernel.org,
        xen-devel@lists.xenproject.org, linux-acpi@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: [PATCH v4 22/25] memory: emif: Use kernel_can_power_off()
Date:   Fri, 26 Nov 2021 21:00:58 +0300
Message-Id: <20211126180101.27818-23-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211126180101.27818-1-digetx@gmail.com>
References: <20211126180101.27818-1-digetx@gmail.com>
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
2.33.1

