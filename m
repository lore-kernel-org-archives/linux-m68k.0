Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BC24C433F5
	for <linux-m68k@archiver.kernel.org>; Wed, 27 Oct 2021 21:19:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 66771610C7
	for <linux-m68k@archiver.kernel.org>; Wed, 27 Oct 2021 21:19:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241053AbhJ0VVy (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 27 Oct 2021 17:21:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53814 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244519AbhJ0VVD (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 27 Oct 2021 17:21:03 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2AD2FC061237
        for <linux-m68k@lists.linux-m68k.org>; Wed, 27 Oct 2021 14:18:26 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id 188so7001629ljj.4
        for <linux-m68k@lists.linux-m68k.org>; Wed, 27 Oct 2021 14:18:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=rn6kChPkfoFMf9bWYHf70bnGYIj3LFIVKDTZ1qePG0M=;
        b=UpWsh/FpGieodrD9s3cNqzK6jy31h5ljZFEwQ+D2q0RTlqvYeysLYZeRQo1KpYyV2E
         FrJFQ3pk1ZjLGkSmkQuMqpQGm3pLQYdGN7MewaJIFH4jHkVWFJbftv36SpE7wHzAfM6f
         KfYBgHNJAt7rLgdyfNzETIqs5AkGlF85N8K8c3T6GaZ5ArdlodepiLYddRqHEhO/3Klg
         D8JJS7iUiqx+skaUr3SoIxZKpGEOkheRNugtxOQ9N5fX3CP32io6EjkCrnAIhbDZrUUD
         zN+4zZTl26WGoleIrx97PYAjrTar40Pf+ijrpXYWtFKLlTkmoUa0DEaDGbd2O74e82mz
         NNrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rn6kChPkfoFMf9bWYHf70bnGYIj3LFIVKDTZ1qePG0M=;
        b=FBFZ3SPm6qrZo7kV02+17rzf+M3EIVoXNIeDl5pCD6ec2vxmwvhnpFt5XZOs/seIpL
         hPTaedJ9UpjuXjP2t2MPq2UPpLAf5RM1Zn5ZULD9QGZliSy3SNm8Ki4E1ZJNPtjFo8VZ
         Ha2pfgjWR7gI0vc0Efs+skKIOGSsCudpUTG0dneq8TYyIcm/qn7t0GwU9xrIybxYyLXL
         f90cdHq3+yBiI2tDAaAIBVMwZBhdEdaXZn/ZKwjzWLJBqAzmwBncKkJe5G5a626rhkk7
         hmIIjq+whXPUCzJboya1e/HnCEs73ZAfYiBYsqkxT350k4D8wke9gkGX4yeCDbgAcD+7
         iNEA==
X-Gm-Message-State: AOAM5306hvceOhe5BXy+PKaqK/1ALXURMr2q6mzHE0KXTqpVeMCjLojM
        GXxut7qoxV8hwI2ta4fxRyM=
X-Google-Smtp-Source: ABdhPJzozXX9CLT+V56pSkYTIT6ENXsjFNJw478xo/aJxRV2fH58rMxN8jZgU4s16hZZ4d9qEx0Lfg==
X-Received: by 2002:a05:651c:114b:: with SMTP id h11mr321181ljo.35.1635369504516;
        Wed, 27 Oct 2021 14:18:24 -0700 (PDT)
Received: from localhost.localdomain (46-138-41-28.dynamic.spd-mgts.ru. [46.138.41.28])
        by smtp.gmail.com with ESMTPSA id d7sm104336ljl.18.2021.10.27.14.18.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Oct 2021 14:18:24 -0700 (PDT)
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
Subject: [PATCH v2 17/45] powerpc: Use do_kernel_power_off()
Date:   Thu, 28 Oct 2021 00:16:47 +0300
Message-Id: <20211027211715.12671-18-digetx@gmail.com>
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
 arch/powerpc/kernel/setup-common.c | 4 +---
 arch/powerpc/xmon/xmon.c           | 3 +--
 2 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/kernel/setup-common.c b/arch/powerpc/kernel/setup-common.c
index 4f1322b65760..71c4ccd9bbb1 100644
--- a/arch/powerpc/kernel/setup-common.c
+++ b/arch/powerpc/kernel/setup-common.c
@@ -161,9 +161,7 @@ void machine_restart(char *cmd)
 void machine_power_off(void)
 {
 	machine_shutdown();
-	if (pm_power_off)
-		pm_power_off();
-
+	do_kernel_power_off();
 	smp_send_stop();
 	machine_hang();
 }
diff --git a/arch/powerpc/xmon/xmon.c b/arch/powerpc/xmon/xmon.c
index dd8241c009e5..9d835807d645 100644
--- a/arch/powerpc/xmon/xmon.c
+++ b/arch/powerpc/xmon/xmon.c
@@ -1243,8 +1243,7 @@ static void bootcmds(void)
 	} else if (cmd == 'h') {
 		ppc_md.halt();
 	} else if (cmd == 'p') {
-		if (pm_power_off)
-			pm_power_off();
+		do_kernel_power_off();
 	}
 }
 
-- 
2.33.1

