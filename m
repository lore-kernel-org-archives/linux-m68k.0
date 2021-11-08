Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3910DC433F5
	for <linux-m68k@archiver.kernel.org>; Mon,  8 Nov 2021 00:50:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1E3FA60C4D
	for <linux-m68k@archiver.kernel.org>; Mon,  8 Nov 2021 00:50:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236935AbhKHAxV (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Sun, 7 Nov 2021 19:53:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237015AbhKHAv5 (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Sun, 7 Nov 2021 19:51:57 -0500
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E829EC079783
        for <linux-m68k@lists.linux-m68k.org>; Sun,  7 Nov 2021 16:48:20 -0800 (PST)
Received: by mail-lj1-x22f.google.com with SMTP id e9so5704090ljl.5
        for <linux-m68k@lists.linux-m68k.org>; Sun, 07 Nov 2021 16:48:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Cc0IUGWHitJ0Cooyguk/vAdy9iAEtCRPuqNtfJHYmrA=;
        b=IzSZ2r99jHnEXOJGmbU0tHUFmE/bhuXI5h+blmEHakGg7rzpiFL+0mOCLjt28XqajZ
         0QhIqwZpxuBAuKtcdn99cngTgGQcwKDfsczTUO7mYBiBbkSJABmgfIe+anJe+S8zTkAo
         +MSGfP9t/6NMZAi/y+PEcZy6dKDaI5eRw8SF2IiidxM3DFV/pghTK0TWXsrC8rAar1Ec
         2oJQaU2TPiJrnwcFVxDME2/aiZTk+celdQeclkyhA6B1KDbPFsfORVhRFDWkqiIGGoGQ
         y74VPF0X/9jdFZHHvYnomCuifzskMFVG48hCZtdZ+dBA6HCo9R7RBcCSlKCE+l0Gg0E2
         Qbpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Cc0IUGWHitJ0Cooyguk/vAdy9iAEtCRPuqNtfJHYmrA=;
        b=UgDVeGbeAOoDNUev2RXDGeMzPNs5ejAQFBYG8uFcCEzxyIr1GAAjA58ZquDxwfCx7v
         IZ8qh9+tO+k5AcMqzWJV3skiE4qWA9ggP2iaei/XlpV5sgDksvbIdfRbBPXxhscnWrLh
         dd4uFLE6wCAqU4LzvOyxql8e6KW6qiUWexcycOSHEUCd6fWdKBG7xKnY7QWmWw6qS6E4
         ZuXC7ioDqFcsixQlrJ5vxRCkU/pp+5T6am0SOGM39l8uRnAp0U/D3VKtTgFHXx+p0sTY
         wbLAqTel4qkkE8vgGxM++9snpmgRBG97pgWXixZNS+jciePV6+/SOMFo4NGGqvQIh2I9
         Qy7g==
X-Gm-Message-State: AOAM531EeKAzHtjg0duJf/XFrtNcmkisV/gqsZMZ52Gn3IWgf0EmFcgA
        YGvAF737Hvgi8gMW/TaVs+E=
X-Google-Smtp-Source: ABdhPJy4RtOehJnpJYrVc1NQyuBuwoIsoJy3foDMnf8FY5V4GrNNRvHzsXmwf+DV8gEqIGOLzN+pyQ==
X-Received: by 2002:a2e:a444:: with SMTP id v4mr75863886ljn.33.1636332499373;
        Sun, 07 Nov 2021 16:48:19 -0800 (PST)
Received: from localhost.localdomain (79-139-188-96.dynamic.spd-mgts.ru. [79.139.188.96])
        by smtp.gmail.com with ESMTPSA id p17sm1625266lfu.209.2021.11.07.16.48.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Nov 2021 16:48:19 -0800 (PST)
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
        Ulf Hansson <ulf.hansson@linaro.org>
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-csky@vger.kernel.org, linux-ia64@vger.kernel.org,
        linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
        linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-riscv@lists.infradead.org, linux-sh@vger.kernel.org,
        xen-devel@lists.xenproject.org, linux-acpi@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: [PATCH v3 18/25] mips: Use do_kernel_power_off()
Date:   Mon,  8 Nov 2021 03:45:17 +0300
Message-Id: <20211108004524.29465-19-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211108004524.29465-1-digetx@gmail.com>
References: <20211108004524.29465-1-digetx@gmail.com>
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

