From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v3 5/6] m68k: remove duplicate memcpy() implementation
Date: Thu, 2 Jun 2011 09:43:09 +0200
Message-ID: <BANLkTima37d7L_GLEf3iwe3i_o3cSSiUfA@mail.gmail.com>
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
	<BANLkTinAJPBc=Dzy8vZOhcGME55vNc49qg@mail.gmail.com>
	<4DE71D3D.1080203@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-bw0-f46.google.com ([209.85.214.46]:51961 "EHLO
	mail-bw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754284Ab1FBHnK convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Thu, 2 Jun 2011 03:43:10 -0400
Received: by bwz15 with SMTP id 15so710536bwz.19
        for <linux-m68k@vger.kernel.org>; Thu, 02 Jun 2011 00:43:09 -0700 (PDT)
In-Reply-To: <4DE71D3D.1080203@snapgear.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Greg Ungerer <gerg@snapgear.com>
Cc: Andreas Schwab <schwab@linux-m68k.org>, linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org, Greg Ungerer <gerg@uclinux.org>

On Thu, Jun 2, 2011 at 07:18, Greg Ungerer <gerg@snapgear.com> wrote:
> On 26/05/11 16:38, Geert Uytterhoeven wrote:
>> I was more thinking along the lines of !CONFIG_M68000&& =C2=A0!CONFI=
G_M68010
>> && =C2=A0!CONFIG_<whatever Coldfire that doesn't support it>.
>
> Or in this case (and probably most cases) we could just switch
> to using the same positive logic. So what I had as:
>
> #if defined(__mc68020__) || defined(__mc68030__) || \
> =C2=A0 =C2=A0defined(__mc68040__) || defined(__mc68060__) || defined(=
__mcpu32__)
>
> becomes
>
> #if defined(CONFIG_M68020) || defined(CONFIG_M68030) || \
> =C2=A0 =C2=A0defined(CONFIG_M68040) || defined(CONFIG_M68060) || \
> =C2=A0 =C2=A0defined(CONFIG_MCPU32)
>
> There currently isn't a CONFIG_MCPU32, but I could easily add
> that (we only have one CPU in that class currently supported,
> the 68360).
>
> The compiler setting won't matter, only what we configured.
> Sam will probably like this better, he suggested using the
> kernel configs initially, in
> http://www.spinics.net/lists/linux-m68k/msg03609.html

Pure positive logic won't work in the (currently stil pathological) cas=
e you're
building a multi-platform kernel, and have both CONFIG_M68020 and a les=
ser
one that doesn't support cpu32 instructions selected.

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
