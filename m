Return-Path: <SRS0=Hd0i=DO=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7297EC4363D
	for <linux-m68k@archiver.kernel.org>; Wed,  7 Oct 2020 08:59:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 306AC20797
	for <linux-m68k@archiver.kernel.org>; Wed,  7 Oct 2020 08:59:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727937AbgJGI7P (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 7 Oct 2020 04:59:15 -0400
Received: from verein.lst.de ([213.95.11.211]:36656 "EHLO verein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727865AbgJGI7O (ORCPT <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 7 Oct 2020 04:59:14 -0400
Received: by verein.lst.de (Postfix, from userid 2407)
        id E52956736F; Wed,  7 Oct 2020 10:59:11 +0200 (CEST)
Date:   Wed, 7 Oct 2020 10:59:11 +0200
From:   Christoph Hellwig <hch@lst.de>
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     Christoph Hellwig <hch@lst.de>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        "David S. Miller" <davem@davemloft.net>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        sparclinux <sparclinux@vger.kernel.org>,
        Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
        Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH 1/3] fbdev/sbuslib: remove FBIOSCURSOR/FBIOGCURSOR
 leftovers
Message-ID: <20201007085911.GA17356@lst.de>
References: <20201007074447.797968-1-hch@lst.de> <20201007074447.797968-2-hch@lst.de> <CAK8P3a0UHEsND+vJjhtj2GKQpMjMCqD55vQ9+2u-SCrThe3wTw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK8P3a0UHEsND+vJjhtj2GKQpMjMCqD55vQ9+2u-SCrThe3wTw@mail.gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Wed, Oct 07, 2020 at 10:54:19AM +0200, Arnd Bergmann wrote:
> On Wed, Oct 7, 2020 at 9:44 AM Christoph Hellwig <hch@lst.de> wrote:
> >
> > There are no actual implementations of FBIOSCURSOR/FBIOGCURSOR left, so
> > don't bother with a compat handler for it, and remove the remaining
> > definitions as well.
> >
> > Signed-off-by: Christoph Hellwig <hch@lst.de>
> 
> I had submitted a similar patch earlier, and Sam Ravnborg applied it to the
> drm-misc tree, but it doesn't seem to be in linux-next, so I don't know
> what the state is.
> 
> My version only removed the compat handling, not the data structures,
> so I'm happy to see your version used instead if mine got lost.

Oh, sorry.  I thought in your summary you decided to give up on
the sbuslib ones.
