From: Angelo Dureghello <angelo@sysam.it>
Subject: coldfire uart question
Date: Sun, 15 Oct 2017 19:28:04 +0200
Message-ID: <1f18ad0d-d147-5c64-ad65-a4bc545d4bff@sysam.it>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from sysam.it ([5.39.81.93]:49047 "EHLO sysam.it"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751502AbdJOR2H (ORCPT <rfc822;linux-m68k@vger.kernel.org>);
        Sun, 15 Oct 2017 13:28:07 -0400
Content-Language: en-US
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Linux/m68k <linux-m68k@vger.kernel.org>

Hi all,

i was trying a file transfer with xmodem-1k
and uClinux "rx" on the mcf54415 stnmark2 board side.

This using a recent mainline kernel:
/ # cat /proc/version
uClinux version 4.14.0-rc4stmark2-001-00118-g811fdbb62a9d
/ #

So, as per xmodem-1k, i send 3 bytes header,
a 1024 bytes block, and 2 bytes crc16. But "rx" timeouts
waiting the block.

Adding some traces to "rx", it timeouts since some bytes
(5 to 10) randomly positioned in the block are not received.
Of course they have been sent (scope checked).

The same 1024 bytes transfer in u-boot (y-modem)
always succeed.

Since mcf54415 has a 4 slots RX fifo UART, i was wondering
if the mcf.c uart driver is not fast enough to read the data,
or, where the "linux" limitation could be.

Regards,
Angelo Dureghello
