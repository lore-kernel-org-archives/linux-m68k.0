From: Lanttor <lanttor.guo@freescale.com>
Subject: uart issues on coldfire platform
Date: Wed, 01 Jul 2009 10:20:48 +0800
Message-ID: <4A4AC800.3070901@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from az33egw02.freescale.net ([192.88.158.103]:53856 "EHLO
	az33egw02.freescale.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751551AbZGACUm (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 30 Jun 2009 22:20:42 -0400
Received: from az33smr02.freescale.net (az33smr02.freescale.net [10.64.34.200])
	by az33egw02.freescale.net (8.14.3/az33egw02) with ESMTP id n612KOT7026878
	for <linux-m68k@vger.kernel.org>; Tue, 30 Jun 2009 19:20:37 -0700 (MST)
Received: from zch01exm25.fsl.freescale.net (zch01exm25.ap.freescale.net [10.192.129.217])
	by az33smr02.freescale.net (8.13.1/8.13.0) with ESMTP id n612KM7A017595
	for <linux-m68k@vger.kernel.org>; Tue, 30 Jun 2009 21:20:23 -0500 (CDT)
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org

Hi,

I find one issue of UART on my coldfire platforms (mcf54451evb board).
I use the linux-2.6.29, and use drivers/serial/mcf.c and
drivers/serial/serial_core.c as my uart driver source.

Following is my test steps -- run command: cat /proc/interrupts two
times contiguously.

[root@freescale /]# cat /proc/interrupts
M5445X    *90:       5099 UART*
M5445X    96:       3130 timer0
M5445X    99:          0 timer3
M5445X   100:       1569 fec(TXF)
M5445X   101:          0 fec(TXB)
M5445X   102:          0 fec(TXFIFO)
M5445X   103:          0 fec(TXCR)
M5445X   104:       3098 fec(RXF)
M5445X   105:          0 fec(RXB)
M5445X   106:         41 fec(MII)
M5445X   107:          0 fec(LC)
M5445X   108:          0 fec(HBERR)
M5445X   109:          0 fec(GRA)
M5445X   110:          0 fec(EBERR)
M5445X   111:          0 fec(BABT)
M5445X   112:          0 fec(BABR)
[root@freescale /]# cat /proc/interrupts
M5445X    *90:       5714 UART*
M5445X    96:       3700 timer0
M5445X    99:          1 timer3
M5445X   100:       1574 fec(TXF)
M5445X   101:          0 fec(TXB)
M5445X   102:          0 fec(TXFIFO)
M5445X   103:          0 fec(TXCR)
M5445X   104:       3108 fec(RXF)
M5445X   105:          0 fec(RXB)
M5445X   106:         47 fec(MII)
M5445X   107:          0 fec(LC)
M5445X   108:          0 fec(HBERR)
M5445X   109:          0 fec(GRA)
M5445X   110:          0 fec(EBERR)
M5445X   111:          0 fec(BABT)
M5445X   112:          0 fec(BABR)

I find that the interrupts for above operation is 5714 - 5099 = 605
Is it normal? (my opinion it's too much)

I test it on the mcf5329 board, it has the same-like result (even more 605).
Actually I don't modify any code of mcf.c and serial_core.c, but I don't
know why so much interrupts are occurred through one operation?

Regards,
Lanttor


