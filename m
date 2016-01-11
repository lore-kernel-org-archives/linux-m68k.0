From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] m68knommu: fix FEC platform device registration when
 driver is modular
Date: Mon, 11 Jan 2016 08:50:54 +0100
Message-ID: <CAMuHMdXarYfyvy3AHW+=Bmx2NQZigB+a8hjE5J8ikr_R+f8OGQ@mail.gmail.com>
References: <1452475316-20008-1-git-send-email-gerg@uclinux.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-ig0-f175.google.com ([209.85.213.175]:35168 "EHLO
	mail-ig0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750710AbcAKHuy (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Mon, 11 Jan 2016 02:50:54 -0500
Received: by mail-ig0-f175.google.com with SMTP id t15so89860712igr.0
        for <linux-m68k@vger.kernel.org>; Sun, 10 Jan 2016 23:50:54 -0800 (PST)
In-Reply-To: <1452475316-20008-1-git-send-email-gerg@uclinux.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Greg Ungerer <gerg@uclinux.org>
Cc: Linux/m68k <linux-m68k@vger.kernel.org>

On Mon, Jan 11, 2016 at 2:21 AM, Greg Ungerer <gerg@uclinux.org> wrote:
> The FEC (Fast Ethernet Crontroller) module on many ColdFire parts can
> be compiled into the kernel, or as a module. Therefore the platform device
> support for it is required whenever the driver is enabled - not just when
> built into the kernel. Use IS_ENABLED(CONFIG_FEC) instead of a conditional
> check on only the driver being built into the kernel.
>
> Signed-off-by: Greg Ungerer <gerg@uclinux.org>

Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
