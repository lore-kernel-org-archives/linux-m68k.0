Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 201B4C4332F
	for <linux-m68k@archiver.kernel.org>; Wed,  8 Dec 2021 20:36:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240474AbhLHUjl (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 8 Dec 2021 15:39:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43386 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240427AbhLHUje (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 8 Dec 2021 15:39:34 -0500
Received: from mail-qv1-xf2d.google.com (mail-qv1-xf2d.google.com [IPv6:2607:f8b0:4864:20::f2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C862EC061A32
        for <linux-m68k@lists.linux-m68k.org>; Wed,  8 Dec 2021 12:36:01 -0800 (PST)
Received: by mail-qv1-xf2d.google.com with SMTP id j9so3271253qvm.10
        for <linux-m68k@lists.linux-m68k.org>; Wed, 08 Dec 2021 12:36:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=efM54ZomnMnKj0fHwD8epFpVs6vA4uxGPqXneKhOTQ4=;
        b=CZ/IogjHt1FbEK64p+q+xuoukwqzLKyhR90K8mytumvWC+vu/dpMMkLo0NclHiem3C
         AwyOLMF2L37XfyjnKdZHevKOTvxFQPHHYuN4I8sFBKFU3Dt4toJ0aVQkF8FYQ5U9piS9
         mWZuncXku17SW28aLVS8oXi7hSJciCeLq8rGiOj5nHJBrgs/8rJbamPH1q59ZGD90FsB
         gk+TYOHPsQW4eNpXD3trVyulGXNsZL/DjJH/6/3DMb/fYpCoS+QfvZ3GaJ7MeZafXUPp
         +j0E2jLWB3qHikLo0dcmjZdUCvVTN/K8yAKp5jdEMQ4AhdKSGGi4QwdFI4dIurB7zlUq
         +2bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=efM54ZomnMnKj0fHwD8epFpVs6vA4uxGPqXneKhOTQ4=;
        b=2qNlX+NrSeN9wtdJGoE5Kkz4plRRfvvejM5mi+RG4h7IusiOlNj/Aiz+nVC0EzOk3N
         vpzeDsF1qDuXNRBRHr5vK5njj9x4KE85ujWQTW3+yT75BkzoJp9p20W8FdZdQeD0fEwp
         bdzopfrqEKNiS4B98nxstoWTy3a6uU4VdlEQHKglyL5ofPENW7iPHZ1pWJ9+O0MnILcQ
         iyDISS937xha2lXePppKaxN/biM8aq59ZKEgwQ1D08IIz06tqx/RHbgJK9jHSnlApgkC
         DloVHFtHC6UzX6r5QUtIZqHIzPWeSuU5RUIrmDbh3u6pofhvOXT8OPXYiih7j8Luxe6o
         aCOg==
X-Gm-Message-State: AOAM532wQ1lg2onGX2CEs2H/is/YJ87v7YDU0VMoE3oXihjWodHqoqq2
        J/g0JI5dZfrYCcWQMIe8G2U2BA==
X-Google-Smtp-Source: ABdhPJw5Y75cfC2gowj44e6l5E9jZvUJuE9e1B0YDT6zuJ1nBlD+sF7LQYQG/tOa7zC/p8ZoFaHJWA==
X-Received: by 2002:ad4:5744:: with SMTP id q4mr10173588qvx.99.1638995760976;
        Wed, 08 Dec 2021 12:36:00 -0800 (PST)
Received: from soleen.c.googlers.com.com (189.216.85.34.bc.googleusercontent.com. [34.85.216.189])
        by smtp.gmail.com with ESMTPSA id 143sm1898710qkg.87.2021.12.08.12.35.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Dec 2021 12:35:59 -0800 (PST)
From:   Pasha Tatashin <pasha.tatashin@soleen.com>
To:     pasha.tatashin@soleen.com, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, linux-m68k@lists.linux-m68k.org,
        anshuman.khandual@arm.com, willy@infradead.org,
        akpm@linux-foundation.org, william.kucharski@oracle.com,
        mike.kravetz@oracle.com, vbabka@suse.cz, geert@linux-m68k.org,
        schmitzmic@gmail.com, rostedt@goodmis.org, mingo@redhat.com,
        hannes@cmpxchg.org, guro@fb.com, songmuchun@bytedance.com,
        weixugc@google.com, gthelen@google.com, rientjes@google.com,
        pjt@google.com
Subject: [PATCH 09/10] mm: do not use atomic_set_release in page_ref_unfreeze()
Date:   Wed,  8 Dec 2021 20:35:43 +0000
Message-Id: <20211208203544.2297121-10-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.34.1.400.ga245620fadb-goog
In-Reply-To: <20211208203544.2297121-1-pasha.tatashin@soleen.com>
References: <20211208203544.2297121-1-pasha.tatashin@soleen.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

In we set the old _refcount value after verifying that the old value was
indeed 0.

VM_BUG_ON_PAGE(page_count(page) != 0, page);
< the _refcount may change here>
atomic_set_release(&page->_refcount, count);

To avoid the smal gap where _refcount may change lets verify the time
of the _refcount at the time of the set operation.

Use atomic_xchg_release() and at the set time verify that the value
was 0.

Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
---
 include/linux/page_ref.h | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/include/linux/page_ref.h b/include/linux/page_ref.h
index 8c76bf3bf7e1..26676d3bcd58 100644
--- a/include/linux/page_ref.h
+++ b/include/linux/page_ref.h
@@ -322,10 +322,9 @@ static inline int folio_ref_freeze(struct folio *folio, int count)
 
 static inline void page_ref_unfreeze(struct page *page, int count)
 {
-	VM_BUG_ON_PAGE(page_count(page) != 0, page);
-	VM_BUG_ON(count == 0);
+	int old_val = atomic_xchg_release(&page->_refcount, count);
 
-	atomic_set_release(&page->_refcount, count);
+	VM_BUG_ON_PAGE(count == 0 || old_val != 0, page);
 	if (page_ref_tracepoint_active(page_ref_unfreeze))
 		__page_ref_unfreeze(page, count);
 }
-- 
2.34.1.400.ga245620fadb-goog

