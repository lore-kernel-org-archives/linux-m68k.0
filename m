From: Matthias Reis <matthias.reis@physik.tu-berlin.de>
Subject: Autovector exceptions on Atari ST
Date: Sun, 7 Aug 2011 22:57:39 +0200
Message-ID: <20110807205739.GA4527@matze-K8NF4G-SATA2>
References: <20110602192553.GA2071@matze-K8NF4G-SATA2>
 <4DE88763.4030705@snapgear.com>
 <BANLkTikVUh4rRsWLRrcAj2R6pu7GQUm-ag@mail.gmail.com>
 <BANLkTi=Uob6LavtHkbhgL=c=n=6m46x-+g@mail.gmail.com>
 <9cfdc3da684fa1f7960cd286766f5832.squirrel@www.physik.tu-berlin.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail.tu-berlin.de ([130.149.7.33]:60910 "EHLO mail.tu-berlin.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755117Ab1HGU5m (ORCPT <rfc822;linux-m68k@vger.kernel.org>);
	Sun, 7 Aug 2011 16:57:42 -0400
Received: from g231201220.adsl.alicedsl.de ([92.231.201.220] helo=localhost)
	by mail.tu-berlin.de (exim-4.75/mailfrontend-3) with esmtpsa [TLSv1:AES128-SHA:128]
	for <linux-m68k@vger.kernel.org>
	id 1QqAPl-0004s6-E6; Sun, 07 Aug 2011 22:57:41 +0200
Content-Disposition: inline
In-Reply-To: <9cfdc3da684fa1f7960cd286766f5832.squirrel@www.physik.tu-berlin.de>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org

Hi all,

I wanted to tell you that my Atari ST kernel now boots up until calibrate_delay loop, which hangs in an infinite loop ... I have read that this indicates normally that the timer interrupt is not working. I therefore checked if atari_sched_init is called and found that it is invoked by time_init which is ok. However, the interrupt handler timer_interrupt is never called subsequently (I can check that by setting a corresponding breakpoint in the emulator). This means probably that MFP autovector exceptions (the timer interrupt is handled by the MFP chip) are not registered properly.

I have applied most of the patches from Geert's uamiga-untested branch, especially the one regarding the 68000 autovectors (http://git.kernel.org/?p=linux/kernel/git/geert/linux-m68k.git;a=commit;h=21e03a7a7c60b2646bd7edd740cc964091bf8ca0). Comparing the amiga_init_IRQ and the atari_init_IRQ functions, I can see that the Amiga code registers the autovectors with request_irq. Do I need to do something similar in atari_init_IRQ and write a special handler for the MFP autovector (I think it is level 6)? If yes, how would such a handler look like?

Thanks in advance for your help :)

Best regards,
Matthias
