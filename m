Return-Path: <SRS0=ttaO=YV=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE9F0CA9EC0
	for <linux-m68k@archiver.kernel.org>; Mon, 28 Oct 2019 22:17:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A1ADE21479
	for <linux-m68k@archiver.kernel.org>; Mon, 28 Oct 2019 22:17:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727020AbfJ1WRh (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 28 Oct 2019 18:17:37 -0400
Received: from kvm5.telegraphics.com.au ([98.124.60.144]:57904 "EHLO
        kvm5.telegraphics.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725776AbfJ1WRh (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Mon, 28 Oct 2019 18:17:37 -0400
X-Greylist: delayed 527 seconds by postgrey-1.27 at vger.kernel.org; Mon, 28 Oct 2019 18:17:37 EDT
Received: from localhost (localhost.localdomain [127.0.0.1])
        by kvm5.telegraphics.com.au (Postfix) with ESMTP id 71EDB2A29A;
        Mon, 28 Oct 2019 18:08:47 -0400 (EDT)
Date:   Tue, 29 Oct 2019 09:08:44 +1100 (AEDT)
From:   Finn Thain <fthain@telegraphics.com.au>
To:     Kars de Jong <jongk@linux-m68k.org>
cc:     Andreas 'count' Kotes 
        <count-vger.kernel.org+linux-m68k@flatline.de>,
        linux-m68k <linux-m68k@vger.kernel.org>
Subject: Re: Amiga PCMCIA network card support
In-Reply-To: <CACz-3riJHfuhkFMyPbUCz8Q9Mbu6T+CFz5gMwAKzMeg0tjM4Hg@mail.gmail.com>
Message-ID: <alpine.LNX.2.21.1910290906330.9@nippy.intranet>
References: <7d87adfd-4373-950d-fc94-3bbdcce9e798@flatline.de> <CACz-3rgbLHbQf7kSbyH7NP5SUcMt1hJ=FiU+SGpTT8ZecuLYVQ@mail.gmail.com> <5531fcb0-687d-7186-a4b5-f2f9349d334a@flatline.de> <CACz-3riJHfuhkFMyPbUCz8Q9Mbu6T+CFz5gMwAKzMeg0tjM4Hg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-m68k-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Mon, 28 Oct 2019, Kars de Jong wrote:

> Also, someone once tested this on his A1200 which had a 68030 and I 
> believe it broke. Something about ioremap() not accepting physical 
> addresses that were already mapped by a fixed mapping (Zorro II address 
> space).
> 

Interesting! On my to-do list is a task to investigate the reason why 
commit bb6ef7d1e8a6 ("m68k/mac: Don't remap SWIM MMIO region") was needed. 
I think you may have put your finger on that reason...

-- 
