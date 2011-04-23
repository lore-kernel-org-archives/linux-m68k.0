From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Debian kernel v2.6.38 (was: Re: Fix for SLUB?)
Date: Sat, 23 Apr 2011 20:00:26 +0200
Message-ID: <BANLkTimCKhPbp3wOCpVusHu1JmoyhwKX0w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-bw0-f46.google.com ([209.85.214.46]:50442 "EHLO
	mail-bw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753202Ab1DWSA2 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sat, 23 Apr 2011 14:00:28 -0400
Received: by bwz15 with SMTP id 15so938156bwz.19
        for <linux-m68k@vger.kernel.org>; Sat, 23 Apr 2011 11:00:27 -0700 (PDT)
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Thorsten Glaser <tg@mirbsd.de>
Cc: linux-m68k@vger.kernel.org

On Sat, Apr 23, 2011 at 17:39, Thorsten Glaser <tg@mirbsd.de> wrote:
> But I was just told by a member of the Debian Kernel Team on
> IRC that the patches from m68k-v2.6.38 will (probably) not be
> accepted, unless they go in via Linus=E2=80=99 tree. How are chances
> of that happening? (He says they had told that years ago al-
> ready.) I=E2=80=99ll need at least the ARAnyM/NatFeat support and som=
e
> of the bugfixes. Otherwise I fear this keeps getting obsolete
> very fast. =E2=98=B9

  1. The critical bugfixes will go in via v2.6.38-stable anyway,
  2. The ARAnyM/NatFeat support will be in v2.6.39, which may be a
sufficiently convincing argument for the Debian Kernel Team to accept
it in Debian's v2.6.38,
  3. If there's anything left that you really need, please tell us, so
"we" can get it in a good shape for v2.6.40.

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
