Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3B57C3526C
	for <linux-m68k@archiver.kernel.org>; Sun, 30 Jan 2022 23:38:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1357378AbiA3XiD (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Sun, 30 Jan 2022 18:38:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34248 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1356986AbiA3Xhh (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Sun, 30 Jan 2022 18:37:37 -0500
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1EF2EC061749
        for <linux-m68k@lists.linux-m68k.org>; Sun, 30 Jan 2022 15:37:36 -0800 (PST)
Received: by mail-lj1-x236.google.com with SMTP id t9so17055630lji.12
        for <linux-m68k@lists.linux-m68k.org>; Sun, 30 Jan 2022 15:37:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=330E/wQDWGl4ulxyuRNdR1rr3T8TzXfUiE06Vh/nJ/4=;
        b=cg3oMBxQjVviL/NNGojcXm2zIQdA1knh2bjCFHcWisBrm24Ky2GZxKJ3rws8Te7/gs
         gKmhuSiy3i3YAnHFoGCZNUdNK8mgFrgHD+dxBwbG4yZhgFFN7+/vK4MkGE5qXYuXmMVs
         bUYXaFsNJIzGbHLL09HMWCh53ba9YsZpoLFHMsubj4f9OdgATDVSFw5EXTDeZNrJ+YwD
         4i3hO0RlUhqkX+D7hyG57IC2hHmNZLq5o5iowEWUxtxxuAtbxm76BsZH9fLeaXdkEFeP
         spgNrmHN/fUhCBM448V1raIkNHUkI0ImPa7nT8ODh8UXU57uCGiJ333W57c8FPVtKEon
         c6Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=330E/wQDWGl4ulxyuRNdR1rr3T8TzXfUiE06Vh/nJ/4=;
        b=q8omEF8O+rBNo9oUgkSofPkl93dIbyK8DkO+0ajvHjSOrUZl/WDVY2Cr5NFjoKCtms
         O1tDGDsnUAleQ4nWF8Izqj84TgERvhJWTUtYw/wiITHFrZ0c0t9rY5eIbk56RpoT7bb+
         nWcBNLeArezPA2Uxa+ZfhIseCTqd1nOb4Eav9MY2LNTJZ0I0S/JG93hkmJLxbYKlbZFL
         5pX9Cf9ErKUWIp87LZEiNbMG1UlHq6yQOC/5kNIyR43MlUa2KbQ8pOfpbnjAonv6H9XY
         sAk+S1m7+fMazrzbeJs39s3a93Rr9Ert6ivA0YxurhnT9FnBlLlEkayS1ARmAC9ukgOM
         zEZA==
X-Gm-Message-State: AOAM532Qekrrs/GR4YnivOssjLyng1OeNabJQ7ffRZi+Kvql1Khht3gU
        IlkFrRf5ioGctC7LuaM5ujs=
X-Google-Smtp-Source: ABdhPJz+BlMXTarUclVIq8qzXV3P6s1WQdhrNGC7YQJ1I4ADKuUOv1DDvqkqis31Xyrq/C6PgvOyzw==
X-Received: by 2002:a2e:9cc4:: with SMTP id g4mr12328016ljj.264.1643585854485;
        Sun, 30 Jan 2022 15:37:34 -0800 (PST)
Received: from localhost.localdomain (109-252-138-126.dynamic.spd-mgts.ru. [109.252.138.126])
        by smtp.gmail.com with ESMTPSA id a24sm1262950ljp.112.2022.01.30.15.37.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Jan 2022 15:37:34 -0800 (PST)
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
Subject: [PATCH v6 05/21] ARM: Use do_kernel_power_off()
Date:   Mon, 31 Jan 2022 02:37:02 +0300
Message-Id: <20220130233718.21544-6-digetx@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220130233718.21544-1-digetx@gmail.com>
References: <20220130233718.21544-1-digetx@gmail.com>
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
2.34.1

