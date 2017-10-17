From: Angelo Dureghello <angelo@sysam.it>
Subject: Re: coldfire uart question
Date: Tue, 17 Oct 2017 23:07:25 +0200
Message-ID: <9fba01f2-9bf4-ecc2-b32e-2e75e203e189@sysam.it>
References: <1f18ad0d-d147-5c64-ad65-a4bc545d4bff@sysam.it>
 <077ccbca-027c-67fe-602e-7105d5c46edf@westnet.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from sysam.it ([5.39.81.93]:50517 "EHLO sysam.it"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1764337AbdJQVH2 (ORCPT <rfc822;linux-m68k@vger.kernel.org>);
        Tue, 17 Oct 2017 17:07:28 -0400
In-Reply-To: <077ccbca-027c-67fe-602e-7105d5c46edf@westnet.com.au>
Content-Language: en-US
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Greg Ungerer <gregungerer@westnet.com.au>, Linux/m68k <linux-m68k@vger.kernel.org>
Cc: Finn Thain <fthain@telegraphics.com.au>

Hi Greg and all,

On 16/10/2017 01:57, Greg Ungerer wrote:
> Hi Angelo,
> 
> On 16/10/17 03:28, Angelo Dureghello wrote:
>> i was trying a file transfer with xmodem-1k
>> and uClinux "rx" on the mcf54415 stnmark2 board side.
>>
>> This using a recent mainline kernel:
>> / # cat /proc/version
>> uClinux version 4.14.0-rc4stmark2-001-00118-g811fdbb62a9d
>> / #
>>
>> So, as per xmodem-1k, i send 3 bytes header,
>> a 1024 bytes block, and 2 bytes crc16. But "rx" timeouts
>> waiting the block.
>>
>> Adding some traces to "rx", it timeouts since some bytes
>> (5 to 10) randomly positioned in the block are not received.
>> Of course they have been sent (scope checked).
> 
> Check if you are getting overruns on the port:
> 
>    cat /proc/tty/driver/mcf

thanks, yes, you are right

/ # cat /proc/tty/driver/mcf
serinfo:1.0 driver revision:
0: uart:ColdFire UART mmio:0xFC060000 irq:90 tx:4047 rx:1057 oe:8 RTS|DTR|CD
1: uart:ColdFire UART mmio:0xFC064000 irq:91 tx:0 rx:0 CD
2: uart:ColdFire UART mmio:0xFC068000 irq:92 tx:0 rx:0 CD
3: uart:ColdFire UART mmio:0xFC06C000 irq:93 tx:0 rx:0 CD
/ #

I am at 115200,n,8,1 now.

I checked the u-boot driver and there is no interrupt handler,
only a coldfire_serial_getc checking USR_RXRDY.

Could the RxFIFO_Full interrupt flag be of any help ?



> 
> Regards
> Greg
> 
> 

Regards,
Angelo

> 
>> The same 1024 bytes transfer in u-boot (y-modem)
>> always succeed.
>>
>> Since mcf54415 has a 4 slots RX fifo UART, i was wondering
>> if the mcf.c uart driver is not fast enough to read the data,
>> or, where the "linux" limitation could be.
>>
>> Regards,
>> Angelo Dureghello
>> -- 
>> To unsubscribe from this list: send the line "unsubscribe linux-m68k" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>>
> 
