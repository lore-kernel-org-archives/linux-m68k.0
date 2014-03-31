From: Michael Schmitz <schmitzmic@gmail.com>
Subject: Re: [PATCH 1/4] m68k/atari - stram: alloc ST-RAM pool even if kernel
 not in ST-RAM
Date: Mon, 31 Mar 2014 14:58:55 +1300
Message-ID: <CAOmrzkK+Fh_9Lz0XvkZRGv9NRiKdr3RfENqaLMO2BHrZJxNxrA@mail.gmail.com>
References: <1396137686-32678-1-git-send-email-schmitz@debian.org>
	<1396137686-32678-2-git-send-email-schmitz@debian.org>
	<CAMuHMdXBHrh8ZP5mU2VaRkbsssf0_NHKWdh_e27gMGJZtWj5WQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-oa0-f45.google.com ([209.85.219.45]:46775 "EHLO
	mail-oa0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751889AbaCaB6z (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 30 Mar 2014 21:58:55 -0400
Received: by mail-oa0-f45.google.com with SMTP id eb12so8595207oac.18
        for <linux-m68k@vger.kernel.org>; Sun, 30 Mar 2014 18:58:55 -0700 (PDT)
In-Reply-To: <CAMuHMdXBHrh8ZP5mU2VaRkbsssf0_NHKWdh_e27gMGJZtWj5WQ@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linux/m68k <linux-m68k@vger.kernel.org>, Debian m68k <debian-68k@lists.debian.org>, Michael Schmitz <schmitz@debian.org>

Hi Geert,

will do. Likewise for the external framebuffer case.

I'm still hung up on the SCSI behaviour with current kernels - may
have managed to trash the SCSI disk filesystems or partitions with an
earlier version of these patches.

Cheers,

  Michael


On Mon, Mar 31, 2014 at 8:11 AM, Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
> Hi Michael,
>
> On Sun, Mar 30, 2014 at 1:01 AM, Michael Schmitz <schmitzmic@gmail.com> wrote:
>> +               pr_debug("atari_stram pool: size = %lu bytes, resource = %pR\n",
>> +                       pool_size, &stram_pool);
>> +               pr_debug("atari_stram pool: start = %p, end = %p\n",
>> +                       (void *) stram_pool.start, (void *) stram_pool.end);
>
> Please drop this line, as it prints more or less the same as the %pR in the
> line above. Also in the other block.
>
>> +               pr_debug("atari_stram pool: stram_virt_offset = %p\n",
>> +                       (void *) stram_virt_offset);
>
> Please use "%lx", and drop the cast to "void *". Also in the other block.
>
> Thanks!
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
