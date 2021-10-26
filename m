Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBBD2C433FE
	for <linux-m68k@archiver.kernel.org>; Tue, 26 Oct 2021 17:38:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C65B961002
	for <linux-m68k@archiver.kernel.org>; Tue, 26 Oct 2021 17:38:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237876AbhJZRlD (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 26 Oct 2021 13:41:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43324 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237834AbhJZRkx (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 26 Oct 2021 13:40:53 -0400
Received: from mail-qv1-xf35.google.com (mail-qv1-xf35.google.com [IPv6:2607:f8b0:4864:20::f35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0343DC061348
        for <linux-m68k@lists.linux-m68k.org>; Tue, 26 Oct 2021 10:38:29 -0700 (PDT)
Received: by mail-qv1-xf35.google.com with SMTP id v2so10067764qve.11
        for <linux-m68k@lists.linux-m68k.org>; Tue, 26 Oct 2021 10:38:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=RTaUD2RUm6/em+jvQTkh6ivxttGsmNn09ntigKewekQ=;
        b=GIGS37Qoa3iQ9XGqYkImLqW64mhHkHZqcAdTsvWcZapxSea6btQvnnY5RgjopRu6dq
         PcqIvjD2ChFH0Bik2yOsB25Qz/PRL4pLDZpduH15i+44oAsfKQzQy77CjbE3RvfjtQ9w
         pZD5mtvVpkN0conJO3+cVJmm6e0g6QBh0b7JZ3psQzlo68/P7mTjqOozTJL5OLMSa12D
         El3xALwir4fVBu8/IaMqnBCrpXu/TCuTT4CVHK5gJIQlfjOXwvc5RvN1E6NEfnqYIuxj
         i4mmV1jV2cHm3QBFvK4uF/aAthF+7j6Tn/8+IW1HmzQ968lQ+O3l+yzPZYkM8cudcmV0
         oRIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=RTaUD2RUm6/em+jvQTkh6ivxttGsmNn09ntigKewekQ=;
        b=RExuVbnZwJM9+qn6FJHh9aoepb0j8e8YVDKI8aYklCBw5PwhaXV3yC1S/JdFtvVZRJ
         tEgt4yaiBJWjKE2hkkOVFlT7VR8fqujbc3kmomXJEinYRZMIr2kwCHz8l0OTl89cEa4Y
         N3eklarQo9d547TjPwUQ09yVjHQaXoXyLEBdVpE7KqrMcQyz8L3zEueFHD+wkTnJSwD0
         tjKyW/kY8SWBEAW1C3GLeHP9yenU0IFiypnAfT2K0VNcYGUDlSl/BZqj1835GcpRXEVF
         mP8GqnMcUDANcRV/lg++pDnJ4tjVTCEGwQQB8cbwiVWlbwThq9+rNhmPJsaXCbI+zcUx
         T4cw==
X-Gm-Message-State: AOAM530O4zSvZTXhShSgqB/i46B9yBqK7mMXZBRVPL+Bx9yt4RbN4fmP
        V7K1QXvITFRiCEVodY0Y+athyg==
X-Google-Smtp-Source: ABdhPJx51qUHPL7MosY+ccdW2v8AQS7qpS2Lf6x9DSO9D0SE6bk4w8h6c+6o+lQ+QoMcJjSYsK+17A==
X-Received: by 2002:a05:6214:23c5:: with SMTP id hr5mr24631556qvb.59.1635269907919;
        Tue, 26 Oct 2021 10:38:27 -0700 (PDT)
Received: from soleen.c.googlers.com.com (189.216.85.34.bc.googleusercontent.com. [34.85.216.189])
        by smtp.gmail.com with ESMTPSA id bj37sm11001939qkb.49.2021.10.26.10.38.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Oct 2021 10:38:27 -0700 (PDT)
From:   Pasha Tatashin <pasha.tatashin@soleen.com>
To:     pasha.tatashin@soleen.com, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, linux-m68k@lists.linux-m68k.org,
        anshuman.khandual@arm.com, willy@infradead.org,
        akpm@linux-foundation.org, william.kucharski@oracle.com,
        mike.kravetz@oracle.com, vbabka@suse.cz, geert@linux-m68k.org,
        schmitzmic@gmail.com, rostedt@goodmis.org, mingo@redhat.com,
        hannes@cmpxchg.org, guro@fb.com, songmuchun@bytedance.com,
        weixugc@google.com, gthelen@google.com
Subject: [RFC 3/8] mm: Avoid using set_page_count() in set_page_recounted()
Date:   Tue, 26 Oct 2021 17:38:17 +0000
Message-Id: <20211026173822.502506-4-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.33.0.1079.g6e70778dc9-goog
In-Reply-To: <20211026173822.502506-1-pasha.tatashin@soleen.com>
References: <20211026173822.502506-1-pasha.tatashin@soleen.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

set_page_refcounted() converts a non-refcounted page that has
(page->_refcount == 0) into a refcounted page by setting _refcount to 1,

Use page_ref_inc_return() instead to avoid unconditionally overwriting
the _refcount value.

Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
---
 mm/internal.h | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/mm/internal.h b/mm/internal.h
index cf3cb933eba3..cf345fac6894 100644
--- a/mm/internal.h
+++ b/mm/internal.h
@@ -91,9 +91,12 @@ static inline bool page_evictable(struct page *page)
  */
 static inline void set_page_refcounted(struct page *page)
 {
+	int refcnt;
+
 	VM_BUG_ON_PAGE(PageTail(page), page);
 	VM_BUG_ON_PAGE(page_ref_count(page), page);
-	set_page_count(page, 1);
+	refcnt = page_ref_inc_return(page);
+	VM_BUG_ON_PAGE(refcnt != 1, page);
 }
 
 extern unsigned long highest_memmap_pfn;
-- 
2.33.0.1079.g6e70778dc9-goog

