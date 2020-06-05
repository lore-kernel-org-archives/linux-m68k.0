Return-Path: <SRS0=rEAP=7S=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA7D9C433DF
	for <linux-m68k@archiver.kernel.org>; Fri,  5 Jun 2020 03:50:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C4BAA2074B
	for <linux-m68k@archiver.kernel.org>; Fri,  5 Jun 2020 03:50:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726039AbgFEDur (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Thu, 4 Jun 2020 23:50:47 -0400
Received: from kvm5.telegraphics.com.au ([98.124.60.144]:37334 "EHLO
        kvm5.telegraphics.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726016AbgFEDur (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Thu, 4 Jun 2020 23:50:47 -0400
Received: from localhost (localhost.localdomain [127.0.0.1])
        by kvm5.telegraphics.com.au (Postfix) with ESMTP id EA2E629F18;
        Thu,  4 Jun 2020 23:50:44 -0400 (EDT)
Date:   Fri, 5 Jun 2020 13:50:44 +1000 (AEST)
From:   Finn Thain <fthain@telegraphics.com.au>
To:     Brad Boyer <flar@allandria.com>
cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Joshua Thompson <funaho@jurai.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>
Subject: Re: [PATCH 0/4] Mac IOP driver fixes
In-Reply-To: <20200604074314.GA800@allandria.com>
Message-ID: <alpine.LNX.2.22.394.2006051133440.8@nippy.intranet>
References: <cover.1590880333.git.fthain@telegraphics.com.au> <CAMuHMdVb2C7asip_-_zbc3JP+nqn6siKqmikOK98tM5=2BYqcQ@mail.gmail.com> <alpine.LNX.2.22.394.2006010931070.8@nippy.intranet> <20200601060915.GA8450@allandria.com> <alpine.LNX.2.22.394.2006020922570.8@nippy.intranet>
 <20200602022157.GA3216@allandria.com> <alpine.LNX.2.22.394.2006021317230.8@nippy.intranet> <20200604031938.GA25970@allandria.com> <alpine.LNX.2.22.394.2006041424440.8@nippy.intranet> <20200604074314.GA800@allandria.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-m68k-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Thu, 4 Jun 2020, Brad Boyer wrote:

> I have a list of structures and one of them appears to be the bypass 
> command. The outbound message is 3 bytes (the command code:4, a byte for 
> a flag with 0 meaning off and 1 meaning on, and an ID byte). The reply 
> is a byte of error (0 is success) followed by extra bytes depending on 
> the error value.
> 
> One of the listed error values is "driver in use", so it's possible it 
> will reject the request. We are just taking advantage of the existing 
> drivers, so probably both the SWIM and ADB drivers are still running on 
> the IOP.
> 
> It looks like shutting down a driver is another command. The command 
> byte for that is 2, and the second byte is which driver to stop (0/1). 
> I'm not sure if there's a way to restart the driver after that other 
> than reloading everything.
> 

I think we need to be able to restart the IOP's internal ADB driver. 
Otherwise it's impossible to have ADB input resume when the floppy drives 
go idle for a while or when the swim module exits.

The alternative is to revive swip_iop.c, and the downside there is that 
the block layer API has completely changed, meaning that the driver needs 
a rewrite on the block layer side, as well as needing more work on the IOP 
protocol side.
