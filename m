From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: Atafb failed to detect the video mode on ARAnyM after kexec
Date: Wed, 18 Sep 2013 13:36:54 +0200
Message-ID: <CAMuHMdVnWu4TCNLsM6Y2emQYe=s4PnZXeggtWpzPQXSu0FJdUw@mail.gmail.com>
References: <CAMuHMdVFRb_-YmjV5VEh1nNsifgyQhw=J3UXHak_vgKix53QSA@mail.gmail.com>
	<CAOmrzkL0-4bUwWA+MNNGATEMaf4Q5Px-k_OFwz_P=8Hd96tL4A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pb0-f51.google.com ([209.85.160.51]:58284 "EHLO
	mail-pb0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752183Ab3IRLgz (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 18 Sep 2013 07:36:55 -0400
Received: by mail-pb0-f51.google.com with SMTP id jt11so6928316pbb.10
        for <linux-m68k@vger.kernel.org>; Wed, 18 Sep 2013 04:36:54 -0700 (PDT)
In-Reply-To: <CAOmrzkL0-4bUwWA+MNNGATEMaf4Q5Px-k_OFwz_P=8Hd96tL4A@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitzmic@gmail.com>
Cc: Linux/m68k <linux-m68k@vger.kernel.org>

On Wed, Sep 18, 2013 at 10:50 AM, Michael Schmitz <schmitzmic@gmail.com> wrote:
> On Fri, Sep 13, 2013 at 9:34 AM, Geert Uytterhoeven
> <geert@linux-m68k.org> wrote:
>> When doing a kexec (WIP) on ARAnyM while the screen was blanked, the
>> kexec'd kernel failed to initialize atafb. If the screen isn't
>> blanked, it works fine.
>>
>> Difference between success and failure is:
>>
>>  atafb_init: start
>>  atafb_init: initializing Falcon hw
>> -atafb: screen_base 0068c000 real_screen_base 0068c000 screen_len 311296
>> -Determined 640x480, depth 4
>> -   virtual 640x972
>> -Console: switching to colour frame buffer device 80x30
>> -fb0: frame buffer device, using 304K of video memory
>> +atafb: screen_base 0068c000 real_screen_base 0068c000 screen_len 4096
>
> That's odd - the screen size has been lost completely.

falcon_blank() clears several videl registers, while falcon_detect()
reads them to detect the current video mode.

>> I guess atafb should unblank on shutdown to restore the videl registers, so it
>> will detect the correct video mode on re-initialization?
>
> That might be the best option (and would be helpful anyway).

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
