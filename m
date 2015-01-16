From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] net: smc91x: Remove unused definition of SMC_outw_be()
Date: Fri, 16 Jan 2015 10:58:30 +0100
Message-ID: <CAMuHMdUJR1TOZC8oTW-ZNzmB-eOT_L-drHQGoGDeM7BXoJ+AtA@mail.gmail.com>
References: <1421015954-6743-1-git-send-email-geert@linux-m68k.org>
	<CAMuHMdXiqWw9ejqUT+z6go83iFF8S5Uz5+ans777-W+fdw7uXA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-la0-f41.google.com ([209.85.215.41]:63719 "EHLO
	mail-la0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751519AbbAPJ6b (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Fri, 16 Jan 2015 04:58:31 -0500
Received: by mail-la0-f41.google.com with SMTP id hv19so18038077lab.0
        for <linux-m68k@vger.kernel.org>; Fri, 16 Jan 2015 01:58:30 -0800 (PST)
In-Reply-To: <CAMuHMdXiqWw9ejqUT+z6go83iFF8S5Uz5+ans777-W+fdw7uXA@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitzmic@gmail.com>
Cc: Linux/m68k <linux-m68k@vger.kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>

On Tue, Jan 13, 2015 at 9:51 AM, Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
> On Sun, Jan 11, 2015 at 11:39 PM, Geert Uytterhoeven
> <geert@linux-m68k.org> wrote:
>> As of commit b7e10fc9c1205fc2 ("net: smc91x: Remove Atari special case
>> handling for SMC_PUSH_DATA") SMC_outw_be() is unused. Remove it.
>>
>> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
>
> Applied and folded into "net: smc91x: Add Atari EtherNAT support", which
> now looks upstreamable.

Thanks to all the recent cleanups, the changes needed to support EtherNAT
became really slim, and the support is now in net-next, so it will be in v3.20.

So my next question is: Can "m68k/atari: USB - add ISP1160 USB host
controller support" be simplified, too?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
