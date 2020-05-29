Return-Path: <SRS0=UnHi=7L=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3018C433DF
	for <linux-m68k@archiver.kernel.org>; Fri, 29 May 2020 23:32:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B67D02073B
	for <linux-m68k@archiver.kernel.org>; Fri, 29 May 2020 23:32:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728349AbgE2XcK (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Fri, 29 May 2020 19:32:10 -0400
Received: from kvm5.telegraphics.com.au ([98.124.60.144]:50688 "EHLO
        kvm5.telegraphics.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728293AbgE2XcK (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Fri, 29 May 2020 19:32:10 -0400
Received: from localhost (localhost.localdomain [127.0.0.1])
        by kvm5.telegraphics.com.au (Postfix) with ESMTP id 9DC5629DCF;
        Fri, 29 May 2020 19:32:05 -0400 (EDT)
Date:   Sat, 30 May 2020 09:32:04 +1000 (AEST)
From:   Finn Thain <fthain@telegraphics.com.au>
To:     Michael Schmitz <schmitzmic@gmail.com>
cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-m68k@lists.linux-m68k.org,
        Michael Schmitz <schmitz@debian.org>
Subject: Re: [m68k:m68k-queue 8/13] drivers/usb/host/isp116x.h:370:87: note:
 in expansion of macro 'isa_rom_writew_raw'
In-Reply-To: <18b6b8b1-d91e-56c9-2eef-6d79fc0ad3e9@gmail.com>
Message-ID: <alpine.LNX.2.22.394.2005300930210.8@nippy.intranet>
References: <202005300247.nivoTcuo%lkp@intel.com> <18b6b8b1-d91e-56c9-2eef-6d79fc0ad3e9@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-m68k-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Sat, 30 May 2020, Michael Schmitz wrote:

> Hi Geert,
> 
> the __w is used as a dummy read variable to execute a read cycle where 
> the address encodes the value to be written to the peripheral on the ROM 
> port. The value of this dummy variable is of no consequence (and may 
> very well be undefined).
> 
> How do I annotate this so the compiler will shut up about it?
> 

I think you want 'u16 __maybe_unused __w'.
