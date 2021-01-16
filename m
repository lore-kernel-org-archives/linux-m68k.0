Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E5CAC433E0
	for <linux-m68k@archiver.kernel.org>; Sat, 16 Jan 2021 02:07:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4B16B208A9
	for <linux-m68k@archiver.kernel.org>; Sat, 16 Jan 2021 02:07:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725934AbhAPCGo (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Fri, 15 Jan 2021 21:06:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45022 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725833AbhAPCGo (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Fri, 15 Jan 2021 21:06:44 -0500
X-Greylist: delayed 3657 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Fri, 15 Jan 2021 18:06:04 PST
Received: from sammy.net (anhedonia.sammy.net [IPv6:2001:4800:7819:104:be76:4eff:fe06:7ac0])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3FEF8C061757
        for <linux-m68k@lists.linux-m68k.org>; Fri, 15 Jan 2021 18:06:04 -0800 (PST)
Received: from sammy by sammy.net with local (Exim 4.94)
        (envelope-from <sammy@sammy.net>)
        id 1l0a1X-00BubH-NM; Fri, 15 Jan 2021 20:05:03 -0500
Date:   Fri, 15 Jan 2021 20:05:03 -0500
From:   Sam Creasey <sammy@sammy.net>
To:     John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>
Subject: Re: Booting Linux on Sun3 machines
Message-ID: <20210116010503.GI1344617@anhedonia>
References: <9fd0f739-1b4b-6ce1-6a02-02375b4b574f@physik.fu-berlin.de>
 <CAMuHMdW5Of5dJwVjBytZyuTw3fxv1vPXrTcB6EzLUVW6T3Jsbw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdW5Of5dJwVjBytZyuTw3fxv1vPXrTcB6EzLUVW6T3Jsbw@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Honestly, it probably doesn't boot.  The last kernel I knew to boot
successfully was 2.6.16, and that required patches.

My last round of notes is still here: https://sammy.net/sun3/

It does include links to a compiled bootloader to netboot a sun3, and
a very ancient debian userland (though if you get to trying to load
init, I'd call that a victory).

I don't believe I ever wrote up full boot instructions, but the
bootloader is a fork of the NetBSD one, so if you can get
rarp/tftp/nfs/etc working well enough to netboot that, you're in the
right place to try to netboot a Linux kernel.  I don't currently have
a boot server configured, but I might be able to find some time to
set something up and help you debug if you get that far.  I've
certainly still got hardware to test with.

-- Sam

On Fri, Jan 15, 2021 at 07:52:05PM +0100, Geert Uytterhoeven wrote:
> CC sammy
>
> On Fri, Jan 15, 2021 at 7:32 PM John Paul Adrian Glaubitz
> <glaubitz@physik.fu-berlin.de> wrote:
> > Since Arnd has waved with the axe at the Sun3 port this week, I would like to start
> > testing the port to make sure it still boots and if not, we can fix the problems.
> >
> > I have three Sun3 machines in my basement that I can test the kernel on. However,
> > I have zero experience booting these machines, so I was wondering whether anyone
> > has booted Linux on these machines in the past and can tell me how that works.
> >
> > Thanks,
> > Adrian
> >
> > --
> >  .''`.  John Paul Adrian Glaubitz
> > : :' :  Debian Developer - glaubitz@debian.org
> > `. `'   Freie Universitaet Berlin - glaubitz@physik.fu-berlin.de
> >   `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
