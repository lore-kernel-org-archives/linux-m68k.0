Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24792C433F5
	for <linux-m68k@archiver.kernel.org>; Fri, 26 Nov 2021 18:24:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240348AbhKZS1W (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Fri, 26 Nov 2021 13:27:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57646 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240368AbhKZSZU (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Fri, 26 Nov 2021 13:25:20 -0500
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EDD0CC0698E4
        for <linux-m68k@lists.linux-m68k.org>; Fri, 26 Nov 2021 10:02:11 -0800 (PST)
Received: by mail-lj1-x22a.google.com with SMTP id e11so20148783ljo.13
        for <linux-m68k@lists.linux-m68k.org>; Fri, 26 Nov 2021 10:02:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4G0wXMIRKtQjgiQjhPPTWIJTonbxBMvj833mzQfGVdU=;
        b=Q7bS5Bcds94ZCTDJZ73tKxITpYV8Kav4ePR+HRo9YdxSWek6px4wRJdgcPmS5hk/Rr
         VPvNAMuE26rR2wieWZvoqh2JqGKS7hi+wU3x2h17uhsQmowPgLITYDnbrjG1GwGkvefd
         hHxk6lkApAV38Oi8vIzUQfEJ8wFoDrL8RwZq4qDk19AhYWVm238iVmmmVO7DlbUJ33tI
         BLX+/0wZLAv6GevVfNs/5TC56F1I6JNn+sAhx6wYa6M2qI3hZxBZFaK0EH29RxIb8wYE
         l0fPT66HRS9VmV580SbvW1FY/SVTqBcYuvfEtu2otEWz3FsM+lLxfdinbLZf9OO11+V4
         J1yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4G0wXMIRKtQjgiQjhPPTWIJTonbxBMvj833mzQfGVdU=;
        b=W7gNzkaNfsn5U8UEKRreoLMDt/6/VTjea9zeUHipvVVUTHztk/3dAZUZiwGpvPutHW
         D5GYy8daSudUaDAb/WdQBN+dT4VTQUL6DInsBxOE56B9rnU5JbxzY+ISX583GrdFEY93
         ZeS264cOoCzQnEqrf54IDk/Q0A+VSwp8hu6yAMyfNA5XcMD1VES6zl2iuspDrOA/ACfM
         WIHV1lIC4qOFIehkDNoQOH164wVIkpPk4ZPRj45ktVWfpkWagLEswz0Ut1LJRE+31EVz
         NrsA4A9aJwRyjR1ELgLFfYsbqv8tEFzb3hr1uGKrwmo4L6ZOsGPTb7+1kD9ytMQEogx5
         +pHw==
X-Gm-Message-State: AOAM531Fm6JzFhJFfjmFNr/drNcK9q9sCotgxHFuLCgunfxG8BQxwsDA
        5Klkm1WyNkd7O9v5b4R/pI0=
X-Google-Smtp-Source: ABdhPJw++X7mxtdOavKH8Ip6GlDs2g7F+GbwMx/tI9yDFlFB9AlrVDhMOYYWaSu8ROQpefmcYFa9fg==
X-Received: by 2002:a2e:858f:: with SMTP id b15mr33453590lji.177.1637949728768;
        Fri, 26 Nov 2021 10:02:08 -0800 (PST)
Received: from localhost.localdomain (94-29-48-99.dynamic.spd-mgts.ru. [94.29.48.99])
        by smtp.gmail.com with ESMTPSA id i32sm553831lfv.295.2021.11.26.10.02.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Nov 2021 10:02:08 -0800 (PST)
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
Subject: [PATCH v4 09/25] ARM: Use do_kernel_power_off()
Date:   Fri, 26 Nov 2021 21:00:45 +0300
Message-Id: <20211126180101.27818-10-digetx@gmail.com>
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

Reviewed-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 arch/arm/kernel/reboot.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/arch/arm/kernel/reboot.c b/arch/arm/kernel/reboot.c
index 3044fcb8d073..2cb943422554 100644
--- a/arch/arm/kernel/reboot.c
+++ b/arch/arm/kernel/reboot.c
@@ -116,9 +116,7 @@ void machine_power_off(void)
 {
 	local_irq_disable();
 	smp_send_stop();
-
-	if (pm_power_off)
-		pm_power_off();
+	do_kernel_power_off();
 }
 
 /*
-- 
2.33.1

