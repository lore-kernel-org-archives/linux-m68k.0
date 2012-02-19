From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 2/2] m68k: merge the MMU and non-MMU versions of process.c
Date: Sun, 19 Feb 2012 11:18:18 +0100
Message-ID: <CAMuHMdXMYRUsbNxfWSusoMaKSkankXOD9aUfXpN7DSE03ihjgw@mail.gmail.com>
References: <1328854457-24859-1-git-send-email-gerg@snapgear.com>
	<1328854457-24859-2-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-wi0-f174.google.com ([209.85.212.174]:53214 "EHLO
	mail-wi0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753277Ab2BSKST convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 19 Feb 2012 05:18:19 -0500
Received: by wics10 with SMTP id s10so2350595wic.19
        for <linux-m68k@vger.kernel.org>; Sun, 19 Feb 2012 02:18:18 -0800 (PST)
In-Reply-To: <1328854457-24859-2-git-send-email-gerg@snapgear.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: gerg@snapgear.com
Cc: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org, Greg Ungerer <gerg@uclinux.org>

On Fri, Feb 10, 2012 at 07:14,  <gerg@snapgear.com> wrote:
> The MMU and non-MMU varients of the m68k arch process.c code are pret=
ty
> much the same. Only a few minor details differ between the two. The
> majority of the difference is to deal with having or wanting hardware=
 FPU
> support. So merge them back into a single process.c file.
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
