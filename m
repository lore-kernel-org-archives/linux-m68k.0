From: Michael Schmitz <schmitzmic@gmail.com>
Subject: Re: atakbd_keycode
Date: Tue, 27 Oct 2015 20:40:19 +1300
Message-ID: <562F2A63.20105@gmail.com>
References: <87h9lgwfra.fsf@igel.home>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pa0-f54.google.com ([209.85.220.54]:32953 "EHLO
	mail-pa0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752263AbbJ0Hk3 (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 27 Oct 2015 03:40:29 -0400
Received: by pabla5 with SMTP id la5so21472342pab.0
        for <linux-m68k@vger.kernel.org>; Tue, 27 Oct 2015 00:40:28 -0700 (PDT)
In-Reply-To: <87h9lgwfra.fsf@igel.home>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Andreas Schwab <schwab@linux-m68k.org>, Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@vger.kernel.org

Andreas,

you're certainly right there - I used the German keyboard to figure out
the mapping (that's where the FIXMEs are from) and must have looked at a
PC keyboard for some of the DE-US translation.

Thanks for spotting this. I'll better double check the entire keymap
before preparing a patch ...

Cheers,

    Michael


Am 25.10.15 um 02:35 schrieb Andreas Schwab:
> In drivers/input/keyboard/atakbd.c, the array atakbd_keycode is
> initialized like this:
>
> 	[41]	 = KEY_BACKSLASH,	/* FIXME, '#' */
> 	[43]	 = KEY_GRAVE,		/* FIXME: '~' */
>
> Shouldn't that be the other way round?  According to the Profibuch, on a
> US Atari keyboard the key which sends scancode 41 is the '`' key and the
> scancode 43 is sent by the '\' key.  On a German keyboard, these are the
> '#' and '~' keys, resp.
>
> Andreas.
>
