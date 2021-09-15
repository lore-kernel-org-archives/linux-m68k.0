Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FDF8C433EF
	for <linux-m68k@archiver.kernel.org>; Wed, 15 Sep 2021 01:07:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 70A8C604DC
	for <linux-m68k@archiver.kernel.org>; Wed, 15 Sep 2021 01:07:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229586AbhIOBIU (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 14 Sep 2021 21:08:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46478 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229458AbhIOBIU (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 14 Sep 2021 21:08:20 -0400
X-Greylist: delayed 31087 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 14 Sep 2021 18:07:02 PDT
Received: from zeniv-ca.linux.org.uk (zeniv-ca.linux.org.uk [IPv6:2607:5300:60:148a::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 720A5C061574
        for <linux-m68k@lists.linux-m68k.org>; Tue, 14 Sep 2021 18:07:02 -0700 (PDT)
Received: from viro by zeniv-ca.linux.org.uk with local (Exim 4.94.2 #2 (Red Hat Linux))
        id 1mQJO4-004GfQ-5l; Wed, 15 Sep 2021 01:06:56 +0000
Date:   Wed, 15 Sep 2021 01:06:56 +0000
From:   Al Viro <viro@zeniv.linux.org.uk>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Michael Schmitz <schmitzmic@gmail.com>,
        Christoph Hellwig <hch@lst.de>,
        Andreas Schwab <schwab@linux-m68k.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Greg Ungerer <gerg@linux-m68k.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>
Subject: Re: RFC: remove set_fs for m68k
Message-ID: <YUFHMBk7B6iCTEDc@zeniv-ca.linux.org.uk>
References: <20210815074236.GA23777@lst.de>
 <63c35a20-3eec-1825-fa18-5df28f5b6eaa@gmail.com>
 <20210816065851.GA26665@lst.de>
 <e705cfe1-4386-d205-89c6-73e13335c792@gmail.com>
 <7517d306-21ad-daa1-a2fb-b273211cb588@gmail.com>
 <CAHk-=wgEFfm61UP3tfkVthVoivsyo0m4c-HrKo7SP8fwZTn4tA@mail.gmail.com>
 <d08e51a8-c5c4-c8be-e8d4-2bfc13b4a48b@gmail.com>
 <CAHk-=wj86gMUzK4XPO+ibZqS77fAgU5eZXRPejn61OZk+rQiRA@mail.gmail.com>
 <YUDNviFDCFCzsh/E@zeniv-ca.linux.org.uk>
 <CAHk-=wj2QPH3Ay+Xh-oKMEZ91SkKXUkBtYT8ex8Ke4GSas6JDQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=wj2QPH3Ay+Xh-oKMEZ91SkKXUkBtYT8ex8Ke4GSas6JDQ@mail.gmail.com>
Sender: Al Viro <viro@ftp.linux.org.uk>
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Tue, Sep 14, 2021 at 09:38:58AM -0700, Linus Torvalds wrote:
> On Tue, Sep 14, 2021 at 9:28 AM Al Viro <viro@zeniv.linux.org.uk> wrote:
> >
> > See https://lkml.kernel.org/lkml/YP2dTQPm1wGPWFgD@zeniv-ca.linux.org.uk/T/
> > for original thread.
> 
> Ok, thanks for the pointer.
> 
> I'm actually surprised we have that "multiple nested signals" thing
> still. I had this memory of us having removed that, and just returning
> to user space with the one signal frame set up.

Too much headache and too many things to keep track of - for example,
you have to cope with fun like raising (and handling) SIGTRAP on
singlestepping into signal handler on some architectures.  That would
need to be special-cased and so would SIGSEGV on failure to set sigframe
up, etc.

Al, back to digging through io_uring and hating every minute of that...
