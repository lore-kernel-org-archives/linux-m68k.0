Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D47BC433FE
	for <linux-m68k@archiver.kernel.org>; Wed, 27 Oct 2021 21:19:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2A8FD610CB
	for <linux-m68k@archiver.kernel.org>; Wed, 27 Oct 2021 21:19:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235961AbhJ0VVq (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 27 Oct 2021 17:21:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53824 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244426AbhJ0VUr (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 27 Oct 2021 17:20:47 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86F44C06122B
        for <linux-m68k@lists.linux-m68k.org>; Wed, 27 Oct 2021 14:18:20 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id bp15so9012976lfb.4
        for <linux-m68k@lists.linux-m68k.org>; Wed, 27 Oct 2021 14:18:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Cc0IUGWHitJ0Cooyguk/vAdy9iAEtCRPuqNtfJHYmrA=;
        b=hGiOk7puznFSxpZSFm/Eya2Cl9N4a04S/N7AMKzyQzEzjBU4DjBRSyeAPC6r2d+wM7
         xUQ7Ac9D1vF+xVotAvlC6ZCck4cXMzjLk9AuV7aPkEcOFRxo/Y6dcKGr+AskSfh12zZH
         j4t9S3xSdGJpshUHlnXLi2wz4oVxcxE35PVQckWFsoWLYAS6gGsox7O/ylTaKD83bUPI
         lt0JfBMnsOVk10t4KXi669c5Oy5pFEzyyvF+GC9JzvCvwEtP2Bq8P5zo32YZHs5FWOMt
         Vb6ZGXWglhHchKGKPrIHgEEJ9wGUMKsnUwpN3Lz0Uy/fasmq0C+gajXgFsv262T+m1RI
         GwKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Cc0IUGWHitJ0Cooyguk/vAdy9iAEtCRPuqNtfJHYmrA=;
        b=blwNJc6m37m6v8ziQyiTSRHlLKubef3b2XLudNZJbUSrEUkfU4VCsQxv3DhmNIIsZB
         XxciTQc7p0KuaII6mE2fGuUz06JeigJSL+cStUdv9ZbfCkLc34JhgNHeeBLobwikuS+s
         zdQdpM5J6//1HtAphiHZ0u1eE7y/ZyYiWJtmaIY98UITjISzF3qDR7ST2yXDKqUMB9A3
         AGJTXK1lUCRsi+ax3xK8GHhkUAtJm2rGTeY3/cTuFiJGljIDexCk66n6RLOdwPm/F0Qm
         Vn3MEcnnchUFP8lAZD2eJVrpTBW6iTVVYnlLYgG5G6O2PfC6dmgay6fukCEC7w3qKDRT
         QiuQ==
X-Gm-Message-State: AOAM530hB2Hrdx6woPROdjfVIiT5kEBEcCxcUZOqB5TSzeTWpdvht1nP
        XY3idgwpudaVba9GfdFgtus=
X-Google-Smtp-Source: ABdhPJygpdJSNoXRh8ba3OotHfDcr8CSl9bSWUL0hunV++q/wiTfcZPk6onGhghey5UXGxJAqpQkjw==
X-Received: by 2002:a05:6512:228a:: with SMTP id f10mr83288lfu.489.1635369498913;
        Wed, 27 Oct 2021 14:18:18 -0700 (PDT)
Received: from localhost.localdomain (46-138-41-28.dynamic.spd-mgts.ru. [46.138.41.28])
        by smtp.gmail.com with ESMTPSA id d7sm104336ljl.18.2021.10.27.14.18.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Oct 2021 14:18:18 -0700 (PDT)
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
Subject: [PATCH v2 14/45] mips: Use do_kernel_power_off()
Date:   Thu, 28 Oct 2021 00:16:44 +0300
Message-Id: <20211027211715.12671-15-digetx@gmail.com>
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
 arch/mips/kernel/reset.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/mips/kernel/reset.c b/arch/mips/kernel/reset.c
index 6288780b779e..e7ce07b3e79b 100644
--- a/arch/mips/kernel/reset.c
+++ b/arch/mips/kernel/reset.c
@@ -114,8 +114,7 @@ void machine_halt(void)
 
 void machine_power_off(void)
 {
-	if (pm_power_off)
-		pm_power_off();
+	do_kernel_power_off();
 
 #ifdef CONFIG_SMP
 	preempt_disable();
-- 
2.33.1

