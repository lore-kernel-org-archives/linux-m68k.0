From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] [m68k] Atari: support for NetUSBee register access to isp116x.h
Date: Tue, 5 Jun 2012 21:52:09 +0200
Message-ID: <CAMuHMdUoQ+iRCpi0MNV2tdsfjW5M3i4RHECgu6Phtn9t1FAGeQ@mail.gmail.com>
References: <CAOmrzkL4BNWr6aLijfpg91m8VKU4A0DRsx1mjOa22qWPrysqtQ@mail.gmail.com>
	<CAMuHMdWpW5aPKasazs2yJX8BZv2F_KXreSAY3+_kXGUqGZVJEw@mail.gmail.com>
	<CAOmrzk+2bYgDNtcW6DVy4WYT2i+07n8xR4bbNbwFJ@mail.gmail.com>
	<loom.20120605T174709-209@post.gmane.org>
	<CAMuHMdWC8agVJoPt5uoxkK-Z6hpEwhoVq6hyniqP6XSXSuzwQg@mail.gmail.com>
	<Pine.BSM.4.64L.1206051623360.9588@herc.mirbsd.org>
	<m2sje94pdf.fsf@igel.home>
	<Pine.BSM.4.64L.1206051756340.9588@herc.mirbsd.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-gh0-f174.google.com ([209.85.160.174]:64062 "EHLO
	mail-gh0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750879Ab2FETwK convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 5 Jun 2012 15:52:10 -0400
Received: by ghrr11 with SMTP id r11so4668615ghr.19
        for <linux-m68k@vger.kernel.org>; Tue, 05 Jun 2012 12:52:09 -0700 (PDT)
In-Reply-To: <Pine.BSM.4.64L.1206051756340.9588@herc.mirbsd.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Thorsten Glaser <tg@mirbsd.de>
Cc: linux-m68k@vger.kernel.org

On Tue, Jun 5, 2012 at 7:57 PM, Thorsten Glaser <tg@mirbsd.de> wrote:
> Andreas Schwab dixit:
>>That is not true. =C2=A08BITMIME will handle that correctly.
>
> 8BITMIME is not ubiquitous. Worse, most current MTAs do *not* handle
> conversion of an 8bit mail to QP/Base64 correctly and violate the RFC=
=2E

I added a Russian word in Cyrilic (UTF8) to a file in a Linux kernel
git repository.
I commited it with a commit message containing Cyrillic, too.
I used "git format-patch" to create a patch, which contains a.o. the fo=
llowing
headers:

| Content-Type: text/plain; charset=3DUTF-8
| Content-Transfer-Encoding: 8bit

I used "git send-email" to send it to me (it goes out via my provider, =
passes
by linux-m68k.org/nerdnet.nl, and arrives at gmail).
The patch looks fine in the gmail web interface.
I used "Show original" to open the original email incl. headers. It sti=
ll has

| Content-Type: text/plain; charset=3DUTF-8
| Content-Transfer-Encoding: 8bit

No Base64 or QP involved.
I saved it to a file and removed the first line.
I could apply the patch fine using "git am".

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
