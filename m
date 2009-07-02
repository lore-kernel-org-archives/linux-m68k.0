From: Greg Ungerer <gerg@snapgear.com>
Subject: Re: [uClinux-dev] uart issues on coldfire platform
Date: Thu, 02 Jul 2009 10:40:49 +1000
Message-ID: <4A4C0211.2090000@snapgear.com>
References: <4A4AC800.3070901@freescale.com> <4A4B029E.1080503@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from rex.securecomputing.com ([203.24.151.4]:60436 "EHLO
	cyberguard.com.au" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1751579AbZGBAkr (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 1 Jul 2009 20:40:47 -0400
In-Reply-To: <4A4B029E.1080503@freescale.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: uClinux development list <uclinux-dev@uclinux.org>
Cc: linux-m68k@vger.kernel.org

Hi Lanttor,

Lanttor wrote:
>> Hi,
>>
>> I find one issue of UART on my coldfire platforms (mcf54451evb board).
>> I use the linux-2.6.29, and use drivers/serial/mcf.c and
>> drivers/serial/serial_core.c as my uart driver source.
>>
>> Following is my test steps -- run command: cat /proc/interrupts two
>> times contiguously.
>>
>> [root@freescale /]# cat /proc/interrupts
>> M5445X    *90:       5099 UART*
>> M5445X    96:       3130 timer0
>> M5445X    99:          0 timer3
>> M5445X   100:       1569 fec(TXF)
>> M5445X   101:          0 fec(TXB)
>> M5445X   102:          0 fec(TXFIFO)
>> M5445X   103:          0 fec(TXCR)
>> M5445X   104:       3098 fec(RXF)
>> M5445X   105:          0 fec(RXB)
>> M5445X   106:         41 fec(MII)
>> M5445X   107:          0 fec(LC)
>> M5445X   108:          0 fec(HBERR)
>> M5445X   109:          0 fec(GRA)
>> M5445X   110:          0 fec(EBERR)
>> M5445X   111:          0 fec(BABT)
>> M5445X   112:          0 fec(BABR)
>> [root@freescale /]# cat /proc/interrupts
>> M5445X    *90:       5714 UART*
>> M5445X    96:       3700 timer0
>> M5445X    99:          1 timer3
>> M5445X   100:       1574 fec(TXF)
>> M5445X   101:          0 fec(TXB)
>> M5445X   102:          0 fec(TXFIFO)
>> M5445X   103:          0 fec(TXCR)
>> M5445X   104:       3108 fec(RXF)
>> M5445X   105:          0 fec(RXB)
>> M5445X   106:         47 fec(MII)
>> M5445X   107:          0 fec(LC)
>> M5445X   108:          0 fec(HBERR)
>> M5445X   109:          0 fec(GRA)
>> M5445X   110:          0 fec(EBERR)
>> M5445X   111:          0 fec(BABT)
>> M5445X   112:          0 fec(BABR)
>>
>> I find that the interrupts for above operation is 5714 - 5099 = 605
                                                      ^^^^^^^^^^^^^ 615 ?

>> Is it normal? (my opinion it's too much)

Most of the ColdFire UART blocks have no transmit FIFO, so you
are going to get 1 interrupt per character. The above block  has
at least 500 characters in it (including white space).  Then include
the extra command prompt and you typing (receive interrupts) and I
would figure that is going to come to around 600 interrupts.
So, yes, that seems about right.

Check the actual character count using:

   cat /proc/tty/driver/mcf


>> I test it on the mcf5329 board, it has the same-like result (even more 605).
>> Actually I don't modify any code of mcf.c and serial_core.c, but I don't
>> know why so much interrupts are occurred through one operation?

That is the price you pay with no data FIFO's in these UART cores.
(Some of the ColdFire parts support DMA with the UART - the mcf
driver doesn't currently use this though).

Regards
Greg



------------------------------------------------------------------------
Greg Ungerer  --  Principal Engineer        EMAIL:     gerg@snapgear.com
SnapGear Group, McAfee                      PHONE:       +61 7 3435 2888
825 Stanley St,                             FAX:         +61 7 3891 3630
Woolloongabba, QLD, 4102, Australia         WEB: http://www.SnapGear.com
