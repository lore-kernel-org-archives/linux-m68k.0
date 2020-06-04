Return-Path: <SRS0=9XsF=7R=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 841C4C433E0
	for <linux-m68k@archiver.kernel.org>; Thu,  4 Jun 2020 07:43:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5C1EE20663
	for <linux-m68k@archiver.kernel.org>; Thu,  4 Jun 2020 07:43:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727881AbgFDHnU (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Thu, 4 Jun 2020 03:43:20 -0400
Received: from cynthia.allandria.com ([50.242.82.17]:56656 "EHLO
        cynthia.allandria.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726246AbgFDHnT (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Thu, 4 Jun 2020 03:43:19 -0400
Received: from flar by cynthia.allandria.com with local (Exim 4.84_2)
        (envelope-from <flar@allandria.com>)
        id 1jgkWw-0000np-U7; Thu, 04 Jun 2020 00:43:14 -0700
Date:   Thu, 4 Jun 2020 00:43:14 -0700
From:   Brad Boyer <flar@allandria.com>
To:     Finn Thain <fthain@telegraphics.com.au>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Joshua Thompson <funaho@jurai.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>
Subject: Re: [PATCH 0/4] Mac IOP driver fixes
Message-ID: <20200604074314.GA800@allandria.com>
References: <cover.1590880333.git.fthain@telegraphics.com.au>
 <CAMuHMdVb2C7asip_-_zbc3JP+nqn6siKqmikOK98tM5=2BYqcQ@mail.gmail.com>
 <alpine.LNX.2.22.394.2006010931070.8@nippy.intranet>
 <20200601060915.GA8450@allandria.com>
 <alpine.LNX.2.22.394.2006020922570.8@nippy.intranet>
 <20200602022157.GA3216@allandria.com>
 <alpine.LNX.2.22.394.2006021317230.8@nippy.intranet>
 <20200604031938.GA25970@allandria.com>
 <alpine.LNX.2.22.394.2006041424440.8@nippy.intranet>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.LNX.2.22.394.2006041424440.8@nippy.intranet>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-m68k-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Thu, Jun 04, 2020 at 02:49:24PM +1000, Finn Thain wrote:
> On Wed, 3 Jun 2020, Brad Boyer wrote:
> > On Tue, Jun 02, 2020 at 01:48:22PM +1000, Finn Thain wrote:
> > > 
> > There does appear to be a bit in the mode register to directly control 
> > the SEL line to the drive. Nothing in our code appears to use it. You 
> > would write HEDSEL to mode0 to clear the line, and write HEDSEL to mode1 
> > to set the line. However, it looks like the first bit in the setup 
> > register controls if that line is input or output. Not sure why we have 
> > it named S_INV_WDATA, but the state machine to the actual floppy drive 
> > is way beyond my comprehension. I'll note that the swim3.c driver uses 
> > the SELECT bit in the control register to do the same basic thing (and 
> > it's the same bit value as HEDSEL in swim.c).
> > 
> 
> I think that agrees with the patch I wrote a couple of years ago, back 
> when I was working on this problem:

Yes, that seems to fit with my understanding. In the pinout list I have
for the original SWIM chip, one line is called /Q3/HEDSEL. The pinout
specifically says it can be configured to either be an input (Q3) or
an output (HEDSEL). However, there's another pin in the list that is
simply listed as HEDSEL. Not sure why they would have had the same
output on two separate pins.

> > I know we at least used to have a problem where the SCC ports only 
> > worked if they were already in bypass mode. There was something we 
> > weren't doing right about setting the bypass mode. I'm not sure if we 
> > ever fixed it. If you turn off the "Compatible Mode" in the Serial 
> > Switch control panel, does the Linux kernel SCC driver still work 
> > afterwards? I know that was a problem at one point.
> > 
> 
> Yes, it's still a problem. This relates directly to patch 2/4, so I asked 
> Stan to confirm this before I sent the present patch series. Apparently 
> the IOP_BYPASS bit is read-only. To effect a switch to bypass mode I 
> believe that it is necessary to send the right message to the IOP kernel.

OK. Yes, I have a list of structures and one of them appears to be the
bypass command. The outbound message is 3 bytes (the command code:4, a
byte for a flag with 0 meaning off and 1 meaning on, and an ID byte).
The reply is a byte of error (0 is success) followed by extra bytes
depending on the error value.

One of the listed error values is "driver in use", so it's possible
it will reject the request. We are just taking advantage of the
existing drivers, so probably both the SWIM and ADB drivers are
still running on the IOP.

It looks like shutting down a driver is another command. The command
byte for that is 2, and the second byte is which driver to stop (0/1).
I'm not sure if there's a way to restart the driver after that other
than reloading everything.

> > > But I wish I knew why the driver doesn't work on an LC III, which 
> > > supposedly has a SWIM 2, just like the Quadra 800.
> > 
> > If I had to guess, the select line isn't in the same place. For example, 
> > on the Mac Portable (which obviously isn't supported in Linux) that line 
> > is apparently in VIA2 register B (as are most of the other bits that 
> > normally show up in register A). Based on looking at the driver, being 
> > unable to drive that line to the disk drive would break lots of stuff, 
> > including the detection of the disk inserted in the drive.
> > 
> 
> OK. I see that figure 9-11 has these details. I never noticed that, being 
> that the Portable seemed to have no relevance.
> 
> We will have to experiment further to find out whether setting this bit 
> has any effect on the LC III.

Thinking of those figures, I'll note that Figure 9-13 specifically
shows HDSEL on the SWIM chip on the IIcx/IIci as not connected while
the VIA1 PA5 output line is connected to the pin on the drive cable.
The IIfx version in Figure 9-14 shows the HDSEL line on the SWIM
chip as the only thing connected to the same pin on the drive cable.

Based on some of the other hints I've read, actually connecting
HDSEL on the SWIM chip to the cable instead of having it accessible
directly by the CPU makes it impossible to use the SWIM in IWM mode.
Perhaps in some later models they gave up and decided to just always
use it in ISM mode so they didn't need to use up a pin on the VIA.

	Brad Boyer
	flar@allandria.com

