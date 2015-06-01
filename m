From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [RFC 01/24] macintosh/nvram: Remove as unused
Date: Mon, 1 Jun 2015 09:40:52 +0200
Message-ID: <CAMuHMdVmoggmChSaDefu4SohCfTYiJeArdT3=i5jqfQwqByV-A@mail.gmail.com>
References: <20150531010132.289674310@telegraphics.com.au>
	<20150531010132.549451549@telegraphics.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-ob0-f178.google.com ([209.85.214.178]:35134 "EHLO
	mail-ob0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751122AbbFAHkx (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Mon, 1 Jun 2015 03:40:53 -0400
In-Reply-To: <20150531010132.549451549@telegraphics.com.au>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Finn Thain <fthain@telegraphics.com.au>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Linux/m68k <linux-m68k@vger.kernel.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, Benjamin Herrenschmidt <benh@kernel.crashing.org>

On Sun, May 31, 2015 at 3:01 AM, Finn Thain <fthain@telegraphics.com.au> wrote:
> Signed-off-by: Finn Thain <fthain@telegraphics.com.au>

Removal seems to be forgotten by full-history-linux
commit 17c6f4635bea74e110ab3558d408c9cd218c568a
Author: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Date:   Fri Feb 6 14:20:56 2004 +1100

    ppc32: Rework nvram management

    move drivers/macintosh/nvram.c to drivers/char/generic_nvram.c,
    update platform hooks,
    fix powermac nvram driver for newer machines

Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
