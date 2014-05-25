From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH RESEND 4/4] m68k/atari: fix SCC initialization for debug console
Date: Sun, 25 May 2014 11:09:37 +0200
Message-ID: <CAMuHMdUnoZVpq79LPPFN1dop8r0fMJYi7knT9a+pUHFqBAxEfQ@mail.gmail.com>
References: <20140411052757.888960081@telegraphics.com.au>
	<20140411052759.169790206@telegraphics.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-ig0-f177.google.com ([209.85.213.177]:57069 "EHLO
	mail-ig0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750811AbaEYJJi (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 25 May 2014 05:09:38 -0400
Received: by mail-ig0-f177.google.com with SMTP id l13so2170827iga.16
        for <linux-m68k@vger.kernel.org>; Sun, 25 May 2014 02:09:37 -0700 (PDT)
In-Reply-To: <20140411052759.169790206@telegraphics.com.au>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Finn Thain <fthain@telegraphics.com.au>
Cc: Michael Schmitz <schmitz@debian.org>, Linux/m68k <linux-m68k@vger.kernel.org>

On Fri, Apr 11, 2014 at 7:28 AM, Finn Thain <fthain@telegraphics.com.au> wrote:
> Fix SCC initialization for Atari as was previously fixed for Mac. It's
> probably not practical to share more code but some attempt is made to
> align the Mac and Atari variants.
>
> Signed-off-by: Finn Thain <fthain@telegraphics.com.au>
>
> ---
> This patch needs testing on Atari. It can't be tested without editing
> macro definitions to enable SCC debug output (which also means disabling
> MFP debug output).
>
> The line rate is changed to 38400 baud to match the Mac code (which
> follows the pmac_zilog serial console default). It would be nice to
> standardize but I don't know whether this is realistic.
>
> The 7.9872 MHz PCLK used in this patch was inferred from the existing code
> as I don't have any hardware data.

Has anyone tested this on Atari?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
