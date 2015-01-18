From: Andreas Schwab <schwab@linux-m68k.org>
Subject: Re: CONFIG_DEVTMPFS_MOUNT
Date: Sun, 18 Jan 2015 13:33:09 +0100
Message-ID: <87wq4ke0ai.fsf@igel.home>
References: <CAMuHMdV413F57YQw_ODzjgYAi4ndVgOvJ39k_kL0yksCQF5jAg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-out.m-online.net ([212.18.0.10]:56254 "EHLO
	mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752044AbbARMdN (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 18 Jan 2015 07:33:13 -0500
In-Reply-To: <CAMuHMdV413F57YQw_ODzjgYAi4ndVgOvJ39k_kL0yksCQF5jAg@mail.gmail.com>
	(Geert Uytterhoeven's message of "Sun, 18 Jan 2015 12:50:36 +0100")
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Thorsten Glaser <tg@mirbsd.org>, Stefan Niestegge <beetle@atari.org>, Debian m68k <debian-68k@lists.debian.org>, Linux/m68k <linux-m68k@vger.kernel.org>

Geert Uytterhoeven <geert@linux-m68k.org> writes:

> While init on Beetle's system complained about not being able to open
> tty* with CONFIG_DEVTMPFS_MOUNT disabled, enabling CONFIG_DEVTMPFS_MOUNT
> broke remote login using ssh on my ARAnyM:
>
> $ ssh atari
> PTY allocation request failed on channel 0
> stdin: is not a tty

What are the available ptys and is devpts properly mounted?

Andreas.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 58CA 54C7 6D53 942B 1756  01D3 44D5 214B 8276 4ED5
"And now for something completely different."
