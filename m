From: Greg Ungerer <gerg@snapgear.com>
Subject: Re: [PATCH] m68knommu: change definitions of __pa() and __va()
Date: Tue, 12 Jan 2010 10:25:41 +1000
Message-ID: <4B4BC185.1030509@snapgear.com>
References: <201001110502.o0B52HG3024292@goober.internal.moreton.com.au> <10f740e81001110744n5aaf6b4ay1afe28671f20e2c5@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from rex.securecomputing.com ([203.24.151.4]:58720 "EHLO
	cyberguard.com.au" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1753417Ab0ALAZa (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Mon, 11 Jan 2010 19:25:30 -0500
In-Reply-To: <10f740e81001110744n5aaf6b4ay1afe28671f20e2c5@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: gerg@uclinux.org, linux-m68k@vger.kernel.org


Hi Geert,

Geert Uytterhoeven wrote:
> On Mon, Jan 11, 2010 at 06:02, Greg Ungerer <gerg@snapgear.com> wrote:
>> I would like to submit this to Linus ASAP, to fix broken compilation
>> in 2.6.33-rc3 for m68knommu targets. It effects m68k includes, so I
>> wanted to get some review here first.
> 
> The m68kmmu part looks fine to me.

Thanks, I'll send it to Linus now.

Regards
Greg


> Gr{oetje,eeting}s,
> 
> 						Geert
> 
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
> 							    -- Linus Torvalds
> 


-- 
------------------------------------------------------------------------
Greg Ungerer  --  Principal Engineer        EMAIL:     gerg@snapgear.com
SnapGear Group, McAfee                      PHONE:       +61 7 3435 2888
8 Gardner Close                             FAX:         +61 7 3217 5323
Milton, QLD, 4064, Australia                WEB: http://www.SnapGear.com
