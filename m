Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BB9CC4321E
	for <linux-m68k@archiver.kernel.org>; Wed, 27 Oct 2021 21:22:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3CC80610CA
	for <linux-m68k@archiver.kernel.org>; Wed, 27 Oct 2021 21:22:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239822AbhJ0VZY (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 27 Oct 2021 17:25:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53906 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241191AbhJ0VYU (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 27 Oct 2021 17:24:20 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60AAEC0432DC
        for <linux-m68k@lists.linux-m68k.org>; Wed, 27 Oct 2021 14:18:50 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id y26so8916133lfa.11
        for <linux-m68k@lists.linux-m68k.org>; Wed, 27 Oct 2021 14:18:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=umNH2+YT7M6ZKcjQGvjjohnKVEe/3rK29YQH+BDj6i4=;
        b=nj5zb43OqtwdizDOJ4YZ+fYZadM1gdDKmRqYZUCoy6YYJ9FK+h8NFV8Fm4J2Ku+dUO
         VD1iu0fINLYL61cuY7tNDYLtDDcpQWTMBS3LiXmrEVigOlROqEfbjJpsrnK8lw9w6k0A
         Q5RVvk+HURAmLxg4yngnt6lHHBxEc4oSlIcG3ZpIBx+R3YAOuuSSdjMf/vRVMuvqCw1Z
         E8uGSsJkZ6VWq/NOLfLD+OAnXKEDLZsNGIWjcaZrIrkicK6f30puV4871fbRXrX4aoDM
         yS04DJACEKWBr3KF/AjOj2De3JGJ2p+GHt74NSrUBKQDPvr858UletsNh5sICSkmVEWD
         3KsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=umNH2+YT7M6ZKcjQGvjjohnKVEe/3rK29YQH+BDj6i4=;
        b=QRVnJcHp1uKT28AzQjdH2Gz62u8EG1mwPYkgXQ2NXbjFWRNGsKY9lco05BkBotHsU9
         /V4CH8MfVr9WJdagX5PdBX7h6NB/n8EwDDj3okwvVgq+n6CjOyDS6UNUZkfVL+NHAraF
         r+aEOAOkLb6MX/oKFfgOrXYSTJ7qyBmfZayVtden+5PN37iC0tViznMuQlCprBXfgsbI
         duWOrV0XnxnNaS4LbooxqZUgR5n9R5wwyjtRXX+rIbHBcBwBSuexXsp5Wp6UCu3L/eCh
         PJbTdiA/9L83AUg+PAbpyY75j9CDEAC/KFPNTv64kZHpkyIkbS6PfuYi5b8bxDwiLF4e
         w7hA==
X-Gm-Message-State: AOAM530YcJIcKVX9zZLxEm4DyIln4namKUzwGbK3Sjykqf/MUUcnZhHQ
        tn9+LpS2SHnDot8FyUZXAiU=
X-Google-Smtp-Source: ABdhPJyzuSZuOYHEQbprBgwtJMyx5L9tc7ERtjIIXrEKG72XHaUi8WMWlLHXLzXgCVfDIwEbrdMbVw==
X-Received: by 2002:a05:6512:38d0:: with SMTP id p16mr83922lft.483.1635369528748;
        Wed, 27 Oct 2021 14:18:48 -0700 (PDT)
Received: from localhost.localdomain (46-138-41-28.dynamic.spd-mgts.ru. [46.138.41.28])
        by smtp.gmail.com with ESMTPSA id d7sm104336ljl.18.2021.10.27.14.18.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Oct 2021 14:18:48 -0700 (PDT)
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
Subject: [PATCH v2 30/45] mfd: ene-kb3930: Use devm_register_power_handler()
Date:   Thu, 28 Oct 2021 00:17:00 +0300
Message-Id: <20211027211715.12671-31-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211027211715.12671-1-digetx@gmail.com>
References: <20211027211715.12671-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Use devm_register_power_handler() that replaces global pm_power_off
variable and allows to register multiple power-off handlers. It also
provides restart-handler support, i.e. all in one API.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/mfd/ene-kb3930.c | 45 ++++++++++++++--------------------------
 1 file changed, 15 insertions(+), 30 deletions(-)

diff --git a/drivers/mfd/ene-kb3930.c b/drivers/mfd/ene-kb3930.c
index 1b73318d1f1f..6a3c5f48e5e1 100644
--- a/drivers/mfd/ene-kb3930.c
+++ b/drivers/mfd/ene-kb3930.c
@@ -31,10 +31,9 @@ struct kb3930 {
 	struct i2c_client *client;
 	struct regmap *ram_regmap;
 	struct gpio_descs *off_gpios;
+	struct power_handler power_handler;
 };
 
-static struct kb3930 *kb3930_power_off;
-
 #define EC_GPIO_WAVE		0
 #define EC_GPIO_OFF_MODE	1
 
@@ -60,21 +59,19 @@ static void kb3930_off(struct kb3930 *ddata, int off_mode)
 	}
 }
 
-static int kb3930_restart(struct notifier_block *this,
-			  unsigned long mode, void *cmd)
+static void kb3930_restart(struct restart_data *data)
 {
-	kb3930_off(kb3930_power_off, EC_OFF_MODE_REBOOT);
-	return NOTIFY_DONE;
+	struct kb3930 *ddata = data->cb_data;
+
+	kb3930_off(ddata, EC_OFF_MODE_REBOOT);
 }
 
-static void kb3930_pm_power_off(void)
+static void kb3930_power_off(struct power_off_data *data)
 {
-	kb3930_off(kb3930_power_off, EC_OFF_MODE_POWER);
-}
+	struct kb3930 *ddata = data->cb_data;
 
-static struct notifier_block kb3930_restart_nb = {
-	.notifier_call = kb3930_restart,
-};
+	kb3930_off(ddata, EC_OFF_MODE_POWER);
+}
 
 static const struct mfd_cell ariel_ec_cells[] = {
 	{ .name = "dell-wyse-ariel-led", },
@@ -131,7 +128,6 @@ static int kb3930_probe(struct i2c_client *client)
 	if (!ddata)
 		return -ENOMEM;
 
-	kb3930_power_off = ddata;
 	ddata->client = client;
 	i2c_set_clientdata(client, ddata);
 
@@ -169,24 +165,14 @@ static int kb3930_probe(struct i2c_client *client)
 	}
 
 	if (ddata->off_gpios) {
-		register_restart_handler(&kb3930_restart_nb);
-		if (!pm_power_off)
-			pm_power_off = kb3930_pm_power_off;
-	}
+		ddata->power_handler.cb_data = ddata;
+		ddata->power_handler.restart_cb = kb3930_restart;
+		ddata->power_handler.power_off_cb = kb3930_power_off;
 
-	return 0;
-}
-
-static int kb3930_remove(struct i2c_client *client)
-{
-	struct kb3930 *ddata = i2c_get_clientdata(client);
-
-	if (ddata->off_gpios) {
-		if (pm_power_off == kb3930_pm_power_off)
-			pm_power_off = NULL;
-		unregister_restart_handler(&kb3930_restart_nb);
+		ret = devm_register_power_handler(dev, &ddata->power_handler);
+		if (ret)
+			return ret;
 	}
-	kb3930_power_off = NULL;
 
 	return 0;
 }
@@ -199,7 +185,6 @@ MODULE_DEVICE_TABLE(of, kb3930_dt_ids);
 
 static struct i2c_driver kb3930_driver = {
 	.probe_new = kb3930_probe,
-	.remove = kb3930_remove,
 	.driver = {
 		.name = "ene-kb3930",
 		.of_match_table = kb3930_dt_ids,
-- 
2.33.1

