From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 0/13] Atari EtherNAT/EtherNEC/NetUSBee support
Date: Wed, 17 Apr 2013 10:01:52 +0200
Message-ID: <CAMuHMdU8svz=FsCDDdn6PXwAOzUdfLSg8DbsD97sTOsS4Qoj8Q@mail.gmail.com>
References: <1365208006-16227-1-git-send-email-schmitz@debian.org>
	<CAMuHMdVv_EAsRUV9FRLmnR5DzaBmW9dPABiMMpuc43G0anMKxw@mail.gmail.com>
	<CAMuHMdV=KmLpwFF24sPr7PXdHJd2_K=LFRjdMORYp4TWwHR7Cg@mail.gmail.com>
	<516E52F4.1020008@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-ie0-f170.google.com ([209.85.223.170]:62880 "EHLO
	mail-ie0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S965703Ab3DQIBx (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 17 Apr 2013 04:01:53 -0400
Received: by mail-ie0-f170.google.com with SMTP id c11so1607335ieb.1
        for <linux-m68k@vger.kernel.org>; Wed, 17 Apr 2013 01:01:53 -0700 (PDT)
In-Reply-To: <516E52F4.1020008@gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitzmic@gmail.com>
Cc: Linux/m68k <linux-m68k@vger.kernel.org>

Hi Michael,

On Wed, Apr 17, 2013 at 9:44 AM, Michael Schmitz <schmitzmic@gmail.com> wrote:
>> I moved the introduction of CONFIG_ETHERNAT and CONFIG_ETHERNEC into
>> the commits that added the corresponding platform devices, so they became
>> independent of the commits that update files under drivers/net/.
>
> Thanks - I'll have a look at what that involves. Sounds reasonable.
>
>> I also queued all arch/m68k commits to for-3.10/for-next.
>
> Hint, hint ... I still haven't submitted net and USB stuff for comments :-(

I know. That's why I moved the Kconfig changes, so I can get the
m68k-specific parts
in without depending on the net/usb changes, as I expect the merge window to
open next weekend.

> We have ANZAC day coming up next week - should give me enough time unless
> sorted before.

Enjoy the holiday ;-)

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
