Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B23F3C4167B
	for <linux-m68k@archiver.kernel.org>; Tue, 21 Dec 2021 15:01:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238776AbhLUPB6 (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 21 Dec 2021 10:01:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53336 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238778AbhLUPBz (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 21 Dec 2021 10:01:55 -0500
Received: from mail-qt1-x82d.google.com (mail-qt1-x82d.google.com [IPv6:2607:f8b0:4864:20::82d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3CD1CC06175A
        for <linux-m68k@lists.linux-m68k.org>; Tue, 21 Dec 2021 07:01:53 -0800 (PST)
Received: by mail-qt1-x82d.google.com with SMTP id o17so13102835qtk.1
        for <linux-m68k@lists.linux-m68k.org>; Tue, 21 Dec 2021 07:01:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=9Ho7P1Z1WqP7ryS19lrI0k8d2U4f/eXw/1oJbaqWceE=;
        b=Gq4vEZXFfCrx18wyS4Qq27rBeHdcAXH69jksx+OkwhSowQMlXtH4nFIJdXpj0jffND
         GMRkTkEsROTk+Q0fN/zQv/aA8Nw+i6ac14Mx8BBAW3gONlgYyoUM4BzZ5Oc3F3mY6x7O
         q2mF8Q2KFRGrCnnGXI/fEWXmh5E5q0wklFMVekfIC7hRBna0SIm50MbZ9WVxjPTgp+3W
         z4EzflFfMl0tNruyp4qrk3cUMkdYdVCQx7xv+fIJKz/0uYLLCSDlawMXFO6s0/kqT9Ff
         MS3Y8+2ZU5HfUKGCMZQ9wgByhNWhrueYcDvj4Yj9qoCYc+RLj/eBDzEmztt+cmbowjXB
         mpMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9Ho7P1Z1WqP7ryS19lrI0k8d2U4f/eXw/1oJbaqWceE=;
        b=OIw8iRD4heKBb4y4UNL3JzLc9bT5NMQzqUn4lisd8OrFyPIr/yd3wiZpjVD5ICNPhU
         Oc3kb0aImIybLDRhaUYM8AwoAcCa7Rx1z2TTJOKFww4QBI8Fr61MgVLPYzVfW3Eeoc7R
         bOf6peaR9lItSBvXbDWyv/eQKLYxBLjNXkgSBfTipmPNtm/Bsz3cnqPVATrxKy9NEGnZ
         yUoI9NoAS00ysGoapUxxEyW8BYTqwUyVQ/GIQeg9H9kUxyi6EO8RAr/iMTCPXAmh870X
         ZG1e0baarB7QXehnHP/lVa1LnYp04i7cTl4GQqtMevE2H/lCDw4fhdBG/06aSwHN5Dwu
         XuEA==
X-Gm-Message-State: AOAM530tX0m/4QKZLZ00rjdjCQwg8tj4yKeEmYBpH0ZlpTO0vSX0I1it
        UgdV77UqUvvW/suZgh/93BcYgQ==
X-Google-Smtp-Source: ABdhPJwpEZVujf1Pk3vgH5fkaQH3jWmAOGB6Xqm6lM1kpQ6rkwA951oHxisyuwNEIFAkYBGCXlnQ6w==
X-Received: by 2002:ac8:7f4b:: with SMTP id g11mr2566406qtk.4.1640098912343;
        Tue, 21 Dec 2021 07:01:52 -0800 (PST)
Received: from soleen.c.googlers.com.com (189.216.85.34.bc.googleusercontent.com. [34.85.216.189])
        by smtp.gmail.com with ESMTPSA id d4sm1991371qkn.79.2021.12.21.07.01.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Dec 2021 07:01:51 -0800 (PST)
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
Subject: [PATCH v2 8/9] mm: do not use atomic_set_release in page_ref_unfreeze()
Date:   Tue, 21 Dec 2021 15:01:39 +0000
Message-Id: <20211221150140.988298-9-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.34.1.307.g9b7440fafd-goog
In-Reply-To: <20211221150140.988298-1-pasha.tatashin@soleen.com>
References: <20211221150140.988298-1-pasha.tatashin@soleen.com>
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
index 243fc60ae6c8..9efabeff4e06 100644
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
2.34.1.307.g9b7440fafd-goog

