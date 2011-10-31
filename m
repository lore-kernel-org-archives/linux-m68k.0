From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 00/16] more mac68k fixes and cleanup
Date: Mon, 31 Oct 2011 19:35:28 +0100
Message-ID: <CAMuHMdUGjity+yvTyShmTLF3qtw0b=DqB5cjtDgec3p_vJG=fA@mail.gmail.com>
References: <20111023141108.856998818@telegraphics.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-iy0-f174.google.com ([209.85.210.174]:47672 "EHLO
	mail-iy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933827Ab1JaSf3 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Mon, 31 Oct 2011 14:35:29 -0400
Received: by iaby12 with SMTP id y12so7455059iab.19
        for <linux-m68k@vger.kernel.org>; Mon, 31 Oct 2011 11:35:28 -0700 (PDT)
In-Reply-To: <20111023141108.856998818@telegraphics.com.au>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Finn Thain <fthain@telegraphics.com.au>
Cc: linux-m68k@vger.kernel.org

Hi Finn,

On Sun, Oct 23, 2011 at 16:11, Finn Thain <fthain@telegraphics.com.au> =
wrote:
> It would be good if this whole series passes through the m68k tree.

OK, I'll apply all of them.
But several of them will have to go in via other maintainers' trees,
or get acked.

> I suppose that after all of the renaming recently this series will ne=
ed
> to be rebased (?)

"git am" is smart enough to detect that drivers/net/ got restructured.

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
