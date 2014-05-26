From: Finn Thain <fthain@telegraphics.com.au>
Subject: Re: [PATCH RESEND 4/4] m68k/atari: fix SCC initialization for debug
 console
Date: Mon, 26 May 2014 22:03:07 +1000 (EST)
Message-ID: <alpine.LNX.2.00.1405262200390.10801@nippy.intranet>
References: <20140411052757.888960081@telegraphics.com.au> <20140411052759.169790206@telegraphics.com.au> <538301BA.1070605@gmail.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from kvm5.telegraphics.com.au ([98.124.60.144]:53093 "EHLO
	kvm5.telegraphics.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751656AbaEZMER (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Mon, 26 May 2014 08:04:17 -0400
In-Reply-To: <538301BA.1070605@gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitzmic@gmail.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k@vger.kernel.org


On Mon, 26 May 2014, Michael Schmitz wrote:

> Finn Thain wrote:
> >
> > The 7.9872 MHz PCLK used in this patch was inferred from the existing 
> > code as I don't have any hardware data.
> >   
> 
> Might just be my PC not autodetecting this 38400 baud rate right, but 
> all I get is gibberish from the early console. The original code (still 
> running at 9600 baud) works.
> 
> I'll have to check clock source and rate from the old SCC driver.

I'll see what I can find also. Do you know of any hardware reference 
material available on the web?

-- 
