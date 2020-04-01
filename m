Return-Path: <SRS0=DDvF=5R=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00F7BC43331
	for <linux-m68k@archiver.kernel.org>; Wed,  1 Apr 2020 23:19:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D0BD120719
	for <linux-m68k@archiver.kernel.org>; Wed,  1 Apr 2020 23:19:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733273AbgDAXTi (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 1 Apr 2020 19:19:38 -0400
Received: from kvm5.telegraphics.com.au ([98.124.60.144]:54306 "EHLO
        kvm5.telegraphics.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732537AbgDAXTi (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 1 Apr 2020 19:19:38 -0400
Received: from localhost (localhost.localdomain [127.0.0.1])
        by kvm5.telegraphics.com.au (Postfix) with ESMTP id D248E29D0E;
        Wed,  1 Apr 2020 19:19:31 -0400 (EDT)
Date:   Thu, 2 Apr 2020 10:19:28 +1100 (AEDT)
From:   Finn Thain <fthain@telegraphics.com.au>
To:     Stefan Reinauer <stefan.k.reinauer@gmail.com>
cc:     linux-m68k <linux-m68k@lists.linux-m68k.org>
Subject: Re: Amiga: Writes to Zorro III cards
In-Reply-To: <CABq5eXHOfryyKL9qmE15=wXW0urGnO3D58Jj0qPPbPoDsLfwkw@mail.gmail.com>
Message-ID: <alpine.LNX.2.22.394.2004021007280.8@nippy.intranet>
References: <CABq5eXHOfryyKL9qmE15=wXW0urGnO3D58Jj0qPPbPoDsLfwkw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-m68k-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Wed, 1 Apr 2020, Stefan Reinauer wrote:

> When it fails/works, it fails/works consistently across several 
> rmmod/insmod cycles.

That implies incomplete hardware initialization or some other bug in the 
driver initialization code.

> (I see arp requests coming in on the Amiga in tcpdump, but they are 
> never answered)

If packets are arriving at the interface but the kernel ignores them, it 
suggests that the packets are corrupt (e.g. invalid frame checksum).

You can check for corrupted packets with a network analyzer like 
Wireshark. On a small system I would capture some traffic with 'tcpdump -i 
eth0 -s0 -w traffic.pcap' and then move the pcap file to a host 
with Wireshark installed.
