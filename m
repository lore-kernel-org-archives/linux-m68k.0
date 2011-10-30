From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 15/36] m68k: add TLB flush support for the ColdFire V4e
 MMU hardware
Date: Sun, 30 Oct 2011 14:26:54 +0100
Message-ID: <CAMuHMdVDhZFru7mh0XmAb4eEG2k77dSzzXzr7k1E0jmgTCn7rA@mail.gmail.com>
References: <1319527168-11166-1-git-send-email-gerg@snapgear.com>
	<1319527168-11166-16-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-iy0-f174.google.com ([209.85.210.174]:33648 "EHLO
	mail-iy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754777Ab1J3N0z convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 30 Oct 2011 09:26:55 -0400
Received: by iaby12 with SMTP id y12so6099858iab.19
        for <linux-m68k@vger.kernel.org>; Sun, 30 Oct 2011 06:26:54 -0700 (PDT)
In-Reply-To: <1319527168-11166-16-git-send-email-gerg@snapgear.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: gerg@snapgear.com
Cc: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org, Greg Ungerer <gerg@uclinux.org>

On Tue, Oct 25, 2011 at 09:19,  <gerg@snapgear.com> wrote:
> It needs is own TLB flush support code.

s/is/its/

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
