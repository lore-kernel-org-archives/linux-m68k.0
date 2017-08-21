From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] m68k: allow ColdFire m5441x parts to run with MMU enabled
Date: Mon, 21 Aug 2017 22:11:35 +0200
Message-ID: <CAMuHMdXVG2QXpRV_VH3JLYbNDRBXHJv6otV-jSKEK02HSOCr0Q@mail.gmail.com>
References: <bc3dc168-aaae-1271-b73b-4d649db5e301@sysam.it>
 <d1ce1669-0286-ebad-7c6c-e9dfe37c266c@sysam.it> <30318b18-e955-1615-975e-9b378d3201b8@westnet.com.au>
 <c095233b-15fc-53f7-c21d-a6c805711040@sysam.it> <0e1723eb-0724-7007-5b63-7d80112268a2@westnet.com.au>
 <d4e220c9-f607-cf9a-2e63-910e745dbea9@sysam.it> <c5dfd7b3-3266-1ecd-1dbf-e66bd9f5aa32@westnet.com.au>
 <f7d80fbd-3b99-66c5-38f5-592780703f96@sysam.it> <590226cf-890a-449b-6bd4-f461fff2938b@westnet.com.au>
 <c8916578-7f5a-707d-e59d-d4d274cbf7a1@sysam.it> <702374e9-7c94-1cbe-306a-d39a1fb70fdd@westnet.com.au>
 <ac5b376c-9ea9-7a62-7f01-d70d9b1e8121@sysam.it>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pg0-f68.google.com ([74.125.83.68]:35166 "EHLO
        mail-pg0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753739AbdHUULg (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Mon, 21 Aug 2017 16:11:36 -0400
Received: by mail-pg0-f68.google.com with SMTP id m133so5845772pga.2
        for <linux-m68k@vger.kernel.org>; Mon, 21 Aug 2017 13:11:36 -0700 (PDT)
In-Reply-To: <ac5b376c-9ea9-7a62-7f01-d70d9b1e8121@sysam.it>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Angelo Dureghello <angelo@sysam.it>
Cc: Greg Ungerer <gregungerer@westnet.com.au>, Linux/m68k <linux-m68k@vger.kernel.org>

Hi Angelo,

On Mon, Aug 21, 2017 at 4:58 PM, Angelo Dureghello <angelo@sysam.it> wrote:
> On 21/08/2017 09:15, Greg Ungerer wrote:
>> Can you apply the attached patch and get any extra debug?
>
> Sure. Done as you required, removed all my debug parts
> and just added yours.
>
> Not sure why, but seems there is now a kind of rollback, as the error
> now comes again before reaching your printk line. Also some strange
> ctrl char is printed at each line begin, in the debug printf.

See include/linux/kern_levels.h.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
