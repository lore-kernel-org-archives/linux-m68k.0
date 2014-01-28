From: Michael Schmitz <schmitzmic@gmail.com>
Subject: [PATCH 0/1] m68k/atari - ide: do not register interrupt if host->get_lock is set
Date: Tue, 28 Jan 2014 21:07:45 +1300
Message-ID: <1390896466-16446-1-git-send-email-schmitz@debian.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pa0-f52.google.com ([209.85.220.52]:48745 "EHLO
	mail-pa0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753180AbaA1IHz (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 28 Jan 2014 03:07:55 -0500
Received: by mail-pa0-f52.google.com with SMTP id bj1so50979pad.39
        for <linux-m68k@vger.kernel.org>; Tue, 28 Jan 2014 00:07:55 -0800 (PST)
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org
Cc: geert@linux-m68k.org

Geert,

as hinted in my earlier patch series, this one bit me while debugging the
SCSI/IDE deadlock on my Falcon. 

On Falcon, registering the IDE interrupt handler is taken care of by
registering stdma_int() in the arch setup code, then passing the relevant
IDE interrupt handler as argument to stdma_lock(). This ensures that the IDE
inthandler is only called if IDE has acquired the ST-DMA lock, and avoids
the IDE handler stepping on the SCSI handlers' toes if the ST-DMA is locked
by SCSI. 

At some point in the past, the IDE interrupt was registered unconditionally
even on m68k, resulting in both stdma_int() and ide_interrupt() being
registered, again opening up the potential of IDE taking interrupts meant to
be handled by SCSI (or floppy). This might result in deadlocking the SCSI
driver if IDE releases the ST-DMA lock in error. 

The next patch changes the IDE core to only register the IDE handler if
host->get_lock is not set - AFAIK m68k is the sole user of host->get_lock
so we can rely on IDE interrupts being handled through the multiplexer
whenever host->get_lock happens to be set. 

Cheers,

	Michael
