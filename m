Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A0C2C4167B
	for <linux-m68k@archiver.kernel.org>; Wed, 17 Nov 2021 01:21:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EA04863244
	for <linux-m68k@archiver.kernel.org>; Wed, 17 Nov 2021 01:21:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232553AbhKQBYN (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 16 Nov 2021 20:24:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232519AbhKQBYI (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 16 Nov 2021 20:24:08 -0500
Received: from mail-qv1-xf2d.google.com (mail-qv1-xf2d.google.com [IPv6:2607:f8b0:4864:20::f2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 932CCC061746
        for <linux-m68k@lists.linux-m68k.org>; Tue, 16 Nov 2021 17:21:10 -0800 (PST)
Received: by mail-qv1-xf2d.google.com with SMTP id s9so834132qvk.12
        for <linux-m68k@lists.linux-m68k.org>; Tue, 16 Nov 2021 17:21:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=175Dn+OmrWLalikvHXgtLaL0RinzWYRBjCoX9yGsvr8=;
        b=nRlJZzzt9m88Z0nj/5kEB+Zes3UkJ20EFtCk6ZM48f4cGo5kl2wcnggusHD2Dz7vhJ
         qAtHdjH9IyoAgHS5377lUw68u2uP7GUDcU3rk+mbiS+vyiLJ2e58T5UIfkY4HOqj+Qeh
         g5ad5XTxjzetjTTUD987sYt0ChOKZBfxwprjP9ti8pdDaQBQ1JSj++YdhF2SGP4twv82
         bZcrCJDYcvlP/eZ8w5pR8rsbjnUKX5BfxJsKwXkQii6xqYCMXp6kPm5uV5rH29tXYxks
         n3rvnnTdxpxz4g4VdgvhLT5lNrq7flTarDX62meRhLNYdqUFQ0rmod1NjGyVyV9mUfIH
         /26A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=175Dn+OmrWLalikvHXgtLaL0RinzWYRBjCoX9yGsvr8=;
        b=KLFmLLaTpKbpa/jOlKcHNfSexSPVWyjWUudysQlSJILemV5BoVBDqNevf/h0nuDH8H
         EhQIytqKRycYsMkSxC+ut0uLhMn6ip2DQvsRRkbiZVNVhy6WiIrNUGSme7Idd6gcPJwv
         BVdW4v6OfHD0gwct0mVN6zLsHggYxv4EhGAcnaYHRXwQl+OadF1F7+vJAD+c0Addr5zo
         2OSSqvgpHnx7jVPG5QlXhvzY48cOK1rVR7aBvmljSOjZ1PUD43FGABybfpv8xRfe0bUT
         RF1gdsXG2b2qSuDVEGRHV7cqOvX10UVEE4PPcsScMaXP7oigNrprdsaASymOgjfeubFn
         91uA==
X-Gm-Message-State: AOAM533QMSY4v1UySvGutt/7jSB4W2c1YgJeBNwSwPLwWLB8LJz7oUoA
        Pfxr55c98MqRrZTKEWIjGJU2/w==
X-Google-Smtp-Source: ABdhPJxOZPahTDzBZTUSHs/wzhS9iI2h8iV/m3zGhfmCPnFCVKUT0V4XucRscYGgLdy3/nkIiDQutQ==
X-Received: by 2002:a0c:e98a:: with SMTP id z10mr50125465qvn.43.1637112069776;
        Tue, 16 Nov 2021 17:21:09 -0800 (PST)
Received: from soleen.c.googlers.com.com (189.216.85.34.bc.googleusercontent.com. [34.85.216.189])
        by smtp.gmail.com with ESMTPSA id i6sm3482289qti.40.2021.11.16.17.21.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Nov 2021 17:21:09 -0800 (PST)
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
Subject: [RFC v2 10/10] mm: use atomic_cmpxchg_acquire in page_ref_freeze().
Date:   Wed, 17 Nov 2021 01:20:59 +0000
Message-Id: <20211117012059.141450-11-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.34.0.rc1.387.gb447b232ab-goog
In-Reply-To: <20211117012059.141450-1-pasha.tatashin@soleen.com>
References: <20211117012059.141450-1-pasha.tatashin@soleen.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

page_ref_freeze and page_ref_unfreeze are designed to be used as a pair.
They protect critical sections where struct page can be modified.

page_ref_unfreeze() is protected by _release() atomic operation, but
page_ref_freeze() is not as it is assumed that cmpxch provides the full
barrier.

Instead, use the appropriate atomic_cmpxchg_acquire() to ensure that
memory model is excplicitly followed.

Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
---
 include/linux/page_ref.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/linux/page_ref.h b/include/linux/page_ref.h
index 26676d3bcd58..ecd92d7f3eef 100644
--- a/include/linux/page_ref.h
+++ b/include/linux/page_ref.h
@@ -308,7 +308,8 @@ static inline bool folio_try_get_rcu(struct folio *folio)
 
 static inline int page_ref_freeze(struct page *page, int count)
 {
-	int ret = likely(atomic_cmpxchg(&page->_refcount, count, 0) == count);
+	int old_val = atomic_cmpxchg_acquire(&page->_refcount, count, 0);
+	int ret = likely(old_val == count);
 
 	if (page_ref_tracepoint_active(page_ref_freeze))
 		__page_ref_freeze(page, count, ret);
-- 
2.34.0.rc1.387.gb447b232ab-goog

