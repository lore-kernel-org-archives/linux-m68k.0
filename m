Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E279CC4332F
	for <linux-m68k@archiver.kernel.org>; Tue, 21 Dec 2021 15:01:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238704AbhLUPBw (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 21 Dec 2021 10:01:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53312 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235776AbhLUPBr (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 21 Dec 2021 10:01:47 -0500
Received: from mail-qk1-x732.google.com (mail-qk1-x732.google.com [IPv6:2607:f8b0:4864:20::732])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E1709C061401
        for <linux-m68k@lists.linux-m68k.org>; Tue, 21 Dec 2021 07:01:46 -0800 (PST)
Received: by mail-qk1-x732.google.com with SMTP id m186so12784508qkb.4
        for <linux-m68k@lists.linux-m68k.org>; Tue, 21 Dec 2021 07:01:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=8OLKCLK70MdlV7lY3Fm4nJPND3+4SBjM5tfYfr3at+o=;
        b=J7/VHH0JOS8YGb7cCfiDWVyL9L52RvtQXQMwPLoGbG4THf4d7TZ+nr3GN+lZxvr3gt
         DR+3zRsmjf8qmyeuY98lOO6DG0APhdsS3T9PbV7zB70pmM2ErA+pPzEESJOwAv5Fi81w
         KtsaENFiwW8dBAVRiZ7W+I6iah2RetGECM6ejHg3WUYuyUdI9g0vOUEOBGedrKnZPVaQ
         rSd6Yw4YzULM473hI0xFGj7CPWywVbUSzXVqRK4jNNnUPE9VstMypT1I0KCXBUKyb9WL
         V/LJtDyszKXavEJ85nP31HaFTBUoUKK4UZeO7tPUy+R2KUqthGLCG7zbzK/iMb56yo+U
         SmxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8OLKCLK70MdlV7lY3Fm4nJPND3+4SBjM5tfYfr3at+o=;
        b=xgWhTQB9FreCACuxhOKJkCleTk0THLkFDCzjWQao+T9IR63FPREEN5A6N9Hv3Q4Uwp
         xsugu2BEHat1hV2U3pC6Y/0hMTB8kcUJ2vKNQyDgaKxNMVu5wzKBpRw0FpLOiv4nC5lw
         Qd+K2+++Zc9uFICFL7scY9sxU35NsydH7TfcKUXX49hsh3Crv+FmDN+vfutQt7ewPNHX
         dv87kswXwa75qjO0eKM2AhrVQZ4qV8MImmhMk6U0L/ERgVMSr6kLNMp2xtVCyVpcSuux
         KSlume/0W/aV9yGqEHPDyq9HykZ5tAO5Vme3IHfAhuAh49FrGbNtwS0lTXheg62QzwQw
         iA/g==
X-Gm-Message-State: AOAM531xXIDLLFYRD+9VygHVgZYJCoJ3JuhWlx5FQ7WAxr8+WlNfSP7f
        Q5rWqf2mEhkYVT27G9dw0p1tbA==
X-Google-Smtp-Source: ABdhPJzN9SRSZZItQKCqO558WN2Y7tM5Mh2bBAZZpVvE6EZpGwsiLYjKEfjD3vbJIkTtFd7w2FLsYQ==
X-Received: by 2002:a05:620a:c4f:: with SMTP id u15mr2250058qki.565.1640098905805;
        Tue, 21 Dec 2021 07:01:45 -0800 (PST)
Received: from soleen.c.googlers.com.com (189.216.85.34.bc.googleusercontent.com. [34.85.216.189])
        by smtp.gmail.com with ESMTPSA id d4sm1991371qkn.79.2021.12.21.07.01.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Dec 2021 07:01:45 -0800 (PST)
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
Subject: [PATCH v2 2/9] mm: Avoid using set_page_count() in set_page_recounted()
Date:   Tue, 21 Dec 2021 15:01:33 +0000
Message-Id: <20211221150140.988298-3-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.34.1.307.g9b7440fafd-goog
In-Reply-To: <20211221150140.988298-1-pasha.tatashin@soleen.com>
References: <20211221150140.988298-1-pasha.tatashin@soleen.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

set_page_refcounted() converts a non-refcounted page that has
(page->_refcount == 0) into a refcounted page by setting _refcount to
1.

The current apporach uses the following logic:

VM_BUG_ON_PAGE(page_ref_count(page), page);
set_page_count(page, 1);

However, if _refcount changes from 0 to 1 between the VM_BUG_ON_PAGE()
and set_page_count() we can break _refcount, which can cause other
problems such as memory corruptions.

Instead, use a safer method: increment _refcount first and verify
that at increment time it was indeed 1.

refcnt = page_ref_inc_return(page);
VM_BUG_ON_PAGE(refcnt != 1, page);

Use page_ref_inc_return() to avoid unconditionally overwriting
the _refcount value with set_page_count(), and check the return value.

Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
---
 mm/internal.h | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/mm/internal.h b/mm/internal.h
index deb9bda18e59..4d45ef2ffea6 100644
--- a/mm/internal.h
+++ b/mm/internal.h
@@ -162,9 +162,11 @@ static inline bool page_evictable(struct page *page)
  */
 static inline void set_page_refcounted(struct page *page)
 {
+	int refcnt;
+
 	VM_BUG_ON_PAGE(PageTail(page), page);
-	VM_BUG_ON_PAGE(page_ref_count(page), page);
-	set_page_count(page, 1);
+	refcnt = page_ref_inc_return(page);
+	VM_BUG_ON_PAGE(refcnt != 1, page);
 }
 
 extern unsigned long highest_memmap_pfn;
-- 
2.34.1.307.g9b7440fafd-goog

