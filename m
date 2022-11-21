Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1678AC4332F
	for <linux-m68k@archiver.kernel.org>; Mon, 21 Nov 2022 10:43:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229664AbiKUKnT (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 21 Nov 2022 05:43:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47768 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229642AbiKUKnS (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 21 Nov 2022 05:43:18 -0500
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D71D32EC
        for <linux-m68k@lists.linux-m68k.org>; Mon, 21 Nov 2022 02:43:17 -0800 (PST)
Received: by verein.lst.de (Postfix, from userid 2407)
        id 267E268AA6; Mon, 21 Nov 2022 11:43:14 +0100 (CET)
Date:   Mon, 21 Nov 2022 11:43:13 +0100
From:   Christoph Hellwig <hch@lst.de>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Christoph Hellwig <hch@lst.de>, Greg Ungerer <gerg@linux-m68k.org>,
        Joakim Zhang <qiangqing.zhang@nxp.com>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        linux-m68k@lists.linux-m68k.org, uclinux-dev@uclinux.org,
        netdev@vger.kernel.org
Subject: Re: [PATCH 1/2] net: fec: use dma_alloc_noncoherent for m532x
Message-ID: <20221121104313.GA4644@lst.de>
References: <20221121095631.216209-1-hch@lst.de> <20221121095631.216209-2-hch@lst.de> <CAMuHMdVWjDYEAXqWuYYEOb=C-phYjS7wYNPSyZYweR0WhzSZ+A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdVWjDYEAXqWuYYEOb=C-phYjS7wYNPSyZYweR0WhzSZ+A@mail.gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Mon, Nov 21, 2022 at 11:24:29AM +0100, Geert Uytterhoeven wrote:
> > +#ifdef CONFIG_M532x
> 
> Shouldn't this be the !CONFIG_M532x path?

Yes.
