Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A9DEC433FE
	for <linux-m68k@archiver.kernel.org>; Tue, 26 Oct 2021 17:38:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E434C610A5
	for <linux-m68k@archiver.kernel.org>; Tue, 26 Oct 2021 17:38:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237840AbhJZRkx (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 26 Oct 2021 13:40:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43312 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235515AbhJZRkv (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 26 Oct 2021 13:40:51 -0400
Received: from mail-qk1-x72d.google.com (mail-qk1-x72d.google.com [IPv6:2607:f8b0:4864:20::72d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF2D9C061348
        for <linux-m68k@lists.linux-m68k.org>; Tue, 26 Oct 2021 10:38:27 -0700 (PDT)
Received: by mail-qk1-x72d.google.com with SMTP id h65so16225141qke.0
        for <linux-m68k@lists.linux-m68k.org>; Tue, 26 Oct 2021 10:38:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=YFzPbDbRL/x6ma5Ca6cfrOJFG3iWMh8fKsCfxaMAfk8=;
        b=YS8eDNpGNOgrhmCcfg9iAfefq9xkwMoUI89lf12WEOadcE9GDaOq+SrKS9at0LRDOq
         QvV0zAPSnq6Jhf+lzstiFxhlVkIwVx4nK7on89VHZHwKlMEIXw1zoSlurpwB9TvtKBTP
         JSu0GGc+AphS9BEpoZN/RJX+iu1jkmCQW74rf3K0Sg29I/WviQ0Q9/H9RigjK1eYZPsK
         rvQLAwaMnsYn6LyrWGHH+63AE9ls3BqAr0OcH3+O5Oc+JjwiD7aBNfJdskPJ+of9GbLn
         XPJjW6DABqlkPdAY4lnOphSbXTpcajPuRlVFi9DfIlW/62zNKjXbx+xO+cVxKhYlrd9U
         M/nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YFzPbDbRL/x6ma5Ca6cfrOJFG3iWMh8fKsCfxaMAfk8=;
        b=bVdl3JyqoSMSGBHq5/J0Ce7QeQZwRhIMqG35cAu5GZT3nWUWZXvfVs7r4a+h5z89tZ
         300Fx3Dt4Oayfmn5ZnYhydaoO1xlkKzfFmd8iGpNsichOt3J7oiiG65PTUH7PkP1PEzz
         gIjFpyAbxfIGvMKGg6eLyWHtgrtq/wewwcYgAYsQYJll/kHWX4poncQm/OiElQXhMPVL
         gP9mACrGkOwgYYpatz1yCoxBVI6grbKn1Drnzm79lAWOLS5PDrRbZARcM7WLcCs4LZ81
         eb1PKcSBGIqgdm/nHOUjzhNtvZeQCGLHw8PkeY+ncXdAXevM0d1m6qEURfmXrZ5nS2Ot
         8cxA==
X-Gm-Message-State: AOAM533kd7LguntIPS2F9qTnqQUGaJQmIa44jysfFHuS9svrJxCvLjhz
        0fAkXFxgo1IIHhBG8hCMFuNlAA==
X-Google-Smtp-Source: ABdhPJzJ5B+p6Rwtjwrqe/0j7MwD86qEOkIZcZ9ny2M9nsl7064QiqLbNAf1+bTV9ovTuHVldv6+BA==
X-Received: by 2002:a05:620a:29d2:: with SMTP id s18mr3823816qkp.418.1635269906887;
        Tue, 26 Oct 2021 10:38:26 -0700 (PDT)
Received: from soleen.c.googlers.com.com (189.216.85.34.bc.googleusercontent.com. [34.85.216.189])
        by smtp.gmail.com with ESMTPSA id bj37sm11001939qkb.49.2021.10.26.10.38.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Oct 2021 10:38:26 -0700 (PDT)
From:   Pasha Tatashin <pasha.tatashin@soleen.com>
To:     pasha.tatashin@soleen.com, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, linux-m68k@lists.linux-m68k.org,
        anshuman.khandual@arm.com, willy@infradead.org,
        akpm@linux-foundation.org, william.kucharski@oracle.com,
        mike.kravetz@oracle.com, vbabka@suse.cz, geert@linux-m68k.org,
        schmitzmic@gmail.com, rostedt@goodmis.org, mingo@redhat.com,
        hannes@cmpxchg.org, guro@fb.com, songmuchun@bytedance.com,
        weixugc@google.com, gthelen@google.com
Subject: [RFC 2/8] mm/hugetlb: remove useless set_page_count()
Date:   Tue, 26 Oct 2021 17:38:16 +0000
Message-Id: <20211026173822.502506-3-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.33.0.1079.g6e70778dc9-goog
In-Reply-To: <20211026173822.502506-1-pasha.tatashin@soleen.com>
References: <20211026173822.502506-1-pasha.tatashin@soleen.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

prep_compound_gigantic_page() calls set_page_count(0, p), but it is not
needed because page_ref_freeze(p, 1) already sets refcount to 0.

Using, set_page_count() is dangerous, because it unconditionally resets
refcount from the current value to unrestrained value, and therefore
should be minimized.

Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
---
 mm/hugetlb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index 95dc7b83381f..7e3996c8b696 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -1707,7 +1707,7 @@ static bool prep_compound_gigantic_page(struct page *page, unsigned int order)
 			pr_warn("HugeTLB page can not be used due to unexpected inflated ref count\n");
 			goto out_error;
 		}
-		set_page_count(p, 0);
+		VM_BUG_ON_PAGE(page_count(p), p);
 		set_compound_head(p, page);
 	}
 	atomic_set(compound_mapcount_ptr(page), -1);
-- 
2.33.0.1079.g6e70778dc9-goog

