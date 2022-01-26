Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C08E8C63686
	for <linux-m68k@archiver.kernel.org>; Wed, 26 Jan 2022 18:34:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241849AbiAZSem (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 26 Jan 2022 13:34:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60180 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244117AbiAZSel (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 26 Jan 2022 13:34:41 -0500
Received: from mail-qv1-xf31.google.com (mail-qv1-xf31.google.com [IPv6:2607:f8b0:4864:20::f31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7B24C06173B
        for <linux-m68k@lists.linux-m68k.org>; Wed, 26 Jan 2022 10:34:40 -0800 (PST)
Received: by mail-qv1-xf31.google.com with SMTP id b12so627528qvz.5
        for <linux-m68k@lists.linux-m68k.org>; Wed, 26 Jan 2022 10:34:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=9qGtluafW49WVeKC1+T5xXe9Gi8hCvJzE0QRf1Gctb0=;
        b=WLC8zAaBt+pGLb2dprhgeTFhzFiOz0Dwgv2sKq4nVV6mme5Ik3TLKMC25II36bZZ5S
         nkiFdbElwzoNvpJfm4IKKcbz4QHq3OId66HMHWWICIgu3RfIP3Y28sd06cMaFCGtpsoS
         og++vqB9AwLOYf7hTuIUOpHHMLg2tMzq5LGyO4/ee6B06PVN72Mnxy/Dau54Nz815L0m
         CT7F1/eD+VSzR33uglaTP7hK7ASfdfmOKDZ4FSRaQjQRm6Pxa7fA7N4bO8kgwtKy7d54
         bCo3neAgZVI3g2RjtaU1yvqnnOVddQ/gjMInuoUFYJvOFvmOj49aqKxoHSPnVsaElEQ5
         B3Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9qGtluafW49WVeKC1+T5xXe9Gi8hCvJzE0QRf1Gctb0=;
        b=4Gs3X5WmUCd/RvTpGsRfWc2GsjN6+A+vGoBY6ayZqCY3mOg/73fAYNsM9wmPwZEVcy
         gJI/oVZi4TEy5kL7D80Qq69s5MVwPPRZhjU7NhORuwWyWfyop2bNTxZDUF+Bo7VelAX2
         Z5G3duUGQYDJbDIq6OeNwxJ6hwr2/6j6xikVs6CQrA9Ti8mbwpWdOLM1ybh8fAukaEWZ
         a2SS7QHvm+hbEm7Sxox/YQeLoz/xGjK+p1Pw8NP7cj2o7iZecYa7xqqpO4qeXcQGUJXj
         bn3ldEKyc4xQGycoyFujOdafuq9XIDnmIaZLjdvofe3i9vnsHOmTyowRkIs+UFK4dve2
         4HNA==
X-Gm-Message-State: AOAM531sY2A7rys5Vk1gMPPSJtUMq3UjYl3hL+wVIKp1RBa+zcHVh10U
        xyrUKMDBJZtL9mRgB79kVF7Dnw==
X-Google-Smtp-Source: ABdhPJxJtoQHYrpWNf8C4q9GS25k4xHwcCuWK9f4FFFmUET3LankryAhv5s7uODB4uZa4iJOyGzaCg==
X-Received: by 2002:a05:6214:1ccb:: with SMTP id g11mr25729042qvd.97.1643222080024;
        Wed, 26 Jan 2022 10:34:40 -0800 (PST)
Received: from soleen.c.googlers.com.com (189.216.85.34.bc.googleusercontent.com. [34.85.216.189])
        by smtp.gmail.com with ESMTPSA id u17sm35886qki.12.2022.01.26.10.34.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jan 2022 10:34:39 -0800 (PST)
From:   Pasha Tatashin <pasha.tatashin@soleen.com>
To:     pasha.tatashin@soleen.com, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, linux-m68k@lists.linux-m68k.org,
        anshuman.khandual@arm.com, willy@infradead.org,
        akpm@linux-foundation.org, william.kucharski@oracle.com,
        mike.kravetz@oracle.com, vbabka@suse.cz, geert@linux-m68k.org,
        schmitzmic@gmail.com, rostedt@goodmis.org, mingo@redhat.com,
        hannes@cmpxchg.org, guro@fb.com, songmuchun@bytedance.com,
        weixugc@google.com, gthelen@google.com, rientjes@google.com,
        pjt@google.com, hughd@google.com
Subject: [PATCH v3 8/9] mm: do not use atomic_set_release in page_ref_unfreeze()
Date:   Wed, 26 Jan 2022 18:34:28 +0000
Message-Id: <20220126183429.1840447-9-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.35.0.rc0.227.g00780c9af4-goog
In-Reply-To: <20220126183429.1840447-1-pasha.tatashin@soleen.com>
References: <20220126183429.1840447-1-pasha.tatashin@soleen.com>
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
2.35.0.rc0.227.g00780c9af4-goog

