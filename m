From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 1/2] m68k: make support for FPU hardware configurable
Date: Sun, 19 Feb 2012 11:17:08 +0100
Message-ID: <CAMuHMdVnOsxKCvUtCbwb_RqKp8L7HLfb4jEO8_Hnewvry+33nQ@mail.gmail.com>
References: <1328854457-24859-1-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-we0-f174.google.com ([74.125.82.174]:57660 "EHLO
	mail-we0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753277Ab2BSKRK convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 19 Feb 2012 05:17:10 -0500
Received: by werb13 with SMTP id b13so2645741wer.19
        for <linux-m68k@vger.kernel.org>; Sun, 19 Feb 2012 02:17:08 -0800 (PST)
In-Reply-To: <1328854457-24859-1-git-send-email-gerg@snapgear.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: gerg@snapgear.com
Cc: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org, Greg Ungerer <gerg@uclinux.org>

On Fri, Feb 10, 2012 at 07:14,  <gerg@snapgear.com> wrote:
> The classic m68k code has always supported an FPU (although it may ha=
ve
> been a software emulated one). The non-MMU m68k code has never suppor=
ted FPU
> hardware. To help in merging common code create a configation setting=
 that
> signifies if we are builing in FPU support or not.
>
> This switch, CONFIG_FPU, is set as per the current use cases. So it i=
s
> always enabled if CONFIG_MMU is set, and disabled otherwise. With a l=
ittle
> extra code it will be possible to disable it on the classic m68k plat=
forms
> as well, and to enable it on non-MMU platforms that do have hardware =
=46PU.
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
