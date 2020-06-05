Return-Path: <SRS0=rEAP=7S=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3553EC433DF
	for <linux-m68k@archiver.kernel.org>; Fri,  5 Jun 2020 09:11:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 154712075B
	for <linux-m68k@archiver.kernel.org>; Fri,  5 Jun 2020 09:11:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726062AbgFEJL3 (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Fri, 5 Jun 2020 05:11:29 -0400
Received: from cynthia.allandria.com ([50.242.82.17]:57169 "EHLO
        cynthia.allandria.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726292AbgFEJL3 (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Fri, 5 Jun 2020 05:11:29 -0400
Received: from flar by cynthia.allandria.com with local (Exim 4.84_2)
        (envelope-from <flar@allandria.com>)
        id 1jh8Nn-0007sx-EK; Fri, 05 Jun 2020 02:11:23 -0700
Date:   Fri, 5 Jun 2020 02:11:23 -0700
From:   Brad Boyer <flar@allandria.com>
To:     Finn Thain <fthain@telegraphics.com.au>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Joshua Thompson <funaho@jurai.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>
Subject: Re: [PATCH 0/4] Mac IOP driver fixes
Message-ID: <20200605091123.GA29547@allandria.com>
References: <alpine.LNX.2.22.394.2006010931070.8@nippy.intranet>
 <20200601060915.GA8450@allandria.com>
 <alpine.LNX.2.22.394.2006020922570.8@nippy.intranet>
 <20200602022157.GA3216@allandria.com>
 <alpine.LNX.2.22.394.2006021317230.8@nippy.intranet>
 <20200604031938.GA25970@allandria.com>
 <alpine.LNX.2.22.394.2006041424440.8@nippy.intranet>
 <20200604074314.GA800@allandria.com>
 <alpine.LNX.2.22.394.2006051133440.8@nippy.intranet>
 <alpine.LNX.2.22.394.2006051418500.8@nippy.intranet>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.LNX.2.22.394.2006051418500.8@nippy.intranet>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-m68k-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Fri, Jun 05, 2020 at 02:23:50PM +1000, Finn Thain wrote:
> On Fri, 5 Jun 2020, Finn Thain wrote:
> > I think we need to be able to restart the IOP's internal ADB driver. 
> > Otherwise it's impossible to have ADB input resume when the floppy 
> > drives go idle for a while or when the swim module exits.
> > 
> > The alternative is to revive swip_iop.c, and the downside there is that 
> > the block layer API has completely changed, meaning that the driver 
> > needs a rewrite on the block layer side, as well as needing more work on 
> > the IOP protocol side.
> > 
> 
> I should also mention that swim.c has some pretty serious limitations: no 
> write support and no GCR support. These features could be added much more 
> easily to swim_iop.c than swim.c because the IOP supports them internally.

With all of that, it sounds like it would be easier to bring back and
fix the swim_iop driver in spite of the need to update the interface
to the kernel. I don't know when I might be able to get my IIfx or Q950
back out and running, but I'll see if I can take a look at the code
even without having the hardware ready to actually test it.

Ideally we would have the code to actually do a full reset on an IOP
and bootstrap the IOP kernel and each IOP driver. I suspect the images
for them are somewhere in the ROM. That's likely only necessary if we
start doing a boot where the MacOS hasn't already loaded fully.

	Brad Boyer
	flar@allandria.com

