From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] mac68k: fix compiler warning
Date: Sat, 13 Aug 2011 19:56:40 +0200
Message-ID: <CAMuHMdW7R7KQT5DyGhoTs8H37RgT05-ni9yMZFQxYfO_Wcbefw@mail.gmail.com>
References: <alpine.OSX.2.00.1107172341070.191@ibook.intranet>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-iy0-f170.google.com ([209.85.210.170]:54941 "EHLO
	mail-iy0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751208Ab1HMR4k convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sat, 13 Aug 2011 13:56:40 -0400
Received: by iye16 with SMTP id 16so4016369iye.1
        for <linux-m68k@vger.kernel.org>; Sat, 13 Aug 2011 10:56:40 -0700 (PDT)
In-Reply-To: <alpine.OSX.2.00.1107172341070.191@ibook.intranet>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Finn Thain <fthain@telegraphics.com.au>
Cc: linux-m68k@vger.kernel.org

On Sun, Jul 17, 2011 at 16:06, Finn Thain <fthain@telegraphics.com.au> =
wrote:
> The algorithm described in the comment compares two reads from the RT=
C but
> the code actually reads once and compares the result to an uninitiali=
zed
> value. This causes the compiler to warn, "last_result maybe used
> uninitialized". Make the code match the comment, fix the warning and
> perhaps improve reliability. Tested on a Quadra 700.

Thanks, applied. Will queue for 3.2.

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
