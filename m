From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 07/17] [m68k] Atari: EtherNAT ethernet support - new
 driver (smc91x)
Date: Sun, 10 Feb 2013 11:27:34 +0100
Message-ID: <CAMuHMdVfpVMU5hM6FPZoKWEtvRoDYtC_4g56FYUi5im57Sk7_w@mail.gmail.com>
References: <20130131002150.4AE33360095@xplor.waratah.dyndns.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-ie0-f181.google.com ([209.85.223.181]:54029 "EHLO
	mail-ie0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751078Ab3BJK1f (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 10 Feb 2013 05:27:35 -0500
Received: by mail-ie0-f181.google.com with SMTP id 17so6516300iea.40
        for <linux-m68k@vger.kernel.org>; Sun, 10 Feb 2013 02:27:35 -0800 (PST)
In-Reply-To: <20130131002150.4AE33360095@xplor.waratah.dyndns.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitzmic@gmail.com>
Cc: linux-m68k@vger.kernel.org

On Thu, Jan 31, 2013 at 1:21 AM, Michael Schmitz <schmitzmic@gmail.com> wrote:
> [PATCH 07/17] [m68k] Atari: EtherNAT ethernet support - new driver (smc91x)

To be folded into
m68k-queue/m68k-atari-Initial-EtherNAT-SMC91C111-driver.patch etc.

> diff --git a/arch/m68k/Kconfig.devices b/arch/m68k/Kconfig.devices
> index c4cdfe4..6d8abf0 100644
> --- a/arch/m68k/Kconfig.devices
> +++ b/arch/m68k/Kconfig.devices
> @@ -55,6 +55,27 @@ config NFETH
>           which will emulate a regular ethernet device while presenting an
>           ethertap device to the host system.
>
> +config ATARI_ETHERNEC

This doesn't belong in this patch.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
