From: Finn Thain <fthain@telegraphics.com.au>
Subject: Re: m68k: [v5] Convert to genirq (WIP)
Date: Sat, 3 Sep 2011 12:40:28 +1000 (EST)
Message-ID: <alpine.OSX.2.00.1109031232500.438@ibook.local>
References: <CAMuHMdUZe0Y55ZPee+umJdEsmY5X-EB-KoC-w-SGEtbPMAcf3g@mail.gmail.com> <alpine.OSX.2.00.1108271506320.190@ibook.local> <alpine.OSX.2.00.1108300148040.435@ibook.local> <CAMuHMdVmNAOSK+M9z-ySOR-oA4LwuS_N0SZ8XxzQ9_pYqM_vdQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from vm4.telegraphics.com.au ([98.124.60.149]:34405 "EHLO
	vps4.telegraphics.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753262Ab1ICChs (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Fri, 2 Sep 2011 22:37:48 -0400
In-Reply-To: <CAMuHMdVmNAOSK+M9z-ySOR-oA4LwuS_N0SZ8XxzQ9_pYqM_vdQ@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Linux/m68k <linux-m68k@vger.kernel.org>, linux-kernel@vger.kernel.org


On Fri, 2 Sep 2011, Geert Uytterhoeven wrote:

> Since this is on Mac and mac_irq_chip is OK, I guess this is a non-PSC 
> Mac, i.e. the IRQ number is IRQ_MAC_SCC == IRQ_AUTO_4?

Right. Similarly, the sonic driver was using IRQ_AUTO_3 when the same 
issue cropped up there. (I was wondering why the PSC machine didn't 
exhibit the problem -- as you point out, it's only auto vector interrupts 
that are affected.)

Finn
