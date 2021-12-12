Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32A0AC433FE
	for <linux-m68k@archiver.kernel.org>; Sun, 12 Dec 2021 21:17:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229662AbhLLVR5 (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Sun, 12 Dec 2021 16:17:57 -0500
Received: from mail-ed1-f43.google.com ([209.85.208.43]:36791 "EHLO
        mail-ed1-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229792AbhLLVRh (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Sun, 12 Dec 2021 16:17:37 -0500
Received: by mail-ed1-f43.google.com with SMTP id z5so46868428edd.3
        for <linux-m68k@lists.linux-m68k.org>; Sun, 12 Dec 2021 13:14:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=SiVmxmlmX7gD18KWJKuTaPa7pNX7A6+5Wut7BQEWlWA=;
        b=qyaqAU+HSKD+HsUBKg5AB4Grj9JsCbr9g/kNEIZtJUYDPkR5w7X3oEBoqbhkveHPA0
         i7WuMCFDqVmy4v4uwmxmKqJQgyKWbZxAuezUxU7vJ7Js6Vv9mGU7AXWM79sgkKDLmhWK
         jFp8UPoUTDTrVPMbjiOZPw0kaHhZEow7vk98bEAvorv4PN2Ae1WrpFauYpbNmt6sURPu
         EHsFzc94IQPacNeM0GpGjXTCkggEJqqfF6pqgsflI/TGqDXRSOm8kaL/erYImjVTvQQe
         TKd1cdir2wKhwb/5hDwmkKqbCAzORiU/FXU4xaDIEAT35buQchr71urUuURu0JjCKmA+
         4E2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=SiVmxmlmX7gD18KWJKuTaPa7pNX7A6+5Wut7BQEWlWA=;
        b=e+9F7ucKe+SBO6l6LwQoGoRLifAV0UixNms+U5uAj+V9+m0+aeS7tFlnPCLsk/lxDk
         1c7ss+9LtvX7iO+42LwNp9XJnfsGe1/YPCJ/acAb8Bvddd09CgC5Puqu+3TxRlNr2sbN
         DvTt8vy6vBfORuOum/CM0kb7W1Ezh1Xvzb36JfTw9se5FNok2SnOoQEvkpYxnOTsngM3
         30bdPJOj5juYzRpak2hqwlRkoENLngwpDmbCcXJ+syA9m1RHBMfGrJgpc4JkO/4gY6WH
         OCzQVfuak/CR6Ip0koT4pokAbxWH7AqIaexAlPc7F054Ud+QOLwjWiF68QvtiCj8Gy4C
         fmWA==
X-Gm-Message-State: AOAM533OeaYha/dcdXvaO13OLESxdqc5yezP2gAKdcqNbnpeFzzw7cWO
        U1cqeinrQTD7okyKKx09tDOCLT2a12M=
X-Google-Smtp-Source: ABdhPJzPB5bwYAfFOn1aDytHDcrWq16AdXdyLAU7ztJCQFx3xpkh7jhCINcDSwIbtlftQmSbgta8Pw==
X-Received: by 2002:a2e:9903:: with SMTP id v3mr25528327lji.143.1639343020440;
        Sun, 12 Dec 2021 13:03:40 -0800 (PST)
Received: from localhost.localdomain (94-29-46-111.dynamic.spd-mgts.ru. [94.29.46.111])
        by smtp.gmail.com with ESMTPSA id y4sm1197172ljp.16.2021.12.12.13.03.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Dec 2021 13:03:40 -0800 (PST)
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
Subject: [PATCH v5 03/21] reboot: Print error message if restart handler has duplicated priority
Date:   Mon, 13 Dec 2021 00:02:51 +0300
Message-Id: <20211212210309.9851-4-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211212210309.9851-1-digetx@gmail.com>
References: <20211212210309.9851-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Add sanity check which ensures that there are no two restart handlers
registered using the same priority. This requirement will become mandatory
once all drivers will be converted to the new API and such errors will be
fixed.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 kernel/reboot.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/kernel/reboot.c b/kernel/reboot.c
index 6bcc5d6a6572..35f0cde641c1 100644
--- a/kernel/reboot.c
+++ b/kernel/reboot.c
@@ -182,6 +182,21 @@ static ATOMIC_NOTIFIER_HEAD(restart_handler_list);
  */
 int register_restart_handler(struct notifier_block *nb)
 {
+	int ret;
+
+	ret = atomic_notifier_chain_register_unique_prio(&restart_handler_list, nb);
+	if (ret != -EBUSY)
+		return ret;
+
+	/*
+	 * Handler must have unique priority. Otherwise call order is
+	 * determined by registration order, which is unreliable.
+	 *
+	 * This requirement will become mandatory once all drivers
+	 * will be converted to use new sys-off API.
+	 */
+	pr_err("failed to register restart handler using unique priority\n");
+
 	return atomic_notifier_chain_register(&restart_handler_list, nb);
 }
 EXPORT_SYMBOL(register_restart_handler);
-- 
2.33.1

