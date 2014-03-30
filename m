From: Andreas Schwab <schwab@linux-m68k.org>
Subject: Re: [PATCH 0/4] Atari kernel-in-FastRAM patches, take three
Date: Mon, 31 Mar 2014 00:34:00 +0200
Message-ID: <8761mvl3jb.fsf@igel.home>
References: <1396137686-32678-1-git-send-email-schmitz@debian.org>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-out.m-online.net ([212.18.0.10]:55381 "EHLO
	mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751897AbaC3WeE (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 30 Mar 2014 18:34:04 -0400
In-Reply-To: <1396137686-32678-1-git-send-email-schmitz@debian.org> (Michael
	Schmitz's message of "Sun, 30 Mar 2014 13:01:22 +1300")
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitzmic@gmail.com>
Cc: linux-m68k@vger.kernel.org, geert@linux-m68k.org, debian-68k@lists.debian.org

Michael Schmitz <schmitzmic@gmail.com> writes:

> see the following patch series for the hopefully final word on 
> the 'make ST-RAM pool accessible for kernels running from FastRAM'
> story.                    

Would you mind sharing your config?  I'm always getting a panic very
early, even before nfcon is ready, which makes it almost impossible to
debug.

Andreas.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 58CA 54C7 6D53 942B 1756  01D3 44D5 214B 8276 4ED5
"And now for something completely different."
