Return-Path: <SRS0=WB/I=7O=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59B7DC433DF
	for <linux-m68k@archiver.kernel.org>; Mon,  1 Jun 2020 06:09:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2DA2C206E2
	for <linux-m68k@archiver.kernel.org>; Mon,  1 Jun 2020 06:09:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726061AbgFAGJZ (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 1 Jun 2020 02:09:25 -0400
Received: from cynthia.allandria.com ([50.242.82.17]:55048 "EHLO
        cynthia.allandria.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725972AbgFAGJZ (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 1 Jun 2020 02:09:25 -0400
Received: from flar by cynthia.allandria.com with local (Exim 4.84_2)
        (envelope-from <flar@allandria.com>)
        id 1jfddL-0002ac-Tq; Sun, 31 May 2020 23:09:15 -0700
Date:   Sun, 31 May 2020 23:09:15 -0700
From:   Brad Boyer <flar@allandria.com>
To:     Finn Thain <fthain@telegraphics.com.au>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Joshua Thompson <funaho@jurai.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>
Subject: Re: [PATCH 0/4] Mac IOP driver fixes
Message-ID: <20200601060915.GA8450@allandria.com>
References: <cover.1590880333.git.fthain@telegraphics.com.au>
 <CAMuHMdVb2C7asip_-_zbc3JP+nqn6siKqmikOK98tM5=2BYqcQ@mail.gmail.com>
 <alpine.LNX.2.22.394.2006010931070.8@nippy.intranet>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.LNX.2.22.394.2006010931070.8@nippy.intranet>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-m68k-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Mon, Jun 01, 2020 at 10:05:05AM +1000, Finn Thain wrote:
> > BTW, how does the issue being fixed manifest itself? That's not clear to 
> > me from the patch description.
> > 
> 
> The bugs in the iop driver were found by inspection, in the course of 
> debugging adb-iop driver failures that Stan encountered. It's possible 
> that the adb-iop driver is not badly affected by these bugs (I don't 
> know). It's possible that the iop driver bugs are among the reasons why 
> the swim_iop driver was never stabilized. That driver was removed in 
> b21a323710e7 ("[PATCH] remove the broken BLK_DEV_SWIM_IOP driver").

The swim_iop driver was never completed. As far as I know, the data
transfer code was never written. I remember testing the driver, and
all it could do was detect the drives and do eject. Read and write
were not working. I looked into it at the time, but it's a little
messy and is much more complicated than the ADB driver. For ADB, the
data is small enough that it's packed in the IOP message. That's not
possible for SWIM, so it has a more complex data handling method. If
you look at the code of that driver and the messages, it looks like
the IOP can do DMA but it can't. The SWIM IOP message includes a buffer
pointer, but the IOP chip isn't connected in a way that it can just
access it (and it's getting passed a virtual address anyway). Based on
some of the other information I was given, there's a separate message
protocol on channel 0 (on each IOP) for bulk data transfer.

At the time, I had a diff to fix some bugs in the detection and handle
the status update messages. However, it hardly seemed worth submitting
that as a fix since the driver still wasn't useful without the bulk
data transfer working. I can pass my diff along if you intend to make
an attempt at a working swim_iop driver.

	Brad Boyer
	flar@allandria.com

