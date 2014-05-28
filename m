From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v3 0/4] Atari kernel-in-FastRAM patches v3
Date: Wed, 28 May 2014 09:35:55 +0200
Message-ID: <CAMuHMdUjzF8D85jC0VrEh6P+Y2V5pRuhOGO1itnVpZD+7CStGw@mail.gmail.com>
References: <1396253168-25601-1-git-send-email-schmitz@debian.org>
	<CAMuHMdVcn2sRZXvSTWQay879maoUbxB46n2w7E9S8jRuWPfniw@mail.gmail.com>
	<CAOmrzkJFqR4FzKaQGwa9vjzCM+OEP2mre=qRWuxbeH-imPhEXQ@mail.gmail.com>
	<5384533B.1050501@gmail.com>
	<CAMuHMdWjUqEsrMXMbWdbtG8SXCuMaQUchMssDDud-b2VkiC+uA@mail.gmail.com>
	<CAOmrzk+=ccumZNU0tySmce+9AXFLJTxQ43pYY3jRpxzLSfZ5kw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-ig0-f179.google.com ([209.85.213.179]:44020 "EHLO
	mail-ig0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752004AbaE1Hf4 (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 28 May 2014 03:35:56 -0400
Received: by mail-ig0-f179.google.com with SMTP id hn18so2125963igb.0
        for <linux-m68k@vger.kernel.org>; Wed, 28 May 2014 00:35:55 -0700 (PDT)
In-Reply-To: <CAOmrzk+=ccumZNU0tySmce+9AXFLJTxQ43pYY3jRpxzLSfZ5kw@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitzmic@gmail.com>
Cc: Linux/m68k <linux-m68k@vger.kernel.org>, Debian m68k <debian-68k@lists.debian.org>

Hi Michael,

On Wed, May 28, 2014 at 2:18 AM, Michael Schmitz <schmitzmic@gmail.com> wrote:
> When deciding whether a ST-RAM DMA buffer needs to be allocated, the
> Atari SCSI driver checks whether there's more than a single chunk of
> RAM (there's always ST-RAM, so the second one indicates FastRAM).
> That's no longer a good test now with the kernel capable of running
> from FastRAM (and the ST-RAM chunk being dropped in MM init).
>
> Maybe we need another variable to hold the number of memory chunks
> before adjustment. Or look at size or physical base address of the
> first chunk...

That's why DMA masks have been invented. The one in atari_scsi.c seems
to have the bits inverted, compared to all other places in the kernel.

But indeed, that doesn't help for the initial check:

        if (MACH_IS_ATARI && ATARIHW_PRESENT(ST_SCSI) &&
            !ATARIHW_PRESENT(EXTD_DMA) && m68k_num_memory > 1) {
                atari_dma_buffer = atari_stram_alloc(STRAM_BUFFER_SIZE, "SCSI");
                if (!atari_dma_buffer) {
                        printk(KERN_ERR "atari_scsi_detect: can't
allocate ST-RAM "
                                        "double buffer\n");
                        return 0;
                }
                atari_dma_phys_buffer = virt_to_phys(atari_dma_buffer);
                atari_dma_orig_addr = 0;
        }

You can loop over m68k_memory[], and check if any chunk lies outside
the first 16 MiB?

If everything fails, you can allocate it unconditionally (it's just
one 4 KiB page).

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
