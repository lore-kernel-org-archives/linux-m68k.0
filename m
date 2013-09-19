From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: Atafb failed to detect the video mode on ARAnyM after kexec
Date: Thu, 19 Sep 2013 14:11:14 +0200
Message-ID: <CAMuHMdV4VkpLxTgUa2Be1=N5MBRUyExvcTiUjQ-hGEEmOM=LHA@mail.gmail.com>
References: <CAMuHMdVFRb_-YmjV5VEh1nNsifgyQhw=J3UXHak_vgKix53QSA@mail.gmail.com>
	<CAOmrzkL0-4bUwWA+MNNGATEMaf4Q5Px-k_OFwz_P=8Hd96tL4A@mail.gmail.com>
	<CAMuHMdVnWu4TCNLsM6Y2emQYe=s4PnZXeggtWpzPQXSu0FJdUw@mail.gmail.com>
	<CAOmrzk+e1ku-B4tUOWtXe5-GaEVsOuvaVFdftkELmD02pPD9fw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pb0-f44.google.com ([209.85.160.44]:40677 "EHLO
	mail-pb0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753874Ab3ISMLP (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Thu, 19 Sep 2013 08:11:15 -0400
Received: by mail-pb0-f44.google.com with SMTP id xa7so8305422pbc.31
        for <linux-m68k@vger.kernel.org>; Thu, 19 Sep 2013 05:11:14 -0700 (PDT)
In-Reply-To: <CAOmrzk+e1ku-B4tUOWtXe5-GaEVsOuvaVFdftkELmD02pPD9fw@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitzmic@gmail.com>
Cc: Linux/m68k <linux-m68k@vger.kernel.org>

On Thu, Sep 19, 2013 at 1:42 PM, Michael Schmitz <schmitzmic@gmail.com> wrote:
>>>> When doing a kexec (WIP) on ARAnyM while the screen was blanked, the
>>>> kexec'd kernel failed to initialize atafb. If the screen isn't
>>>> blanked, it works fine.
>>
>> falcon_blank() clears several videl registers, while falcon_detect()
>> reads them to detect the current video mode.
>
> I suppose we can't just leave the cleared registers loaded when kexec
> support is compiled in, and effect screen blanking in another way
> (color map)?
>
> Can the screen be blanked/unblanked from user space (fbset)?

You can unblank from userspace.

Probably the right way is to convert atafb to use a platform device first,
and hook up its shutdown() method later.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
