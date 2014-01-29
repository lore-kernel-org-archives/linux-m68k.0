From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH, RFC 02/30] scsi: atari_scsi: fix sleep_on race
Date: Wed, 29 Jan 2014 15:53:53 +0100
Message-ID: <201401291553.53531.arnd@arndb.de>
References: <1388664474-1710039-1-git-send-email-arnd@arndb.de> <201401122100.28877.arnd@arndb.de> <52E61895.6000007@gmail.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from moutng.kundenserver.de ([212.227.126.171]:52472 "EHLO
	moutng.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751888AbaA2Ox7 (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 29 Jan 2014 09:53:59 -0500
In-Reply-To: <52E61895.6000007@gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitzmic@gmail.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Michael Schmitz <schmitz@biophys.uni-duesseldorf.de>, Linux//m68k <linux-m68k@vger.kernel.org>

On Monday 27 January 2014, Michael Schmitz wrote:
> I will submit patches to the Atari SCSI driver based on Arnd's patch 
> later this week. Has Arnd's initial patch made it into mainline yet?

I've been a little occupied with other work recently, so I have never
gotten around to post a non-RFC version of the sleep_on patches.
Some have been picked up by various maintainers anyway, but this
one has not.

Thanks so much for taking care of this one!

	Arnd
