From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 5/5 v2] m68k: remove dead timer code
Date: Wed, 22 Feb 2012 11:05:49 +0100
Message-ID: <CAMuHMdVX0vKufhB=Y=hWshTF=W9HdCdiaTOYPB5ZTWTCwmD=fQ@mail.gmail.com>
References: <1329883136-9837-1-git-send-email-gerg@snapgear.com>
	<1329883136-9837-5-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-we0-f174.google.com ([74.125.82.174]:54982 "EHLO
	mail-we0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751746Ab2BVKFv convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 22 Feb 2012 05:05:51 -0500
Received: by werb13 with SMTP id b13so4374785wer.19
        for <linux-m68k@vger.kernel.org>; Wed, 22 Feb 2012 02:05:50 -0800 (PST)
In-Reply-To: <1329883136-9837-5-git-send-email-gerg@snapgear.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: gerg@snapgear.com
Cc: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org, Greg Ungerer <gerg@uclinux.org>

On Wed, Feb 22, 2012 at 04:58,  <gerg@snapgear.com> wrote:
> The set_rtc_mmss() function is defined "static inline" but is never u=
sed
> in this file. Remove it.
>
> Signed-off-by: Greg Ungerer <gerg@uclinux.org>

Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

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
