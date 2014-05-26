From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v3 0/4] Atari kernel-in-FastRAM patches v3
Date: Mon, 26 May 2014 22:56:58 +0200
Message-ID: <CAMuHMdVcn2sRZXvSTWQay879maoUbxB46n2w7E9S8jRuWPfniw@mail.gmail.com>
References: <1396253168-25601-1-git-send-email-schmitz@debian.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-ig0-f169.google.com ([209.85.213.169]:60125 "EHLO
	mail-ig0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751800AbaEZU46 (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Mon, 26 May 2014 16:56:58 -0400
Received: by mail-ig0-f169.google.com with SMTP id hl10so377927igb.0
        for <linux-m68k@vger.kernel.org>; Mon, 26 May 2014 13:56:58 -0700 (PDT)
In-Reply-To: <1396253168-25601-1-git-send-email-schmitz@debian.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitzmic@gmail.com>
Cc: Linux/m68k <linux-m68k@vger.kernel.org>, Debian m68k <debian-68k@lists.debian.org>

Hi Michael,

On Mon, Mar 31, 2014 at 10:06 AM, Michael Schmitz <schmitzmic@gmail.com> wrote:
> changes to stram.c and atafb.c patches as requested. The external_addr
> case is still untested - may have other bugs that I've not seen when
> changing the external_addr types.
>
> CC to the relevant lists for floppy and SCSI patches.

Thanks, applied and queued for 3.16.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
