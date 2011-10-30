From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 16/36] m68k: set ColdFire MMU page size
Date: Sun, 30 Oct 2011 14:29:11 +0100
Message-ID: <CAMuHMdUksKmucNHEVSXR+RdGoA-wzGHgo49NYDdJd=gdiKC76w@mail.gmail.com>
References: <1319527168-11166-1-git-send-email-gerg@snapgear.com>
	<1319527168-11166-17-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-iy0-f174.google.com ([209.85.210.174]:49872 "EHLO
	mail-iy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754777Ab1J3N3L convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 30 Oct 2011 09:29:11 -0400
Received: by iaby12 with SMTP id y12so6101389iab.19
        for <linux-m68k@vger.kernel.org>; Sun, 30 Oct 2011 06:29:11 -0700 (PDT)
In-Reply-To: <1319527168-11166-17-git-send-email-gerg@snapgear.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: gerg@snapgear.com
Cc: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org, Greg Ungerer <gerg@uclinux.org>

On Tue, Oct 25, 2011 at 09:19,  <gerg@snapgear.com> wrote:
> We use the ColdFire V4e MMU page size of 8kb. Define PAGE_SHIFT
> appropriately.

8kb =3D 0.9765625 KiB ;-)

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
