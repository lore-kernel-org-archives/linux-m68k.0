Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE1C7C433F5
	for <linux-m68k@archiver.kernel.org>; Tue, 14 Sep 2021 16:28:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D5EEA610F9
	for <linux-m68k@archiver.kernel.org>; Tue, 14 Sep 2021 16:28:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229497AbhINQaO (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 14 Sep 2021 12:30:14 -0400
Received: from zeniv-ca.linux.org.uk ([142.44.231.140]:46386 "EHLO
        zeniv-ca.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229482AbhINQaN (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 14 Sep 2021 12:30:13 -0400
Received: from viro by zeniv-ca.linux.org.uk with local (Exim 4.94.2 #2 (Red Hat Linux))
        id 1mQBIc-0049a9-S5; Tue, 14 Sep 2021 16:28:46 +0000
Date:   Tue, 14 Sep 2021 16:28:46 +0000
From:   Al Viro <viro@zeniv.linux.org.uk>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Michael Schmitz <schmitzmic@gmail.com>,
        Christoph Hellwig <hch@lst.de>,
        Andreas Schwab <schwab@linux-m68k.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Greg Ungerer <gerg@linux-m68k.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>
Subject: Re: RFC: remove set_fs for m68k
Message-ID: <YUDNviFDCFCzsh/E@zeniv-ca.linux.org.uk>
References: <8884e940-22e8-72a5-e9ec-f9b2628b6ef4@gmail.com>
 <251aa093-047a-b37c-4e88-d543c6fa8bc6@gmail.com>
 <20210815074236.GA23777@lst.de>
 <63c35a20-3eec-1825-fa18-5df28f5b6eaa@gmail.com>
 <20210816065851.GA26665@lst.de>
 <e705cfe1-4386-d205-89c6-73e13335c792@gmail.com>
 <7517d306-21ad-daa1-a2fb-b273211cb588@gmail.com>
 <CAHk-=wgEFfm61UP3tfkVthVoivsyo0m4c-HrKo7SP8fwZTn4tA@mail.gmail.com>
 <d08e51a8-c5c4-c8be-e8d4-2bfc13b4a48b@gmail.com>
 <CAHk-=wj86gMUzK4XPO+ibZqS77fAgU5eZXRPejn61OZk+rQiRA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=wj86gMUzK4XPO+ibZqS77fAgU5eZXRPejn61OZk+rQiRA@mail.gmail.com>
Sender: Al Viro <viro@ftp.linux.org.uk>
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Tue, Sep 14, 2021 at 08:54:26AM -0700, Linus Torvalds wrote:
> On Mon, Sep 13, 2021 at 7:43 PM Michael Schmitz <schmitzmic@gmail.com> wrote:
> >
> > having run stress tests on a kernel with Al Viro's signal handling fixes
> > applied for the past two days with no further errors, I am now quite
> > confident that the format error I saw in resume_userspace() and a bus
> > error in setup_frame() were caused by multiple pending signals, and the
> > resulting stack mangling that Al's patches fix.
> 
> Sounds good. Except you say "Al Viro's signal handling fixes" without
> giving any context, so I have no idea which patches you are referring
> to.
> 
> Regardless, if there's some fixes queue that also removes set_fs()
> from m68k, I'm willing to take it for 5.15 just to have another
> architecture down and done with.
> 
> And even if the set_fs() patches might still be under discussion, the
> format errors have been going on for some time, so the signal fixes -
> wherever they are - seem to be no-brainers if they fix those.

	vfs.git #{untested,fixes}.m68k, series posted to m68k folks back in July.
3 commits in there, and I've some local followup cleanups (ifdefs in m68k/signal.c
are bloody confused), but the latter got stalled by ptrace and signal review and
documentation writing...

	See https://lkml.kernel.org/lkml/YP2dTQPm1wGPWFgD@zeniv-ca.linux.org.uk/T/
for original thread.
