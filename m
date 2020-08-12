Return-Path: <SRS0=xXxx=BW=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42AD7C433DF
	for <linux-m68k@archiver.kernel.org>; Wed, 12 Aug 2020 09:34:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2459920885
	for <linux-m68k@archiver.kernel.org>; Wed, 12 Aug 2020 09:34:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727049AbgHLJeb (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 12 Aug 2020 05:34:31 -0400
Received: from scenergy.dfmk.hu ([193.224.143.38]:51378 "EHLO scenergy.dfmk.hu"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726629AbgHLJeb (ORCPT <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 12 Aug 2020 05:34:31 -0400
X-Greylist: delayed 338 seconds by postgrey-1.27 at vger.kernel.org; Wed, 12 Aug 2020 05:34:30 EDT
Received: by scenergy.dfmk.hu (Postfix, from userid 1000)
        id D5A08800664; Wed, 12 Aug 2020 11:28:49 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
        by scenergy.dfmk.hu (Postfix) with ESMTP id B96048003F5;
        Wed, 12 Aug 2020 11:28:49 +0200 (CEST)
Date:   Wed, 12 Aug 2020 11:28:49 +0200 (CEST)
From:   "Karoly Balogh (Charlie/SGR)" <charlie@scenergy.dfmk.hu>
To:     Carsten Strotmann <cas@strotmann.de>
cc:     Debian m68k <debian-68k@lists.debian.org>,
        emutos-devel@lists.sourceforge.net, amigaml@freelists.org,
        linux-m68k <linux-m68k@lists.linux-m68k.org>
Subject: Re: m68k chat 21st Aug 2020 - "the Amitari - EmuTOS and Atari Software
 on the Amiga"
In-Reply-To: <86v9hoffcd.fsf@emacs.strotmann.de>
Message-ID: <alpine.DEB.2.02.2008121116420.3100@scenergy.dfmk.hu>
References: <86v9hoffcd.fsf@emacs.strotmann.de>
User-Agent: Alpine 2.02 (DEB 1266 2009-07-14)
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-m68k-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi,

On Wed, 12 Aug 2020, Carsten Strotmann wrote:

> Friday 21st August 2020, 20:00 H CEST (6:00 PM UTC)
>
> Location <https://meet.m68k.info/m68k> (will be online 30 minutes before
> the chat starts)
>
> We will have a short demo: "the Amitari - EmuTOS and Atari Software on
> the Amiga" and discuss the experiences of running Atari software on the
> Amiga (might the reverse might possible too --> running AmigaOS command
> line binaries on TOS?)

Is it possible to run EmuTOS as an AmigaOS "task" already? I know it can
run standalone on various Amiga (and Amiga-related) hardware, but the real
fun - for me anyway - would be to run it alongside AmigaOS. Maybe in a
lightweight VM, like Shapeshifter for MacOS, but course EmuTOS could even
provide such infrastructure for itself. I once even looked at the EmuTOS
code to figure this out, but I never went anywhere with it, because I
realized all the EmuTOS drivers are basically banging the Amiga HW, and
ignore the entire Kickstart.. (Which is understandable from EmuTOS PoV,
but if I want to run it on top of AmigaOS, it means all drivers/etc needs
to be rewritten, which was a much bigger project than I was willing to
take on at that point. Also FIXME, if I was wrong on this.)

I think the main challenge would be sharing the lower 4/8K of RAM, mainly
for TRAP vectors, but exactly for things like Shapeshifter, there's
already a way to handle that. But of course I don't know about various
other Atari-related complications, handling of ST vs. TT RAM, etc.

Overall, I don't know. Just brainstorming. Opinions? :)

Charlie
