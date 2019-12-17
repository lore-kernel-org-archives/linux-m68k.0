Return-Path: <SRS0=T4dA=2H=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FCFEC3F68F
	for <linux-m68k@archiver.kernel.org>; Tue, 17 Dec 2019 00:26:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1888B24655
	for <linux-m68k@archiver.kernel.org>; Tue, 17 Dec 2019 00:26:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727708AbfLQA0X (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 16 Dec 2019 19:26:23 -0500
Received: from kvm5.telegraphics.com.au ([98.124.60.144]:56758 "EHLO
        kvm5.telegraphics.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726734AbfLQA0X (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 16 Dec 2019 19:26:23 -0500
Received: from localhost (localhost.localdomain [127.0.0.1])
        by kvm5.telegraphics.com.au (Postfix) with ESMTP id 6D86B22D73;
        Mon, 16 Dec 2019 19:26:19 -0500 (EST)
Date:   Tue, 17 Dec 2019 11:26:09 +1100 (AEDT)
From:   Finn Thain <fthain@telegraphics.com.au>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
cc:     Brad Boyer <flar@allandria.com>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Debian m68k <debian-68k@lists.debian.org>
Subject: Re: Using more than 1 GB in qemu-m68k-system
In-Reply-To: <CAMuHMdW26v_j=ADaisMN-FqC2v+YYRs3W0J0jy2+sgO_YCxYOw@mail.gmail.com>
Message-ID: <alpine.LNX.2.21.1.1912171054150.11@nippy.intranet>
References: <b95c70fe-aca0-faf7-4ff7-e71d8db3d149@physik.fu-berlin.de> <alpine.LNX.2.21.1.1912150919080.8@nippy.intranet> <20191215014133.GA2084@allandria.com> <CAMuHMdW26v_j=ADaisMN-FqC2v+YYRs3W0J0jy2+sgO_YCxYOw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-m68k-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Sun, 15 Dec 2019, Geert Uytterhoeven wrote:

> Hi Brad,
> 
> On Sun, Dec 15, 2019 at 3:19 AM Brad Boyer <flar@allandria.com> wrote:
> > We could probably emulate a fake NuBus card in qemu that is just 
> > memory in the super slot space for that card. Can a regular driver add 
> > RAM, or would we have to detect that in the core code somewhere?
> 
> I think a regular driver can do that, if CONFIG_MEMORY_HOTPLUG=y. 
> However, the latter depends on CONFIG_SPARSEMEM.
> 
> The early core code can just call memblock_add(), though.
> 

The nubus subsystem isn't available during early boot. The regular driver 
option might be the best option.

BTW, the Nubus memory mapping done in arch/m68k/kernel/head.S (0xf8000000 
through 0xffffffff) covers the standard slot space but not the super slot 
space.

> Gr{oetje,eeting}s,
> 
>                         Geert
> 
> 
