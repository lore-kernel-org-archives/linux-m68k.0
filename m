Return-Path: <SRS0=2kwO=74=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE104C433E0
	for <linux-m68k@archiver.kernel.org>; Mon, 15 Jun 2020 04:21:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B1E63206F1
	for <linux-m68k@archiver.kernel.org>; Mon, 15 Jun 2020 04:21:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728146AbgFOEVa (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 15 Jun 2020 00:21:30 -0400
Received: from kvm5.telegraphics.com.au ([98.124.60.144]:39934 "EHLO
        kvm5.telegraphics.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725648AbgFOEV3 (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 15 Jun 2020 00:21:29 -0400
Received: from localhost (localhost.localdomain [127.0.0.1])
        by kvm5.telegraphics.com.au (Postfix) with ESMTP id 8E4212259B;
        Mon, 15 Jun 2020 00:21:26 -0400 (EDT)
Date:   Mon, 15 Jun 2020 14:21:25 +1000 (AEST)
From:   Finn Thain <fthain@telegraphics.com.au>
To:     Josh Juran <jjuran@gmail.com>
cc:     linux-m68k@lists.linux-m68k.org
Subject: Re: penguin (was Re: Linux-mac68k project account maintenance)
In-Reply-To: <0A4C54D6-956E-4E46-90DB-BA89B0ED66EB@gmail.com>
Message-ID: <alpine.LNX.2.22.394.2006151336260.34@nippy.intranet>
References: <alpine.LNX.2.22.394.2006151113030.17@nippy.intranet> <0A4C54D6-956E-4E46-90DB-BA89B0ED66EB@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-m68k-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Sun, 14 Jun 2020, Josh Juran wrote:

> 
> As my most recent participation was co-developing Penguin, I probably 
> don't need to be an admin. :-)
> 

If your sourceforge account is still a going concern I'll leave the commit 
bit as-is -- I'd hate to discourage possible future contributions!

> Let me know if there's any other information or action you need from me.  
> I'd also be interested in any hearing about efforts to virtualize Mac OS 
> or Mac applications on Linux/m68k, as I might be able to assist with 
> those.
> 

I don't know of any MacOS virtualization efforts (kvm for linux-m68k?)

Personally, I'd love to see EMILE ported to MacRelix, as a replacement for 
Penguin. Reason being, there are several Penguin bugs that result in boot 
crashes and some other bugs besides. Almost all have workarounds, but you 
have to read the docs to find out about them (and go out of your way to 
apply them).
