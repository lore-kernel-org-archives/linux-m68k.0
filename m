From: Greg Ungerer <gregungerer@westnet.com.au>
Subject: Re: [PATCH] m68knommu: allow ColdFire CPUs to use unaligned accesses
Date: Fri, 08 Jun 2012 19:10:55 +1000
Message-ID: <4FD1C19F.4020400@westnet.com.au>
References: <1339134180-13630-1-git-send-email-gerg@snapgear.com> <CAMuHMdWO2HsAP1Xe3cPbHAdUZsY4FyzgXFqy1Aud=ThGs2N=Mg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from outbound-mail03.westnet.com.au ([203.10.1.244]:63330 "EHLO
	outbound-mail03.westnet.com.au" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1754969Ab2FHJLA (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Fri, 8 Jun 2012 05:11:00 -0400
In-Reply-To: <CAMuHMdWO2HsAP1Xe3cPbHAdUZsY4FyzgXFqy1Aud=ThGs2N=Mg@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: gerg@snapgear.com, linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org, Greg Ungerer <gerg@uclinux.org>

On 06/08/2012 05:19 PM, Geert Uytterhoeven wrote:
> On Fri, Jun 8, 2012 at 7:43 AM,<gerg@snapgear.com>  wrote:
>> From: Greg Ungerer<gerg@uclinux.org>
>>
>> All current ColdFire CPUs are able to support unaligned memory accesses.
>> So remove the CONFIG_CPU_HAS_NO_UNALIGNED option selection for ColdFire.
>>
>> It seems that the current restriction was inherrited from the early non-MMU
>> support for the basic 68000 proecssors - which do not support unaligned
>> accesses.
>>
>> Signed-off-by: Greg Ungerer<gerg@uclinux.org>
>
> I'll add this to my tree, as it depends on the other
> CPU_HAS_NO_UNALIGNED patches.

Thanks Geert!

Regards
Greg



> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
>
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                  -- Linus Torvalds
> --
> To unsubscribe from this list: send the line "unsubscribe linux-m68k" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
