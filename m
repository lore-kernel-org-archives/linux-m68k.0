Return-Path: <SRS0=kwK6=CQ=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DBD6C43461
	for <linux-m68k@archiver.kernel.org>; Mon,  7 Sep 2020 07:14:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2C81A206B8
	for <linux-m68k@archiver.kernel.org>; Mon,  7 Sep 2020 07:14:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726420AbgIGHOD (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 7 Sep 2020 03:14:03 -0400
Received: from verein.lst.de ([213.95.11.211]:47935 "EHLO verein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726287AbgIGHOD (ORCPT <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 7 Sep 2020 03:14:03 -0400
Received: by verein.lst.de (Postfix, from userid 2407)
        id 7E4FA68BEB; Mon,  7 Sep 2020 09:14:00 +0200 (CEST)
Date:   Mon, 7 Sep 2020 09:14:00 +0200
From:   Christoph Hellwig <hch@lst.de>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Christoph Hellwig <hch@lst.de>, kernel test robot <lkp@intel.com>,
        kbuild-all@lists.01.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Greg Ungerer <gerg@linux-m68k.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>
Subject: Re: [char-misc:char-misc-next 28/28] drivers/char/mem.c:737:21:
 sparse: sparse: incorrect type in argument 1 (different address
 spaces)
Message-ID: <20200907071400.GA19764@lst.de>
References: <202009060512.tOc1hWe8%lkp@intel.com> <20200907062456.GA19124@lst.de> <CAMuHMdVTysHJoghpLC5KyX=s7SOFNFxsXKX1m69AseM12x3XRQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdVTysHJoghpLC5KyX=s7SOFNFxsXKX1m69AseM12x3XRQ@mail.gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Sender: linux-m68k-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Mon, Sep 07, 2020 at 09:04:15AM +0200, Geert Uytterhoeven wrote:
> Hi Christoph,
> 
> On Mon, Sep 7, 2020 at 8:25 AM Christoph Hellwig <hch@lst.de> wrote:
> > On Sun, Sep 06, 2020 at 05:14:15AM +0800, kernel test robot wrote:
> > > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/char-misc.git char-misc-next
> > > head:   99f667352f6c938440d9043d0f66f859d6f3d50d
> > > commit: 99f667352f6c938440d9043d0f66f859d6f3d50d [28/28] /dev/zero: also implement ->read
> > > config: m68k-randconfig-s031-20200904 (attached as .config)
> > > compiler: m68k-linux-gcc (GCC) 9.3.0
> >
> > Looks like m68 does not have proper __user annotations for clear_user..
> 
> M68k has, m68knommu apparently hasn't.
> Same for strncpy_from_user() and strnlen_user().

Sorry, I mean to write m68knommu, that's why I added Greg to the
Cc list.
