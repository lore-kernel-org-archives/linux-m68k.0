Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 436B2C433EF
	for <linux-m68k@archiver.kernel.org>; Thu, 16 Sep 2021 07:05:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 199D1611EE
	for <linux-m68k@archiver.kernel.org>; Thu, 16 Sep 2021 07:05:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234539AbhIPHGV (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Thu, 16 Sep 2021 03:06:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234532AbhIPHGV (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Thu, 16 Sep 2021 03:06:21 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20A17C061574
        for <linux-m68k@lists.linux-m68k.org>; Thu, 16 Sep 2021 00:05:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
        Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
        Content-Description:In-Reply-To:References;
        bh=cTMVni+dHRcNcSlwdhZZOw/5aDYLq4nytqFoVbXjb0w=; b=mZL6N9tCXvnvYRIQMMEbcxaUGn
        anlGXlFRDX86Ho0yTu+Y4rreSxVZc8AZmSWEVzhfbZ3JygAzgQv/7KjdxeMkDgUnMwSmE8Bry0PJZ
        UFrevq0vQmcmONkG/F1p04kN4/H6fy99bp5cADy4cjsj6FQMVzy066wAL3gTJgaQwYjHnAsbhjrwq
        5DhHg+jiD9lj6FlK/hvbQhYv/3IjRgS8w3iw/8Xs+DnBlhsbPlCcu6sSqApzPGuOBrV059UYvO1vv
        cmbLRf1heqQQea5IFevTfjOpVULXpIj90WFeXR37fJb4JgYbHkCC4xcTICPbtSnOpogAXDdIjJJlE
        +zfL6lfQ==;
Received: from [2001:4bb8:184:72db:6d44:b004:a9fa:2cf3] (helo=localhost)
        by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1mQlRH-00GOxr-M9; Thu, 16 Sep 2021 07:04:15 +0000
From:   Christoph Hellwig <hch@lst.de>
To:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Greg Ungerer <gerg@linux-m68k.org>
Cc:     Michael Schmitz <schmitzmic@gmail.com>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        linux-m68k@lists.linux-m68k.org
Subject: remove set_fs for m68k
Date:   Thu, 16 Sep 2021 09:03:59 +0200
Message-Id: <20210916070405.52750-1-hch@lst.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi all,

this series converts m68k to the new world where set_fs is gone to make
the uaccess routines work on kernel pointers.

Changes from the RFC version:
  - simplify virt_to_phys_slow (and thus flush_icache_range)
