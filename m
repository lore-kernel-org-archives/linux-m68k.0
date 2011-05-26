From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v3 5/6] m68k: remove duplicate memcpy() implementation
Date: Thu, 26 May 2011 08:38:12 +0200
Message-ID: <BANLkTinAJPBc=Dzy8vZOhcGME55vNc49qg@mail.gmail.com>
References: <1303345491-27888-1-git-send-email-gerg@snapgear.com>
	<1303345491-27888-2-git-send-email-gerg@snapgear.com>
	<1303345491-27888-3-git-send-email-gerg@snapgear.com>
	<1303345491-27888-4-git-send-email-gerg@snapgear.com>
	<1303345491-27888-5-git-send-email-gerg@snapgear.com>
	<1303345491-27888-6-git-send-email-gerg@snapgear.com>
	<BANLkTi=3K=J_UrG5f-sRZDG2oiWcjejkKg@mail.gmail.com>
	<m2sjs542hh.fsf@igel.home>
	<BANLkTinjZMVF5q11dORUMUDPkuYPPO=qJQ@mail.gmail.com>
	<m3wrhgwmid.fsf@linux-m68k.org>
	<4DDDF1F9.8050902@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-bw0-f46.google.com ([209.85.214.46]:61989 "EHLO
	mail-bw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752276Ab1EZGiO convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Thu, 26 May 2011 02:38:14 -0400
Received: by bwz15 with SMTP id 15so170257bwz.19
        for <linux-m68k@vger.kernel.org>; Wed, 25 May 2011 23:38:12 -0700 (PDT)
In-Reply-To: <4DDDF1F9.8050902@snapgear.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Greg Ungerer <gerg@snapgear.com>
Cc: Andreas Schwab <schwab@linux-m68k.org>, linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org, Greg Ungerer <gerg@uclinux.org>

On Thu, May 26, 2011 at 08:23, Greg Ungerer <gerg@snapgear.com> wrote:
> On 24/05/11 18:06, Andreas Schwab wrote:
>> Geert Uytterhoeven<geert@linux-m68k.org> =C2=A0writes:
>>
>>> What exactly do you mean by "does not support anything less"? It se=
ems it
>>> does
>>> restrict instruction generation to 68000 if you ask for it.
>>
>> The point is that Linux/m68k requires 68020+, so compiling for 68000
>> does not make sense (at least back when the gcc configuration was
>> created).
>
> Yeah, used to be true :-)
> This seems very much to me to be a "broken compiler" issue.
>
> Is it worth putting some form of compiler version limits to protect
> compilation in the m68000 case? =C2=A0(Probably no need to limit it f=
or
> the existing 68020+ case).
>
> Are there any other gcc defines that we could use instead?
> We need to check with your old compiler Geert :-)
>
> I really don't want to use CONFIG_MMU here (or in bitops.h either).
> When I work in the ColdFire MMU code this won't be right.

I was more thinking along the lines of !CONFIG_M68000 && !CONFIG_M68010
&& !CONFIG_<whatever Coldfire that doesn't support it>.

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
