From: Finn Thain <fthain@telegraphics.com.au>
Subject: write ordering and macfb nop() usage
Date: Wed, 15 Oct 2008 03:56:35 +1100 (EST)
Message-ID: <Pine.LNX.4.64.0810150251270.14578@loopy.telegraphics.com.au>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from loopy.telegraphics.com.au ([202.45.126.152]:35552 "EHLO
	loopy.telegraphics.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751105AbYJNQ4h (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 14 Oct 2008 12:56:37 -0400
Received: from localhost (localhost [127.0.0.1])
	by loopy.telegraphics.com.au (Postfix) with ESMTP id 00E42135DF8
	for <linux-m68k@vger.kernel.org>; Wed, 15 Oct 2008 03:56:35 +1100 (EST)
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org


Hi All,

I've been working on macfb.c, and I notice that it is full of stuff like 
this:

        /* the nop's are there to order writes. */
        nubus_writeb(_regno, &cmap_regs->addr); nop();
        nubus_writeb(_red, &cmap_regs->lut);    nop();
        nubus_writeb(_green, &cmap_regs->lut);  nop();
        nubus_writeb(_blue, &cmap_regs->lut);

Timing aside, I don't see what are the nop's are for. I thought accessors 
like nubus_write/raw_out/out are intended to issue these writes in order 
anyway?

And why were nop's were used instead of an empty asm() or just a volatile 
qualifier anyway? Some accident of history like a compiler bug?

Also, can a nop provide a useful timing constraint when bus speed can vary 
so much from one machine to another?

I'm baffled.

Finn
