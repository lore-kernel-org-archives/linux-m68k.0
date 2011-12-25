From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 23/35] m68k: use ColdFire MMU read/write bit flags when ioremapping
Date: Sun, 25 Dec 2011 21:23:10 +0100
Message-ID: <CAMuHMdVcPwGtOmuDHNY9Q8hsnw2bhgSoTyodkJSxoG1=s7tBAw@mail.gmail.com>
References: <1324610148-20666-1-git-send-email-gerg@snapgear.com>
	<1324610148-20666-24-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-wi0-f174.google.com ([209.85.212.174]:37497 "EHLO
	mail-wi0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751129Ab1LYUXM convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 25 Dec 2011 15:23:12 -0500
Received: by wibhm6 with SMTP id hm6so4076089wib.19
        for <linux-m68k@vger.kernel.org>; Sun, 25 Dec 2011 12:23:10 -0800 (PST)
In-Reply-To: <1324610148-20666-24-git-send-email-gerg@snapgear.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: gerg@snapgear.com
Cc: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org, Greg Ungerer <gerg@uclinux.org>

On Fri, Dec 23, 2011 at 04:15,  <gerg@snapgear.com> wrote:
> From: Greg Ungerer <gerg@uclinux.org>
>
> The ColdFire MMU has separate read and write bits, unlike the Motorol=
a
> m68k MMU which has a single read-only bit.
>
> Define a _PAGE_READWRITE value for the Motorola MMU, which is 0, so w=
e
> can unconditionaly include that in the page table entry bits when set=
ting
> up ioremapped pages.
>
> Signed-off-by: Greg Ungerer <gerg@uclinux.org>
> Acked-by: Matt Waddel <mwaddel@yahoo.com>
> Acked-by: Kurt Mahan <kmahan@xmission.com>

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
