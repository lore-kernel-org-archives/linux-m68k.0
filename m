Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 724E3C433EF
	for <linux-m68k@archiver.kernel.org>; Sun, 12 Dec 2021 21:17:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229449AbhLLVRh (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Sun, 12 Dec 2021 16:17:37 -0500
Received: from mail-lj1-f172.google.com ([209.85.208.172]:42691 "EHLO
        mail-lj1-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229721AbhLLVRh (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Sun, 12 Dec 2021 16:17:37 -0500
Received: by mail-lj1-f172.google.com with SMTP id z8so21102030ljz.9
        for <linux-m68k@lists.linux-m68k.org>; Sun, 12 Dec 2021 13:13:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=NEBfa1fMA+x5w4qEnSCEpCMUhXzxF+K5pq5bQ4oFCgw=;
        b=jKT5aLZfWR0wdy1ZRHa2+F5Hc16ta1np03rkr+cf27BN8zUNhbkEoAuNYpXOIawSIH
         2XymTHuAk1C3VpWmhK4AsE1yb/G2IulrJt3rlG67Vh5DarQrO3/RvtCACcc9q/mrlMzG
         idTBdpttStFv0rFHXoDeMkKrlqiTc6LMJnuQorLtWh4hfdMc2KQqq/SPJGqZAD8cFtP7
         bU0fIoQxCEwyS17dGv1ELgqsYZc+uy4iyxYp9vTtn2S36VrT7egCJ/N2pPTJk/5GCnV0
         wCdVD2AV/3wMZeA5Ef+Z3RwjWWbr7SVUDzZ2VoU/BSE2RRwY2l531P1a/0YVFVmDZNjy
         PILQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NEBfa1fMA+x5w4qEnSCEpCMUhXzxF+K5pq5bQ4oFCgw=;
        b=zP6bbaBqZuzxtkzYSFyNBeaRf+AaDdcXsj107jwgXYhifrfdm3TMAQETbAkpW/ohUT
         2aot5r8TadEx6yOFrM3ZlP2fbehiFnj0hh7BYgrOA2DTLDuqD3HjdQDrCimkSjJ/ebI2
         /O/EV55Q8w3liq96ZCum3SLuX1Pf9oEMYrlYOspdicranvzXImC1qaFP6ECd55hdd63E
         jiJ0bbkjKXpxdyt4YmkOl/Htu8BgF8DV7xWD3gI/Y81+xV6Z5BDSbBs/vUVA5pgUghRt
         AQ2rJaNCqpDuYARhqsLsTQ4sSxlJX/+bna6tj0MLsCfwdaFu4gn0Eg1nkQOCZedlc4uW
         eVug==
X-Gm-Message-State: AOAM5322IfeDCP0nGSY+9lWAPnv4bbbTowOqqHcX8beSIHXdQ9vDX/wS
        0weEc7xq7Fd9RAgmkuusuFD0zqiOInI=
X-Google-Smtp-Source: ABdhPJxgpZfqxao+vFSyfTfxI+LCB5noXzLgWBaLJYSm65bPEK2lM39NLgbcPLKrE+YWXn5oNC0cUA==
X-Received: by 2002:a2e:a26a:: with SMTP id k10mr25711010ljm.156.1639343030651;
        Sun, 12 Dec 2021 13:03:50 -0800 (PST)
Received: from localhost.localdomain (94-29-46-111.dynamic.spd-mgts.ru. [94.29.46.111])
        by smtp.gmail.com with ESMTPSA id y4sm1197172ljp.16.2021.12.12.13.03.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Dec 2021 13:03:50 -0800 (PST)
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
Subject: [PATCH v5 08/21] arm64: Use do_kernel_power_off()
Date:   Mon, 13 Dec 2021 00:02:56 +0300
Message-Id: <20211212210309.9851-9-digetx@gmail.com>
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

Acked-by: Catalin Marinas <catalin.marinas@arm.com>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 arch/arm64/kernel/process.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm64/kernel/process.c b/arch/arm64/kernel/process.c
index aacf2f5559a8..f8db031afa7d 100644
--- a/arch/arm64/kernel/process.c
+++ b/arch/arm64/kernel/process.c
@@ -110,8 +110,7 @@ void machine_power_off(void)
 {
 	local_irq_disable();
 	smp_send_stop();
-	if (pm_power_off)
-		pm_power_off();
+	do_kernel_power_off();
 }
 
 /*
-- 
2.33.1

