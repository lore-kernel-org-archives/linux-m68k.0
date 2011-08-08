From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: 3.1-rc1 on m68k
Date: Mon, 8 Aug 2011 14:36:46 +0200
Message-ID: <CAMuHMdUyr1as3_qd_tgSw9EoGG=Vq4SGaCQnG1nZ+KRDbO+-Bw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-iy0-f170.google.com ([209.85.210.170]:46268 "EHLO
	mail-iy0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751140Ab1HHMgr convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Mon, 8 Aug 2011 08:36:47 -0400
Received: by iye16 with SMTP id 16so8958055iye.1
        for <linux-m68k@vger.kernel.org>; Mon, 08 Aug 2011 05:36:46 -0700 (PDT)
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitzmic@googlemail.com>, Linux/m68k <linux-m68k@vger.kernel.org>

Hi all,

I pushed out 3.1-rc1 for m68k to the master branch of
http://git.kernel.org/?p=3Dlinux/kernel/git/geert/linux-m68k.git

Notable thing is the upstream deletion of the generic serial drivers
from the staging
area, cfr. http://git.kernel.org/?p=3Dlinux/kernel/git/torvalds/linux.g=
it;a=3Dcommitdiff;h=3Dbb2a97e9ccd525dd9c3326988e8c676d15d3e12a.
This means we lost the A2232 serial drivers and various VME SCC drivers=
=2E

=46or now I kept the source code for the Atari SCC driver itself, but I
will probably
delete it when 3.1 is released. It will still be preserved in the
m68k-v3.0 branch,
though.

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
