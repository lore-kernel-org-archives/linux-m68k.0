Return-Path: <SRS0=0yiB=55=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90205C2BA2B
	for <linux-m68k@archiver.kernel.org>; Mon, 13 Apr 2020 23:02:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6C78820692
	for <linux-m68k@archiver.kernel.org>; Mon, 13 Apr 2020 23:02:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389874AbgDMXCw (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 13 Apr 2020 19:02:52 -0400
Received: from kvm5.telegraphics.com.au ([98.124.60.144]:50808 "EHLO
        kvm5.telegraphics.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727968AbgDMXCv (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Mon, 13 Apr 2020 19:02:51 -0400
Received: from localhost (localhost.localdomain [127.0.0.1])
        by kvm5.telegraphics.com.au (Postfix) with ESMTP id 3B3D72290B;
        Mon, 13 Apr 2020 19:02:48 -0400 (EDT)
Date:   Tue, 14 Apr 2020 09:02:45 +1000 (AEST)
From:   Finn Thain <fthain@telegraphics.com.au>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
cc:     Rob Landley <rob@landley.net>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        Linux/m68k <linux-m68k@vger.kernel.org>,
        Laurent Vivier <Laurent@vivier.eu>
Subject: Re: GCC?, was Re: Running m68k on qemu with external initramfs?
In-Reply-To: <CAMuHMdXyhB52yLZ59njZ6fTZB8B1cZNWLFHcGaCxZ2TuKt7_0g@mail.gmail.com>
Message-ID: <alpine.LNX.2.22.394.2004140841070.8@nippy.intranet>
References: <b1e930f3-7775-6955-860e-a2886627caa8@landley.net> <c4a784d9-2fef-ee90-9ff3-b1d8487e8a8b@physik.fu-berlin.de> <238ea76c-fa8e-0134-667b-3864938d9a78@landley.net> <alpine.LNX.2.22.394.2004130922090.8@nippy.intranet> <7a9ada44-e0d4-6743-3819-92dc44f3f156@landley.net>
 <alpine.LNX.2.22.394.2004131146180.15@nippy.intranet> <eb942a46-515f-9e1e-eeab-22c50b56e07c@landley.net> <29e2cf8a-35fa-b24a-bce2-84e05e54d4c5@landley.net> <CAMuHMdXyhB52yLZ59njZ6fTZB8B1cZNWLFHcGaCxZ2TuKt7_0g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-m68k-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Mon, 13 Apr 2020, Geert Uytterhoeven wrote:

> On Mon, Apr 13, 2020 at 11:37 AM Rob Landley <rob@landley.net> wrote:
> >
> > Did you know that if you disable optimizations you can get _more_ 
> > warnings?
> >
> > _disabling_ the gcse optimization triggered one of those "may be used 
> > uninitialized but is a false positive 99% of the time" which in this 
> > case, turned out to have a path that could trigger in a function I 
> > added last week, which which was called in an else case 5 lines down. 
> > (Yes, when it DIDN'T segfault, it gave me the warning.)
> 
> It's indeed a pity.  I looked into each and every one of them when I 
> could still compile the kernel with gcc 4.1, to find the few cases that 
> were real bugs...
> 

It appears code generation and static analysis really are separate 
problems. Code gen could be done faster when the user just wants an 
executable and has no use for the analysis (up to 'git bisect'). And 
static analysis works better when you have proper coverage, as you guys 
have shown.
