Return-Path: <SRS0=Ru6R=AA=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 936B2C433DF
	for <linux-m68k@archiver.kernel.org>; Fri, 19 Jun 2020 16:06:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 727A721532
	for <linux-m68k@archiver.kernel.org>; Fri, 19 Jun 2020 16:06:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="iIqFOc9o"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404081AbgFSQGj (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Fri, 19 Jun 2020 12:06:39 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:52800 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S2405552AbgFSQGB (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Fri, 19 Jun 2020 12:06:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1592582759;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=lYOPBG0iFD9F9VjgENlAdm0PiHZqNHDJn1sXF2V/+vk=;
        b=iIqFOc9oUfDa2rAbxXUCBFx1agVxIe8uuQhf4sSIDE8AVCTluTtn8aT3YyHQwfdx1J2RVa
        8VFF9mdAX2o6kcLtVm9UA5FV27r51e6C/ssWnhP41SXuXtpy7NC9CqaIOLaCaSsuk+fY3D
        E4xYXvyRedAhug/3bILWG9zQd5NDdmI=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-324-VqcEwEB4NNieFtuPKW2WDA-1; Fri, 19 Jun 2020 12:05:57 -0400
X-MC-Unique: VqcEwEB4NNieFtuPKW2WDA-1
Received: by mail-qt1-f198.google.com with SMTP id u48so7391469qth.17
        for <linux-m68k@lists.linux-m68k.org>; Fri, 19 Jun 2020 09:05:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=lYOPBG0iFD9F9VjgENlAdm0PiHZqNHDJn1sXF2V/+vk=;
        b=Tx1wiMkzB3Eja8vBRzy1BsMPiQ1BZ1PKv4z6ii/TP22pcXBwIKX8FHYXXH/irZ6dYs
         jWRMrrVrul+mNmR7g4Q8if+9xO3++P2WySRF4ODaV5TDIkYeEvfxbQN0tmEKiMo9l6rU
         KeBsN3NWllPPG6MQGdgsx6QQlHVpkFqqxmxsJ+bxvvlcCidK2U/FGH+7dItnSAbvfRLt
         iuyO7uMJvA1GKpAue9gS5mR6aGubmnaluEZ4QVwiGvkL+kVHPXalUj8HuFqVVV+Gc4ui
         PSjbu4kGHEh/1SHK1tODPSyUxH0PsZpJmrMWco4JmQwOGZTAgOlNKoNROE/CFWRbqWVS
         GixA==
X-Gm-Message-State: AOAM530iHuuYZkOIbMkSoGWUOzJMFSHfZiyU6HJsPT/B+Hpn4LomvxJ3
        UlxN5B0zjZdW/Dp8zVJ4yclvJj70MZTrZyxCETSpd06mLSJeFIPJvbAgtWjxOm3/JxomMoojxII
        PsS1t6IXd616vuH042HDXhtUitMdM
X-Received: by 2002:aed:29e6:: with SMTP id o93mr4023508qtd.135.1592582757407;
        Fri, 19 Jun 2020 09:05:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxxln6wPfL9eSCFZYzdRyC9ZdfjMa92r0xY4V7AGxdmExb5DyEte9R6BPboKGMNjvpqtx9bDA==
X-Received: by 2002:aed:29e6:: with SMTP id o93mr4023464qtd.135.1592582756856;
        Fri, 19 Jun 2020 09:05:56 -0700 (PDT)
Received: from xz-x1.redhat.com ([2607:9880:19c0:32::2])
        by smtp.gmail.com with ESMTPSA id g11sm6412604qkk.123.2020.06.19.09.05.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jun 2020 09:05:56 -0700 (PDT)
From:   Peter Xu <peterx@redhat.com>
To:     linux-kernel@vger.kernel.org, linux-mm@kvack.org
Cc:     Gerald Schaefer <gerald.schaefer@de.ibm.com>, peterx@redhat.com,
        Andrew Morton <akpm@linux-foundation.org>,
        Andrea Arcangeli <aarcange@redhat.com>,
        Will Deacon <will@kernel.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-m68k@lists.linux-m68k.org
Subject: [PATCH 09/26] mm/m68k: Use general page fault accounting
Date:   Fri, 19 Jun 2020 12:05:21 -0400
Message-Id: <20200619160538.8641-10-peterx@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200619160538.8641-1-peterx@redhat.com>
References: <20200619160538.8641-1-peterx@redhat.com>
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

