From: Greg Ungerer <gregungerer@westnet.com.au>
Subject: Re: coldfire uart question
Date: Mon, 16 Oct 2017 09:57:01 +1000
Message-ID: <077ccbca-027c-67fe-602e-7105d5c46edf@westnet.com.au>
References: <1f18ad0d-d147-5c64-ad65-a4bc545d4bff@sysam.it>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from icp-osb-irony-out9.external.iinet.net.au ([203.59.1.226]:61631
        "EHLO icp-osb-irony-out9.external.iinet.net.au" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1751348AbdJOX5b (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>);
        Sun, 15 Oct 2017 19:57:31 -0400
In-Reply-To: <1f18ad0d-d147-5c64-ad65-a4bc545d4bff@sysam.it>
Content-Language: en-US
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Angelo Dureghello <angelo@sysam.it>, Linux/m68k <linux-m68k@vger.kernel.org>

Hi Angelo,

On 16/10/17 03:28, Angelo Dureghello wrote:
> i was trying a file transfer with xmodem-1k
> and uClinux "rx" on the mcf54415 stnmark2 board side.
> 
> This using a recent mainline kernel:
> / # cat /proc/version
> uClinux version 4.14.0-rc4stmark2-001-00118-g811fdbb62a9d
> / #
> 
> So, as per xmodem-1k, i send 3 bytes header,
> a 1024 bytes block, and 2 bytes crc16. But "rx" timeouts
> waiting the block.
> 
> Adding some traces to "rx", it timeouts since some bytes
> (5 to 10) randomly positioned in the block are not received.
> Of course they have been sent (scope checked).

Check if you are getting overruns on the port:

  cat /proc/tty/driver/mcf

Regards
Greg



> The same 1024 bytes transfer in u-boot (y-modem)
> always succeed.
> 
> Since mcf54415 has a 4 slots RX fifo UART, i was wondering
> if the mcf.c uart driver is not fast enough to read the data,
> or, where the "linux" limitation could be.
> 
> Regards,
> Angelo Dureghello
> -- 
> To unsubscribe from this list: send the line "unsubscribe linux-m68k" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
