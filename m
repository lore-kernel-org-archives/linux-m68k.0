From: Matthias Reis <matthias.reis@physik.tu-berlin.de>
Subject: 68000 patches (Atari ST platform)
Date: Mon, 12 Sep 2011 01:09:20 +0200
Message-ID: <20110911230920.GA1541@matze-K8NF4G-SATA2>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail.tu-berlin.de ([130.149.7.33]:1026 "EHLO mail.tu-berlin.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753306Ab1IKXJW (ORCPT <rfc822;linux-m68k@vger.kernel.org>);
	Sun, 11 Sep 2011 19:09:22 -0400
Received: from g225121069.adsl.alicedsl.de ([92.225.121.69] helo=localhost)
	by mail.tu-berlin.de (exim-4.75/mailfrontend-1) with esmtpsa [TLSv1:AES128-SHA:128]
	for <linux-m68k@vger.kernel.org>
	id 1R2t9N-0004nz-Ln; Mon, 12 Sep 2011 01:09:21 +0200
Content-Disposition: inline
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org

Hi all,

today I finally got my hands on the user interrupts for plain 68000 CPUs and it was quite straightforward, just as you have suggested: I implemented user*_inthandlers in entry_mm.S that push the vectornumber onto the stack. My kernel still doesn't boot completely, but it runs now correctly calibrate delay loop (0.59 BogoMIPS, isn't it great? ;) since the timer interrupt is working.

According to the "release early, release often"-mantra, I want now to send some patches to the list. Do you want to have the Atari bootstrap patches in this mailinglist? I'm asking because bootstrap is not (anymore) part of the kernel sources... The next question would be whether you want to have a single head.S version for the Atari ST-nommu platform or a merge with the current arch/m68k/kernel/head.S. The head.S I use does not use much code from the "classic" head.S and is for sure easier to read due to its small size.

Best regards,
Matthias
