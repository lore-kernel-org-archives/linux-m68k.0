From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [RFC] m68k/mac: Remove SONIC interrupt hack
Date: Thu, 9 Feb 2017 11:56:21 +0100
Message-ID: <CAMuHMdXJVp5woERxKY9tjTD_JNVP=cTJ_0WT1TrmL52rknUZ9Q@mail.gmail.com>
References: <alpine.LNX.2.00.1612121404080.16984@nippy.intranet>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-it0-f68.google.com ([209.85.214.68]:35210 "EHLO
        mail-it0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752113AbdBIK5M (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Thu, 9 Feb 2017 05:57:12 -0500
Received: by mail-it0-f68.google.com with SMTP id 203so1867553ith.2
        for <linux-m68k@vger.kernel.org>; Thu, 09 Feb 2017 02:56:23 -0800 (PST)
In-Reply-To: <alpine.LNX.2.00.1612121404080.16984@nippy.intranet>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Finn Thain <fthain@telegraphics.com.au>
Cc: Linux/m68k <linux-m68k@vger.kernel.org>, Laurent Vivier <laurent@vivier.eu>, Michael Schmitz <schmitzmic@gmail.com>

Hi Finn,

On Mon, Dec 12, 2016 at 4:45 AM, Finn Thain <fthain@telegraphics.com.au> wrote:
> BTW, is it possible to get an error message printed to the console when an
> irq is raised for which there is no handler? (Neglecting that this could

The IRQ core code already does that, but...

> happen even before the early console starts...)

... yep, you guessed right ;-)

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
