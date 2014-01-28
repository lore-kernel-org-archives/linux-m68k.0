From: Michael Schmitz <schmitzmic@gmail.com>
Subject: [PATCH 0/3] m68k/atari - Atari NCR5380 SCSI driver fixes
Date: Tue, 28 Jan 2014 20:52:28 +1300
Message-ID: <1390895551-16270-1-git-send-email-schmitz@debian.org>
References: <CAMuHMdWNnOA8dtUPWfQfikTiWxe9-ZwMUU7gkfP3Mv8PcWcvyQ@mail.gmail.com>
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pa0-f46.google.com ([209.85.220.46]:60191 "EHLO
	mail-pa0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751985AbaA1Hwq (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 28 Jan 2014 02:52:46 -0500
Received: by mail-pa0-f46.google.com with SMTP id rd3so40175pab.5
        for <linux-m68k@vger.kernel.org>; Mon, 27 Jan 2014 23:52:46 -0800 (PST)
In-Reply-To: <CAMuHMdWNnOA8dtUPWfQfikTiWxe9-ZwMUU7gkfP3Mv8PcWcvyQ@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org
Cc: geert@linux-m68k.org

Geert,

this patch series brings the Atari NCR5380 driver up to date with current 3.x
(or even 2.6) series SCSI midlevel and error handling changes. 

The first patch fixes completion condition errors contained in Arnd Bergmann's
patch ([PATCH, RFC 02/30] scsi: atari_scsi: fix sleep_on race). The locking
scheme still isn't 100% race free that way, but much improved, and I've seen
the driver successfully handle error recovery from aborting a disconnected
command via bus reset with all three patches applied. Never managed to do that
before. Not sure whether this one should be taken through your tree or handled
by Arnd rather. 

The other two are a rehash of old patches I had prepared somewhere along the
2.6 series - somehow or other these were lost when one of my old git trees
went pear shaped. Abort and reset handler return codes have changed, and the
SCSI midlevel now queues commands (in particular error handling ones) from
softirq context - the Falcon locking scheme was ill equipped to deal with that.

Another issue that surfaced while debugging SCSI deadlocks was the odd fact
that two interrupts get registered for the ST-DMA/floppy/SCSI/IDE interrupt:
the stdma_int multiplexer, and the IDE interrupt handler itself. I'll send a
separate patch for that. 

Cheers,

	Michael


[PATCH 1/3] m68k/atari - atari_scsi: fix wait_event completion conditions
[PATCH 2/3] m68k/atari - atari_scsi: change abort/reset return codes
[PATCH 3/3] m68k/atari - atari_scsi: punt if deadlocked on stdma_lock
