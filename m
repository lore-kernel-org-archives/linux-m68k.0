Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45CC7C4321E
	for <linux-m68k@archiver.kernel.org>; Mon,  8 Nov 2021 00:47:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2E236613A6
	for <linux-m68k@archiver.kernel.org>; Mon,  8 Nov 2021 00:47:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236924AbhKHAuj (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Sun, 7 Nov 2021 19:50:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55110 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236896AbhKHAug (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Sun, 7 Nov 2021 19:50:36 -0500
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F917C061570
        for <linux-m68k@lists.linux-m68k.org>; Sun,  7 Nov 2021 16:47:52 -0800 (PST)
Received: by mail-lj1-x229.google.com with SMTP id 13so8240093ljj.11
        for <linux-m68k@lists.linux-m68k.org>; Sun, 07 Nov 2021 16:47:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6FNFlMpNjS/DNcuPrR0BFjK6OkkBLQhzqGXiB9qxwwI=;
        b=ap3A83fg5fKkLgYcPLGj4ujgDQbjKUnCHl1tJwJk0YYfyEiGzkqPECTzKOM1YfoD1L
         7Tv1IQL0qy27hRaO+2V8mMNwuPhmt0RnGYTpIVZHvmMlW0N/ak+ket1f1gl2JZ7gk9d3
         fAQNCztH/PN7x2xYeGLPMEE2nD1cIjm0qVz550BDVg6mI6jct3ZSJyVKmro1IFNn1yWr
         IPyHSXGPZHiix8heM9Rffd6oJdFFpg7+1b1krhUZivdkkY35o0on0Qdc3YJ5KDtW0+lB
         QH16yrcERPBYXXBZaoG/Grh/x98enYzxE1lM3ST5QIPReMfvmXUk1iBZ/CuGE0IZaTFO
         vjnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6FNFlMpNjS/DNcuPrR0BFjK6OkkBLQhzqGXiB9qxwwI=;
        b=GiUW6eqJ8sskGBVE+7zOdZq5KkArnbqdDPuoaBKJ6932dVClitJYEewrOydrLthOf5
         gSsBZlpUehBCx4BALd3muTWjTf3hYsjVApRE2xABkWO8aU84PrlHWAJOHFugkcyLO892
         xEwX9bI3HMX18/Jv4oNtLWeDdc7atA5UIZzsY577s4IwKz0MdbyngDISb/4c2RCXJMKd
         ruXAbS9kKlcKQW0FMYaDbR5a6nwIvihLbbrEkn1nFCPWN0BFwFp1wKBv3n+r9SeM0l6Q
         lxrSFVPzXROLbr2vIcpk8pY5+arZI4cDLPRkQBPAL+Dyqds1UHHCS8CIFlkVb23rNzN5
         Ro5w==
X-Gm-Message-State: AOAM532N0Vu6znbe3Er2NDfATJH4bc7PoVzFCrZb2qcmnm6MGYjvPI0n
        SmCGiuS30VeT/Wq8F1UZ5lo=
X-Google-Smtp-Source: ABdhPJyrOsT2LfeoRDePz9gvXDRZ9T+n52FCNueqjAZN/qgGSzpYZGgdBodfU1+UMWgFhWWsCOX6NQ==
X-Received: by 2002:a2e:8799:: with SMTP id n25mr26944321lji.377.1636332470861;
        Sun, 07 Nov 2021 16:47:50 -0800 (PST)
Received: from localhost.localdomain (79-139-188-96.dynamic.spd-mgts.ru. [79.139.188.96])
        by smtp.gmail.com with ESMTPSA id p17sm1625266lfu.209.2021.11.07.16.47.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Nov 2021 16:47:50 -0800 (PST)
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
Subject: [PATCH v3 02/25] notifier: Add blocking_notifier_call_chain_is_empty()
Date:   Mon,  8 Nov 2021 03:45:01 +0300
Message-Id: <20211108004524.29465-3-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211108004524.29465-1-digetx@gmail.com>
References: <20211108004524.29465-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Add blocking_notifier_call_chain_is_empty() that returns true if call
chain is empty.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 include/linux/notifier.h |  2 ++
 kernel/notifier.c        | 14 ++++++++++++++
 2 files changed, 16 insertions(+)

diff --git a/include/linux/notifier.h b/include/linux/notifier.h
index 4b80a815b666..924c9d7c8e73 100644
--- a/include/linux/notifier.h
+++ b/include/linux/notifier.h
@@ -173,6 +173,8 @@ int blocking_notifier_call_chain_robust(struct blocking_notifier_head *nh,
 int raw_notifier_call_chain_robust(struct raw_notifier_head *nh,
 		unsigned long val_up, unsigned long val_down, void *v);
 
+bool blocking_notifier_call_chain_is_empty(struct blocking_notifier_head *nh);
+
 #define NOTIFY_DONE		0x0000		/* Don't care */
 #define NOTIFY_OK		0x0001		/* Suits me */
 #define NOTIFY_STOP_MASK	0x8000		/* Don't call further */
diff --git a/kernel/notifier.c b/kernel/notifier.c
index b8251dc0bc0f..b20cb7b9b1f0 100644
--- a/kernel/notifier.c
+++ b/kernel/notifier.c
@@ -322,6 +322,20 @@ int blocking_notifier_call_chain(struct blocking_notifier_head *nh,
 }
 EXPORT_SYMBOL_GPL(blocking_notifier_call_chain);
 
+/**
+ *	blocking_notifier_call_chain_is_empty - Check whether notifier chain is empty
+ *	@nh: Pointer to head of the blocking notifier chain
+ *
+ *	Checks whether notifier chain is empty.
+ *
+ *	Returns true is notifier chain is empty, false otherwise.
+ */
+bool blocking_notifier_call_chain_is_empty(struct blocking_notifier_head *nh)
+{
+	return !rcu_access_pointer(nh->head);
+}
+EXPORT_SYMBOL_GPL(blocking_notifier_call_chain_is_empty);
+
 /*
  *	Raw notifier chain routines.  There is no protection;
  *	the caller must provide it.  Use at your own risk!
-- 
2.33.1

