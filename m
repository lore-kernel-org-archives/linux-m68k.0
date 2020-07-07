Return-Path: <SRS0=M86Y=AS=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18ED3C433E1
	for <linux-m68k@archiver.kernel.org>; Tue,  7 Jul 2020 22:51:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E87102075B
	for <linux-m68k@archiver.kernel.org>; Tue,  7 Jul 2020 22:51:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YIV8lRrA"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729623AbgGGWvz (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 7 Jul 2020 18:51:55 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:51520 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1729568AbgGGWuo (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 7 Jul 2020 18:50:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1594162243;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=8f5TTLJDyENYlbFehaNnbtlaq4/fY2SMNvjmVOggAGU=;
        b=YIV8lRrAxbwW6WjJ++ggcXwlAS0CnbckWgXhzbrSek0JukDj6uBHq7V+f8UKBfigNe1l7q
        JiAFl2SCcgKA5Y4jzfxVrbNhZab5MXTkHSBs97KC6qo08Y6/nMVhb+TZGCJLR5MQNMW//K
        2816oWQW0QhTALBiGGp/jDppXOL8moo=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-94-njWrXEKiPnuNeKZlGBkPxQ-1; Tue, 07 Jul 2020 18:50:39 -0400
X-MC-Unique: njWrXEKiPnuNeKZlGBkPxQ-1
Received: by mail-qv1-f72.google.com with SMTP id e6so19061623qva.2
        for <linux-m68k@lists.linux-m68k.org>; Tue, 07 Jul 2020 15:50:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8f5TTLJDyENYlbFehaNnbtlaq4/fY2SMNvjmVOggAGU=;
        b=m9fcNuhEYCNNp5BbrDF6CXqPXnSkmzWuToRWRbswDwXRAJSOIy9fQOtLZv/qJLfFuo
         xn3nXB1qQtcOikPgsCJ9cvsOd2EVW23MnAFnTgzx1PWQacAPp6JyTjQDnNyeIG6WS/Bl
         Wp9qwCAwYNpf0m0qrSpJWHzfDAQnS00r73pt41AVZXYIOqW8E56cQF8cDNr4atPgr8HE
         TolnnVOBD5K47B0O7Q/ZFFPcbAe2/xC2rGaoGyuygTrDj/iZoUFAyTlbDq8dkks7kDy1
         qPbAxG4J8uW4In3jPzwZl24lvG2BCFIFB00sq/QiUvlX1W4pCdihXchI2rJr2eRRuHkE
         AyKg==
X-Gm-Message-State: AOAM530UwK8h1jF6IFflgRZ9qiE+qg40vZLCedv0xDiEI/8FK4q8CxK+
        oiqlrhM+3+wpSuo/B4AqIik0JGiKqkbjo7TE1AXIdlDSfSJ52NMFbYxGYGwPBr893Wo4tOqWLNU
        WA8DhhEdHaE3IIDeU6Thdv3PxunzF
X-Received: by 2002:a05:6214:949:: with SMTP id dn9mr51711876qvb.116.1594162239263;
        Tue, 07 Jul 2020 15:50:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxYnZ/sBwn9kw3lX9BrDVhoNgmUHTzKr+RCjgXjVMxWi/R7wstbktVvXocMev9XoXXGqSRu1Q==
X-Received: by 2002:a05:6214:949:: with SMTP id dn9mr51711848qvb.116.1594162238945;
        Tue, 07 Jul 2020 15:50:38 -0700 (PDT)
Received: from xz-x1.redhat.com ([2607:9880:19c0:32::2])
        by smtp.gmail.com with ESMTPSA id j16sm26267642qtp.92.2020.07.07.15.50.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2020 15:50:38 -0700 (PDT)
From:   Peter Xu <peterx@redhat.com>
To:     linux-kernel@vger.kernel.org, linux-mm@kvack.org
Cc:     Gerald Schaefer <gerald.schaefer@de.ibm.com>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        peterx@redhat.com, Andrew Morton <akpm@linux-foundation.org>,
        Will Deacon <will@kernel.org>,
        Andrea Arcangeli <aarcange@redhat.com>,
        David Rientjes <rientjes@google.com>,
        John Hubbard <jhubbard@nvidia.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-m68k@lists.linux-m68k.org
Subject: [PATCH v5 09/25] mm/m68k: Use general page fault accounting
Date:   Tue,  7 Jul 2020 18:50:05 -0400
Message-Id: <20200707225021.200906-10-peterx@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200707225021.200906-1-peterx@redhat.com>
References: <20200707225021.200906-1-peterx@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
        auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
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
index 08b35a318ebe..795f483b1050 100644
--- a/arch/m68k/mm/fault.c
+++ b/arch/m68k/mm/fault.c
@@ -12,6 +12,7 @@
 #include <linux/interrupt.h>
 #include <linux/module.h>
 #include <linux/uaccess.h>
+#include <linux/perf_event.h>
 
 #include <asm/setup.h>
 #include <asm/traps.h>
@@ -84,6 +85,8 @@ int do_page_fault(struct pt_regs *regs, unsigned long address,
 
 	if (user_mode(regs))
 		flags |= FAULT_FLAG_USER;
+
+	perf_sw_event(PERF_COUNT_SW_PAGE_FAULTS, 1, regs, address);
 retry:
 	mmap_read_lock(mm);
 
@@ -134,7 +137,7 @@ int do_page_fault(struct pt_regs *regs, unsigned long address,
 	 * the fault.
 	 */
 
-	fault = handle_mm_fault(vma, address, flags, NULL);
+	fault = handle_mm_fault(vma, address, flags, regs);
 	pr_debug("handle_mm_fault returns %x\n", fault);
 
 	if (fault_signal_pending(fault, regs))
@@ -150,16 +153,7 @@ int do_page_fault(struct pt_regs *regs, unsigned long address,
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

