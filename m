Return-Path: <SRS0=2kwO=74=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D673C433E0
	for <linux-m68k@archiver.kernel.org>; Mon, 15 Jun 2020 22:17:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6033620739
	for <linux-m68k@archiver.kernel.org>; Mon, 15 Jun 2020 22:17:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VQ3QzxZg"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726681AbgFOWRF (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 15 Jun 2020 18:17:05 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:60705 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726514AbgFOWQb (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 15 Jun 2020 18:16:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1592259389;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=3nTgxHzg3sUm7azIu/IGyb2/pAj1EtKc4utkvCx/xjo=;
        b=VQ3QzxZg/UdwJYiOGjQkf2RWh50meT9xbD9WQm9Woyp46LjAOTmix2pilsEME+XhIgcRe7
        3bs7f7n2XzuEvVMlmRaE5qlPy/PgsYYSjoQcp4kbciiAMKgmDXi6dBLzA+YJ62GH70YWTa
        ME2Zzw7PgL8hYoTJntRCoGSO0n9Bwns=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-266-ZfprAOQFPFiv0jAvLLcu5w-1; Mon, 15 Jun 2020 18:16:27 -0400
X-MC-Unique: ZfprAOQFPFiv0jAvLLcu5w-1
Received: by mail-qv1-f72.google.com with SMTP id d5so14160238qvo.3
        for <linux-m68k@lists.linux-m68k.org>; Mon, 15 Jun 2020 15:16:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3nTgxHzg3sUm7azIu/IGyb2/pAj1EtKc4utkvCx/xjo=;
        b=V9f1gD7OSDxuh5rl5APvgKL8fosBLZXGDxFYQnhTMBej+WnB3DLcXwqU0IC2QIEBUF
         8oJRXOcFPsLiHsfyasdGC0fLMo0bQRVmnrprr+oqxj79o5krwqI0xr8K1enSK7WlAgnI
         B6fY90yosgrECJJXMJLLoFu4oRPb1Ax0vdB2l/lnijNRB0yIyNp1vm3esHxNgOb5hO9K
         Owmt1uhYGXU1xrphQhOI9nT4i+wK82XiyxrbHTAZ+f57IdtHU2Dq3p7hHTSTlI/Pd8wM
         xYEcNkxvVvtfRkCkz13J64YeeTI/h/aVWKnyD1xoeYfnnW5hMmeuTPb9Z6vBV3q4Gzte
         RxDw==
X-Gm-Message-State: AOAM530DJQobaiDwnm9/8MsDQUuqYEJXwhDMPxFV6eo07LDz0sVpgT3b
        84oRBUA65tUXSr7x5PhhwU9PYNEl9ZtqfDG5lbsjmetM2efJQMeLWvWANtnFmHLGcpyqM+/ENa0
        ncLU41LIgBN4MTTKIU3jvLtWewQ9i
X-Received: by 2002:ac8:7c8e:: with SMTP id y14mr18606172qtv.112.1592259387416;
        Mon, 15 Jun 2020 15:16:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyaZOEBtd/scoU4DOdAOopbdMF0V2JY6TKjzvEn2SFwwxD8thna1PZbGyLvOB4sG9vd+sh+ZQ==
X-Received: by 2002:ac8:7c8e:: with SMTP id y14mr18606143qtv.112.1592259387156;
        Mon, 15 Jun 2020 15:16:27 -0700 (PDT)
Received: from xz-x1.hitronhub.home ([2607:9880:19c0:32::2])
        by smtp.gmail.com with ESMTPSA id w13sm12351509qkb.91.2020.06.15.15.16.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2020 15:16:26 -0700 (PDT)
From:   Peter Xu <peterx@redhat.com>
To:     linux-kernel@vger.kernel.org
Cc:     Gerald Schaefer <gerald.schaefer@de.ibm.com>,
        Andrew Morton <akpm@linux-foundation.org>, peterx@redhat.com,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Andrea Arcangeli <aarcange@redhat.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-m68k@lists.linux-m68k.org
Subject: [PATCH 10/25] mm/m68k: Use mm_fault_accounting()
Date:   Mon, 15 Jun 2020 18:15:52 -0400
Message-Id: <20200615221607.7764-11-peterx@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200615221607.7764-1-peterx@redhat.com>
References: <20200615221607.7764-1-peterx@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-m68k-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Use the new mm_fault_accounting() helper for page fault accounting.

Avoid doing page fault accounting multiple times if the page fault is retried.
Also, the perf events for page faults will be accounted too when the config has
CONFIG_PERF_EVENTS defined.  Do the accounting without mmap_sem.

CC: Geert Uytterhoeven <geert@linux-m68k.org>
CC: linux-m68k@lists.linux-m68k.org
Signed-off-by: Peter Xu <peterx@redhat.com>
---
 arch/m68k/mm/fault.c | 13 +++----------
 1 file changed, 3 insertions(+), 10 deletions(-)

diff --git a/arch/m68k/mm/fault.c b/arch/m68k/mm/fault.c
index 3bfb5c8ac3c7..6c6d6d77a1be 100644
--- a/arch/m68k/mm/fault.c
+++ b/arch/m68k/mm/fault.c
@@ -70,7 +70,7 @@ int do_page_fault(struct pt_regs *regs, unsigned long address,
 {
 	struct mm_struct *mm = current->mm;
 	struct vm_area_struct * vma;
-	vm_fault_t fault;
+	vm_fault_t fault, major = 0;
 	unsigned int flags = FAULT_FLAG_DEFAULT;
 
 	pr_debug("do page fault:\nregs->sr=%#x, regs->pc=%#lx, address=%#lx, %ld, %p\n",
@@ -136,6 +136,7 @@ int do_page_fault(struct pt_regs *regs, unsigned long address,
 	 */
 
 	fault = handle_mm_fault(vma, address, flags);
+	major |= fault & VM_FAULT_MAJOR;
 	pr_debug("handle_mm_fault returns %x\n", fault);
 
 	if (fault_signal_pending(fault, regs))
@@ -151,16 +152,7 @@ int do_page_fault(struct pt_regs *regs, unsigned long address,
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
 
@@ -175,6 +167,7 @@ int do_page_fault(struct pt_regs *regs, unsigned long address,
 	}
 
 	up_read(&mm->mmap_sem);
+	mm_fault_accounting(current, regs, address, major);
 	return 0;
 
 /*
-- 
2.26.2

