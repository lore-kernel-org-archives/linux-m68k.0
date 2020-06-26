Return-Path: <SRS0=0V5P=AH=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A801C433DF
	for <linux-m68k@archiver.kernel.org>; Fri, 26 Jun 2020 22:32:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 74C4F20FC3
	for <linux-m68k@archiver.kernel.org>; Fri, 26 Jun 2020 22:32:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NGpj+Uqk"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726169AbgFZWcG (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Fri, 26 Jun 2020 18:32:06 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:38988 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726132AbgFZWbu (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Fri, 26 Jun 2020 18:31:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1593210708;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=lYOPBG0iFD9F9VjgENlAdm0PiHZqNHDJn1sXF2V/+vk=;
        b=NGpj+UqkGsUie+K5D4tYjlt7dFwpIqz4POFCQ3pHUgO219KZOCEuV4wWv3gGcwlC19YSSO
        P2s+bS/G3s8fkpXSvooLP3LC2ycjERxlNoXRNItSbWI6ZPnKHyqgqbp1TmqWBCxhqPDHM0
        tMbpTNMsRPnQYu9eOoEs9vGZOgRlUxk=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-385-qkZbHhFFNKSbkNLZ6dWorg-1; Fri, 26 Jun 2020 18:31:47 -0400
X-MC-Unique: qkZbHhFFNKSbkNLZ6dWorg-1
Received: by mail-qv1-f70.google.com with SMTP id q5so7343704qvq.18
        for <linux-m68k@lists.linux-m68k.org>; Fri, 26 Jun 2020 15:31:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=lYOPBG0iFD9F9VjgENlAdm0PiHZqNHDJn1sXF2V/+vk=;
        b=VnlPHihSTSAtqo1vI7J6ZhiWeSM+0xD9MWj8YaR7TAy13zRTXxpLGdFMmmwUw3AgcS
         SVHrP5r9+p8hZsD5CKQMVjLo5T2uFb+PcJD/gZFopKeHAJ3RLeG0Od1UCElBKk/2D1FV
         Hr5xGafIBFc7wsw1y6u/+FruswClxss+6pdHsbDEkVCo2nLsoxMchoIXkCCV//NyRiLH
         ER+lv02jBH0wCsA9Zghgn8Wa3q6ix1O2Xi0N77WDM5mklzt1CNqzvjSKYea+WR+uTx0H
         TXzgibGmI+yatn7mCgc2BGW4TG0sp/sen/hnzFJu/nz5CRpA5YyPxh3RMgoi0fxVyN0K
         6nTA==
X-Gm-Message-State: AOAM533Y9ybIAxuFDYndsXWh2wILdS5HaMEVbeWUi5pzxs9+gSpk5MzC
        Oz6/unCO7i7zD6/BcXT0gBe283oCj6u3dr3JSwe5Xa7vkjnFV538jWcF51Xo4g7JbR6i+EqeQ4U
        wKcMa33Wco11EKKBLUS6Wr1z2IboU
X-Received: by 2002:ac8:34b1:: with SMTP id w46mr5148300qtb.175.1593210706922;
        Fri, 26 Jun 2020 15:31:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwEsH9GTqG0Uyirbf2HfHCLkouB6MqgMm+luFGWqRBdr7XED0i0wltil1GoCMm1tUaTEq60hA==
X-Received: by 2002:ac8:34b1:: with SMTP id w46mr5148270qtb.175.1593210706647;
        Fri, 26 Jun 2020 15:31:46 -0700 (PDT)
Received: from xz-x1.redhat.com ([2607:9880:19c0:32::2])
        by smtp.gmail.com with ESMTPSA id f203sm9903311qke.135.2020.06.26.15.31.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2020 15:31:46 -0700 (PDT)
From:   Peter Xu <peterx@redhat.com>
To:     linux-mm@kvack.org, linux-kernel@vger.kernel.org
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Gerald Schaefer <gerald.schaefer@de.ibm.com>,
        Andrea Arcangeli <aarcange@redhat.com>,
        Will Deacon <will@kernel.org>, peterx@redhat.com,
        Michael Ellerman <mpe@ellerman.id.au>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-m68k@lists.linux-m68k.org
Subject: [PATCH 09/26] mm/m68k: Use general page fault accounting
Date:   Fri, 26 Jun 2020 18:31:13 -0400
Message-Id: <20200626223130.199227-10-peterx@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200626223130.199227-1-peterx@redhat.com>
References: <20200626223130.199227-1-peterx@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-m68k-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Use the general page fault accounting by passing regs into handle_mm_fault().
It naturally solve the issue of multiple page fault accounting when page fault
retry happened.

Add the missing PERF_COUNT_SW_PAGE_FAULTS perf events too.  Note, the other two
perf events (PERF_COUNT_SW_PAGE_FAULTS_[MAJ|MIN]) were done in handle_mm_fault().

CC: Geert Uytterhoeven <geert@linux-m68k.org>
CC: linux-m68k@lists.linux-m68k.org
Signed-off-by: Peter Xu <peterx@redhat.com>
---
 arch/m68k/mm/fault.c | 14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

diff --git a/arch/m68k/mm/fault.c b/arch/m68k/mm/fault.c
index 2db38dfbc00c..983054d209bc 100644
--- a/arch/m68k/mm/fault.c
+++ b/arch/m68k/mm/fault.c
@@ -12,6 +12,7 @@
 #include <linux/interrupt.h>
 #include <linux/module.h>
 #include <linux/uaccess.h>
+#include <linux/perf_event.h>
 
 #include <asm/setup.h>
 #include <asm/traps.h>
@@ -85,6 +86,8 @@ int do_page_fault(struct pt_regs *regs, unsigned long address,
 
 	if (user_mode(regs))
 		flags |= FAULT_FLAG_USER;
+
+	perf_sw_event(PERF_COUNT_SW_PAGE_FAULTS, 1, regs, address);
 retry:
 	down_read(&mm->mmap_sem);
 
@@ -135,7 +138,7 @@ int do_page_fault(struct pt_regs *regs, unsigned long address,
 	 * the fault.
 	 */
 
-	fault = handle_mm_fault(vma, address, flags, NULL);
+	fault = handle_mm_fault(vma, address, flags, regs);
 	pr_debug("handle_mm_fault returns %x\n", fault);
 
 	if (fault_signal_pending(fault, regs))
@@ -151,16 +154,7 @@ int do_page_fault(struct pt_regs *regs, unsigned long address,
 		BUG();
 	}
 
-	/*
-	 * Major/minor page fault accounting is only done on the
-	 * initial attempt. If we go through a retry, it is extremely
-	 * likely that the page will be found in page cache at that point.
-	 */
 	if (flags & FAULT_FLAG_ALLOW_RETRY) {
-		if (fault & VM_FAULT_MAJOR)
-			current->maj_flt++;
-		else
-			current->min_flt++;
 		if (fault & VM_FAULT_RETRY) {
 			flags |= FAULT_FLAG_TRIED;
 
-- 
2.26.2

