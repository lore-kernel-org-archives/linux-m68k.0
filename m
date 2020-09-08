Return-Path: <SRS0=nM4c=CR=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BC73C433E2
	for <linux-m68k@archiver.kernel.org>; Tue,  8 Sep 2020 19:29:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D41162078B
	for <linux-m68k@archiver.kernel.org>; Tue,  8 Sep 2020 19:29:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731032AbgIHT3w (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 8 Sep 2020 15:29:52 -0400
Received: from verein.lst.de ([213.95.11.211]:53207 "EHLO verein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731026AbgIHP7O (ORCPT <rfc822;linux-m68k@vger.kernel.org>);
        Tue, 8 Sep 2020 11:59:14 -0400
Received: by verein.lst.de (Postfix, from userid 2407)
        id 4597868C4E; Tue,  8 Sep 2020 15:30:18 +0200 (CEST)
Date:   Tue, 8 Sep 2020 15:30:17 +0200
From:   Christoph Hellwig <hch@lst.de>
To:     Greg Ungerer <gerg@linux-m68k.org>
Cc:     linux-m68k@vger.kernel.org, hch@lst.de, geert@linux-m68k.org,
        kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] m68knommu: add missing __user annotations
Message-ID: <20200908133017.GA4042@lst.de>
References: <20200908132647.923201-1-gerg@linux-m68k.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200908132647.923201-1-gerg@linux-m68k.org>
User-Agent: Mutt/1.5.17 (2007-11-01)
Sender: linux-m68k-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Tue, Sep 08, 2020 at 11:26:47PM +1000, Greg Ungerer wrote:
> Some of the m68knommu user access functions are not using the __user
> annotation where required. Specifically __clear_user(), strnlen_user()
> and strncpy_from_user() need their user space source address annoted
> with __user.

You'll also need __force annotations to that sparse doesn't complain
inside the function.  Btw, it might be worth to just use the helpers
from asm-generic/uaccess.h as they should work for m68knommu.
