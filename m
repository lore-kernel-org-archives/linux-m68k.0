From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH, RFC 02/30] scsi: atari_scsi: fix sleep_on race
Date: Sun, 12 Jan 2014 21:00:28 +0100
Message-ID: <201401122100.28877.arnd@arndb.de>
References: <1388664474-1710039-1-git-send-email-arnd@arndb.de> <70d98fc4293247b4d5a11235a1d676b6@biophys.uni-duesseldorf.de> <52D1F299.7080909@gmail.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from moutng.kundenserver.de ([212.227.17.9]:57147 "EHLO
	moutng.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751028AbaALUAh (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 12 Jan 2014 15:00:37 -0500
In-Reply-To: <52D1F299.7080909@gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitzmic@gmail.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Michael Schmitz <schmitz@biophys.uni-duesseldorf.de>, Linux//m68k <linux-m68k@vger.kernel.org>

On Sunday 12 January 2014, Michael Schmitz wrote:
> Arnd,
> 
> your patch breaks the Atari NCR5380 SCSI driver (easily verified using 
> ARAnyM). Last console output:
> 

Thanks so much for testing and sorry for your troubles. It seems I
got the wrong polarity on at least one of the conditions when converting
from a while()-style loop to an until()-style wait_event loop.
I did double-check all the patches before, but this one must have
slipped through because the use is so obscure.

	Arnd
