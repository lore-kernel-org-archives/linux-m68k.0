From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] m68knommu: change definitions of __pa() and __va()
Date: Mon, 11 Jan 2010 16:44:08 +0100
Message-ID: <10f740e81001110744n5aaf6b4ay1afe28671f20e2c5@mail.gmail.com>
References: <201001110502.o0B52HG3024292@goober.internal.moreton.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-ew0-f214.google.com ([209.85.219.214]:53563 "EHLO
	mail-ew0-f214.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753108Ab0AKPoK (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Mon, 11 Jan 2010 10:44:10 -0500
Received: by ewy6 with SMTP id 6so22139192ewy.29
        for <linux-m68k@vger.kernel.org>; Mon, 11 Jan 2010 07:44:08 -0800 (PST)
In-Reply-To: <201001110502.o0B52HG3024292@goober.internal.moreton.com.au>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Greg Ungerer <gerg@snapgear.com>
Cc: gerg@uclinux.org, linux-m68k@vger.kernel.org

On Mon, Jan 11, 2010 at 06:02, Greg Ungerer <gerg@snapgear.com> wrote:
> I would like to submit this to Linus ASAP, to fix broken compilation
> in 2.6.33-rc3 for m68knommu targets. It effects m68k includes, so I
> wanted to get some review here first.

The m68kmmu part looks fine to me.

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
