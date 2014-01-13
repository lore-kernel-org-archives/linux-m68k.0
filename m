From: Michael Schmitz <schmitzmic@gmail.com>
Subject: Re: [PATCH, RFC 02/30] scsi: atari_scsi: fix sleep_on race
Date: Mon, 13 Jan 2014 20:35:44 +1300
Message-ID: <6a6f94b5248796fbe0230a223d01d3fc@gmail.com>
References: <1388664474-1710039-1-git-send-email-arnd@arndb.de> <70d98fc4293247b4d5a11235a1d676b6@biophys.uni-duesseldorf.de> <52D1F299.7080909@gmail.com> <201401122100.28877.arnd@arndb.de>
Mime-Version: 1.0 (Apple Message framework v624)
Content-Type: text/plain; charset=US-ASCII; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pb0-f45.google.com ([209.85.160.45]:65430 "EHLO
	mail-pb0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751295AbaAMHfx (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Mon, 13 Jan 2014 02:35:53 -0500
Received: by mail-pb0-f45.google.com with SMTP id rp16so6953226pbb.18
        for <linux-m68k@vger.kernel.org>; Sun, 12 Jan 2014 23:35:53 -0800 (PST)
In-Reply-To: <201401122100.28877.arnd@arndb.de>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Linux//m68k <linux-m68k@vger.kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>

Arnd,

>> your patch breaks the Atari NCR5380 SCSI driver (easily verified using
>> ARAnyM). Last console output:
>>
>
> Thanks so much for testing and sorry for your troubles. It seems I

Not to worry - without the occasional incentive to work on it, the 
driver would just keep on bitrotting more. Not that I ever officially 
took it on ...

> got the wrong polarity on at least one of the conditions when 
> converting
> from a while()-style loop to an until()-style wait_event loop.

Yep, that's my hunch too. From what I've seen so far it blocks at the 
falcon_fairness_wait stage, but more tests are needed.

> I did double-check all the patches before, but this one must have
> slipped through because the use is so obscure.

Just say it - it is a nightmare. The code dates back to the times of 
the Big Kernel Lock, and interrupt priorities on Atari made it 
necessary to enable interrupts while in the SCSI inthandler at that 
time (after masking off the SCSI interrupt).

Sharing the interrupt with DMA completion, floppy and IDE without a way 
to properly check which one raised it just does not help.

If you want me to try something else, let me know.

Cheers,

	Michael
