From: Matthew Lear <matt@bubblegen.co.uk>
Subject: Re: uart issues on coldfire platform
Date: Wed, 01 Jul 2009 14:44:00 +0100
Message-ID: <4A4B6820.2050103@bubblegen.co.uk>
References: <4A4AC800.3070901@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from relay.pcl-ipout01.plus.net ([212.159.7.99]:15117 "EHLO
	relay.pcl-ipout01.plus.net" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751640AbZGANoA (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 1 Jul 2009 09:44:00 -0400
In-Reply-To: <4A4AC800.3070901@freescale.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Lanttor <lanttor.guo@freescale.com>
Cc: linux-m68k@vger.kernel.org

Lanttor wrote:
> Hi,
> 
> I find one issue of UART on my coldfire platforms (mcf54451evb board).
> I use the linux-2.6.29, and use drivers/serial/mcf.c and
> drivers/serial/serial_core.c as my uart driver source.
> 
> Following is my test steps -- run command: cat /proc/interrupts two
> times contiguously.
> 
> [root@freescale /]# cat /proc/interrupts
> M5445X    *90:       5099 UART*
> M5445X    96:       3130 timer0
> M5445X    99:          0 timer3
> M5445X   100:       1569 fec(TXF)
> M5445X   101:          0 fec(TXB)
> M5445X   102:          0 fec(TXFIFO)
> M5445X   103:          0 fec(TXCR)
> M5445X   104:       3098 fec(RXF)
> M5445X   105:          0 fec(RXB)
> M5445X   106:         41 fec(MII)
> M5445X   107:          0 fec(LC)
> M5445X   108:          0 fec(HBERR)
> M5445X   109:          0 fec(GRA)
> M5445X   110:          0 fec(EBERR)
> M5445X   111:          0 fec(BABT)
> M5445X   112:          0 fec(BABR)
> [root@freescale /]# cat /proc/interrupts
> M5445X    *90:       5714 UART*
> M5445X    96:       3700 timer0
> M5445X    99:          1 timer3
> M5445X   100:       1574 fec(TXF)
> M5445X   101:          0 fec(TXB)
> M5445X   102:          0 fec(TXFIFO)
> M5445X   103:          0 fec(TXCR)
> M5445X   104:       3108 fec(RXF)
> M5445X   105:          0 fec(RXB)
> M5445X   106:         47 fec(MII)
> M5445X   107:          0 fec(LC)
> M5445X   108:          0 fec(HBERR)
> M5445X   109:          0 fec(GRA)
> M5445X   110:          0 fec(EBERR)
> M5445X   111:          0 fec(BABT)
> M5445X   112:          0 fec(BABR)
> 
> I find that the interrupts for above operation is 5714 - 5099 = 605
> Is it normal? (my opinion it's too much)
> 
> I test it on the mcf5329 board, it has the same-like result (even more 605).
> Actually I don't modify any code of mcf.c and serial_core.c, but I don't
> know why so much interrupts are occurred through one operation?

By the looks of it, the driver is interrupting per character (ie per
byte). If you copy half your output above into a text editor, and count
the characters, including one byte per line end, you get 605. I can't
speak for the driver implementation, but it sounds fair enough to me.
Cheers,
--  Matt
