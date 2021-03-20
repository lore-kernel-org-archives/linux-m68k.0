Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFAB1C433E3
	for <linux-m68k@archiver.kernel.org>; Sat, 20 Mar 2021 03:45:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 892BE619A5
	for <linux-m68k@archiver.kernel.org>; Sat, 20 Mar 2021 03:45:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229818AbhCTDow (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Fri, 19 Mar 2021 23:44:52 -0400
Received: from angie.orcam.me.uk ([157.25.102.26]:37952 "EHLO
        angie.orcam.me.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229872AbhCTDos (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Fri, 19 Mar 2021 23:44:48 -0400
Received: by angie.orcam.me.uk (Postfix, from userid 500)
        id 26B2092009C; Sat, 20 Mar 2021 04:44:46 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
        by angie.orcam.me.uk (Postfix) with ESMTP id 1F63392009B;
        Sat, 20 Mar 2021 04:44:46 +0100 (CET)
Date:   Sat, 20 Mar 2021 04:44:46 +0100 (CET)
From:   "Maciej W. Rozycki" <macro@orcam.me.uk>
To:     Christoph Hellwig <hch@lst.de>
cc:     "David S. Miller" <davem@davemloft.net>,
        Jens Axboe <axboe@kernel.dk>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Richard Henderson <rth@twiddle.net>,
        Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
        Matt Turner <mattst88@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Michael Ellerman <mpe@ellerman.id.au>,
        linux-ide@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 10/10] ide: remove the legacy ide driver
In-Reply-To: <20210318045706.200458-11-hch@lst.de>
Message-ID: <alpine.DEB.2.21.2103200425360.21463@angie.orcam.me.uk>
References: <20210318045706.200458-1-hch@lst.de> <20210318045706.200458-11-hch@lst.de>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Thu, 18 Mar 2021, Christoph Hellwig wrote:

> The legay ide driver has been replace with libata startin in 2003 and has

 s/legay/legacy/;s/replace/replaced/;s/startin/startin/ (though I'd say 
"back in" instead in the latter case).

> been scheduled for removal for a while.  Finally kill it off so that we
> can start cleaning up various bits of cruft it forced on the block layer.

 You need to adjust Documentation/admin-guide/kernel-parameters.txt too, 
i.e. remove all the `ide*' options, possibly more (I haven't checked in 
detail).

  Maciej
