From: Greg Ungerer <gerg@snapgear.com>
Subject: Re: [PATCH v3 5/6] m68k: remove duplicate memcpy() implementation
Date: Thu, 26 May 2011 16:23:53 +1000
Message-ID: <4DDDF1F9.8050902@snapgear.com>
References: <1303345491-27888-1-git-send-email-gerg@snapgear.com>	<1303345491-27888-2-git-send-email-gerg@snapgear.com>	<1303345491-27888-3-git-send-email-gerg@snapgear.com>	<1303345491-27888-4-git-send-email-gerg@snapgear.com>	<1303345491-27888-5-git-send-email-gerg@snapgear.com>	<1303345491-27888-6-git-send-email-gerg@snapgear.com>	<BANLkTi=3K=J_UrG5f-sRZDG2oiWcjejkKg@mail.gmail.com>	<m2sjs542hh.fsf@igel.home>	<BANLkTinjZMVF5q11dORUMUDPkuYPPO=qJQ@mail.gmail.com> <m3wrhgwmid.fsf@linux-m68k.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from sncsmrelay2.nai.com ([67.97.80.206]:47084 "EHLO
	sncsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751037Ab1EZG0c (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Thu, 26 May 2011 02:26:32 -0400
In-Reply-To: <m3wrhgwmid.fsf@linux-m68k.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Andreas Schwab <schwab@linux-m68k.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org, Greg Ungerer <gerg@uclinux.org>

Hi Andreas, Geert,

On 24/05/11 18:06, Andreas Schwab wrote:
> Geert Uytterhoeven<geert@linux-m68k.org>  writes:
>
>> What exactly do you mean by "does not support anything less"? It seems it does
>> restrict instruction generation to 68000 if you ask for it.
>
> The point is that Linux/m68k requires 68020+, so compiling for 68000
> does not make sense (at least back when the gcc configuration was
> created).

Yeah, used to be true :-)
This seems very much to me to be a "broken compiler" issue.

Is it worth putting some form of compiler version limits to protect
compilation in the m68000 case?  (Probably no need to limit it for
the existing 68020+ case).

Are there any other gcc defines that we could use instead?
We need to check with your old compiler Geert :-)

I really don't want to use CONFIG_MMU here (or in bitops.h either).
When I work in the ColdFire MMU code this won't be right.

Regards
Greg


------------------------------------------------------------------------
Greg Ungerer  --  Principal Engineer        EMAIL:     gerg@snapgear.com
SnapGear Group, McAfee                      PHONE:       +61 7 3435 2888
8 Gardner Close                             FAX:         +61 7 3217 5323
Milton, QLD, 4064, Australia                WEB: http://www.SnapGear.com
