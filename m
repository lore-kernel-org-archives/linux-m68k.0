Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F36BC433F5
	for <linux-m68k@archiver.kernel.org>; Wed, 27 Oct 2021 21:21:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 29419610CB
	for <linux-m68k@archiver.kernel.org>; Wed, 27 Oct 2021 21:21:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241426AbhJ0VXk (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 27 Oct 2021 17:23:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53912 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244671AbhJ0VVv (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 27 Oct 2021 17:21:51 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7512EC07978C
        for <linux-m68k@lists.linux-m68k.org>; Wed, 27 Oct 2021 14:18:35 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id bq11so8955703lfb.10
        for <linux-m68k@lists.linux-m68k.org>; Wed, 27 Oct 2021 14:18:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4OWbCpLiTrW70NMTPpPUNVkhVF3RKPzG5GTofMVph+0=;
        b=nyjF7CMTiXZTknDCkjxSlwBlmez3wFeA+zehsvTRn8HWRCKWBbu+VeqUVL44ms69wV
         nnBlf5yP21RTavxXaqxcjkZ3KCf591eZC6XUlLgNrDZoqwAeG0e8waWDmBuDqGJPa/ia
         TWGnRhqwCJRO6ZHGrxxDEuuBCRuC8gitnwXoBy6yPn2yaI52p7BdBoMEudji1fyrvZ7s
         jQQkx67Vh3JRx01BzNxvLauTbUeZkFSOIEd8jQMxIMky+FUXABFowKrpCYCop+RjKrYK
         44VAj9OlGjdC9id5DEzvny9pb4y7eTDKQL+s4i3zBATQTR5zvjDC+NzhG9GB4CVWfx2z
         vHjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4OWbCpLiTrW70NMTPpPUNVkhVF3RKPzG5GTofMVph+0=;
        b=BLsbk5bRQrfatErYK+pAcr+0TtcCSnNepbarw3kWUgLRV1AFAKaGT13s7tSinCTUqZ
         WhXvAbjryFM6jRHLR5fBcUXDTCKmjw/MlTJJk+HOhjvR6Sdzy0e7gdM8w49tfOokmbF5
         6Tk/Yabi2K0GwXtvqmHBwVmuSbQDeSOIyHhyWhkuluImfzlVAU15pGN4TZCmwfIUqe17
         CbMMjxLHANmDDL9yPOuxsG8e+3zN7K1Lisd8dBXmBcdd8XUWqgSqhJtAWYXQak7OojpP
         5NJvjnGloVlM7gL2hrRXjWcdLQU3eZ2e9nVLMJ3YnPGQ5u0CQerurV/WeD8IR6jtJVnI
         C2lw==
X-Gm-Message-State: AOAM5334f5t0CREF34+BXKp8t6c1XPbwyXQV8hXfNYtl5WLhnDNZJqj0
        oa6omj5NtigFJxLR7+bBJEs=
X-Google-Smtp-Source: ABdhPJy61JBdPHWehe+0JZDFDtaEYRkwyYUuH0JZUFf3l53X5Ds5OQvvxR8PRHj15LQUp0FSRiIF9w==
X-Received: by 2002:ac2:53a5:: with SMTP id j5mr141454lfh.130.1635369513848;
        Wed, 27 Oct 2021 14:18:33 -0700 (PDT)
Received: from localhost.localdomain (46-138-41-28.dynamic.spd-mgts.ru. [46.138.41.28])
        by smtp.gmail.com with ESMTPSA id d7sm104336ljl.18.2021.10.27.14.18.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Oct 2021 14:18:33 -0700 (PDT)
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
Subject: [PATCH v2 22/45] memory: emif: Use kernel_can_power_off()
Date:   Thu, 28 Oct 2021 00:16:52 +0300
Message-Id: <20211027211715.12671-23-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211027211715.12671-1-digetx@gmail.com>
References: <20211027211715.12671-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Replace legacy pm_power_off with kernel_can_power_off() helper that
is aware about chained power-off handlers.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/memory/emif.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/memory/emif.c b/drivers/memory/emif.c
index 762d0c0f0716..cab10d5274a0 100644
--- a/drivers/memory/emif.c
+++ b/drivers/memory/emif.c
@@ -630,7 +630,7 @@ static irqreturn_t emif_threaded_isr(int irq, void *dev_id)
 		dev_emerg(emif->dev, "SDRAM temperature exceeds operating limit.. Needs shut down!!!\n");
 
 		/* If we have Power OFF ability, use it, else try restarting */
-		if (pm_power_off) {
+		if (kernel_can_power_off()) {
 			kernel_power_off();
 		} else {
 			WARN(1, "FIXME: NO pm_power_off!!! trying restart\n");
-- 
2.33.1

