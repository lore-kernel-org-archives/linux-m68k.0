From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] brk: COMPAT_BRK: fix detection of randomized brk (was Re:
 [regression v2.6.38] Re: [PATCH v2] brk: fix min_brk lower bound computation forCOMPAT_BRK)
Date: Wed, 6 Apr 2011 22:40:58 +0200
Message-ID: <BANLkTinhTM3pntJauwpxSEd02MDAB+VS1w@mail.gmail.com>
References: <alpine.LNX.2.00.1101030002390.26685@pobox.suse.cz>
	<alpine.LNX.2.00.1101031237210.26685@pobox.suse.cz>
	<alpine.LNX.2.00.1101031421470.26685@pobox.suse.cz>
	<AANLkTinK-TYnY70Wst_FTbEtn7Dwm8wEQoWMewsYM8dh@mail.gmail.com>
	<alpine.LNX.2.00.1103251119120.26754@pobox.suse.cz>
	<AANLkTi=g5z+GYkbOGbdLQcLaQkpY6yQ6tjGRjjk1H59R@mail.gmail.com>
	<alpine.LNX.2.00.1103281619320.26754@pobox.suse.cz>
	<AANLkTi=pNxVY8NZjRhT_aJMQNiTpfkmECqc-ZnTD7ynW@mail.gmail.com>
	<alpine.LNX.2.00.1104061155530.5855@pobox.suse.cz>
	<BANLkTinnvXX70OCrtyYy_2e-zJDqS9f2iw@mail.gmail.com>
	<alpine.LNX.2.00.1104061336190.5855@pobox.suse.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-bw0-f46.google.com ([209.85.214.46]:42222 "EHLO
	mail-bw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932177Ab1DFUlA convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 6 Apr 2011 16:41:00 -0400
In-Reply-To: <alpine.LNX.2.00.1104061336190.5855@pobox.suse.cz>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Jiri Kosina <jkosina@suse.cz>
Cc: Andrew Morton <akpm@linux-foundation.org>, Ingo Molnar <mingo@elte.hu>, linux-kernel@vger.kernel.org, Linux/m68k <linux-m68k@vger.kernel.org>

On Wed, Apr 6, 2011 at 22:38, Jiri Kosina <jkosina@suse.cz> wrote:
> From: Jiri Kosina <jkosina@suse.cz>
> Subject: brk: COMPAT_BRK: fix detection of randomized brk
>
> 5520e89 ("brk: fix min_brk lower bound computation for COMPAT_BRK")
> tried to get the whole logic of brk randomization for legacy (libc5-b=
ased)
> applications finally right.
>
> It turns out that the way to detect whether brk has actually been ran=
domized in
> the end or not introduced by that patch still doesn't work for those =
binaries,
> as reported by Geert.
>
> I don't like it, but currently see no better option than a bit flag i=
n
> task_struct to catch the CONFIG_COMPAT_BRK && randomize_va_space =3D=3D=
 2
> case.
>
> Signed-off-by: Jiri Kosina <jkosina@suse.cz>
> Tested-by: Geert Uytterhoeven <geert@linux-m68k.org>
> ---
>
> I am not really happy about introducing the bit flag, but I currently
> don't see another option. And it's only for the legacy CONFIG_COMPAT_=
BRK
> case anyway.
>
> Andrew, Ingo, any opinions/objections?
>
> If not -- Andrew, I guess this should go into current -rc still.

And in 2.6.38-stable.

Does anyone still have libc5 binaries for i386?

Gr{oetje,eeting}s,

=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-=
m68k.org

In personal conversations with technical people, I call myself a hacker=
=2E But
when I'm talking to journalists I just say "programmer" or something li=
ke that.
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0=C2=A0 -- Linus Torvalds
