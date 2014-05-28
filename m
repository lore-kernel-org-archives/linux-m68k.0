From: Michael Schmitz <schmitzmic@gmail.com>
Subject: Re: [PATCH v3 0/4] Atari kernel-in-FastRAM patches v3
Date: Wed, 28 May 2014 12:18:55 +1200
Message-ID: <CAOmrzk+=ccumZNU0tySmce+9AXFLJTxQ43pYY3jRpxzLSfZ5kw@mail.gmail.com>
References: <1396253168-25601-1-git-send-email-schmitz@debian.org>
	<CAMuHMdVcn2sRZXvSTWQay879maoUbxB46n2w7E9S8jRuWPfniw@mail.gmail.com>
	<CAOmrzkJFqR4FzKaQGwa9vjzCM+OEP2mre=qRWuxbeH-imPhEXQ@mail.gmail.com>
	<5384533B.1050501@gmail.com>
	<CAMuHMdWjUqEsrMXMbWdbtG8SXCuMaQUchMssDDud-b2VkiC+uA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-oa0-f52.google.com ([209.85.219.52]:55316 "EHLO
	mail-oa0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752908AbaE1AS4 (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 27 May 2014 20:18:56 -0400
Received: by mail-oa0-f52.google.com with SMTP id eb12so10396527oac.39
        for <linux-m68k@vger.kernel.org>; Tue, 27 May 2014 17:18:55 -0700 (PDT)
In-Reply-To: <CAMuHMdWjUqEsrMXMbWdbtG8SXCuMaQUchMssDDud-b2VkiC+uA@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linux/m68k <linux-m68k@vger.kernel.org>, Debian m68k <debian-68k@lists.debian.org>

Hi Geert,

>> Found the error, most likely - when the kernel runs in FastRAM,
>> m68k_num_memory is == 1. Is there a way to access the bootinfo view of the
>> number of memory chunks after the MMU init code has tweaked m68k_num_memory,
>> Geert?
>
> You mean the ones that were removed due to "Ignoring memory chunk"?

These ones exactly.

> No, bootinfo is gone, unless saved for kexec with CONFIG_BOOTINFO_PROC=y.
>
> What exactly is the issue?

When deciding whether a ST-RAM DMA buffer needs to be allocated, the
Atari SCSI driver checks whether there's more than a single chunk of
RAM (there's always ST-RAM, so the second one indicates FastRAM).
That's no longer a good test now with the kernel capable of running
from FastRAM (and the ST-RAM chunk being dropped in MM init).

Maybe we need another variable to hold the number of memory chunks
before adjustment. Or look at size or physical base address of the
first chunk...

Cheers,

  Michael


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
