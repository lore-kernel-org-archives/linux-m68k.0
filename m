Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1970FC433FE
	for <linux-m68k@archiver.kernel.org>; Wed, 27 Oct 2021 21:18:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 06FE461106
	for <linux-m68k@archiver.kernel.org>; Wed, 27 Oct 2021 21:18:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244466AbhJ0VU4 (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 27 Oct 2021 17:20:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53790 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244371AbhJ0VUh (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 27 Oct 2021 17:20:37 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3457CC061570
        for <linux-m68k@lists.linux-m68k.org>; Wed, 27 Oct 2021 14:18:11 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id f3so804082lfu.12
        for <linux-m68k@lists.linux-m68k.org>; Wed, 27 Oct 2021 14:18:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=BPtMBppPEnkW8FAu+XIJVa0vPCxV8oSZETkwJ9fGFM4=;
        b=evvP7MsJwkqVHf9WWHeVtMPJGHU+mvo2PJqLCvURQO+gDiXejWyY7GbQhAh5S2Yuq3
         zE+MXp6bpyTV9PKDTbTfo9WWXpFtGfj5n4Qz8ioZr0QyDkpV7sVDFNZi5aSeGd0r1ssm
         FaiC2SGtT+UwMk3wtZhRptmS5Jh1EvMlK22P6yAvTfzVBpKlWKTd0CWvNC0iHDJeCUVq
         3jvnGl27YfW1MAZwLzhuSz3oPcJmkrZj59ainuK5d21Jqe/MApWPiIhI2vk+XeD9jyY+
         vEN96KR+en3glKlYAHFchamcvD6xrJYfM61Zs7aonaQIhrzZ8Vd1+JewhOn6GxzMgcou
         E++w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BPtMBppPEnkW8FAu+XIJVa0vPCxV8oSZETkwJ9fGFM4=;
        b=WVNJjKb781vuGWx/M95HVacEDtEwrFE4fcVqgyMdve1maPjmhbP3trsqaRbDpWRnTK
         eyG7N9qpTP0mtj6gdYTEqEvmrT3P0hjPk0BC+G99UuJcJxz9oYter3eRJroISzIEGqa3
         mTye4+R11ElD/NqploIVaDjA57H0aThXOSPNMPXXQeCyb2kHfzLmPMXS6Gs2itDF1hVd
         JeQWp+bSL3S6S7rVII3xDuu/cw3JBV1ag8NiUGhKqwTEKfqNd0NQmi8FupfxQnlswlpj
         P1uZKHAW7BZA4kAQZ7cdy0n4iSW7t1vh3fCW28l+IQhIdt+YtPyHCDdw2WQHaxBwqE1C
         H+iQ==
X-Gm-Message-State: AOAM531PGYXyLxKdeAQ8976TM+xYkTMU5mDkRFNwjpoVJUbuEZQsEBuB
        mP8TFIMfoTdxTUMejO9nGO0=
X-Google-Smtp-Source: ABdhPJwclkCD48sSOOyIVpWJhTUvxO0ayPfEAseJaJV46PV2ffR0qGAwcKjO8WTuzPJQEhkUDZtmqQ==
X-Received: by 2002:a05:6512:aca:: with SMTP id n10mr147591lfu.66.1635369489587;
        Wed, 27 Oct 2021 14:18:09 -0700 (PDT)
Received: from localhost.localdomain (46-138-41-28.dynamic.spd-mgts.ru. [46.138.41.28])
        by smtp.gmail.com with ESMTPSA id d7sm104336ljl.18.2021.10.27.14.18.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Oct 2021 14:18:09 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Lee Jones <lee.jones@linaro.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Mark Brown <broonie@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Russell King <linux@armlinux.org.uk>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Ulf Hansson <ulf.hansson@linaro.org>
Cc:     Catalin Marinas <catalin.marinas@arm.com>,
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
        Len Brown <lenb@kernel.org>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Chen-Yu Tsai <wens@csie.org>,
        =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
        Tony Lindgren <tony@atomide.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Vladimir Zapolskiy <vz@mleia.com>,
        Avi Fishman <avifishman70@gmail.com>,
        Tomer Maimon <tmaimon77@gmail.com>,
        Tali Perry <tali.perry1@gmail.com>,
        Patrick Venture <venture@google.com>,
        Nancy Yuen <yuenn@google.com>,
        Benjamin Fair <benjaminfair@google.com>,
        Pavel Machek <pavel@ucw.cz>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-csky@vger.kernel.org, linux-ia64@vger.kernel.org,
        linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
        linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-riscv@lists.infradead.org, linux-sh@vger.kernel.org,
        xen-devel@lists.xenproject.org, linux-acpi@vger.kernel.org,
        linux-omap@vger.kernel.org, openbmc@lists.ozlabs.org,
        linux-tegra@vger.kernel.org, linux-pm@vger.kernel.org
Subject: [PATCH v2 09/45] xen/x86: Use do_kernel_power_off()
Date:   Thu, 28 Oct 2021 00:16:39 +0300
Message-Id: <20211027211715.12671-10-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211027211715.12671-1-digetx@gmail.com>
References: <20211027211715.12671-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Kernel now supports chained power-off handlers. Use do_kernel_power_off()
that invokes chained power-off handlers. It also invokes legacy
pm_power_off() for now, which will be removed once all drivers will
be converted to the new power-off API.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 arch/x86/xen/enlighten_pv.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/x86/xen/enlighten_pv.c b/arch/x86/xen/enlighten_pv.c
index 4f63117f09bb..4a0b9b7baf02 100644
--- a/arch/x86/xen/enlighten_pv.c
+++ b/arch/x86/xen/enlighten_pv.c
@@ -32,6 +32,7 @@
 #include <linux/gfp.h>
 #include <linux/edd.h>
 #include <linux/objtool.h>
+#include <linux/reboot.h>
 
 #include <xen/xen.h>
 #include <xen/events.h>
@@ -1087,8 +1088,7 @@ static void xen_machine_halt(void)
 
 static void xen_machine_power_off(void)
 {
-	if (pm_power_off)
-		pm_power_off();
+	do_kernel_power_off();
 	xen_reboot(SHUTDOWN_poweroff);
 }
 
-- 
2.33.1

