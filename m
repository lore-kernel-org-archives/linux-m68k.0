From: Andreas Schwab <schwab@linux-m68k.org>
Subject: Re: [RFC v4 03/25] m68k/atari: Move Atari-specific code out of drivers/char/nvram.c
Date: Mon, 13 Jul 2015 20:13:44 +0200
Message-ID: <87d1zwc4dj.fsf@igel.home>
References: <20150712102527.356151908@telegraphics.com.au>
	<20150712102528.107134628@telegraphics.com.au>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-out.m-online.net ([212.18.0.9]:58465 "EHLO
	mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751748AbbGMSNu (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Mon, 13 Jul 2015 14:13:50 -0400
In-Reply-To: <20150712102528.107134628@telegraphics.com.au> (Finn Thain's
	message of "Sun, 12 Jul 2015 20:25:30 +1000")
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Finn Thain <fthain@telegraphics.com.au>
Cc: linux-kernel@vger.kernel.org, linux-m68k@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, Geert Uytterhoeven <geert@linux-m68k.org>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>

Finn Thain <fthain@telegraphics.com.au> writes:

> BTW, I didn't change the SCSI ID location in NVRAM. This code says 16
> whereas atari_scsi says 14. Which one is correct?

I think atari_scsi is wrong.  The best source I could find
(http://www.gratifiant.com/nvram-falcon-t561185) places it after the
video mode byte, thus at byte 16.

Andreas.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 58CA 54C7 6D53 942B 1756  01D3 44D5 214B 8276 4ED5
"And now for something completely different."
