From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] m68k: fix find_next bitops
Date: Thu, 31 Mar 2011 08:16:35 +0200
Message-ID: <AANLkTi=kamiujNVhVgjPLjyPnEw0gSgNn=28QVmsP-5j@mail.gmail.com>
References: <1301050810-11329-1-git-send-email-akinobu.mita@gmail.com>
	<AANLkTikKA2MY6nf+LLyJbNQffX=qYY3eZdpNmwVQc21u@mail.gmail.com>
	<m2sju4jrov.fsf@igel.home>
	<AANLkTimuDf+Qo0e_sVuNX5DavOBSu+Gr-VryeD9aSw_9@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-bw0-f46.google.com ([209.85.214.46]:56513 "EHLO
	mail-bw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752723Ab1CaGQg convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Thu, 31 Mar 2011 02:16:36 -0400
In-Reply-To: <AANLkTimuDf+Qo0e_sVuNX5DavOBSu+Gr-VryeD9aSw_9@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Akinobu Mita <akinobu.mita@gmail.com>
Cc: Andreas Schwab <schwab@linux-m68k.org>, linux-kernel@vger.kernel.org, akpm@linux-foundation.org, Roman Zippel <zippel@linux-m68k.org>, linux-m68k@vger.kernel.org, Michael Schmitz <schmitzmic@googlemail.com>

On Thu, Mar 31, 2011 at 08:02, Akinobu Mita <akinobu.mita@gmail.com> wr=
ote:
> 2011/3/31 Andreas Schwab <schwab@linux-m68k.org>:
>> Geert Uytterhoeven <geert@linux-m68k.org> writes:
>>
>>> Andreas, do you think it's worth keeping (and fixing) the m68k "opt=
imized"
>>> versions?
>>
>> Should be easy to add the required offset >=3D size checks.
>
> OK, I'll try to fix the optimized version.
> Or, could someone who can test on the real hardware fix this problem?

I'll have a look...

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
