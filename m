From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 01/12] m68knommu: add clock creation support macro for
 other ColdFire CPUs
Date: Fri, 16 Nov 2012 07:30:09 +0100
Message-ID: <CAMuHMdUo=cqA=KHhV8+nBMB+sG0wMx9JD5Tds3Ur04524Sgszw@mail.gmail.com>
References: <1353041256-2959-1-git-send-email-gerg@snapgear.com>
	<1353041256-2959-2-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-vb0-f46.google.com ([209.85.212.46]:34987 "EHLO
	mail-vb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750853Ab2KPGaK (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Fri, 16 Nov 2012 01:30:10 -0500
Received: by mail-vb0-f46.google.com with SMTP id ff1so2542538vbb.19
        for <linux-m68k@vger.kernel.org>; Thu, 15 Nov 2012 22:30:09 -0800 (PST)
In-Reply-To: <1353041256-2959-2-git-send-email-gerg@snapgear.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: gerg@snapgear.com
Cc: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org, Greg Ungerer <gerg@uclinux.org>

On Fri, Nov 16, 2012 at 5:47 AM,  <gerg@snapgear.com> wrote:
> With this we will be able to define simple clock trees for all ColdFire
> CPU types, even though will not be able to be enabled or disabled. They
                         ^ they

> will be able to report the clock rate.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
