From: Michael Schmitz <schmitzmic@gmail.com>
Subject: [PATCH] Do not register the IDE interrupt handler if host->get_lock is set.
Date: Sat,  1 Feb 2014 13:48:12 +1300
Message-ID: <1391215693-2880-1-git-send-email-schmitz@debian.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pd0-f174.google.com ([209.85.192.174]:54611 "EHLO
	mail-pd0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753713AbaBAAs2 (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Fri, 31 Jan 2014 19:48:28 -0500
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org
Cc: geert@linux-m68k.org, davem@davemloft.net, linux-ide@vger.kernel.org

The m68k Atari Falcon IDE driver shares the IDE interrupt with DMA completion,
SCSI and floppy controller. The DMA controller does not provide a way to check
whether it had generated an interrupt, so the shared interrupt has to be
reserved for exclusive use by the respective driver.
To this end, host->get_lock was added to allow both locking the interrupt
and passing the relevant interrupt handler to the machine specific interrupt
code. This feature is used exclusively by the Falcon IDE driver.
Unconditionally registering the IDE interrupt handler in init_irq() when
host->get_lock is set does result in two calls being dispatched to the IDE
handler on each IDE interrupt, and one spurious call on each SCSI, DMA or 
floppy interrupt.

The following patch changes init_irq() to request the IDE interrupt only if
host->get_lock is not set.

Regards,

	Michael Schmitz
