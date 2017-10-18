From: Philippe De Muyter <phdm@macq.eu>
Subject: Re: coldfire uart question
Date: Wed, 18 Oct 2017 09:35:46 +0200
Message-ID: <20171018073546.GA8408@frolo.macqel>
References: <1f18ad0d-d147-5c64-ad65-a4bc545d4bff@sysam.it> <alpine.LNX.2.00.1710160943040.3@nippy.intranet> <e4fff222-c8d0-9da0-32b4-222fbfad8044@sysam.it> <e955b0fa-e5b6-9d78-a5af-78391d639650@westnet.com.au> <ed4d11b6-3b7b-3064-9d3e-34f9244d92e1@sysam.it>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from smtp2.macqel.be ([109.135.2.61]:50665 "EHLO smtp2.macqel.be"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1762087AbdJRHlL (ORCPT <rfc822;linux-m68k@vger.kernel.org>);
        Wed, 18 Oct 2017 03:41:11 -0400
Content-Disposition: inline
In-Reply-To: <ed4d11b6-3b7b-3064-9d3e-34f9244d92e1@sysam.it>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Angelo Dureghello <angelo@sysam.it>
Cc: Greg Ungerer <gregungerer@westnet.com.au>, Linux/m68k <linux-m68k@vger.kernel.org>, Finn Thain <fthain@telegraphics.com.au>

Hi all,

it seems that mcf54415 has uart DMA support (https://community.nxp.com/thread/304877)
could you use that ?

Philippe

On Wed, Oct 18, 2017 at 09:19:52AM +0200, Angelo Dureghello wrote:
> Hi Greg,
>
> On 18/10/2017 09:12, Greg Ungerer wrote:
>> Hi Angelo,
>> On 18/10/17 07:18, Angelo Dureghello wrote:
>>> On 16/10/2017 01:08, Finn Thain wrote:
>>>> On Sun, 15 Oct 2017, Angelo Dureghello wrote:
>>>>
>>>>> Hi all,
>>>>>
>>>>> i was trying a file transfer with xmodem-1k and uClinux "rx" on the
>>>>> mcf54415 stnmark2 board side.
>>>>>
>>>>> This using a recent mainline kernel:
>>>>> / # cat /proc/version
>>>>> uClinux version 4.14.0-rc4stmark2-001-00118-g811fdbb62a9d
>>>>> / #
>>>>>
>>>>> So, as per xmodem-1k, i send 3 bytes header, a 1024 bytes block, and 2
>>>>> bytes crc16. But "rx" timeouts waiting the block.
>>>>>
>>>>
>>>> What is the fastest baud rate that will work?
>>>>
>>>>> Adding some traces to "rx", it timeouts since some bytes (5 to 10)
>>>>> randomly positioned in the block are not received. Of course they have
>>>>> been sent (scope checked).
>>>>>
>>>>> The same 1024 bytes transfer in u-boot (y-modem) always succeed.
>>>>>
>>>>
>>>> Does u-boot need to do any retransmissions? (If it polls the UART, it
>>>> could probably avoid any fifo overflow.)
>>>>
>>>> You may also want to try lrzsz.
>>>>
>>>>> Since mcf54415 has a 4 slots RX fifo UART,
>>>>
>>>> Ouch. At 115200 baud, that FIFO overflows after about 347 microseconds. 
>>>> If
>>>> the kernel takes one interrupt per 4 bytes, you're looking at thousands 
>>>> of
>>>> interrupts per second. Add a little unexpected interrupt latency (say, 
>>>> 50
>>>> microseconds) and the next byte gets lost.
>>>>
>>>
>>> thanks for explaining this.
>>>
>>> Well, if i understand properly, this mcf54415 CPU has 2 interrupts flags
>>> that can be checked:
>>>   RXRDY, for one or more character received (current mcf.c seems to use
>>> this flag) and
>>> FFULL, for all 4 fifo slots full.
>>>
>>> So we probably have even more interrupts per second right now.
>>>
>>> I am at 115200, will try to decrease, and also, will try zmodem in case.
>> Can you use hardware flow control (the "crtscts" stty setting)?
>> You will need to use a serial cable with RTS and CTS signals wired,
>> and also for the sending end to be set for it. The ColdFire UART
>> has hardware level support for automatically driving RTS/CTS when
>> FIFO is full.
>
> many thanks for the hint, well for stmark2 board unfortunately/stupidly i
> didn't wired them out from the BGA package. But good to know.
>
>> Regards
>> Greg
>>
>
>  Regards,
> Angelo
> --
> To unsubscribe from this list: send the line "unsubscribe linux-m68k" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
