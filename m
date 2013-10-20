From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: Linux 3.1-2-m68k config
Date: Sun, 20 Oct 2013 18:49:37 +0200
Message-ID: <CAMuHMdWfi4ymGd=Af+gMuvcBif2PBbPd09KYSe8GH6-KZuqaiA@mail.gmail.com>
References: <CAMuHMdXDDyzdy80gDvS-i96pMSgiCw9AJTD3ts=HaCwC26KWUw@mail.gmail.com>
	<5263A185.1040303@Vivier.EU>
	<Pine.BSM.4.64L.1310201454250.19879@herc.mirbsd.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pa0-f53.google.com ([209.85.220.53]:54491 "EHLO
	mail-pa0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751083Ab3JTQti convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 20 Oct 2013 12:49:38 -0400
Received: by mail-pa0-f53.google.com with SMTP id kq14so6889213pab.12
        for <linux-m68k@vger.kernel.org>; Sun, 20 Oct 2013 09:49:38 -0700 (PDT)
In-Reply-To: <Pine.BSM.4.64L.1310201454250.19879@herc.mirbsd.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Thorsten Glaser <tg@mirbsd.de>
Cc: Debian m68k <debian-68k@lists.debian.org>, Linux/m68k <linux-m68k@vger.kernel.org>

On Sun, Oct 20, 2013 at 5:01 PM, Thorsten Glaser <tg@mirbsd.de> wrote:
> One pet peeve of mine is that I don=E2=80=99t know which of the trist=
ate
> options add =E2=80=9Ccommon code=E2=80=9D (such as hooks) and which, =
when set to
> =E2=80=98m=E2=80=99, do _not_ add something to vmlinux.

To find code that's compiled if a tristate symbol is "m":

git grep "\<CONFIG_[^ ]*_MODULE\>"

This is not necessariy code in vmlinux; it can be code in another modul=
e.

And in Makefile logic:

git grep "\<CONFIG_[^ ]*\>.*\m=3Dy" -- "*Makefile"

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-=
m68k.org

In personal conversations with technical people, I call myself a hacker=
=2E But
when I'm talking to journalists I just say "programmer" or something li=
ke that.
                                -- Linus Torvalds
