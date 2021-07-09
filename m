Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A458BC07E99
	for <linux-m68k@archiver.kernel.org>; Fri,  9 Jul 2021 07:01:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 831FB613C3
	for <linux-m68k@archiver.kernel.org>; Fri,  9 Jul 2021 07:01:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230345AbhGIHEe (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Fri, 9 Jul 2021 03:04:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43086 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230121AbhGIHEd (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Fri, 9 Jul 2021 03:04:33 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA46AC0613DD
        for <linux-m68k@lists.linux-m68k.org>; Fri,  9 Jul 2021 00:01:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
        Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
        Content-Description:In-Reply-To:References;
        bh=lu/EME0CKpUts2SBhaZjb74KKPmYcJ5SdV801WLZvIo=; b=IPqCoFDvIMjSUybr9LMLrm8DY9
        9gL3MX1sqwxsUpRtk8QJfbYazXDEphNyW9kjTu3UaKsRaMvnLNUC12oH8jQ7IOuSrPsI0BL7ngeOR
        +V0dOeJ6j2q4c6Q7ZpFT4C2EXkNaTWRiX1Io4Vf+/w5r85E84qWpWVVc8pNfCQbi1YaeH415MDhSD
        /d6VxHYl3lzHpcaCME5LaQXgfiEcxaDmtaX1TMX4+CsLToOEaurtyU+Qa1yI6O9oMxKtiNWexNL2J
        1nM1US2Nydkb/5Uy+7P8Uzs9DV53hW/kD31HtQGLEyBtE2a5Ds5GvBO+CgNjx/f7u4srNJ2i7Qdrh
        O284CrEw==;
Received: from p4fdb05cb.dip0.t-ipconnect.de ([79.219.5.203] helo=localhost)
        by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1m1kW4-00EFMG-0D; Fri, 09 Jul 2021 07:01:42 +0000
From:   Christoph Hellwig <hch@lst.de>
To:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Greg Ungerer <gerg@linux-m68k.org>
Cc:     Michael Schmitz <schmitzmic@gmail.com>,
        linux-m68k@lists.linux-m68k.org
Subject: RFC: remove set_fs for m68k
Date:   Fri,  9 Jul 2021 09:01:25 +0200
Message-Id: <20210709070132.3387689-1-hch@lst.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi all,

this series converts m68k to the new world where set_fs is gone to make
the uaccess routines work on kernel pointers.  Note that it is compile
tested only and thus needs to be handled with care.
