From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] [m68k] Atari: support for NetUSBee register access to isp116x.h
Date: Tue, 29 May 2012 22:46:39 +0200
Message-ID: <CAMuHMdWpW5aPKasazs2yJX8BZv2F_KXreSAY3+_kXGUqGZVJEw@mail.gmail.com>
References: <CAOmrzkL4BNWr6aLijfpg91m8VKU4A0DRsx1mjOa22qWPrysqtQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-yw0-f46.google.com ([209.85.213.46]:43215 "EHLO
	mail-yw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751667Ab2E2Uw0 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 29 May 2012 16:52:26 -0400
Received: by yhmm54 with SMTP id m54so2706115yhm.19
        for <linux-m68k@vger.kernel.org>; Tue, 29 May 2012 13:52:25 -0700 (PDT)
In-Reply-To: <CAOmrzkL4BNWr6aLijfpg91m8VKU4A0DRsx1mjOa22qWPrysqtQ@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitzmic@googlemail.com>
Cc: Michael Schmitz <schmitz@zirkon.biophys.uni-duesseldorf.de>, linux-m68k@vger.kernel.org

Hi Michael,

On Tue, May 29, 2012 at 12:48 AM, Michael Schmitz
<schmitzmic@googlemail.com> wrote:
> the following patch allows selecting the correct register access
> macros depending on whether the EtherNAT or NetUSBee variant of the
> ISP1160 chip is used. With this patch applied on top of the previous
> two, it should be possible to test the NetUSBee USB port.

Thanks!

Just like a few of the previous patches, this one is severely
white-space damaged :-(
In addition, several of the patches showed checkpatch errors.
=46or bedtime reading, I can recommend linux/Documentation/email-client=
s.txt and
linux/Documentation/SubmittingPatches.

After some manual fixes, I did manage to apply all of them to my
private working tree.
Everything builds and boots (on ARAnyM) fine. I will comment on the
individual patches
when time permits.

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
