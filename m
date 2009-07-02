From: Lanttor <lanttor.guo@freescale.com>
Subject: Re: [uClinux-dev] uart issues on coldfire platform
Date: Thu, 02 Jul 2009 10:21:51 +0800
Message-ID: <4A4C19BF.3070002@freescale.com>
References: <4A4AC800.3070901@freescale.com> <4A4B029E.1080503@freescale.com> <4A4C0211.2090000@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from az33egw02.freescale.net ([192.88.158.103]:59954 "EHLO
	az33egw02.freescale.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752963AbZGBCV0 (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 1 Jul 2009 22:21:26 -0400
Received: from de01smr01.freescale.net (de01smr01.freescale.net [10.208.0.31])
	by az33egw02.freescale.net (8.14.3/az33egw02) with ESMTP id n622LG4m024060
	for <linux-m68k@vger.kernel.org>; Wed, 1 Jul 2009 19:21:17 -0700 (MST)
Received: from zch01exm25.fsl.freescale.net (zch01exm25.ap.freescale.net [10.192.129.217])
	by de01smr01.freescale.net (8.13.1/8.13.0) with ESMTP id n622LEHf024095
	for <linux-m68k@vger.kernel.org>; Wed, 1 Jul 2009 21:21:15 -0500 (CDT)
In-Reply-To: <4A4C0211.2090000@snapgear.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Greg Ungerer <gerg@snapgear.com>
Cc: uClinux development list <uclinux-dev@uclinux.org>, linux-m68k@vger.kernel.org, Jin Zhengxiong-R64188 <Jason.Jin@freescale.com>

Thanks Greg/Matt/Cris' reply. I know it's not the issue now :)

> Most of the ColdFire UART blocks have no transmit FIFO, so you
> are going to get 1 interrupt per character. The above block  has
> at least 500 characters in it (including white space).  Then include
> the extra command prompt and you typing (receive interrupts) and I
> would figure that is going to come to around 600 interrupts.
> So, yes, that seems about right.
>
> Check the actual character count using:
>
>   cat /proc/tty/driver/mcf 
Indeed it is. The UART transmit Buffer in my board is 1 character size
(no FIFO), only receiver has FIFO.

I test command "cat /proc/tty/driver/mcf", the result is as follows:

[root@freescale /]# cat /proc/tty/driver/mcf
serinfo:1.0 driver revision:
0: uart:ColdFire UART mmio:0xFC060000 irq:90 tx:54821 rx:91 RTS|DTR|CD
[root@freescale /]# cat /proc/interrupts
M5445X    90:      55042 UART
M5445X    96:       9962 timer
M5445X    99:          2 timer
M5445X   100:       3761 fec(TXF)
M5445X   101:          0 fec(TXB)
M5445X   102:          0 fec(TXFIFO)
M5445X   103:          0 fec(TXCR)
M5445X   104:       8169 fec(RXF)
M5445X   105:          0 fec(RXB)
M5445X   106:        110 fec(MII)
M5445X   107:          0 fec(LC)
M5445X   108:          0 fec(HBERR)
M5445X   109:          0 fec(GRA)
M5445X   110:          0 fec(EBERR)
M5445X   111:          0 fec(BABT)
M5445X   112:          0 fec(BABR)
[root@freescale /]# cat /proc/tty/driver/mcf
serinfo:1.0 driver revision:
0: uart:ColdFire UART mmio:0xFC060000 irq:90 tx:55603 rx:115 RTS|DTR|CD

Thanks!

Regards,
Lanttor




------------------------------------------------------------------------
*From:* Greg Ungerer <gerg@snapgear.com>
*Sent:* 07/02/2009 8:40:49 AM +0800
*To:* uClinux development list <uclinux-dev@uclinux.org>
*CC:* linux-m68k@vger.kernel.org
*Subject:* [uClinux-dev] uart issues on coldfire platform

> Hi Lanttor,
>
> Lanttor wrote:
>>> Hi,
>>>
>>> I find one issue of UART on my coldfire platforms (mcf54451evb board).
>>> I use the linux-2.6.29, and use drivers/serial/mcf.c and
>>> drivers/serial/serial_core.c as my uart driver source.
>>>
>>> Following is my test steps -- run command: cat /proc/interrupts two
>>> times contiguously.
>>>
>>> [root@freescale /]# cat /proc/interrupts
>>> M5445X    *90:       5099 UART*
>>> M5445X    96:       3130 timer0
>>> M5445X    99:          0 timer3
>>> M5445X   100:       1569 fec(TXF)
>>> M5445X   101:          0 fec(TXB)
>>> M5445X   102:          0 fec(TXFIFO)
>>> M5445X   103:          0 fec(TXCR)
>>> M5445X   104:       3098 fec(RXF)
>>> M5445X   105:          0 fec(RXB)
>>> M5445X   106:         41 fec(MII)
>>> M5445X   107:          0 fec(LC)
>>> M5445X   108:          0 fec(HBERR)
>>> M5445X   109:          0 fec(GRA)
>>> M5445X   110:          0 fec(EBERR)
>>> M5445X   111:          0 fec(BABT)
>>> M5445X   112:          0 fec(BABR)
>>> [root@freescale /]# cat /proc/interrupts
>>> M5445X    *90:       5714 UART*
>>> M5445X    96:       3700 timer0
>>> M5445X    99:          1 timer3
>>> M5445X   100:       1574 fec(TXF)
>>> M5445X   101:          0 fec(TXB)
>>> M5445X   102:          0 fec(TXFIFO)
>>> M5445X   103:          0 fec(TXCR)
>>> M5445X   104:       3108 fec(RXF)
>>> M5445X   105:          0 fec(RXB)
>>> M5445X   106:         47 fec(MII)
>>> M5445X   107:          0 fec(LC)
>>> M5445X   108:          0 fec(HBERR)
>>> M5445X   109:          0 fec(GRA)
>>> M5445X   110:          0 fec(EBERR)
>>> M5445X   111:          0 fec(BABT)
>>> M5445X   112:          0 fec(BABR)
>>>
>>> I find that the interrupts for above operation is 5714 - 5099 = 605
>                                                      ^^^^^^^^^^^^^ 615 ?
>
>>> Is it normal? (my opinion it's too much)
>
> Most of the ColdFire UART blocks have no transmit FIFO, so you
> are going to get 1 interrupt per character. The above block  has
> at least 500 characters in it (including white space).  Then include
> the extra command prompt and you typing (receive interrupts) and I
> would figure that is going to come to around 600 interrupts.
> So, yes, that seems about right.
>
> Check the actual character count using:
>
>   cat /proc/tty/driver/mcf
>
>
>>> I test it on the mcf5329 board, it has the same-like result (even
>>> more 605).
>>> Actually I don't modify any code of mcf.c and serial_core.c, but I
>>> don't
>>> know why so much interrupts are occurred through one operation?
>
> That is the price you pay with no data FIFO's in these UART cores.
> (Some of the ColdFire parts support DMA with the UART - the mcf
> driver doesn't currently use this though).
>
> Regards
> Greg
>
>
>
> ------------------------------------------------------------------------
> Greg Ungerer  --  Principal Engineer        EMAIL:     gerg@snapgear.com
> SnapGear Group, McAfee                      PHONE:       +61 7 3435 2888
> 825 Stanley St,                             FAX:         +61 7 3891 3630
> Woolloongabba, QLD, 4102, Australia         WEB: http://www.SnapGear.com
> -- 
> To unsubscribe from this list: send the line "unsubscribe linux-m68k" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
