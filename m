Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CF85C433FE
	for <linux-m68k@archiver.kernel.org>; Fri, 26 Nov 2021 18:24:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242931AbhKZS1y (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Fri, 26 Nov 2021 13:27:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57764 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240735AbhKZSZw (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Fri, 26 Nov 2021 13:25:52 -0500
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC7D0C0698FE
        for <linux-m68k@lists.linux-m68k.org>; Fri, 26 Nov 2021 10:02:14 -0800 (PST)
Received: by mail-lf1-x12b.google.com with SMTP id n12so26160165lfe.1
        for <linux-m68k@lists.linux-m68k.org>; Fri, 26 Nov 2021 10:02:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hKgqav8a8uS+JOYHQI8KBeK4UU43xCMXoqbNcSGFyUw=;
        b=Po1r9nVFosID/XIv4S8lizZdxtb4AiKjgIf77Z9VdEmxeyZ4v2AKodX8o/k+Z3rD2d
         e2PI94UHDmym38k6JGIB2xhQcbHnk++cihPLhjPUlu0ata6V7Elqqu1vX/dUvmX8vd//
         gFGlEXk8MDQ81Mp13d+goJXAs9OHRCnyuOhZEEjTJ4y/wSzHt8J2Kug/9ssKueQtT4Bx
         eKaeWcEuefXhfGSMQhhq6VHfHmDtX4qeoutfpXxh+4HClTuY5U63fmiF7CsLfkldK5nU
         ruhLNjZH8cKw2EdHXxrwIzr9XSez2deXmOvWqitl0d7ezpYqqMN01hGnnX/7XN488JAq
         2Xpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hKgqav8a8uS+JOYHQI8KBeK4UU43xCMXoqbNcSGFyUw=;
        b=SR0aznSkUIjwLkoynNILjyBJVVh4cBZzEYl0DaVnPtH8jr1osT/nG+fPIfnPWGpayv
         CO6wy6QW5T20pmvmyvWxL+7FNxOWN071i+sRaEAwY9sQ8zU8LvoKoVOR+k7VXUr/ukVO
         1w8pwdHN/OHmK7W4QyEGeLHlwmczHHf6oTIuJ6FVYQ0IZlIjDwr6SMj4xvisZOpq87m1
         jsUC6Y8U8tm5nC2ezgGAh2818VLCK3djUn6jEUF+tw0/hLvjgBUS7w9ll/fcJbZ2gXIm
         vd6Pj3elWH/YC32XkLvFZd9JTEsxp0A0DflIQYCyZyyTVMSfynLC7hkcShrMVQsHg7NB
         BFgw==
X-Gm-Message-State: AOAM532N9Svjc15DFO32tkAh2xRBiDiCgPc8JfxZ8AHpfrHXo/D8GjD8
        u+44qZxZj1dpslf+imJQLig=
X-Google-Smtp-Source: ABdhPJyU2gXG+eVj9py9Up4KS/i8crRthe+TvBFG99PRD6Vp7wlcfVEp3e9ky90MnSLaJ58dEaRzoA==
X-Received: by 2002:ac2:5548:: with SMTP id l8mr30765420lfk.509.1637949732941;
        Fri, 26 Nov 2021 10:02:12 -0800 (PST)
Received: from localhost.localdomain (94-29-48-99.dynamic.spd-mgts.ru. [94.29.48.99])
        by smtp.gmail.com with ESMTPSA id i32sm553831lfv.295.2021.11.26.10.02.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Nov 2021 10:02:12 -0800 (PST)
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
Subject: [PATCH v4 11/25] riscv: Use do_kernel_power_off()
Date:   Fri, 26 Nov 2021 21:00:47 +0300
Message-Id: <20211126180101.27818-12-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211126180101.27818-1-digetx@gmail.com>
References: <20211126180101.27818-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Kernel now supports chained power-off handlers. Use do_kernel_power_off()
that invokes chained power-off handlers. It also invokes legacy
pm_power_off() for now, which will be removed once all drivers will
be converted to the new power-off API.

Acked-by: Palmer Dabbelt <palmer@dabbelt.com>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 arch/riscv/kernel/reset.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/arch/riscv/kernel/reset.c b/arch/riscv/kernel/reset.c
index 9c842c41684a..912288572226 100644
--- a/arch/riscv/kernel/reset.c
+++ b/arch/riscv/kernel/reset.c
@@ -23,16 +23,12 @@ void machine_restart(char *cmd)
 
 void machine_halt(void)
 {
-	if (pm_power_off != NULL)
-		pm_power_off();
-	else
-		default_power_off();
+	do_kernel_power_off();
+	default_power_off();
 }
 
 void machine_power_off(void)
 {
-	if (pm_power_off != NULL)
-		pm_power_off();
-	else
-		default_power_off();
+	do_kernel_power_off();
+	default_power_off();
 }
-- 
2.33.1

