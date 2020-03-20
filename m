Return-Path: <SRS0=BlFA=5F=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51199C4332B
	for <linux-m68k@archiver.kernel.org>; Fri, 20 Mar 2020 23:08:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 33AAD2072C
	for <linux-m68k@archiver.kernel.org>; Fri, 20 Mar 2020 23:08:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727550AbgCTXIp (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Fri, 20 Mar 2020 19:08:45 -0400
Received: from kvm5.telegraphics.com.au ([98.124.60.144]:42494 "EHLO
        kvm5.telegraphics.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726997AbgCTXIp (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Fri, 20 Mar 2020 19:08:45 -0400
Received: from localhost (localhost.localdomain [127.0.0.1])
        by kvm5.telegraphics.com.au (Postfix) with ESMTP id 063EE29E83;
        Fri, 20 Mar 2020 19:08:44 -0400 (EDT)
Date:   Sat, 21 Mar 2020 10:08:50 +1100 (AEDT)
From:   Finn Thain <fthain@telegraphics.com.au>
To:     John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
cc:     linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Debian m68k <debian-68k@lists.debian.org>,
        Helge Deller <deller@gmx.de>
Subject: Re: Seccomp support for linux-m68k
In-Reply-To: <4b2815bb-1eaf-d0a3-0ab4-5db473dfaa05@physik.fu-berlin.de>
Message-ID: <alpine.LNX.2.22.394.2003211002210.8@nippy.intranet>
References: <cd3ff9a1-030e-1e34-3950-99088ef81be0@physik.fu-berlin.de> <alpine.LNX.2.22.394.2003210904040.8@nippy.intranet> <4b2815bb-1eaf-d0a3-0ab4-5db473dfaa05@physik.fu-berlin.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-m68k-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org


On Fri, 20 Mar 2020, John Paul Adrian Glaubitz wrote:

> The question is how many of these 17 architectures are actually 
> supported by Debian.
> 

I don't see how this issue relates to any particular distro. Perhaps we 
can drop the upstream Cc.
