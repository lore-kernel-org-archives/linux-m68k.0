From: Greg Ungerer <gerg@snapgear.com>
Subject: Re: [PATCH v3 5/6] m68k: remove duplicate memcpy() implementation
Date: Tue, 24 May 2011 09:55:37 +1000
Message-ID: <4DDAF3F9.30209@snapgear.com>
References: <1303345491-27888-1-git-send-email-gerg@snapgear.com>	<1303345491-27888-2-git-send-email-gerg@snapgear.com>	<1303345491-27888-3-git-send-email-gerg@snapgear.com>	<1303345491-27888-4-git-send-email-gerg@snapgear.com>	<1303345491-27888-5-git-send-email-gerg@snapgear.com>	<1303345491-27888-6-git-send-email-gerg@snapgear.com>	<BANLkTi=3K=J_UrG5f-sRZDG2oiWcjejkKg@mail.gmail.com> <m2sjs542hh.fsf@igel.home>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from sncsmrelay2.nai.com ([67.97.80.206]:56504 "EHLO
	sncsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752467Ab1EWXzU (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Mon, 23 May 2011 19:55:20 -0400
In-Reply-To: <m2sjs542hh.fsf@igel.home>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Andreas Schwab <schwab@linux-m68k.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org, Greg Ungerer <gerg@uclinux.org>

On 24/05/11 05:54, Andreas Schwab wrote:
> Geert Uytterhoeven<geert@linux-m68k.org>  writes:
>
>> FWIW, my m68k-linux-gnu-gcc (4.1.2 20061115 (prerelease)) always defines
>> __mc68000__ and __mc68020__, even when specifying -m68000 on the command
>> line.
>
> m68k-linux has always defined __mc68020__ unconditionally, because it
> does not support anything less.

I don't beleive that is always the case:


$ m68k-linux-gcc -m68000 -dM -E - < /dev/null | grep 68020

$ m68k-linux-gcc -m5200 -dM -E - < /dev/null | grep 68020

$ m68k-linux-gcc -dM -E - < /dev/null | grep 68020
#define __mc68020__ 1
#define __mc68020 1
#define mc68020 1

$ m68k-linux-gcc -mcpu32 -dM -E - < /dev/null | grep 68020
#define __mc68020__ 1
#define __mc68020 1
#define mc68020 1

$ m68k-linux-gcc --version
m68k-linux-gcc (GCC) 4.5.1
Copyright (C) 2010 Free Software Foundation, Inc.
This is free software; see the source for copying conditions.  There is NO
warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

Regards
Greg


------------------------------------------------------------------------
Greg Ungerer  --  Principal Engineer        EMAIL:     gerg@snapgear.com
SnapGear Group, McAfee                      PHONE:       +61 7 3435 2888
8 Gardner Close                             FAX:         +61 7 3217 5323
Milton, QLD, 4064, Australia                WEB: http://www.SnapGear.com
