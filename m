From: <gerg@snapgear.com>
Subject: [PATCH] m68k: add ColdFire FPU support for the V4e ColdFire CPU's
Date: Thu, 3 Nov 2011 15:54:04 +1000
Message-ID: <1320299645-9105-1-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from sncsmrelay2.nai.com ([67.97.80.206]:59066 "EHLO
	sncsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751349Ab1KCFx7 (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Thu, 3 Nov 2011 01:53:59 -0400
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org


Hi All,

Here is an improved patch set for FPU support on the ColdFire V4e.
Much cleaner than the ifdefery for this in the ColdFire/MMU patch
set I sent recently. (So of course this replaces that patch).

Does anyone know why some of the code for using fsave/frestore is
surrounded by ".chip" directives and others are not?  For example
in arch/m68k/kernel/process_mm.c you will find this:

       __asm__ volatile (".chip 68k/68881\n\t"
                          "frestore %0\n\t"
                          ".chip 68k" : : "m" (*sc->sc_fpstate));

and you will also find this:

	asm volatile ("frestore %0" : : "m" (p->thread.fpstate[0]));

I can use the second form directly on ColdFire, but not the first...

Regards
Greg
