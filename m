From: Michael Schmitz <schmitzmic@gmail.com>
Subject: Re: Atafb failed to detect the video mode on ARAnyM after kexec
Date: Wed, 18 Sep 2013 10:50:02 +0200
Message-ID: <CAOmrzkL0-4bUwWA+MNNGATEMaf4Q5Px-k_OFwz_P=8Hd96tL4A@mail.gmail.com>
References: <CAMuHMdVFRb_-YmjV5VEh1nNsifgyQhw=J3UXHak_vgKix53QSA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-wi0-f170.google.com ([209.85.212.170]:38800 "EHLO
	mail-wi0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751850Ab3IRIuE (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 18 Sep 2013 04:50:04 -0400
Received: by mail-wi0-f170.google.com with SMTP id cb5so6055565wib.5
        for <linux-m68k@vger.kernel.org>; Wed, 18 Sep 2013 01:50:02 -0700 (PDT)
In-Reply-To: <CAMuHMdVFRb_-YmjV5VEh1nNsifgyQhw=J3UXHak_vgKix53QSA@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linux/m68k <linux-m68k@vger.kernel.org>

Geert,

On Fri, Sep 13, 2013 at 9:34 AM, Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
> When doing a kexec (WIP) on ARAnyM while the screen was blanked, the
> kexec'd kernel failed to initialize atafb. If the screen isn't
> blanked, it works fine.
>
> Difference between success and failure is:
>
>  atafb_init: start
>  atafb_init: initializing Falcon hw
> -atafb: screen_base 0068c000 real_screen_base 0068c000 screen_len 311296
> -Determined 640x480, depth 4
> -   virtual 640x972
> -Console: switching to colour frame buffer device 80x30
> -fb0: frame buffer device, using 304K of video memory
> +atafb: screen_base 0068c000 real_screen_base 0068c000 screen_len 4096

That's odd - the screen size has been lost completely.

> I guess atafb should unblank on shutdown to restore the videl registers, so it
> will detect the correct video mode on re-initialization?

That might be the best option (and would be helpful anyway).

Cheers,

  Michael


On Fri, Sep 13, 2013 at 9:34 AM, Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
> When doing a kexec (WIP) on ARAnyM while the screen was blanked, the
> kexec'd kernel failed to initialize atafb. If the screen isn't
> blanked, it works fine.
>
> Difference between success and failure is:
>
>  atafb_init: start
>  atafb_init: initializing Falcon hw
> -atafb: screen_base 0068c000 real_screen_base 0068c000 screen_len 311296
> -Determined 640x480, depth 4
> -   virtual 640x972
> -Console: switching to colour frame buffer device 80x30
> -fb0: frame buffer device, using 304K of video memory
> +atafb: screen_base 0068c000 real_screen_base 0068c000 screen_len 4096
>
> I guess atafb should unblank on shutdown to restore the videl registers, so it
> will detect the correct video mode on re-initialization?
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
> --
> To unsubscribe from this list: send the line "unsubscribe linux-m68k" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
