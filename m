From: "Matthias Reis" <matthias.reis@physik.tu-berlin.de>
Subject: Re: memcpy on 68000
Date: Fri, 29 Jul 2011 16:01:47 +0200
Message-ID: <cdc56050e936eb87808c0e183b6cf1c3.squirrel@www.physik.tu-berlin.de>
References: <caf33f7e8bf8202bde374315ce6c0961.squirrel@www.physik.tu-berlin.de>
    <4E31146E.3060007@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail.tu-berlin.de ([130.149.7.33]:36849 "EHLO mail.tu-berlin.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753774Ab1G2OB4 (ORCPT <rfc822;linux-m68k@vger.kernel.org>);
	Fri, 29 Jul 2011 10:01:56 -0400
In-Reply-To: <4E31146E.3060007@snapgear.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Greg Ungerer <gerg@snapgear.com>
Cc: Matthias Reis <matthias.reis@physik.tu-berlin.de>, linux-m68k@vger.kernel.org

Hi Greg,

thanks for the fix. I'll test this as soon as I get my own PC back... I
use Geert's master tree as code basis.

Best regards,
Matthias


> That looks to be the memcpy.c from linux-3.0, yes?
>
> Looking at the memcpy.c code for m68knommu before merging
> and cleanup I can see that it used to do this:
>
>    const char *c_from = from;
>    char *c_to = to;
>    while (n-- > 0)
>      *c_to++ = *c_from++;
>    return((void *) to);
>
> for the the M68000 case. (Actually it did that for all
> non-ColdFire cases). Which obviously would always work,
> but is not particularly efficient.
>
> So, yes, the current code is broken for M68000. It doesn't
> check alignment of the source ("from") address.
>
> Heres a first attempt at a fix for this. This is only compile
> tested, not run tested... Basically we check that if after
> 16bit aligning the destination if the source is unaligned
> then we resort to a byte wise copy.
>
> Need to check if CPU32 needs this or not too. ColdFire doesn't.
