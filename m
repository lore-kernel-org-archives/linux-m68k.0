Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18D29C433F5
	for <linux-m68k@archiver.kernel.org>; Sun, 12 Dec 2021 21:39:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229626AbhLLVi7 (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Sun, 12 Dec 2021 16:38:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37286 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229625AbhLLVi6 (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Sun, 12 Dec 2021 16:38:58 -0500
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 776E7C06173F
        for <linux-m68k@lists.linux-m68k.org>; Sun, 12 Dec 2021 13:38:58 -0800 (PST)
Received: by mail-lj1-x230.google.com with SMTP id k2so21164102lji.4
        for <linux-m68k@lists.linux-m68k.org>; Sun, 12 Dec 2021 13:38:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4G0wXMIRKtQjgiQjhPPTWIJTonbxBMvj833mzQfGVdU=;
        b=UmHNBT8JmdhQ5CXOuzBPrdCFUG3onvjKjyb7BVoTR6PoZ7aY9ImgmoLFJ8cX/YVLss
         FhaRpMyx6UDbgZbpErI6LiS2MWo9dsEpm/Yn/glHgDMltg46AqIFy+ODbJy1mDGnSX6Q
         6hgBQWxhgUXb1w4suJJ3mGjbzzVU8sboZDIyHdE0at2JpjfcocKdBr+3u8eWls6ZdqdV
         vZ4mrsRkvMQH9goBfcYfawa9rTT2nVXUK1e0dhFRpy7O9dgcCyJsMwyOMgChqmTkAYY8
         lrO8FmVaBVXU/jCI9v95z8kMIgVRbHZl7Dj+Y9SNeeNladuYqhNnhCKP7pmJssTLe+hK
         /zfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4G0wXMIRKtQjgiQjhPPTWIJTonbxBMvj833mzQfGVdU=;
        b=v2bP1iSoVAmtsySiG+U+z4EQyviXETdujWB1/rlsPWB97wwWyEu0Eeu1zu3bBZUtXb
         23Dllm2tPx2iErM3TBrdS+mF2zRkmKF76d95J0vc95ZkbHNW0bWEaePeqWVpIGqEDLt2
         wfpfburnlzpHWpSJ15nP8+r9o7E+5sbzxHrwj9nJsvrUCCigd33CcDl5susLDEA6cLtZ
         fzT0Ni4Et+jSia9N3wcN2Q7n5VVc7KEw8hfjAOyCl6mVuyeQibSaNuNHpO56zLXXleGm
         CVdAbDyQZmSQMU6P5ZS7D1yh0UTh1rIYjs/OOts9JhIER/FJpo78ktZYfFrYo9iNkCsf
         c3pQ==
X-Gm-Message-State: AOAM5328/ZKx9YdCrxAc5ITkcfbhgD6tI37Zv+rfGxGCV1j1MsUl4McQ
        Bt7EnT3YU+qrWlzIdx0RKKcQAhovLBc=
X-Google-Smtp-Source: ABdhPJxFbn2GY3BCcnuEIOE5ToL9Wd42NcsVPvWkJ7LxAK1mty5nUWabwI1BhIkHNdC7U+LYga5X9w==
X-Received: by 2002:a05:6512:3f6:: with SMTP id n22mr19160482lfq.501.1639343024602;
        Sun, 12 Dec 2021 13:03:44 -0800 (PST)
Received: from localhost.localdomain (94-29-46-111.dynamic.spd-mgts.ru. [94.29.46.111])
        by smtp.gmail.com with ESMTPSA id y4sm1197172ljp.16.2021.12.12.13.03.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Dec 2021 13:03:44 -0800 (PST)
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
        linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
        linux-sh@vger.kernel.org, xen-devel@lists.xenproject.org,
        linux-acpi@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: [PATCH v5 05/21] ARM: Use do_kernel_power_off()
Date:   Mon, 13 Dec 2021 00:02:53 +0300
Message-Id: <20211212210309.9851-6-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211212210309.9851-1-digetx@gmail.com>
References: <20211212210309.9851-1-digetx@gmail.com>
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

