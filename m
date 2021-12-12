Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43709C4332F
	for <linux-m68k@archiver.kernel.org>; Sun, 12 Dec 2021 21:17:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229583AbhLLVRq (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Sun, 12 Dec 2021 16:17:46 -0500
Received: from mail-wr1-f43.google.com ([209.85.221.43]:41816 "EHLO
        mail-wr1-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229776AbhLLVRh (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Sun, 12 Dec 2021 16:17:37 -0500
Received: by mail-wr1-f43.google.com with SMTP id a9so23973719wrr.8
        for <linux-m68k@lists.linux-m68k.org>; Sun, 12 Dec 2021 13:14:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=cQhCUMmxREqlb3fYFdUNP+80Jr1xwOUlupNd5E99mX4=;
        b=kywzoc+Gi7wLNuBk90TEKZW85IC/6URmBmQrI58bAL/QPFhT2prlCmlNeb9T8eY7Ic
         kaAzgc8G/0LgoIzVYO1QktoG7vKpxJJBnuwLoDt+HIA67HN4VctOi7XqEXlw6RTgsmNB
         9ZzMbAWCGvmSWTdelcaOM9EwDKrMUtEbXlVABEMzzEb6IxT5HrFIy/s6X4Z2D3yGz8be
         G89ttBkdlIOUOuEDpB9kv6rMon8ZyAqpnzA7ZSWI952xKubMgQPGXFJ+ne9aWLwQTENu
         ihN9SLyYypvBOVyotduA1RjOzW4Dvoz4sPrRK/VW5mbeHSEzk4q7EP/uMXmylA99SqQI
         TI5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=cQhCUMmxREqlb3fYFdUNP+80Jr1xwOUlupNd5E99mX4=;
        b=5kDOwvfeDHNNL79WFRmeHxMRXFdypxK6ENB85CEkf9997YPd3MLN29MQp4hC0mX17Q
         igUuUWroNagr0r3qTILzY0rxFnwTqqu4DhmDqTudWKoBwyks6IEgXHuJQYSlKQRPASzB
         Bp/1PpGN0lVhbWYXv1rro8GKkymdGvl/9jWnrfDic5t8vbRVEGR72zas2dQbYgJxwACm
         58NlOJgiy78WVYCBOSBBLpFxhaaJz9+KLQyW80abc6ISCiNTQcC1cDLvbRsdoK7edC2W
         lJFxFwoJHO5NqeZSpzo0EqdqQQl6jEofKtwGTAghGlZ5+mBaciaAC+1j4GrbNpafL0CM
         amGA==
X-Gm-Message-State: AOAM532AHz2wsemxqaBAYZQe0FV0+yIm9liECS4zNY7f8CkOcqFmC/mT
        6K6exoMqjlTw0VMeLSpP4Q100MLojCU=
X-Google-Smtp-Source: ABdhPJwPHg+2Pz2/BonOuvJzDEEvGDrSlS58FJbScCfLgCTS8nGeJYv4KFLQDU4sli93Hwi7CmGl0g==
X-Received: by 2002:a2e:a176:: with SMTP id u22mr26407140ljl.116.1639343034642;
        Sun, 12 Dec 2021 13:03:54 -0800 (PST)
Received: from localhost.localdomain (94-29-46-111.dynamic.spd-mgts.ru. [94.29.46.111])
        by smtp.gmail.com with ESMTPSA id y4sm1197172ljp.16.2021.12.12.13.03.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Dec 2021 13:03:54 -0800 (PST)
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
Subject: [PATCH v5 10/21] xen/x86: Use do_kernel_power_off()
Date:   Mon, 13 Dec 2021 00:02:58 +0300
Message-Id: <20211212210309.9851-11-digetx@gmail.com>
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

Acked-by: Juergen Gross <jgross@suse.com>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 arch/x86/xen/enlighten_pv.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/x86/xen/enlighten_pv.c b/arch/x86/xen/enlighten_pv.c
index 5004feb16783..527fa545eb1f 100644
--- a/arch/x86/xen/enlighten_pv.c
+++ b/arch/x86/xen/enlighten_pv.c
@@ -31,6 +31,7 @@
 #include <linux/gfp.h>
 #include <linux/edd.h>
 #include <linux/objtool.h>
+#include <linux/reboot.h>
 
 #include <xen/xen.h>
 #include <xen/events.h>
@@ -1068,8 +1069,7 @@ static void xen_machine_halt(void)
 
 static void xen_machine_power_off(void)
 {
-	if (pm_power_off)
-		pm_power_off();
+	do_kernel_power_off();
 	xen_reboot(SHUTDOWN_poweroff);
 }
 
-- 
2.33.1

