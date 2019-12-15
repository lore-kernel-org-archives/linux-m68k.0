Return-Path: <SRS0=fwhs=2F=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	LOTS_OF_MONEY,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8C09C43603
	for <linux-m68k@archiver.kernel.org>; Sun, 15 Dec 2019 02:19:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 91DF020700
	for <linux-m68k@archiver.kernel.org>; Sun, 15 Dec 2019 02:19:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726865AbfLOCTf (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Sat, 14 Dec 2019 21:19:35 -0500
Received: from cynthia.allandria.com ([50.242.82.17]:48962 "EHLO
        cynthia.allandria.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726783AbfLOCTf (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Sat, 14 Dec 2019 21:19:35 -0500
X-Greylist: delayed 2271 seconds by postgrey-1.27 at vger.kernel.org; Sat, 14 Dec 2019 21:19:35 EST
Received: from flar by cynthia.allandria.com with local (Exim 4.84_2)
        (envelope-from <flar@allandria.com>)
        id 1igIuc-0000cV-42; Sat, 14 Dec 2019 17:41:34 -0800
Date:   Sat, 14 Dec 2019 17:41:34 -0800
From:   Brad Boyer <flar@allandria.com>
To:     Finn Thain <fthain@telegraphics.com.au>
Cc:     John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Debian m68k <debian-68k@lists.debian.org>
Subject: Re: Using more than 1 GB in qemu-m68k-system
Message-ID: <20191215014133.GA2084@allandria.com>
References: <b95c70fe-aca0-faf7-4ff7-e71d8db3d149@physik.fu-berlin.de>
 <alpine.LNX.2.21.1.1912150919080.8@nippy.intranet>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.LNX.2.21.1.1912150919080.8@nippy.intranet>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-m68k-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Sun, Dec 15, 2019 at 09:36:33AM +1100, Finn Thain wrote:
> I believe that the reason for the limitation is the Mac memory map, as 
> Laurent pointed out in the issue tracker,
> https://github.com/vivier/qemu-m68k/issues/42
> 
> It's theoretically possible to use NuBus slot space for additional RAM. 
> 
> The super slot space ($6000 0000 thru $EFFF FFFF) is 2304 MB in size and 
> the standard slot space ($F100 0000 thru $FFFF FFFF) is another 239 MB.
> 
> I'm not sure about any hardware designs that took advantage of this 
> possibility (Radius Rocket perhaps?).

On the fundamental issue, yes the Mac uses $0000 0000 to $3FFF FFFF for
RAM, with $4000 0000 the start of ROM and $5000 0000 the start of the
internal devices.

The Radius Rocket does have RAM, but I never checked if it was visible
from the host. It seems like it should be to do a few of the things
it does. I've never tried to poke at mine while in Linux. I'll add it
to the list of things to try. Even then, it would be slower than the
RAM directly on the processor bus.

We could probably emulate a fake NuBus card in qemu that is just memory
in the super slot space for that card. Can a regular driver add RAM, or
would we have to detect that in the core code somewhere?

	Brad Boyer
	flar@allandria.com

