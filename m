Return-Path: <SRS0=9XsF=7R=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9816AC433DF
	for <linux-m68k@archiver.kernel.org>; Thu,  4 Jun 2020 03:19:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7CD08206E6
	for <linux-m68k@archiver.kernel.org>; Thu,  4 Jun 2020 03:19:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726533AbgFDDTo (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 3 Jun 2020 23:19:44 -0400
Received: from cynthia.allandria.com ([50.242.82.17]:56598 "EHLO
        cynthia.allandria.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726260AbgFDDTo (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 3 Jun 2020 23:19:44 -0400
Received: from flar by cynthia.allandria.com with local (Exim 4.84_2)
        (envelope-from <flar@allandria.com>)
        id 1jggPq-0007oA-7l; Wed, 03 Jun 2020 20:19:38 -0700
Date:   Wed, 3 Jun 2020 20:19:38 -0700
From:   Brad Boyer <flar@allandria.com>
To:     Finn Thain <fthain@telegraphics.com.au>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Joshua Thompson <funaho@jurai.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>
Subject: Re: [PATCH 0/4] Mac IOP driver fixes
Message-ID: <20200604031938.GA25970@allandria.com>
References: <cover.1590880333.git.fthain@telegraphics.com.au>
 <CAMuHMdVb2C7asip_-_zbc3JP+nqn6siKqmikOK98tM5=2BYqcQ@mail.gmail.com>
 <alpine.LNX.2.22.394.2006010931070.8@nippy.intranet>
 <20200601060915.GA8450@allandria.com>
 <alpine.LNX.2.22.394.2006020922570.8@nippy.intranet>
 <20200602022157.GA3216@allandria.com>
 <alpine.LNX.2.22.394.2006021317230.8@nippy.intranet>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.LNX.2.22.394.2006021317230.8@nippy.intranet>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-m68k-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Tue, Jun 02, 2020 at 01:48:22PM +1000, Finn Thain wrote:
> On Mon, 1 Jun 2020, Brad Boyer wrote:
> > In particular, note the direct use of a GPIO line on VIA1 in swim_select 
> > in drivers/block/swim.c.  That won't work on an IOP based system as that 
> > input line to SWIM doesn't appear to be hooked up to anything that can 
> > be accessed directly.
> > 
> > Here's the way it's put in _Guide to the Macintosh Family Hardware_ 
> > (Second Edition), on page 155:
> > 
> > "An IOP provides the state-control line SEL to the floppy disk drives. 
> > Among other functions, this line selects which of the two heads is to be 
> > used in a double-sided floppy disk drive."
> > 
> > The bit in VIA1 register A that is normally the "vHeadSel" line is 
> > explicitly listed as "Reserved" on the IIfx.
> > 
> 
> Yes, I was aware of that issue. But the GTMFH 2ed. figure 9-14 indicates 
> that (on the IIfx) pin 12 in the drive connector is driven by the SWIM 
> HDSEL pin instead of VIA1 Port A output. So, I wrote a patch to attempt to 
> get the SWIM to drive this pin. But nothing worked because I never 
> succeeded in putting the chip into bypass mode.

There does appear to be a bit in the mode register to directly control
the SEL line to the drive. Nothing in our code appears to use it. You
would write HEDSEL to mode0 to clear the line, and write HEDSEL to
mode1 to set the line. However, it looks like the first bit in the
setup register controls if that line is input or output. Not sure
why we have it named S_INV_WDATA, but the state machine to the actual
floppy drive is way beyond my comprehension. I'll note that the swim3.c
driver uses the SELECT bit in the control register to do the same
basic thing (and it's the same bit value as HEDSEL in swim.c).

I know we at least used to have a problem where the SCC ports only
worked if they were already in bypass mode. There was something we
weren't doing right about setting the bypass mode. I'm not sure if
we ever fixed it. If you turn off the "Compatible Mode" in the
Serial Switch control panel, does the Linux kernel SCC driver still
work afterwards? I know that was a problem at one point.

> With regard to PowerBooks, we will need to power up the drive. And with 
> regard to the IIfx, the A/UX iop.h header file indicates that, in bypass 
> mode, the ISM registers have a 2-byte spacing (instead of 512-byte).

The notes I have indicate the SWIM registers are at the same spacing as
the SCC registers on the other IOP. That's definitely not 512-byte, so
I presume it's 2-byte spacing as that's what the SCC driver looks like
it does.

> But I wish I knew why the driver doesn't work on an LC III, which 
> supposedly has a SWIM 2, just like the Quadra 800.

If I had to guess, the select line isn't in the same place. For example,
on the Mac Portable (which obviously isn't supported in Linux) that line
is apparently in VIA2 register B (as are most of the other bits that
normally show up in register A). Based on looking at the driver, being
unable to drive that line to the disk drive would break lots of stuff,
including the detection of the disk inserted in the drive.

We may need to map which models have this line hooked up where. I
wouldn't be surprised if it's only on VIA1 on some models and only
on the SWIM chip on others. It sounds like IWM didn't even know
about that line, which is why it was attached to the VIA in the
original mac models (on the Macintosh SE, some of them had an IWM
chip and some had the original version of SWIM - it was even
available as an upgrade to get the new chip and ROMs).

> > Apparently this external input line is not strictly required when the 
> > SWIM chip is running in ISM mode. However, our driver appears to force 
> > the chip into ISM mode and yet still depends on this input line.
> > 
> 
> I can't comment on that. I don't really understand the ISM or IWM logic in 
> any depth.

I can't claim to fully understand it, but I can figure out bits and pieces.

	Brad Boyer
	flar@allandria.com

