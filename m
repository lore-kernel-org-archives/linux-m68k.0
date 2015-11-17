From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 0/8] Amiga XSurf100 patch series, to be submitted to linux-net
Date: Tue, 17 Nov 2015 21:02:49 +0100
Message-ID: <CAMuHMdXSmRFOCzFLNtZ0uFrJcKee956KmmatXSdV1oKxPX1TjQ@mail.gmail.com>
References: <1447716797-20906-1-git-send-email-schmitzmic@gmail.com>
	<CAMuHMdXOFEgB5diqNdz8QTQHDUecz0naQ+G594JmZztg+h+DTQ@mail.gmail.com>
	<564B6EF6.2020207@mkarcher.dialup.fu-berlin.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-oi0-f52.google.com ([209.85.218.52]:35013 "EHLO
	mail-oi0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751982AbbKQUCu (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 17 Nov 2015 15:02:50 -0500
Received: by oige206 with SMTP id e206so11892759oig.2
        for <linux-m68k@vger.kernel.org>; Tue, 17 Nov 2015 12:02:49 -0800 (PST)
In-Reply-To: <564B6EF6.2020207@mkarcher.dialup.fu-berlin.de>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Karcher <kernel@mkarcher.dialup.fu-berlin.de>
Cc: Michael Schmitz <schmitzmic@gmail.com>, Linux/m68k <linux-m68k@vger.kernel.org>, Debian m68k <debian-68k@lists.debian.org>

Hi Michael,

On Tue, Nov 17, 2015 at 7:16 PM, Michael Karcher
<kernel@mkarcher.dialup.fu-berlin.de> wrote:
> On 17.11.2015 09:18, Geert Uytterhoeven wrote:
>> Please don't put drivers in arch/m68k/. drivers/net is fine for a
>> pure-net driver.
> There is a USB daughterboard on the XSurf 100 card, so it will no longer
> be pure-net if that daughterboard is installed.

Then it will definitely benefit from the MFD subsystem!

MFD drivers are typically under drivers/mfd/, but if we go that way for
generic Zorro drivers, I would store them under drivers/zorro/, if the MFD
maintainer won't object.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
