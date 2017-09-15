From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: Installing with new Installer-Image
Date: Fri, 15 Sep 2017 10:51:09 +0200
Message-ID: <CAMuHMdWyuGetiYi2NB0ZVH=KyHYsr_io71=aa2AcjvrB_VkHaQ@mail.gmail.com>
References: <f9c4e93e-342d-9cd2-e7f3-92829c6f5810@abbuc.de>
 <b5f70ff9-2c86-de2c-5ba7-4b78b4816bd0@physik.fu-berlin.de>
 <98ed5d64-d0d6-799e-a13e-63af27df3a4f@abbuc.de> <d20ba6f0-08fc-ca49-18bf-3a5801eaa25d@physik.fu-berlin.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pf0-f194.google.com ([209.85.192.194]:33765 "EHLO
        mail-pf0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750838AbdIOIvK (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Fri, 15 Sep 2017 04:51:10 -0400
Received: by mail-pf0-f194.google.com with SMTP id h4so951597pfk.0
        for <linux-m68k@vger.kernel.org>; Fri, 15 Sep 2017 01:51:10 -0700 (PDT)
In-Reply-To: <d20ba6f0-08fc-ca49-18bf-3a5801eaa25d@physik.fu-berlin.de>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc: Stefan Niestegge <beetle@abbuc.de>, Debian m68k <debian-68k@lists.debian.org>, Linux/m68k <linux-m68k@vger.kernel.org>

Hi Adrian,

On Fri, Sep 15, 2017 at 10:42 AM, John Paul Adrian Glaubitz
<glaubitz@physik.fu-berlin.de> wrote:
> On 09/15/2017 10:35 AM, Stefan Niestegge wrote:
>> - its possible to "modprobe falconide" as well as cdrom, isofs modules

The falconide isn't a platform driver with proper MODULE_ALIAS()  yet,
so its module needs to be loaded based on platform heuristics.
Recent Debian may no longer have those?

>> - dmesg then shows that my Harddrive and my DVD Burner were found as hda,
>> hdb
>> - but no device nodes are created for hda, hdb
>
> Yes, this is what I need to debug next. I had hoped for one of the kernel
> people to chime in and give me a hint what we might be missing here.

Do you have

CONFIG_DEVTMPFS=y
CONFIG_DEVTMPFS_MOUNT=y

?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
