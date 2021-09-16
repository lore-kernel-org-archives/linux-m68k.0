Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 964E6C433F5
	for <linux-m68k@archiver.kernel.org>; Thu, 16 Sep 2021 03:21:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 76A1061164
	for <linux-m68k@archiver.kernel.org>; Thu, 16 Sep 2021 03:21:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234121AbhIPDWq (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 15 Sep 2021 23:22:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37254 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234037AbhIPDWp (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 15 Sep 2021 23:22:45 -0400
Received: from zeniv-ca.linux.org.uk (zeniv-ca.linux.org.uk [IPv6:2607:5300:60:148a::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A28BC061574;
        Wed, 15 Sep 2021 20:21:23 -0700 (PDT)
Received: from viro by zeniv-ca.linux.org.uk with local (Exim 4.94.2 #2 (Red Hat Linux))
        id 1mQhxh-004a4S-9q; Thu, 16 Sep 2021 03:21:21 +0000
Date:   Thu, 16 Sep 2021 03:21:21 +0000
From:   Al Viro <viro@zeniv.linux.org.uk>
To:     Michael Schmitz <schmitzmic@gmail.com>
Cc:     linux-m68k@lists.linux-m68k.org,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Greg Ungerer <gerg@linux-m68k.org>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] m68k: leave stack mangling to asm wrapper of
 sigreturn()
Message-ID: <YUK4MWzI73lwRq0W@zeniv-ca.linux.org.uk>
References: <YP2c1xk9LJ0zE3KW@zeniv-ca.linux.org.uk>
 <YP2dTQPm1wGPWFgD@zeniv-ca.linux.org.uk>
 <08183665-f846-0c5e-a8c7-d0a65e78a3da@gmail.com>
 <YUKNn3erTbH+ytpM@zeniv-ca.linux.org.uk>
 <48dafad1-4f0c-4ab7-792c-b34a81d26799@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <48dafad1-4f0c-4ab7-792c-b34a81d26799@gmail.com>
Sender: Al Viro <viro@ftp.linux.org.uk>
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Thu, Sep 16, 2021 at 12:53:53PM +1200, Michael Schmitz wrote:
> > You'd need to
> > 	* load the frame type from sigcontext (and deal with EFAULT, etc.)
> > 	* make decision based on that
> > 	* pass the type down into sigreturn(), so we wouldn't run into
> > mismatches.
> > 
> > And all that just to avoid a single "subtract a constant from stack pointer"
> > insn.  We are on a very shallow kernel stack here - it's a syscall entry,
> > after all.  And the stack footprint of do_sigreturn() is fairly small - e.g.
> > stat(2) eats a lot more.
> 
> Thanks, that's what I was wondering. Not worth the extra complexity then.
> 
> > 
> > We are not initializing the gap either - it's just reserved on stack; we only
> > access it if we need to enlarge the stack frame.
> > 
> > IOW, what would be the benefit of trying to avoid unconditional gap there?
> 
> Avoiding a kernel stack overflow - there are comments in the code that warn
> against that, but those may be largely historic...

This is syscall entry; moreover, it critically relies upon the fixed stack
layout - type 0 exception frame + pt_regs + switch_stack + (now) gap.
Followed by fairly shallow C call chain.  I suspect that the deepest you
can get there is when you get an unmapped page when reading the sigframe
and go into page fault handling, with call chain going into some filesystem's
->readpage().  If it was that close to stack overflow, we'd see them all
the time in e.g. random net ioctl doing copy_from_user() - that's going
to be deeper.  Or in stat(2), for that matter.
