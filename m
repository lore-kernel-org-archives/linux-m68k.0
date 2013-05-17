From: Andreas Schwab <schwab@linux-m68k.org>
Subject: Re: [PATCH][M68K] implement futex.h to support userspace robust futexes and PI mutexes
Date: Fri, 17 May 2013 11:38:56 +0200
Message-ID: <87r4h6lzdb.fsf@hase.home>
References: <20793.61385.652975.797741@pilspetsen.it.uu.se>
	<87y5bem1wf.fsf@hase.home>
	<CAMuHMdVnTz=zq2qP+vgiCQpOze_VttwrogynNy+QcdRAdfz8ag@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-out.m-online.net ([212.18.0.9]:40144 "EHLO
	mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750712Ab3EQJjI (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Fri, 17 May 2013 05:39:08 -0400
In-Reply-To: <CAMuHMdVnTz=zq2qP+vgiCQpOze_VttwrogynNy+QcdRAdfz8ag@mail.gmail.com>
	(Geert Uytterhoeven's message of "Fri, 17 May 2013 11:02:22 +0200")
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Mikael Pettersson <mikpe@it.uu.se>, Linux/m68k <linux-m68k@vger.kernel.org>

Geert Uytterhoeven <geert@linux-m68k.org> writes:

> Hi Andreas, Mikael,
>
> On Fri, May 17, 2013 at 10:44 AM, Andreas Schwab <schwab@linux-m68k.org> wrote:
>> Geert, please push this to 3.10.
>
> Thanks for bringing this under my radar. I completely forgot about this patch,
> sorry about that.
>
> This also needs removal of "generic-y += futex.h" from
> arch/m68k/include/asm/Kbuild. I'll add that.
>
> Andreas: Can I add your acked-by?

Acked-by: Andreas Schwab <schwab@linux-m68k.org>

Thanks, Andreas.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 58CA 54C7 6D53 942B 1756  01D3 44D5 214B 8276 4ED5
"And now for something completely different."
