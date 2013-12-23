From: Michael Schmitz <schmitz@biophys.uni-duesseldorf.de>
Subject: Re: [PATCH] m68k/irq - use polled IRQ flag for MFP timer cascaded interrupts
Date: Mon, 23 Dec 2013 22:16:19 +1300
Message-ID: <0662fd1f6f09f26ea0b7c0ea44a0b961@biophys.uni-duesseldorf.de>
References: <1387611538-18305-1-git-send-email-schmitz@debian.org> <1387611538-18305-2-git-send-email-schmitz@debian.org> <CAMuHMdWirPo7HSsBiLdQDKdMmP4sjKEhcB1hfW0HabhkpQ-Jxg@mail.gmail.com> <m238llp255.fsf@linux-m68k.org>
Mime-Version: 1.0 (Apple Message framework v624)
Content-Type: text/plain; charset=US-ASCII; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pa0-f43.google.com ([209.85.220.43]:39617 "EHLO
	mail-pa0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932108Ab3LWJQY (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Mon, 23 Dec 2013 04:16:24 -0500
Received: by mail-pa0-f43.google.com with SMTP id bj1so5109352pad.30
        for <linux-m68k@vger.kernel.org>; Mon, 23 Dec 2013 01:16:24 -0800 (PST)
In-Reply-To: <m238llp255.fsf@linux-m68k.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Andreas Schwab <schwab@linux-m68k.org>
Cc: Linux/m68k <linux-m68k@vger.kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>

Andreas,

> What does that fix?

Hardware with no interrupt line (EtherNEC, NetUSBee) has the driver 
interrupt routine polled from the Atari timer D interrupt, which calls 
in to the driver inthandler via driver-specific chained interrupts 
IRQ_MFP_TIMER1 etc. (see patch to set up irq chip for timer D interrupt 
earlier).

These interrupts will, more often than not, return IRQ_NONE as there's 
not always any work to be done when called from the timer. Accumulation 
of unhandled interrupts then causes the handler to be disabled by the 
unhandled interrupt watchdog.

Driver maintainers have been reluctant to accept other hacks to fix 
this issue (such as declaring the driver interrupt shared, and hooking 
up a handler that just returns IRQ_HANDLED always).

Cheers,

	Michael


>
> Andreas.
>
> -- 
> Andreas Schwab, schwab@linux-m68k.org
> GPG Key fingerprint = 58CA 54C7 6D53 942B 1756  01D3 44D5 214B 8276 
> 4ED5
> "And now for something completely different."
> --
> To unsubscribe from this list: send the line "unsubscribe linux-m68k" 
> in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
