From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Atari console corruption
Date: Wed, 13 Oct 2010 21:10:29 +0200
Message-ID: <AANLkTimZ4q3mGhy27qVo5gQHMCM2U8jrc_fNPH4YUXev@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-fx0-f46.google.com ([209.85.161.46]:35510 "EHLO
	mail-fx0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753000Ab0JMTKa convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 13 Oct 2010 15:10:30 -0400
Received: by fxm4 with SMTP id 4so1902693fxm.19
        for <linux-m68k@vger.kernel.org>; Wed, 13 Oct 2010 12:10:29 -0700 (PDT)
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Linux/m68k <linux-m68k@vger.kernel.org>

If your shell command line looks like:

sh-3.1# abcd

Then insert another 'b' in front of the existing 'b'. The 'c' will
become corrupted.
The actual characters don't matter, except that the inserted character =
must be
the same as the existing one.
It happens in all even columns, so if your prompt is different, just tr=
y it at
a different even position.

It happens in frame buffer depths 2, 4, and 8. In monochrome mode the c=
orruption
is different. In 16 bpp, when it uses the cfb code, there's no
corruption, so the bug
must be in the Atari-specific code.

I could not reproduce it in vi, only in bash.

Tested on ARAnyM only.

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
