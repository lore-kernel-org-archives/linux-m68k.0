Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE180C433EF
	for <linux-m68k@archiver.kernel.org>; Mon,  8 Nov 2021 00:50:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A4BF16135F
	for <linux-m68k@archiver.kernel.org>; Mon,  8 Nov 2021 00:50:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236252AbhKHAxE (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Sun, 7 Nov 2021 19:53:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55234 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236908AbhKHAvf (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Sun, 7 Nov 2021 19:51:35 -0500
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E18FC061195
        for <linux-m68k@lists.linux-m68k.org>; Sun,  7 Nov 2021 16:48:17 -0800 (PST)
Received: by mail-lf1-x12c.google.com with SMTP id l22so5663686lfg.7
        for <linux-m68k@lists.linux-m68k.org>; Sun, 07 Nov 2021 16:48:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0HObz0L7jYC33/Dxy7x3kt14KoppaRcQ+sU+HcRStgU=;
        b=ZVNAr1U4ql3QetoKQdPWWOYdxSBB0k5djEWleeY+9VSLcYiHnCSkCkIaOl4kqaHShO
         oab4Tmm3bwD0P0vkAzDwXd33MBPBcdebn4RnRlv1JfpXW5azFQJ8VDNmkiaenWK08EOn
         RwVRxb2a8jq1Me5zajmOOnqUKWN+NVp3gIC4vDQvl7X+QS/9Q/6G8PsCj7pFygNZ42G6
         2+Tzi7ka9eoxAdQUiRD+NnUxxBwExid0v7AfOqmbTtknjCEBmTA6xGh62w38gQj+fJ/p
         jOjBMtv9YA3dt8WYnPd7X0Be6DYsLDDoWJqswRWvH4kz+YPHCvK+UcFcEoVWh55qLPDl
         ATPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0HObz0L7jYC33/Dxy7x3kt14KoppaRcQ+sU+HcRStgU=;
        b=Ckjbgl4y3PDdiJc63rsJI241jmna4MsYCtoPBynxdE18ziyDjj29TbQgFjPILzh2uB
         XQJj46Z8yqwpSBzmdKagfIM515PwvqVnV8ljDkGZOxk68CsgmG6OY7z+W10+ipkw1OTQ
         koFfwVzQN1sWy9z3NTHttc4ni+IFTb+BTS6bo4zx4k2YzXJ9W7SojkNOl0khoBQuGEox
         h496qgSWuOnRGkWyC3OcXi6RxxKHf45Il8be8/D4sxsC6E2TG2B/WCIxZPNcPKW8KKtt
         aMLcTXIMy07QrBpXTmwl4XhekalnGAeKDldRD3YDYAHEMufkX+1uI40kNv0j2OPT5mkB
         BtXA==
X-Gm-Message-State: AOAM532w9/tEElj1DI2KCNX2/+j0tjFKEI8cP9EJ+q8Loryc43Y3tuU8
        5pCNmg2ryK9QzdUUQSclSKQ=
X-Google-Smtp-Source: ABdhPJxGJgazXdUgtKIBvIIz/6GDfezGKbWWr8YH8P5/vbQu6B1dGA0GfveTE6FMi6W4ZN9EO5qX9g==
X-Received: by 2002:a05:6512:402a:: with SMTP id br42mr25576250lfb.530.1636332495851;
        Sun, 07 Nov 2021 16:48:15 -0800 (PST)
Received: from localhost.localdomain (79-139-188-96.dynamic.spd-mgts.ru. [79.139.188.96])
        by smtp.gmail.com with ESMTPSA id p17sm1625266lfu.209.2021.11.07.16.48.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Nov 2021 16:48:15 -0800 (PST)
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
Subject: [PATCH v3 16/25] x86: Use do_kernel_power_off()
Date:   Mon,  8 Nov 2021 03:45:15 +0300
Message-Id: <20211108004524.29465-17-digetx@gmail.com>
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
 arch/x86/kernel/reboot.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/x86/kernel/reboot.c b/arch/x86/kernel/reboot.c
index 0a40df66a40d..cd7d9416d81a 100644
--- a/arch/x86/kernel/reboot.c
+++ b/arch/x86/kernel/reboot.c
@@ -747,10 +747,10 @@ static void native_machine_halt(void)
 
 static void native_machine_power_off(void)
 {
-	if (pm_power_off) {
+	if (kernel_can_power_off()) {
 		if (!reboot_force)
 			machine_shutdown();
-		pm_power_off();
+		do_kernel_power_off();
 	}
 	/* A fallback in case there is no PM info available */
 	tboot_shutdown(TB_SHUTDOWN_HALT);
-- 
2.33.1

