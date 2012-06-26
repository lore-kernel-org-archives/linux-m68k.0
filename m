From: Greg Ungerer <gerg@snapgear.com>
Subject: Re: [PATCH 1/2] net: add support for NS8390 based eth controllers
 on some ColdFire boards
Date: Tue, 26 Jun 2012 15:16:58 +1000
Message-ID: <4FE945CA.6060509@snapgear.com>
References: <1340587792-8596-1-git-send-email-gerg@snapgear.com> <1340587792-8596-2-git-send-email-gerg@snapgear.com> <CAMuHMdXWCmDfGw65Ckr082xx8x4yJyG62wiNj0i4khxU2k3AhA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from dalsmrelay2.nai.com ([205.227.136.216]:34453 "EHLO
	dalsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750809Ab2FZFRQ (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 26 Jun 2012 01:17:16 -0400
In-Reply-To: <CAMuHMdXWCmDfGw65Ckr082xx8x4yJyG62wiNj0i4khxU2k3AhA@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org

Hi Geert,

On 06/25/2012 05:59 PM, Geert Uytterhoeven wrote:
> On Mon, Jun 25, 2012 at 3:29 AM,<gerg@snapgear.com>  wrote:
>>   arch/m68k/include/asm/mcfne.h       |  129 +---------
>
> mcf8390.h?
> mcfne.h is queued for removal.

I was trying to save it :-)
Do you think I should just silently move the modified mcfne.h
to a mcf8390.h?

Regards
Greg



>>   drivers/net/ethernet/8390/Kconfig   |   14 +
>>   drivers/net/ethernet/8390/Makefile  |    1 +
>>   drivers/net/ethernet/8390/mcf8390.c |  477 +++++++++++++++++++++++++++++++++++
>
> Gr{oetje,eeting}s,
>
>                          Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
>
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                  -- Linus Torvalds

------------------------------------------------------------------------
Greg Ungerer  --  Principal Engineer        EMAIL:     gerg@snapgear.com
SnapGear Group, McAfee                      PHONE:       +61 7 3435 2888
8 Gardner Close,                            FAX:         +61 7 3891 3630
Milton, QLD, 4064, Australia                WEB: http://www.SnapGear.com
