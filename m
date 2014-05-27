From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v3 0/4] Atari kernel-in-FastRAM patches v3
Date: Tue, 27 May 2014 11:14:16 +0200
Message-ID: <CAMuHMdWjUqEsrMXMbWdbtG8SXCuMaQUchMssDDud-b2VkiC+uA@mail.gmail.com>
References: <1396253168-25601-1-git-send-email-schmitz@debian.org>
	<CAMuHMdVcn2sRZXvSTWQay879maoUbxB46n2w7E9S8jRuWPfniw@mail.gmail.com>
	<CAOmrzkJFqR4FzKaQGwa9vjzCM+OEP2mre=qRWuxbeH-imPhEXQ@mail.gmail.com>
	<5384533B.1050501@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-ig0-f175.google.com ([209.85.213.175]:52447 "EHLO
	mail-ig0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752456AbaE0JOR (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 27 May 2014 05:14:17 -0400
Received: by mail-ig0-f175.google.com with SMTP id uq10so807064igb.14
        for <linux-m68k@vger.kernel.org>; Tue, 27 May 2014 02:14:16 -0700 (PDT)
In-Reply-To: <5384533B.1050501@gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitzmic@gmail.com>
Cc: Linux/m68k <linux-m68k@vger.kernel.org>, Debian m68k <debian-68k@lists.debian.org>

Hi Michael,

>> Thank you - anyone testing these please note that the Falcon SCSI DMA
>> dribble buffer handling in the SCSI patch is still faulty. You should
>> _not_ attempt to use SCSI when running the kernel in FastRAM.
>
> Found the error, most likely - when the kernel runs in FastRAM,
> m68k_num_memory is == 1. Is there a way to access the bootinfo view of the
> number of memory chunks after the MMU init code has tweaked m68k_num_memory,
> Geert?

You mean the ones that were removed due to "Ignoring memory chunk"?

No, bootinfo is gone, unless saved for kexec with CONFIG_BOOTINFO_PROC=y.

What exactly is the issue?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
