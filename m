From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: M68k SCSI compile warning fixes
Date: Mon, 13 Jun 2011 20:39:14 +0200
Message-ID: <1307990362-22768-1-git-send-email-geert@linux-m68k.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from brigitte.telenet-ops.be ([195.130.137.66]:35128 "EHLO
	brigitte.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752610Ab1FMSja (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Mon, 13 Jun 2011 14:39:30 -0400
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: "James E.J. Bottomley" <JBottomley@parallels.com>
Cc: linux-scsi@vger.kernel.org, linux-m68k@vger.kernel.org, linux-kernel@vger.kernel.org

	Hi James,

These patches fix several compile warnings on m68k.
As I don't have the hardware, I couldn't run test them, though.

 b/drivers/scsi/atari_NCR5380.c |    5 +++
 b/drivers/scsi/atari_scsi.c    |    1 
 b/drivers/scsi/mac_scsi.c      |    2 -
 b/drivers/scsi/sun3_NCR5380.c  |    2 -
 b/drivers/scsi/sun3_scsi.c     |    2 -
 b/drivers/scsi/sun3_scsi_vme.c |    2 -
 drivers/scsi/mac_scsi.c        |   12 -------
 drivers/scsi/sun3_NCR5380.c    |   65 +++--------------------------------------
 drivers/scsi/sun3_scsi.c       |    9 ++++-
 drivers/scsi/sun3_scsi_vme.c   |    9 ++++-
 10 files changed, 31 insertions(+), 78 deletions(-)

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
