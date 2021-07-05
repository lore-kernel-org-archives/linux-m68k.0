Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D83F2C07E98
	for <linux-m68k@archiver.kernel.org>; Mon,  5 Jul 2021 05:57:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B628661396
	for <linux-m68k@archiver.kernel.org>; Mon,  5 Jul 2021 05:57:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229781AbhGEGAW (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 5 Jul 2021 02:00:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50540 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229734AbhGEGAW (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 5 Jul 2021 02:00:22 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E1962C061574
        for <linux-m68k@lists.linux-m68k.org>; Sun,  4 Jul 2021 22:57:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
        Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
        Content-Description:In-Reply-To:References;
        bh=Cskoe9oyQCYklHNnJijNFqW/H/1PlRUBwxq1N2Fs1W4=; b=FBvKZzYLDCNh0pem2Ek6G09/Qr
        THW2LZihPvRbUg+q/faQLSJ3ujVapZnEOfYzrAiH5bJfmq+ERJTJuAjurH1qzCA2amDN5WJsdYaNj
        R2PZmuybhy5A57uIEFKKmOyjoiFvPiDfV51PiOjahEF7LeVb1Rl1Cb1AW6qDAc8K0cCaesrZ5V6OJ
        7SsI7QCdZy8Dtv+jVvcn/EyhlFPHdcchyHdkP13sGQvSZylUwXM+6UAtg6oXxZ4sCHP52JqxByAl7
        BKfqzwOyaf9t7pUwqMLel2KB5tp8oy4ma2NxFGn1FxYAeWDCfH4UVA9LvIworHvy3WpuhtKjF27X4
        +E7e8hVg==;
Received: from 213-225-15-202.nat.highway.a1.net ([213.225.15.202] helo=localhost)
        by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1m0Hbd-009vkb-NI; Mon, 05 Jul 2021 05:57:24 +0000
From:   Christoph Hellwig <hch@lst.de>
To:     geert@linux-m68k.org, gerg@linux-m68k.org
Cc:     linux-m68k@lists.linux-m68k.org, uclinux-dev@uclinux.org,
        torvalds@linux-foundation.org
Subject: RFC: stop implementing set_fs for m68knommu
Date:   Mon,  5 Jul 2021 07:57:18 +0200
Message-Id: <20210705055719.949875-1-hch@lst.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi all,

as a recently build error showed implementing set_fs for m68knommu is
actively wrong given that it already does not distinguish between address
spaces.  Fix this up by not implementing set_fs() at all.

Compile tested only.


