From: Angelo Dureghello <angelo@sysam.it>
Subject: Re: coldfire uart question
Date: Tue, 17 Oct 2017 23:18:28 +0200
Message-ID: <e4fff222-c8d0-9da0-32b4-222fbfad8044@sysam.it>
References: <1f18ad0d-d147-5c64-ad65-a4bc545d4bff@sysam.it>
 <alpine.LNX.2.00.1710160943040.3@nippy.intranet>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from sysam.it ([5.39.81.93]:50528 "EHLO sysam.it"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1764458AbdJQVSb (ORCPT <rfc822;linux-m68k@vger.kernel.org>);
        Tue, 17 Oct 2017 17:18:31 -0400
In-Reply-To: <alpine.LNX.2.00.1710160943040.3@nippy.intranet>
Content-Language: en-US
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Linux/m68k <linux-m68k@vger.kernel.org>
Cc: Finn Thain <fthain@telegraphics.com.au>

Hi Finn,

On 16/10/2017 01:08, Finn Thain wrote:
> On Sun, 15 Oct 2017, Angelo Dureghello wrote:
> 
>> Hi all,
>>
>> i was trying a file transfer with xmodem-1k and uClinux "rx" on the
>> mcf54415 stnmark2 board side.
>>
>> This using a recent mainline kernel:
>> / # cat /proc/version
>> uClinux version 4.14.0-rc4stmark2-001-00118-g811fdbb62a9d
>> / #
>>
>> So, as per xmodem-1k, i send 3 bytes header, a 1024 bytes block, and 2
>> bytes crc16. But "rx" timeouts waiting the block.
>>
> 
> What is the fastest baud rate that will work?
> 
>> Adding some traces to "rx", it timeouts since some bytes (5 to 10)
>> randomly positioned in the block are not received. Of course they have
>> been sent (scope checked).
>>
>> The same 1024 bytes transfer in u-boot (y-modem) always succeed.
>>
> 
> Does u-boot need to do any retransmissions? (If it polls the UART, it
> could probably avoid any fifo overflow.)
> 
> You may also want to try lrzsz.
> 
>> Since mcf54415 has a 4 slots RX fifo UART,
> 
> Ouch. At 115200 baud, that FIFO overflows after about 347 microseconds. If
> the kernel takes one interrupt per 4 bytes, you're looking at thousands of
> interrupts per second. Add a little unexpected interrupt latency (say, 50
> microseconds) and the next byte gets lost.
> 

thanks for explaining this.

Well, if i understand properly, this mcf54415 CPU has 2 interrupts flags
that can be checked:
  
RXRDY, for one or more character received (current mcf.c seems to use
this flag) and
FFULL, for all 4 fifo slots full.

So we probably have even more interrupts per second right now.

I am at 115200, will try to decrease, and also, will try zmodem in case.

Regards,
Angelo
