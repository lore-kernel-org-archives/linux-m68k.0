Return-Path: <SRS0=BGCw=2E=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	LOTS_OF_MONEY,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52DB7C43603
	for <linux-m68k@archiver.kernel.org>; Sat, 14 Dec 2019 22:36:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2CCC020724
	for <linux-m68k@archiver.kernel.org>; Sat, 14 Dec 2019 22:36:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726783AbfLNWgj (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Sat, 14 Dec 2019 17:36:39 -0500
Received: from kvm5.telegraphics.com.au ([98.124.60.144]:35232 "EHLO
        kvm5.telegraphics.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726687AbfLNWgj (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Sat, 14 Dec 2019 17:36:39 -0500
Received: from localhost (localhost.localdomain [127.0.0.1])
        by kvm5.telegraphics.com.au (Postfix) with ESMTP id 95C9E22CF3;
        Sat, 14 Dec 2019 17:36:36 -0500 (EST)
Date:   Sun, 15 Dec 2019 09:36:33 +1100 (AEDT)
From:   Finn Thain <fthain@telegraphics.com.au>
To:     John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
cc:     linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Debian m68k <debian-68k@lists.debian.org>
Subject: Re: Using more than 1 GB in qemu-m68k-system
In-Reply-To: <b95c70fe-aca0-faf7-4ff7-e71d8db3d149@physik.fu-berlin.de>
Message-ID: <alpine.LNX.2.21.1.1912150919080.8@nippy.intranet>
References: <b95c70fe-aca0-faf7-4ff7-e71d8db3d149@physik.fu-berlin.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-m68k-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Sat, 14 Dec 2019, John Paul Adrian Glaubitz wrote:

> Hi!
> 
> When installing Debian/m68k inside qemu-m68k-system [1], we are 
> currently limited to 1 GB of physical memory which is due to a limit in 
> the Linux kernel as far as I know.
> 
> However, I also know that it is possible to run the m68k kernel on 
> Aranym with up to 3.5 GB of RAM. Thus, I was wondering whether there 
> would be chance we could get the kernel patched to support more than 1 
> GB of memory also on qemu-m68k-system which currently emulates an Apple 
> Macintosh Quadra 800 system.
> 
> Adrian
> 
> > [1] https://wiki.debian.org/M68k/QemuSystemM68k
> 

I believe that the reason for the limitation is the Mac memory map, as 
Laurent pointed out in the issue tracker,
https://github.com/vivier/qemu-m68k/issues/42

It's theoretically possible to use NuBus slot space for additional RAM. 

The super slot space ($6000 0000 thru $EFFF FFFF) is 2304 MB in size and 
the standard slot space ($F100 0000 thru $FFFF FFFF) is another 239 MB.

I'm not sure about any hardware designs that took advantage of this 
possibility (Radius Rocket perhaps?).

-- 
