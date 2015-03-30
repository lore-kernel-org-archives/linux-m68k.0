From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v2] m68k/mac: Fix out-of-bounds array index in OSS IRQ
 source initialization
Date: Mon, 30 Mar 2015 10:17:40 +0200
Message-ID: <CAMuHMdWP+Rwy7v9S0LP5i2gsTBD7FTxbDWLFHJMs97ZsgEHEBA@mail.gmail.com>
References: <alpine.LNX.2.00.1503281605050.26059@nippy.intranet>
	<alpine.LNX.2.00.1503301222220.18094@nippy.intranet>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-oi0-f52.google.com ([209.85.218.52]:33397 "EHLO
	mail-oi0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753282AbbC3IRk (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Mon, 30 Mar 2015 04:17:40 -0400
Received: by oifl3 with SMTP id l3so121694156oif.0
        for <linux-m68k@vger.kernel.org>; Mon, 30 Mar 2015 01:17:40 -0700 (PDT)
In-Reply-To: <alpine.LNX.2.00.1503301222220.18094@nippy.intranet>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Finn Thain <fthain@telegraphics.com.au>
Cc: Linux/m68k <linux-m68k@vger.kernel.org>, David Binderman <dcb314@hotmail.com>

On Mon, Mar 30, 2015 at 3:22 AM, Finn Thain <fthain@telegraphics.com.au> wrote:
> ---
>
> Changes since v1:
> - remove pointless braces

Thanks!

Applied with re-added lost RB and SoB from v1, and queued for v4.1.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
