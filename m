Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1035AC4167D
	for <linux-m68k@archiver.kernel.org>; Wed, 17 Nov 2021 01:21:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DB7646325A
	for <linux-m68k@archiver.kernel.org>; Wed, 17 Nov 2021 01:21:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232556AbhKQBYN (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 16 Nov 2021 20:24:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47300 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232501AbhKQBYH (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 16 Nov 2021 20:24:07 -0500
Received: from mail-qv1-xf2a.google.com (mail-qv1-xf2a.google.com [IPv6:2607:f8b0:4864:20::f2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C04FAC061746
        for <linux-m68k@lists.linux-m68k.org>; Tue, 16 Nov 2021 17:21:09 -0800 (PST)
Received: by mail-qv1-xf2a.google.com with SMTP id s9so834115qvk.12
        for <linux-m68k@lists.linux-m68k.org>; Tue, 16 Nov 2021 17:21:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=dKJmUx0S3b3gU9QerEdM5MtTK89f9bkEO3AdXrfthGg=;
        b=SiJvkIEmmAa+081NeDmkVtE5qXMKEyWz2TjohNpRU6u4LtKyx1uEhrJppd73vJzoFM
         8BY29UHCMxrocLY5y8FJwbRKNg6rvaOr7/BCdVobyI3GcPT5w+zM9lIOzu7/Wbk0BEZR
         e9hAbvkI7utgriQ3AL8kzQ4cwOISlKrA9LJXK4vnEUb5RqZKIQHhhCxEx/UyFzJ1FY07
         pRtmRje2wnvSN56pig/ow3liUabXKOy+ebNopsBKUDbYRi4Y95kZ+2Av9hHhlRUf9isj
         9ihzFXX4IeTiln6zC9lZaS63ci3YUFDZCouE7fLp5n77zubKk27nRzSOQ6DI4RK6i71T
         CwOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=dKJmUx0S3b3gU9QerEdM5MtTK89f9bkEO3AdXrfthGg=;
        b=03MxxQQgMhoy7G3orbuoDS92d+/wuv0jMNjnZzo3CQaIu0MTcMcVCcQD3/NvBlDmO+
         pz+rBmLUt/7Y9k7LbgWfdCNtuGpc61s/cypafnFqM49MbFWNxLLz7nDUX18KTziBcizG
         LlfSN/G1qlNqhHrzmIVl1QtsQMf78sH5qdf+qmkT9Dj78WctFzRWzw5K7MAyQx9rNWGA
         swmCR8jdM8FAw4aVlYgQae4hvmwBFEVUIeWqikJy3ORFeEtl1NLKVyusGqDXdBdTbc/B
         n678WiPjLoUw6gKLxODV2e/fuU+tE2E44c3QC0cmmfib01WSUf6AWT2LDi58Ls9D+ygn
         DSMQ==
X-Gm-Message-State: AOAM531RNYwgfG8z7NP9AUeqJMRy64/PiQp7+2KT+WOBwxXzFTDRqryX
        AMmtawBchk48i8ezL6WZMDX69w==
X-Google-Smtp-Source: ABdhPJyGremPP9L92/6lcac/wA3df9Bul/Oomg4HlgGr7phDDIKwAGBqFNBXjyfBYYwK7urnRXunoQ==
X-Received: by 2002:ad4:5fcd:: with SMTP id jq13mr49700248qvb.29.1637112069006;
        Tue, 16 Nov 2021 17:21:09 -0800 (PST)
Received: from soleen.c.googlers.com.com (189.216.85.34.bc.googleusercontent.com. [34.85.216.189])
        by smtp.gmail.com with ESMTPSA id i6sm3482289qti.40.2021.11.16.17.21.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Nov 2021 17:21:08 -0800 (PST)
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
Subject: [RFC v2 09/10] mm: do not use atomic_set_release in page_ref_unfreeze()
Date:   Wed, 17 Nov 2021 01:20:58 +0000
Message-Id: <20211117012059.141450-10-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.34.0.rc1.387.gb447b232ab-goog
In-Reply-To: <20211117012059.141450-1-pasha.tatashin@soleen.com>
References: <20211117012059.141450-1-pasha.tatashin@soleen.com>
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
2.34.0.rc1.387.gb447b232ab-goog

