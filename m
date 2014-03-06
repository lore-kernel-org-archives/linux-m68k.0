From: Michael Schmitz <schmitzmic@gmail.com>
Subject: Re: [PATCH] m68k/atari - ide: do not register interrupt if host->get_lock is set
Date: Thu, 6 Mar 2014 19:47:06 +1300
Message-ID: <540db7ba6339cc907a63fb7a615aaa7e@gmail.com>
References: <1391215693-2880-1-git-send-email-schmitz@debian.org> <1391215693-2880-2-git-send-email-schmitz@debian.org> <20140304.155906.221185723445733090.davem@davemloft.net>
Mime-Version: 1.0 (Apple Message framework v624)
Content-Type: text/plain; charset=US-ASCII; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pa0-f54.google.com ([209.85.220.54]:50459 "EHLO
	mail-pa0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750810AbaCFGq4 (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Thu, 6 Mar 2014 01:46:56 -0500
In-Reply-To: <20140304.155906.221185723445733090.davem@davemloft.net>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: David Miller <davem@davemloft.net>
Cc: linux-m68k@vger.kernel.org, schmitz@debian.org, linux-ide@vger.kernel.org, geert@linux-m68k.org

Thanks Dave,

>> On m68k, host->get_lock is used to both lock and register the 
>> interrupt
>> that the IDE host shares with other device drivers. Registering the
>> IDE interrupt handler in ide-probe.c results in duplicating the
>> interrupt registered (once via host->get lock, and also via 
>> init_irq()),
>> and may result in IDE accepting interrupts even when another driver 
>> has
>> locked the interrupt hardware. This opens the whole locking scheme up
>> to races.
>>
>> host->get_lock is set on m68k only, so other drivers' behaviour is not
>> changed.
>>
>> Signed-off-by: Michael Schmitz <schmitz@debian.org>
>
> It's a bit kludgy, but minimal and correct.

Would you have preferred to use a host flag instead?

> Applied, thank you.

Thanks again,

	Michael
