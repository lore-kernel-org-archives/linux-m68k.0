Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25B38C433EF
	for <linux-m68k@archiver.kernel.org>; Tue, 26 Oct 2021 17:38:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 055C060F9D
	for <linux-m68k@archiver.kernel.org>; Tue, 26 Oct 2021 17:38:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236281AbhJZRku (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 26 Oct 2021 13:40:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43300 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234976AbhJZRku (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 26 Oct 2021 13:40:50 -0400
Received: from mail-qk1-x733.google.com (mail-qk1-x733.google.com [IPv6:2607:f8b0:4864:20::733])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9FF1C061767
        for <linux-m68k@lists.linux-m68k.org>; Tue, 26 Oct 2021 10:38:25 -0700 (PDT)
Received: by mail-qk1-x733.google.com with SMTP id r15so15944817qkp.8
        for <linux-m68k@lists.linux-m68k.org>; Tue, 26 Oct 2021 10:38:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1wFVuNwCQDYBl4y+oheYP9hytkXQV86RHdzyMeLYvHo=;
        b=DgmpiJ5a4TBPAgk9kfH34K6GHXyXVUok93gbxtPSDZBT9hSEB3TNmKPMh7S4AdUTiY
         vaIa4rtpH/4yK9n/egQL2T/v1rb+40jk3YhuPBIAeznL3+Vg1ti7X+Vcb+l1jLhx0iyU
         +BnmNbsW4WV1mWaqP2dMLeNKUDszdu82/Pyv1tELesYUa6S2ecc7KEe2/6n96YRqURfn
         GnbGn8c5PTRw1aLI869AqkjrrDCfAN8wCwfPF/cmo9xQRxFSIs2rL5owDcZcGOEVg2kx
         QD0pEfbdtm8G0v6vbHSs95Wq2qjtBZ6SlG3j7qJv/OZfm/WB5BBY6r44gUnhdUv1+LiI
         GxRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1wFVuNwCQDYBl4y+oheYP9hytkXQV86RHdzyMeLYvHo=;
        b=WJb7ZIzJ2nHNl2aQAYe6wiprzAKmhzdtmNwNQjoOgbKQEh5ZXRYOfgwiC446bQGKz4
         fTcZtlpE7Ant6QHNGk2KUw+mAmn/wb/6LjccO0hNhW+qC/XH0OUTk6fmtKvF5xRf3Udd
         565I8g2Xeafi6PObCDYnay9ptBWPhDcxij18rxi4VizQjAhd2eQpN8zWxDUNa0iWVy5C
         9WCMSoEuojeIQi/Ys24/w0vl5p+/YCIciTMJM5cHXFgwBWij9IrOlwDV6qEEDIa9KP+O
         1AtmzFnHgz2df0WZPZNrKJC3/ADzJdBGCDGIyaoM1lXpJgvrwcMMNBm7xr/A/S0SaL4O
         v1/g==
X-Gm-Message-State: AOAM530r+HuOx9W+NaxJTfZJ/I7SrjHXH5iqQVVP/DGzUMXe1RUT/RsE
        HoDidfbPodOBnUlZwlFiODqXfw==
X-Google-Smtp-Source: ABdhPJyMZJkPL/lBXsv80gSA7jyRMzmSsRuOz4irGOx6Nwzcx1LmjIDkWSNzBFsXqrtVX0RQFW5FWA==
X-Received: by 2002:ae9:f813:: with SMTP id x19mr4851895qkh.198.1635269904891;
        Tue, 26 Oct 2021 10:38:24 -0700 (PDT)
Received: from soleen.c.googlers.com.com (189.216.85.34.bc.googleusercontent.com. [34.85.216.189])
        by smtp.gmail.com with ESMTPSA id bj37sm11001939qkb.49.2021.10.26.10.38.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Oct 2021 10:38:24 -0700 (PDT)
From:   Pasha Tatashin <pasha.tatashin@soleen.com>
To:     pasha.tatashin@soleen.com, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, linux-m68k@lists.linux-m68k.org,
        anshuman.khandual@arm.com, willy@infradead.org,
        akpm@linux-foundation.org, william.kucharski@oracle.com,
        mike.kravetz@oracle.com, vbabka@suse.cz, geert@linux-m68k.org,
        schmitzmic@gmail.com, rostedt@goodmis.org, mingo@redhat.com,
        hannes@cmpxchg.org, guro@fb.com, songmuchun@bytedance.com,
        weixugc@google.com, gthelen@google.com
Subject: [RFC 0/8] Hardening page _refcount
Date:   Tue, 26 Oct 2021 17:38:14 +0000
Message-Id: <20211026173822.502506-1-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.33.0.1079.g6e70778dc9-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

It is hard to root cause _refcount problems, because they usually
manifest after the damage has occurred.  Yet, they can lead to
catastrophic failures such memory corruptions.

Improve debugability by adding more checks that ensure that
page->_refcount never turns negative (i.e. double free does not
happen, or free after freeze etc).

- Check for overflow and underflow right from the functions that
  modify _refcount
- Remove set_page_count(), so we do not unconditionally overwrite
  _refcount with an unrestrained value
- Trace return values in all functions that modify _refcount

Applies against v5.15-rc7. Boot tested in QEMU.

Pasha Tatashin (8):
  mm: add overflow and underflow checks for page->_refcount
  mm/hugetlb: remove useless set_page_count()
  mm: Avoid using set_page_count() in set_page_recounted()
  mm: remove set_page_count() from page_frag_alloc_align
  mm: avoid using set_page_count() when pages are freed into allocator
  mm: rename init_page_count() -> page_ref_init()
  mm: remove set_page_count()
  mm: simplify page_ref_* functions

 arch/m68k/mm/motorola.c         |   2 +-
 include/linux/mm.h              |   2 +-
 include/linux/page_ref.h        | 116 ++++++++++++++++----------------
 include/trace/events/page_ref.h |  66 +++++++++++-------
 mm/debug_page_ref.c             |  22 ++----
 mm/hugetlb.c                    |   2 +-
 mm/internal.h                   |   5 +-
 mm/page_alloc.c                 |  19 ++++--
 8 files changed, 125 insertions(+), 109 deletions(-)

-- 
2.33.0.1079.g6e70778dc9-goog

