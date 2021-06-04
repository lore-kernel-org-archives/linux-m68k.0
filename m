Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CF76C47098
	for <linux-m68k@archiver.kernel.org>; Fri,  4 Jun 2021 06:58:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 18BC161414
	for <linux-m68k@archiver.kernel.org>; Fri,  4 Jun 2021 06:58:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230109AbhFDG7s (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Fri, 4 Jun 2021 02:59:48 -0400
Received: from szxga08-in.huawei.com ([45.249.212.255]:4303 "EHLO
        szxga08-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230073AbhFDG7p (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Fri, 4 Jun 2021 02:59:45 -0400
Received: from dggemv711-chm.china.huawei.com (unknown [172.30.72.56])
        by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4FxD483NN7z1BFNP;
        Fri,  4 Jun 2021 14:53:12 +0800 (CST)
Received: from dggpemm500001.china.huawei.com (7.185.36.107) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Fri, 4 Jun 2021 14:57:57 +0800
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 dggpemm500001.china.huawei.com (7.185.36.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Fri, 4 Jun 2021 14:57:57 +0800
From:   Kefeng Wang <wangkefeng.wang@huawei.com>
To:     Andrew Morton <akpm@linux-foundation.org>,
        <linux-kernel@vger.kernel.org>
CC:     <linux-mm@kvack.org>, Kefeng Wang <wangkefeng.wang@huawei.com>,
        "Greg Ungerer" <gerg@linux-m68k.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        <linux-m68k@lists.linux-m68k.org>
Subject: [PATCH v2 07/15] m68k: convert to setup_initial_init_mm()
Date:   Fri, 4 Jun 2021 15:06:25 +0800
Message-ID: <20210604070633.32363-8-wangkefeng.wang@huawei.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210604070633.32363-1-wangkefeng.wang@huawei.com>
References: <20210604070633.32363-1-wangkefeng.wang@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.113.25]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggpemm500001.china.huawei.com (7.185.36.107)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Use setup_initial_init_mm() helper to simplify code.

Acked-by: Greg Ungerer <gerg@linux-m68k.org>
Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Greg Ungerer <gerg@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org
Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
---
 arch/m68k/kernel/setup_mm.c | 5 +----
 arch/m68k/kernel/setup_no.c | 5 +----
 2 files changed, 2 insertions(+), 8 deletions(-)

diff --git a/arch/m68k/kernel/setup_mm.c b/arch/m68k/kernel/setup_mm.c
index 017bac3aab80..4b51bfd38e5f 100644
--- a/arch/m68k/kernel/setup_mm.c
+++ b/arch/m68k/kernel/setup_mm.c
@@ -258,10 +258,7 @@ void __init setup_arch(char **cmdline_p)
 		}
 	}
 
-	init_mm.start_code = PAGE_OFFSET;
-	init_mm.end_code = (unsigned long)_etext;
-	init_mm.end_data = (unsigned long)_edata;
-	init_mm.brk = (unsigned long)_end;
+	setup_initial_init_mm((void *)PAGE_OFFSET, _etext, _edata, _end);
 
 #if defined(CONFIG_BOOTPARAM)
 	strncpy(m68k_command_line, CONFIG_BOOTPARAM_STRING, CL_SIZE);
diff --git a/arch/m68k/kernel/setup_no.c b/arch/m68k/kernel/setup_no.c
index d1b7988efc91..5e4104f07a44 100644
--- a/arch/m68k/kernel/setup_no.c
+++ b/arch/m68k/kernel/setup_no.c
@@ -87,10 +87,7 @@ void __init setup_arch(char **cmdline_p)
 	memory_start = PAGE_ALIGN(_ramstart);
 	memory_end = _ramend;
 
-	init_mm.start_code = (unsigned long) &_stext;
-	init_mm.end_code = (unsigned long) &_etext;
-	init_mm.end_data = (unsigned long) &_edata;
-	init_mm.brk = (unsigned long) 0;
+	setup_initial_init_mm(_stext, _etext, _edata, NULL);
 
 	config_BSP(&command_line[0], sizeof(command_line));
 
-- 
2.26.2

