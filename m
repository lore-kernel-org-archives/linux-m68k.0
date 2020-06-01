Return-Path: <SRS0=WB/I=7O=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1FD8C433DF
	for <linux-m68k@archiver.kernel.org>; Mon,  1 Jun 2020 23:32:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A9C27206A4
	for <linux-m68k@archiver.kernel.org>; Mon,  1 Jun 2020 23:32:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725820AbgFAXcf (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 1 Jun 2020 19:32:35 -0400
Received: from kvm5.telegraphics.com.au ([98.124.60.144]:51612 "EHLO
        kvm5.telegraphics.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725802AbgFAXcf (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 1 Jun 2020 19:32:35 -0400
Received: from localhost (localhost.localdomain [127.0.0.1])
        by kvm5.telegraphics.com.au (Postfix) with ESMTP id 3BE9129513;
        Mon,  1 Jun 2020 19:32:30 -0400 (EDT)
Date:   Tue, 2 Jun 2020 09:32:29 +1000 (AEST)
From:   Finn Thain <fthain@telegraphics.com.au>
To:     Brad Boyer <flar@allandria.com>
cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Joshua Thompson <funaho@jurai.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>
Subject: Re: [PATCH 0/4] Mac IOP driver fixes
In-Reply-To: <20200601060915.GA8450@allandria.com>
Message-ID: <alpine.LNX.2.22.394.2006020922570.8@nippy.intranet>
References: <cover.1590880333.git.fthain@telegraphics.com.au> <CAMuHMdVb2C7asip_-_zbc3JP+nqn6siKqmikOK98tM5=2BYqcQ@mail.gmail.com> <alpine.LNX.2.22.394.2006010931070.8@nippy.intranet> <20200601060915.GA8450@allandria.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-m68k-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Sun, 31 May 2020, Brad Boyer wrote:

> 
> The swim_iop driver was never completed. As far as I know, the data 
> transfer code was never written. I remember testing the driver, and all 
> it could do was detect the drives and do eject. Read and write were not 
> working. I looked into it at the time, but it's a little messy and is 
> much more complicated than the ADB driver. For ADB, the data is small 
> enough that it's packed in the IOP message. That's not possible for 
> SWIM, so it has a more complex data handling method. If you look at the 
> code of that driver and the messages, it looks like the IOP can do DMA 
> but it can't. The SWIM IOP message includes a buffer pointer, but the 
> IOP chip isn't connected in a way that it can just access it (and it's 
> getting passed a virtual address anyway). Based on some of the other 
> information I was given, there's a separate message protocol on channel 
> 0 (on each IOP) for bulk data transfer.
> 
> At the time, I had a diff to fix some bugs in the detection and handle 
> the status update messages. However, it hardly seemed worth submitting 
> that as a fix since the driver still wasn't useful without the bulk data 
> transfer working. I can pass my diff along if you intend to make an 
> attempt at a working swim_iop driver.
> 

I'm hoping that the SWIM IOP can be used in bypass mode, so it could be 
used with the swim.c driver. I haven't been able to make that work yet.

You may want to send the patch to the mailing list anyway. Or maybe send 
it to the linux-mac68k bug tracker on sourceforge.
