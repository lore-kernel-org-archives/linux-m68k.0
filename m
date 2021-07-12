Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54AEBC07E9B
	for <linux-m68k@archiver.kernel.org>; Mon, 12 Jul 2021 08:45:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3CF3C61003
	for <linux-m68k@archiver.kernel.org>; Mon, 12 Jul 2021 08:45:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353770AbhGLIsG (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 12 Jul 2021 04:48:06 -0400
Received: from verein.lst.de ([213.95.11.211]:51631 "EHLO verein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1355754AbhGLIqG (ORCPT <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 12 Jul 2021 04:46:06 -0400
Received: by verein.lst.de (Postfix, from userid 2407)
        id E746567373; Mon, 12 Jul 2021 10:43:14 +0200 (CEST)
Date:   Mon, 12 Jul 2021 10:43:14 +0200
From:   Christoph Hellwig <hch@lst.de>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Christoph Hellwig <hch@lst.de>, Finn Thain <fthain@linux-m68k.org>,
        linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] m68k: MAC should select HAVE_PATA_PLATFORM
Message-ID: <20210712084314.GA17819@lst.de>
References: <20210712074022.2116655-1-geert@linux-m68k.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210712074022.2116655-1-geert@linux-m68k.org>
User-Agent: Mutt/1.5.17 (2007-11-01)
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Looks good,

Reviewed-by: Christoph Hellwig <hch@lst.de>
