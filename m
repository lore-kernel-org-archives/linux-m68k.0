From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v2] m68k/mac: Fix scsi_type for Mac LC and similar models
Date: Sun, 11 Jan 2015 11:44:13 +0100
Message-ID: <CAMuHMdU-wgj5Ne=S1E52gOTj+f9QrNYGJbnqkRUnj_zQbbtG2Q@mail.gmail.com>
References: <alpine.LNX.2.00.1501051421480.21732@nippy.intranet>
	<alpine.LNX.2.00.1501071104260.12963@nippy.intranet>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-lb0-f181.google.com ([209.85.217.181]:49642 "EHLO
	mail-lb0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751593AbbAKKoP (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 11 Jan 2015 05:44:15 -0500
Received: by mail-lb0-f181.google.com with SMTP id l4so13960656lbv.12
        for <linux-m68k@vger.kernel.org>; Sun, 11 Jan 2015 02:44:14 -0800 (PST)
In-Reply-To: <alpine.LNX.2.00.1501071104260.12963@nippy.intranet>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Finn Thain <fthain@telegraphics.com.au>
Cc: Linux/m68k <linux-m68k@vger.kernel.org>

On Wed, Jan 7, 2015 at 1:17 AM, Finn Thain <fthain@telegraphics.com.au> wrote:
> Designing Cards and Drivers for the Macintosh Family, 3rd ed. on page 310
> says that the I/O address space for the Mac LC is $50F0 0000 - $50FF FFFF.
> The developer notes for the Classic II, LC III and IIvx/IIvi give the same
> I/O address space.
>
> That means I've assigned the wrong platform resources to those Mac models.
> Fix the scsi_type initialization for the affected models, to restore the
> SCSI base address to its value prior to Linux 3.18.
>
> Also rename MAC_SCSI_CCL as MAC_SCSI_LC for the sake of correct chronology.
>
> Signed-off-by: Finn Thain <fthain@telegraphics.com.au>

Thanks, v2 applied and queued for 3.20.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
