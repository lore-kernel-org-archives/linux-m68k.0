From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 17/17] [m68k] Atari: NetUSBee tweaks for ISP1160 USB HCD
 driver (updated patch)
Date: Sun, 10 Feb 2013 19:50:37 +0100
Message-ID: <CAMuHMdWaMAQK3q+ZtMV7b0Fq==KuSEPKvXXU4r_YcCdkqU+QPA@mail.gmail.com>
References: <20130131205445.22899360952@xplor.waratah.dyndns.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-ia0-f177.google.com ([209.85.210.177]:56626 "EHLO
	mail-ia0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756705Ab3BJSuh (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 10 Feb 2013 13:50:37 -0500
Received: by mail-ia0-f177.google.com with SMTP id k38so367564iah.8
        for <linux-m68k@vger.kernel.org>; Sun, 10 Feb 2013 10:50:37 -0800 (PST)
In-Reply-To: <20130131205445.22899360952@xplor.waratah.dyndns.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitzmic@gmail.com>
Cc: linux-m68k@vger.kernel.org

On Thu, Jan 31, 2013 at 9:54 PM, Michael Schmitz <schmitzmic@gmail.com> wrote:
> [PATCH 17/17] [m68k] Atari: NetUSBee tweaks for ISP1160 USB HCD driver
>         Some tweaks necessary to make the NetUSBee driver work with
>         both USB ports - something in the NetUSBee design makes the
>         second port shut down due to overcurrent otherwise. As all
>         NetUSBee stuff, this is provided by David.

Should probably be folded into "[PATCH 16/17] [m68k] Atari: Add ISP1160
USB host controller support (EtherNAT/NetUSBee)"

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
