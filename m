From: Greg Ungerer <gerg@snapgear.com>
Subject: Re: [PATCH] m68k/m68knommu: merge MMU and non-MMU string.h
Date: Wed, 8 Sep 2010 22:22:09 +1000
Message-ID: <4C877FF1.30808@snapgear.com>
References: <201009070452.o874qqmg006794@goober.internal.moreton.com.au>	<AANLkTim+jWjOKX_M52DWSKH2+oRWBXqc3TUFQp6esf3r@mail.gmail.com>	<4C8776C5.9030205@snapgear.com> <m3lj7ctpfg.fsf@hase.home>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from dalsmrelay2.nai.com ([205.227.136.216]:10636 "HELO
	dalsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S1752892Ab0IHMWk (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 8 Sep 2010 08:22:40 -0400
In-Reply-To: <m3lj7ctpfg.fsf@hase.home>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Andreas Schwab <schwab@linux-m68k.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k@vger.kernel.org, gerg@uclinux.org


Hi Andreas,

On 08/09/10 22:01, Andreas Schwab wrote:
> Greg Ungerer<gerg@snapgear.com>  writes:
>
>> Hmm, good question. Maybe I should generate stand alone patches
>> without gits rename detection turned on?
>
> How did you manage to create the patch?  When I try I'm unable to get
> this kind of patch even with rename/copy detection (I have set
> diff.renamelimit=0 and diff.renames=copies).

I used:

   git format-patch -M -B <COMMIT-ID>

Regards
Greg
