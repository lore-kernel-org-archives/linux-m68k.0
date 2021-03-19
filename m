Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A756C433DB
	for <linux-m68k@archiver.kernel.org>; Fri, 19 Mar 2021 06:36:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4F09664F69
	for <linux-m68k@archiver.kernel.org>; Fri, 19 Mar 2021 06:36:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233993AbhCSGgI (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Fri, 19 Mar 2021 02:36:08 -0400
Received: from kvm5.telegraphics.com.au ([98.124.60.144]:40144 "EHLO
        kvm5.telegraphics.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233963AbhCSGfz (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Fri, 19 Mar 2021 02:35:55 -0400
Received: from localhost (localhost.localdomain [127.0.0.1])
        by kvm5.telegraphics.com.au (Postfix) with ESMTP id C0DF129EED;
        Fri, 19 Mar 2021 02:35:50 -0400 (EDT)
Date:   Fri, 19 Mar 2021 17:35:47 +1100 (AEDT)
From:   Finn Thain <fthain@telegraphics.com.au>
To:     Michael Pavone <pavone@retrodev.com>
cc:     linux-m68k@lists.linux-m68k.org,
        Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] m68k/mvme16x: Fix timer interrupts
In-Reply-To: <598f5719-8cc5-15da-4062-157b1162318a@retrodev.com>
Message-ID: <475053d4-7ee-4e5f-26fe-c47e55e76a@telegraphics.com.au>
References: <628cb0d0-94af-651f-0d84-f78b966cd8bd@retrodev.com> <96914f42-e18-29cc-6c5-28b3a2fb360@telegraphics.com.au> <598f5719-8cc5-15da-4062-157b1162318a@retrodev.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Thu, 18 Mar 2021, Michael Pavone wrote:

> On 3/17/21 8:05 PM, Finn Thain wrote:
> 
> > On Tue, 16 Mar 2021, Mike Pavone wrote:
> >
> >> Timer interrupts on MVME16x and MVME17x boards are broken as the CEN and
> >> COC bits are being inadvertently cleared when clearing the overflow
> >> counter. This results in no timer interrupts being delivered after the
> >> first. Initialization then hangs in calibrate_delay as the jiffies counter
> >> is not updated. OR with current register value to preserve these bits.
> >>
> >> Fixes: 19999a8b8782 ("m68k: mvme16x: Handle timer counter overflow")
> >> Signed-off-by: Michael Pavone <pavone@retrodev.com>
> > Sorry about that regression.
> >
> > Do you think that commit 7529b90d051e ("m68k: mvme147: Handle timer 
> > counter overflow") has the same problem?
> 
> I don't have an MVME147 board to test with, but based on the 
> documentation it looks like it does. The clear bit is in the same 
> register as the enable and count enable bits on the original PCCchip.
> 

OK. I will write a patch for mvme147.

BTW, assuming you did get the kernel running on your hardware, do you know 
if there's any need for the '#warning check me!' that still remains in 
arch/m68k/mvme16x/config.c and arch/m68k/mvme147/config.c?
