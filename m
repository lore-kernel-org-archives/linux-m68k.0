From: Andreas Schwab <schwab@linux-m68k.org>
Subject: atakbd_keycode
Date: Sat, 24 Oct 2015 15:35:53 +0200
Message-ID: <87h9lgwfra.fsf@igel.home>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-out.m-online.net ([212.18.0.9]:60431 "EHLO
	mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751653AbbJXNf5 (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sat, 24 Oct 2015 09:35:57 -0400
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Michael Schmitz <schmitzmic@gmail.com>, linux-m68k@vger.kernel.org

In drivers/input/keyboard/atakbd.c, the array atakbd_keycode is
initialized like this:

	[41]	 = KEY_BACKSLASH,	/* FIXME, '#' */
	[43]	 = KEY_GRAVE,		/* FIXME: '~' */

Shouldn't that be the other way round?  According to the Profibuch, on a
US Atari keyboard the key which sends scancode 41 is the '`' key and the
scancode 43 is sent by the '\' key.  On a German keyboard, these are the
'#' and '~' keys, resp.

Andreas.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 58CA 54C7 6D53 942B 1756  01D3 44D5 214B 8276 4ED5
"And now for something completely different."
