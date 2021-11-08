Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69DC9C41535
	for <linux-m68k@archiver.kernel.org>; Mon,  8 Nov 2021 00:51:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4FAD36139E
	for <linux-m68k@archiver.kernel.org>; Mon,  8 Nov 2021 00:51:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236330AbhKHAyg (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Sun, 7 Nov 2021 19:54:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55234 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236232AbhKHAxE (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Sun, 7 Nov 2021 19:53:04 -0500
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B682C061208
        for <linux-m68k@lists.linux-m68k.org>; Sun,  7 Nov 2021 16:48:28 -0800 (PST)
Received: by mail-lf1-x136.google.com with SMTP id l22so5664619lfg.7
        for <linux-m68k@lists.linux-m68k.org>; Sun, 07 Nov 2021 16:48:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4OWbCpLiTrW70NMTPpPUNVkhVF3RKPzG5GTofMVph+0=;
        b=e0ljdZgUHxZoyrJf4Dt2fwtbFIjxaRgt4CmCodkueXGI72qhDsuRfelUBkYJi1hxMV
         nVcrNSnFNugeEgo9dFzzn9kUZgqKVczGUVkzxEZ0y+F+zPZAPZ7KTWNrymzr+v8zRA6W
         hzyEMZ+lJw61TUCsGRXIL6ISvHg90N5/Swog25tfvvhBcMsUtWu3Fu24ZSfRDv56tPfx
         u7EEOW6fujcPyu5HErvjdfpqNkTiTvdcBDeTA/ZXqCyI7u7V46PBq7FF8CITRhSt1b0b
         knOh10H2RyeFwuduBi3XuFdJ3g4IczEsWRKguhpnQSZq/UwFqnQDt0DwqWwb6ZYN8sH6
         SUng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4OWbCpLiTrW70NMTPpPUNVkhVF3RKPzG5GTofMVph+0=;
        b=7ooAMmKRHBBLIYOMPk+fGhr9AapHaRu8bGKVZPD3rINv7x6+OAndOmzBbhlYrBTczK
         s3UsCMc7gPH0EkT/JeA+X9vnwUFe3SjXzXBoKz/lxIRicBP+qyM8ufsVc+nMEsHz5iyZ
         Qpy6CmMG/s+FBlJQGLSBxcGpAWNDp80rXstZhVj9n8LDVsCHOXBk9UhaT8HLjlWLTlnJ
         qFejioX0D8IQJ/KKUoUmj6O8Hmnn4MgeRWBqt7gbp2afOjWB91IBSME8+ItMX18B8NX9
         fdW7PGvs5JT9lM1BAk2ubyEszYCyeahgjMAqNqbTovSuVmV8dLvEH5V1zcQG88ATouCm
         2m7w==
X-Gm-Message-State: AOAM531WtaToVfSr31lHXAG5YXNRcqqu8L1ceLCF103mhts7Jiwxbqs4
        E8koqxBOuMtMbuenkoDO0E4=
X-Google-Smtp-Source: ABdhPJzScGXAcuT9LP8Wp5Twd6ncUhvGBQU3GEh7kpHpHCWpqfw4o2+7PS5n+hbmeggYCjjEzfj60w==
X-Received: by 2002:a05:6512:3095:: with SMTP id z21mr1126601lfd.423.1636332506643;
        Sun, 07 Nov 2021 16:48:26 -0800 (PST)
Received: from localhost.localdomain (79-139-188-96.dynamic.spd-mgts.ru. [79.139.188.96])
        by smtp.gmail.com with ESMTPSA id p17sm1625266lfu.209.2021.11.07.16.48.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Nov 2021 16:48:26 -0800 (PST)
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
        Nick Hu <nickhu@andestech.com>,
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
        Ulf Hansson <ulf.hansson@linaro.org>
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-csky@vger.kernel.org, linux-ia64@vger.kernel.org,
        linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
        linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-riscv@lists.infradead.org, linux-sh@vger.kernel.org,
        xen-devel@lists.xenproject.org, linux-acpi@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: [PATCH v3 22/25] memory: emif: Use kernel_can_power_off()
Date:   Mon,  8 Nov 2021 03:45:21 +0300
Message-Id: <20211108004524.29465-23-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211108004524.29465-1-digetx@gmail.com>
References: <20211108004524.29465-1-digetx@gmail.com>
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

