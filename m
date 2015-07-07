From: Greg Ungerer <gerg@uclinux.org>
Subject: Re: [PATCH 00/10] m68knommu: fix allnoconfig
Date: Tue, 07 Jul 2015 22:22:25 +1000
Message-ID: <559BC481.6010004@uclinux.org>
References: <1436252124-23051-1-git-send-email-gerg@uclinux.org> <CAMuHMdXenF_87nwbiVAM_+or19xCAMLfDExOxRPbKvGk7Q2AuQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from icp-osb-irony-out8.external.iinet.net.au ([203.59.1.225]:37290
	"EHLO icp-osb-irony-out8.external.iinet.net.au" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1754589AbbGGMXS (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 7 Jul 2015 08:23:18 -0400
In-Reply-To: <CAMuHMdXenF_87nwbiVAM_+or19xCAMLfDExOxRPbKvGk7Q2AuQ@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linux/m68k <linux-m68k@vger.kernel.org>

Hi Geert,

On 07/07/15 19:00, Geert Uytterhoeven wrote:
> Hi Greg,
>
> On Tue, Jul 7, 2015 at 8:55 AM, Greg Ungerer <gerg@uclinux.org> wrote:
>> The following set of patches are designed to fix the issues causing a
>> "make allnoconfig" to fail for m68k. There is really only a couple of
>> problems, and those are easily fixed.
> Thanks!
>
> For 1-3:
> Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

Thanks Geert. I will add that on, and push to m68knommu git
tree in the next day or so.

> Now I only have to fix the m68k+MMU allnoconfig build
>
>      $ echo CONFIG_MMU=y > allno.config
>      $ make allnoconfig KCONFIG_ALLCONFIG=1
>
> I have patches for some problems, but not all of them...

Do we care about allmodconfig and allyesconfig?
Looks like problems there too.

Regards
Greg

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
>
