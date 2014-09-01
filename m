From: Michael Schmitz <schmitzmic@gmail.com>
Subject: Re: USB/IP support?
Date: Tue, 2 Sep 2014 11:12:01 +1200
Message-ID: <CAOmrzk+Q_9Oi17doWQf7XyQtFqhxsrMwmtj9HL-PkyUzknifOQ@mail.gmail.com>
References: <CAMuHMdW+yOKA0fswU630HoNd2-BGFMAtBX+kVStgHSgBASBLBg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-qc0-f181.google.com ([209.85.216.181]:49973 "EHLO
	mail-qc0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751464AbaIAXMD (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Mon, 1 Sep 2014 19:12:03 -0400
Received: by mail-qc0-f181.google.com with SMTP id i17so5913285qcy.40
        for <linux-m68k@vger.kernel.org>; Mon, 01 Sep 2014 16:12:01 -0700 (PDT)
In-Reply-To: <CAMuHMdW+yOKA0fswU630HoNd2-BGFMAtBX+kVStgHSgBASBLBg@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Debian m68k <debian-68k@lists.debian.org>, Linux/m68k <linux-m68k@vger.kernel.org>

Hi Geert,

On Mon, Sep 1, 2014 at 9:08 PM, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> v3.17-rc3 gained (well, it was present before in staging) an interesting new
> feature:
>
> config USBIP_CORE
>         tristate "USB/IP support"
>         depends on USB && NET
>         ---help---
>           This enables pushing USB packets over IP to allow remote
>           machines direct access to USB devices. It provides the
>           USB/IP core that is required by both drivers.
>
>           For more details, and to get the userspace utility
>           programs, please see <http://usbip.sourceforge.net/>.
>
>           To compile this as a module, choose M here: the module will
>           be called usbip-core.
>
>           If unsure, say N.
>
> Hence USB is no longer limited to Ataris with NetUSBee, but can be used
> "by proxy" on all network-enabled m68k machines.

Nice ... that's something I have been looking for occasionally.

> Have fun with webcams, TV-cards, ...
>
> Do you think we should enable (modular, of course) USB and its myriads of
> drivers in all defconfigs now?

I would not go quite that far. Test a few things like USB storage
first, perhaps.

Cheers,

    Michael

>
> Gr{oetje,eeting}s,
>
>                         Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
>
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds
> --
> To unsubscribe from this list: send the line "unsubscribe linux-m68k" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
