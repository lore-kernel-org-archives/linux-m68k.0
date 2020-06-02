Return-Path: <SRS0=aBsQ=7P=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CA5EC433E1
	for <linux-m68k@archiver.kernel.org>; Tue,  2 Jun 2020 03:48:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3D0B3206C3
	for <linux-m68k@archiver.kernel.org>; Tue,  2 Jun 2020 03:48:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726110AbgFBDs2 (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 1 Jun 2020 23:48:28 -0400
Received: from kvm5.telegraphics.com.au ([98.124.60.144]:56024 "EHLO
        kvm5.telegraphics.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725850AbgFBDs1 (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 1 Jun 2020 23:48:27 -0400
Received: from localhost (localhost.localdomain [127.0.0.1])
        by kvm5.telegraphics.com.au (Postfix) with ESMTP id DF1E423238;
        Mon,  1 Jun 2020 23:48:23 -0400 (EDT)
Date:   Tue, 2 Jun 2020 13:48:22 +1000 (AEST)
From:   Finn Thain <fthain@telegraphics.com.au>
To:     Brad Boyer <flar@allandria.com>
cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Joshua Thompson <funaho@jurai.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>
Subject: Re: [PATCH 0/4] Mac IOP driver fixes
In-Reply-To: <20200602022157.GA3216@allandria.com>
Message-ID: <alpine.LNX.2.22.394.2006021317230.8@nippy.intranet>
References: <cover.1590880333.git.fthain@telegraphics.com.au> <CAMuHMdVb2C7asip_-_zbc3JP+nqn6siKqmikOK98tM5=2BYqcQ@mail.gmail.com> <alpine.LNX.2.22.394.2006010931070.8@nippy.intranet> <20200601060915.GA8450@allandria.com> <alpine.LNX.2.22.394.2006020922570.8@nippy.intranet>
 <20200602022157.GA3216@allandria.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-m68k-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Mon, 1 Jun 2020, Brad Boyer wrote:

> On Tue, Jun 02, 2020 at 09:32:29AM +1000, Finn Thain wrote:
> > I'm hoping that the SWIM IOP can be used in bypass mode, so it could 
> > be used with the swim.c driver. I haven't been able to make that work 
> > yet.
> 
> Putting the IOP in bypass mode would have a couple issues. The obvious 
> one is that it will break ADB (and because the shift register attached 
> to the ADB transceiver is part of the IOP chip itself, there's not an 
> easy fix for that)

I see.

> but there's also some strangeness in the way the SWIM chip is attached 
> to the IOP chip that looks like it might break a few things. In 
> particular, it looks like they only enabled using the SWIM chip in ISM 
> mode and not IWM mode.

IIUC, swim.c only uses ISM mode.

> The notes I have imply that the normal Mac floppy driver didn't work on 
> a IIfx even in bypass mode.

I abandoned my failed attempt to put the SWIM IOP into bypass mode when I 
finally came across this text in the HW09 tech note:

    "Like the processor which controls floppy disk and ADB I/O, the IIfx 
    has another ASIC to control the SCC, but unlike the former, this 
    processor is capable of running in a special 'IOP Bypass' mode which 
    allows direct access to the SCC."

I suppose the problem being alluded to here is the one you mentioned: to 
put this IOP in bypass would kill ADB functionality (for the duration).

> In particular, note the direct use of a GPIO line on VIA1 in swim_select 
> in drivers/block/swim.c.  That won't work on an IOP based system as that 
> input line to SWIM doesn't appear to be hooked up to anything that can 
> be accessed directly.
> 
> Here's the way it's put in _Guide to the Macintosh Family Hardware_ 
> (Second Edition), on page 155:
> 
> "An IOP provides the state-control line SEL to the floppy disk drives. 
> Among other functions, this line selects which of the two heads is to be 
> used in a double-sided floppy disk drive."
> 
> The bit in VIA1 register A that is normally the "vHeadSel" line is 
> explicitly listed as "Reserved" on the IIfx.
> 

Yes, I was aware of that issue. But the GTMFH 2ed. figure 9-14 indicates 
that (on the IIfx) pin 12 in the drive connector is driven by the SWIM 
HDSEL pin instead of VIA1 Port A output. So, I wrote a patch to attempt to 
get the SWIM to drive this pin. But nothing worked because I never 
succeeded in putting the chip into bypass mode.

> It's definitely possible to access and drive the SWIM chip in bypass 
> mode, but that doesn't mean it's as transparent as for the SCC driver. 

OK.

BTW, I suspect there may be an issue with swim.c because it doesn't work 
on all models on which it should work. I know it works on Quadra 800, 650 
and a few others.

With regard to PowerBooks, we will need to power up the drive. And with 
regard to the IIfx, the A/UX iop.h header file indicates that, in bypass 
mode, the ISM registers have a 2-byte spacing (instead of 512-byte).

But I wish I knew why the driver doesn't work on an LC III, which 
supposedly has a SWIM 2, just like the Quadra 800.

> Apparently this external input line is not strictly required when the 
> SWIM chip is running in ISM mode. However, our driver appears to force 
> the chip into ISM mode and yet still depends on this input line.
> 

I can't comment on that. I don't really understand the ISM or IWM logic in 
any depth.
