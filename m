Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B47B4C433FE
	for <linux-m68k@archiver.kernel.org>; Wed, 27 Oct 2021 21:24:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9D20C60231
	for <linux-m68k@archiver.kernel.org>; Wed, 27 Oct 2021 21:24:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237256AbhJ0V1M (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 27 Oct 2021 17:27:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53898 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234176AbhJ0VZW (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 27 Oct 2021 17:25:22 -0400
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B52DCC0432E8
        for <linux-m68k@lists.linux-m68k.org>; Wed, 27 Oct 2021 14:18:57 -0700 (PDT)
Received: by mail-lj1-x22c.google.com with SMTP id k13so6922724ljj.12
        for <linux-m68k@lists.linux-m68k.org>; Wed, 27 Oct 2021 14:18:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=J0jiL1GV/+pRa/Pi8omBJ059E/kI2yC/kBEGzY3TRbg=;
        b=FJbtoAu7rbq7E5RaKvepyk9plUf7jLnT+ML08UZjLgFiOZ5VaykzHp5Ff2lObAbFB8
         5GZGzZ57ZApIGsXSOF6gLQA97YsI0ZAQ/ZGu34m5aZxcCPPjtIEcQp67CojYOup39/Xv
         xsYx/9Bl6pD+/d5Egre5OsJvj19u3KKVwrkexlOW8n23RNvDolWdvTv8CSXdsnambAlA
         jmNsfq7r35M1wkX74Jgv3A3xCPTBUP4sDGuQeSw9FU1X/TxBftWhWMRe81zJ6SuXHAM8
         TvqOPVU0PykNu+1EXPWfVa52MP/IYJ4S57Q0SiUIct4v8BdbY1Ush4O+dDWBQRJUzf+C
         FQ7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=J0jiL1GV/+pRa/Pi8omBJ059E/kI2yC/kBEGzY3TRbg=;
        b=OrPnpvJZkPFnGfMm2zDcjY/tM1sLSrPAPwYsHdnjO/V0fgvLNU2eEbFB4oXcmkxIaa
         S1fto6mHcbLAl0FjmBM3zpSWl4l4fJTWOVeuH1rUGWRpSfFdHTJT/+6c0APWgPAQvc4w
         fuHrc+KAKAtuNom98rOrNGWJ9EBirBsOTfH/y70eX4KOvi+wf7Dt9SKv7MExu39KnoAB
         O/RkS38wun47JtQp32SgRAHNDGHDBIPid7dlIhoEA7hHaaff+Qw+tCi7Bj5OAn35lMvK
         mr3petGxNmxk0HdJXtHjl6S5KCNSb/t2RqdJx2m0++gM3y9j6COwYULleYZmfJiQKSAV
         SvLQ==
X-Gm-Message-State: AOAM530EVJXIlzvaRAvglJKzVekKcz6fFBfe/WXx3r0g4Yyf3V/O95PM
        HhARZCq+d+sT+/mvRFiVDIo=
X-Google-Smtp-Source: ABdhPJwO9DbKrxmMzwfiSQzUITuZHuDXfhRgNgPDDhUghYThRMLe5cQOKy/B7VPBX8OP8l5Jmu7iAw==
X-Received: by 2002:a2e:8097:: with SMTP id i23mr314285ljg.287.1635369536096;
        Wed, 27 Oct 2021 14:18:56 -0700 (PDT)
Received: from localhost.localdomain (46-138-41-28.dynamic.spd-mgts.ru. [46.138.41.28])
        by smtp.gmail.com with ESMTPSA id d7sm104336ljl.18.2021.10.27.14.18.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Oct 2021 14:18:55 -0700 (PDT)
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
Subject: [PATCH v2 34/45] mfd: palmas: Use devm_register_simple_power_off_handler()
Date:   Thu, 28 Oct 2021 00:17:04 +0300
Message-Id: <20211027211715.12671-35-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211027211715.12671-1-digetx@gmail.com>
References: <20211027211715.12671-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Use devm_register_simple_power_off_handler() that replaces global
pm_power_off variable and allows to register multiple power-off handlers.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/mfd/palmas.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/mfd/palmas.c b/drivers/mfd/palmas.c
index f5b3fa973b13..c7d4d48d2fda 100644
--- a/drivers/mfd/palmas.c
+++ b/drivers/mfd/palmas.c
@@ -14,6 +14,7 @@
 #include <linux/i2c.h>
 #include <linux/interrupt.h>
 #include <linux/irq.h>
+#include <linux/reboot.h>
 #include <linux/regmap.h>
 #include <linux/err.h>
 #include <linux/mfd/core.h>
@@ -420,12 +421,12 @@ static void palmas_dt_to_pdata(struct i2c_client *i2c,
 			"ti,system-power-controller");
 }
 
-static struct palmas *palmas_dev;
-static void palmas_power_off(void)
+static void palmas_power_off(void *data)
 {
 	unsigned int addr;
 	int ret, slave;
 	u8 powerhold_mask;
+	struct palmas *palmas_dev = data;
 	struct device_node *np = palmas_dev->dev->of_node;
 
 	if (of_property_read_bool(np, "ti,palmas-override-powerhold")) {
@@ -680,12 +681,16 @@ static int palmas_i2c_probe(struct i2c_client *i2c,
 	 */
 	if (node) {
 		ret = devm_of_platform_populate(&i2c->dev);
-		if (ret < 0) {
+		if (ret < 0)
+			goto err_irq;
+	}
+
+	if (pdata->pm_off) {
+		ret = devm_register_simple_power_off_handler(&i2c->dev,
+							     palmas_power_off,
+							     palmas);
+		if (ret)
 			goto err_irq;
-		} else if (pdata->pm_off && !pm_power_off) {
-			palmas_dev = palmas;
-			pm_power_off = palmas_power_off;
-		}
 	}
 
 	return ret;
@@ -712,11 +717,6 @@ static int palmas_i2c_remove(struct i2c_client *i2c)
 			i2c_unregister_device(palmas->i2c_clients[i]);
 	}
 
-	if (palmas == palmas_dev) {
-		pm_power_off = NULL;
-		palmas_dev = NULL;
-	}
-
 	return 0;
 }
 
-- 
2.33.1

