Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 113D7C4332F
	for <linux-m68k@archiver.kernel.org>; Fri, 26 Nov 2021 18:22:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238132AbhKZS0G (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Fri, 26 Nov 2021 13:26:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57824 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238079AbhKZSYD (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Fri, 26 Nov 2021 13:24:03 -0500
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 32777C0698D0
        for <linux-m68k@lists.linux-m68k.org>; Fri, 26 Nov 2021 10:02:04 -0800 (PST)
Received: by mail-lf1-x12f.google.com with SMTP id k37so26156803lfv.3
        for <linux-m68k@lists.linux-m68k.org>; Fri, 26 Nov 2021 10:02:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=idp+KUM0Lads56hMjVdKoUEucrYOLC8M0llXkHYfiR0=;
        b=q2+3D7luLbLFGQf0rLpPcuWTJ51luwk4E0BLwdexAsMfEPwQ+vkLaGFyWTazwTiBO3
         /31kHhpvsxvbKpD6AoRLviAKAyfSlaZuuBZ4G5+V4OQzeOPzvvdnKmespVy/IqSeX7hO
         YTpSNWUfBdkYMm9sefGyGdAIypO41Y86jqoXG+FM5ZKY1SqW/Wp0Kge+e08k/V8NPYuz
         YtC36m0FSAgcE4CC4jRft7WGjfF+hcgDrvOqUW7oFxpYyW5LwR3hKV2jrTJdfRtBiX7E
         qc34DpRilSgV0iEhvXRNTWvVGUy3qFfYDOeUaBdaf+MPIjTcw1RGSJKn81/KWfdsBdx+
         55DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=idp+KUM0Lads56hMjVdKoUEucrYOLC8M0llXkHYfiR0=;
        b=sEAWwcsg8ApQpUIz/CSTKPcADxMl0wdFKWi9CTRnpcwMjXVGOF45oM2OASL9IUh2r+
         U4FPbU1YLGKW2dYzK8Msmdin+aw53/vCH0Vzave5n8HNWixcYZ09sqPKS1/Qgg1FG4E1
         aRCTixmKtBTk0BDjryexR9hPr6hfvVxn1QdiO+0lAJu6GReKncSQZNEGY7e/9WPDEkVN
         zN+b4Ys6QRf4Q6fb7nN2VJkHdrlSQ8jBorX0cpdvvhUv8qXtaIxofYxzTN7qJQoO7qTe
         yC39lvJztuxPDBWlHBQpKCbYKWZYp7JkCKcQPkLjly83oD6HkHnOswwnFsd2BsNKVMpI
         lUbA==
X-Gm-Message-State: AOAM533ws/KyiFlhxocFavz7WltFnGS0PDhsH0PkmEc5GiwfEWPOAHsA
        n0CfXr4GXJKRkQxyRELqhIQ=
X-Google-Smtp-Source: ABdhPJyszCqoy2c22hJd1AwW3euuk/YQIYMf48+wUhpEids7tlSfZnt+31CbA93lLkfEy/WCRFUCww==
X-Received: by 2002:ac2:4423:: with SMTP id w3mr31717979lfl.385.1637949722516;
        Fri, 26 Nov 2021 10:02:02 -0800 (PST)
Received: from localhost.localdomain (94-29-48-99.dynamic.spd-mgts.ru. [94.29.48.99])
        by smtp.gmail.com with ESMTPSA id i32sm553831lfv.295.2021.11.26.10.02.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Nov 2021 10:02:02 -0800 (PST)
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
Subject: [PATCH v4 06/25] reboot: Warn if unregister_restart_handler() fails
Date:   Fri, 26 Nov 2021 21:00:42 +0300
Message-Id: <20211126180101.27818-7-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211126180101.27818-1-digetx@gmail.com>
References: <20211126180101.27818-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Emit warning if unregister_restart_handler() fails since it never should
fail. This will ease further API development by catching mistakes early.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 kernel/reboot.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/reboot.c b/kernel/reboot.c
index e6659ae329f1..f0e7b9c13f6b 100644
--- a/kernel/reboot.c
+++ b/kernel/reboot.c
@@ -210,7 +210,7 @@ EXPORT_SYMBOL(register_restart_handler);
  */
 int unregister_restart_handler(struct notifier_block *nb)
 {
-	return atomic_notifier_chain_unregister(&restart_handler_list, nb);
+	return WARN_ON(atomic_notifier_chain_unregister(&restart_handler_list, nb));
 }
 EXPORT_SYMBOL(unregister_restart_handler);
 
-- 
2.33.1

