Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C42CC433FE
	for <linux-m68k@archiver.kernel.org>; Fri, 26 Nov 2021 18:24:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243412AbhKZS2H (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Fri, 26 Nov 2021 13:28:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57808 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241163AbhKZS0B (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Fri, 26 Nov 2021 13:26:01 -0500
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17682C07E5DB
        for <linux-m68k@lists.linux-m68k.org>; Fri, 26 Nov 2021 10:02:23 -0800 (PST)
Received: by mail-lj1-x22f.google.com with SMTP id k2so20273468lji.4
        for <linux-m68k@lists.linux-m68k.org>; Fri, 26 Nov 2021 10:02:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=gu1TeBm+2e/G5RkADOFU3cJrqp3hDioEihnrKvJEWzw=;
        b=btNqE7qj3gxEiDVofvmyjyd5e7+E6dC5EvozkZ3YONorP6vNKMDK/arxDxAc+ltG7R
         TI/OKrB+ElUSGJggS6fR+VvabEemoQpP54QSf8icDIcXqsN3cetkl+MJM3Uv83OU/ua5
         YnrqP6SpxE3RilnmapTLWdFynEqGWoF9UKLd/DifHXHRRJENB4MJ8bZKGXsja5FQh/Ln
         Gn1mmiKEwmPfkV+5o1Qx1UHHE5Ho0OF5Lv2UTxiT+KLX82V7SYEs1ZWnthM6isYJwRQ9
         tdU5PDbvVk5b/rhIUQRngDxoQRVVJQlBNfOWOrEip1niZaJKsE7C6PZqI9A924a269T1
         nFWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gu1TeBm+2e/G5RkADOFU3cJrqp3hDioEihnrKvJEWzw=;
        b=sNH9bZsp2H+TeP/A7NtNyR9s2VN7UGA+RkWVSveAbIjIZSZolXrwD3DW5ywZku1KJ5
         JBT8dR753kS40NxvDmy+021pS4QxtRECa7RW27SQ/p0/vuA9+6nxjxtdXgtnvgKuGIL1
         6FxaIdcJ1FEXShkINdjh44L2StDxQ8Pjt2j6Q6lDBWkD2vlndF5E3f5+mEwig4Eb1RFx
         2hxiVHcLTdy3WCM0Wlt6YQs/tLrOYky/18gDHHaVUww+NwxCaK7r4Bmvd0sjQHNz/NAA
         I2a0Ygctho0e8PGCpiMuGOqRqDpVitQmfWZNa3PfwdcWcYaFw7U8dXJWi4W8QUwkrv8T
         ILwQ==
X-Gm-Message-State: AOAM532oTickynGaJEUVprh73MPcgadW/S5hjqnbkm69Nz1tdUvCjq8G
        u0RIU08WJjq0kIYP9MFm4M8=
X-Google-Smtp-Source: ABdhPJyqXZVO64K86xv5JIX/t9zYDjx1u3F4bWT4GBdKatrIZNjie6T+K7n3Ac1v1Jvn5JGF+DNcxQ==
X-Received: by 2002:a2e:7d0a:: with SMTP id y10mr33852017ljc.259.1637949741369;
        Fri, 26 Nov 2021 10:02:21 -0800 (PST)
Received: from localhost.localdomain (94-29-48-99.dynamic.spd-mgts.ru. [94.29.48.99])
        by smtp.gmail.com with ESMTPSA id i32sm553831lfv.295.2021.11.26.10.02.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Nov 2021 10:02:20 -0800 (PST)
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
Subject: [PATCH v4 15/25] powerpc: Use do_kernel_power_off()
Date:   Fri, 26 Nov 2021 21:00:51 +0300
Message-Id: <20211126180101.27818-16-digetx@gmail.com>
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

Acked-by: Michael Ellerman <mpe@ellerman.id.au>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 arch/powerpc/kernel/setup-common.c | 4 +---
 arch/powerpc/xmon/xmon.c           | 3 +--
 2 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/kernel/setup-common.c b/arch/powerpc/kernel/setup-common.c
index 4f1322b65760..71c4ccd9bbb1 100644
--- a/arch/powerpc/kernel/setup-common.c
+++ b/arch/powerpc/kernel/setup-common.c
@@ -161,9 +161,7 @@ void machine_restart(char *cmd)
 void machine_power_off(void)
 {
 	machine_shutdown();
-	if (pm_power_off)
-		pm_power_off();
-
+	do_kernel_power_off();
 	smp_send_stop();
 	machine_hang();
 }
diff --git a/arch/powerpc/xmon/xmon.c b/arch/powerpc/xmon/xmon.c
index 83100c6524cc..759e167704e6 100644
--- a/arch/powerpc/xmon/xmon.c
+++ b/arch/powerpc/xmon/xmon.c
@@ -1243,8 +1243,7 @@ static void bootcmds(void)
 	} else if (cmd == 'h') {
 		ppc_md.halt();
 	} else if (cmd == 'p') {
-		if (pm_power_off)
-			pm_power_off();
+		do_kernel_power_off();
 	}
 }
 
-- 
2.33.1

