Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFC4BC433F5
	for <linux-m68k@archiver.kernel.org>; Sun, 12 Dec 2021 21:17:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229623AbhLLVRu (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Sun, 12 Dec 2021 16:17:50 -0500
Received: from mail-wr1-f54.google.com ([209.85.221.54]:40584 "EHLO
        mail-wr1-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229779AbhLLVRh (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Sun, 12 Dec 2021 16:17:37 -0500
Received: by mail-wr1-f54.google.com with SMTP id t9so24003918wrx.7
        for <linux-m68k@lists.linux-m68k.org>; Sun, 12 Dec 2021 13:14:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=IgdEY3brdUGAcbkVUTuopyRaDKQjmT9IOiG4donLZPs=;
        b=pRjCeelZEbxaZGwO+A2aL0XPV/VaH02YaHpKAd9wdI9JEveM57sE60GJ6XNHSn3X7R
         3k3prwg00aYmbn6qrs0hvCC/Qu+NXBudxBQ11zdQ8NwOHe1318/leMZcgjGjBHY51gwa
         7soXg88k1YVhJkGc+TTtq+bVpeCDRCSSMfOlkqSinKAC0bda9LJdWsfx6/W5MHM5/jd9
         DvPUXfjXzCMkaPG3Qy81MLfolhXJsYt+NP13KnN+kkNkRrGfJb6pVBACzy9He8+wQu/l
         eGVwkctUMedEHbT7ecy6K+YGcbliElewyWmMiaaA91DPydKzN7z1nc6/16QB5Y1JZoWn
         FbWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=IgdEY3brdUGAcbkVUTuopyRaDKQjmT9IOiG4donLZPs=;
        b=FI1xSTXd+7cNMU4DArneKJnGsWiTkAb2jFTjr47fhcPYE8Ljk5daqu76XZm/eZg6mK
         +47o5Ok8hSoUWrbeNSyDvuzrqXkDXSLNyOit1C/BCXUJlLQgz04EPFBJ1LXSHYasiJ8r
         CwY1GYnkF8hGF7DeonWzxtb2d7AXRKY1VVYubbRYKtlj0klYhs9pkHfZgSCo4umvLYQ+
         4yhkIupFriv2y0KVFuTzlcYzBHu0Gz8qz93P3Gtv4Aqee+zHlImjlUz94pRY0kRVPPt5
         8n/nVdn+C7YetYC6rdywaLpypoywcVL00IgVX8WnguBM+Ax6XogzF5ebVBUEV43K8mxR
         cvBA==
X-Gm-Message-State: AOAM531KTeCqpylSfj3l/7Og4ILawTRSiSDP//quqNX81mRX97hhqIwo
        8iFTWLWo07q628yfJBaum/bqDTxnPq4=
X-Google-Smtp-Source: ABdhPJxNW1DwCShpX2NDWOWr5vcKraTuFYIWDWgUXB6EPWJrHuuBITafm/NNerVkSN6nEKqLT69IWQ==
X-Received: by 2002:a05:651c:1548:: with SMTP id y8mr25360872ljp.458.1639343048830;
        Sun, 12 Dec 2021 13:04:08 -0800 (PST)
Received: from localhost.localdomain (94-29-46-111.dynamic.spd-mgts.ru. [94.29.46.111])
        by smtp.gmail.com with ESMTPSA id y4sm1197172ljp.16.2021.12.12.13.04.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Dec 2021 13:04:08 -0800 (PST)
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
Subject: [PATCH v5 17/21] nds32: Use do_kernel_power_off()
Date:   Mon, 13 Dec 2021 00:03:05 +0300
Message-Id: <20211212210309.9851-18-digetx@gmail.com>
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

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 arch/nds32/kernel/process.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/nds32/kernel/process.c b/arch/nds32/kernel/process.c
index 49fab9e39cbf..0936dcd7db1b 100644
--- a/arch/nds32/kernel/process.c
+++ b/arch/nds32/kernel/process.c
@@ -54,8 +54,7 @@ EXPORT_SYMBOL(machine_halt);
 
 void machine_power_off(void)
 {
-	if (pm_power_off)
-		pm_power_off();
+	do_kernel_power_off();
 }
 
 EXPORT_SYMBOL(machine_power_off);
-- 
2.33.1

