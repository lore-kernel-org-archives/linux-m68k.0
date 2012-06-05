From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] [m68k] Atari: support for NetUSBee register access to isp116x.h
Date: Tue, 5 Jun 2012 18:20:57 +0200
Message-ID: <CAMuHMdWC8agVJoPt5uoxkK-Z6hpEwhoVq6hyniqP6XSXSuzwQg@mail.gmail.com>
References: <CAOmrzkL4BNWr6aLijfpg91m8VKU4A0DRsx1mjOa22qWPrysqtQ@mail.gmail.com>
	<CAMuHMdWpW5aPKasazs2yJX8BZv2F_KXreSAY3+_kXGUqGZVJEw@mail.gmail.com>
	<CAOmrzk+2bYgDNtcW6DVy4WYT2i+07n8xR4bbNbwFJ@mail.gmail.com>
	<loom.20120605T174709-209@post.gmane.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-yx0-f174.google.com ([209.85.213.174]:59878 "EHLO
	mail-yx0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751727Ab2FEQU6 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 5 Jun 2012 12:20:58 -0400
Received: by yenm10 with SMTP id m10so4148567yen.19
        for <linux-m68k@vger.kernel.org>; Tue, 05 Jun 2012 09:20:57 -0700 (PDT)
In-Reply-To: <loom.20120605T174709-209@post.gmane.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Thorsten Glaser <tg@mirbsd.org>
Cc: linux-m68k@vger.kernel.org

On Tue, Jun 5, 2012 at 5:51 PM, Thorsten Glaser <tg@mirbsd.org> wrote:
> =E2=91=A1 $EDITOR 00*
> =E2=91=A2 Add a To: line, and possibly a In-Reply-To: line referencin=
g
> =C2=A0the Message-ID from the introductory mail (to get them threaded=
),
> =C2=A0to each file; save and exit https://www.mirbsd.org/jupp.htm ^Wt=
he editor
> =E2=91=A3 for a in 00*; do sendmail -oem -oi -t -f sender@mydomain.co=
m <"$a"; done

"git send-email --to user@domain 00*"?
That can also take care of the threading.

> !BUT!
>
> This does only work if the patchfile does NOT contain any non-7bit
> characters. (This has affected me in the past when writing commit
> messages with =E2=80=9Ctypogra=E2=80=99phic=E2=80=9D marks, as I=E2=80=
=99m used to, nowadays.) There
> is *no* reliable way to transport inline patches through SMTP when
> either the commit message or the patches/the patch context contain
> such characters, as the SMTP transport path is probably not 8-bit
> transparent (may convert to QP or Base64, or strip bit7).
>
> So, in case I ever need to send such mails because the n=C5=8Dn-7bit
> part is in the patch (as opposed to the commit message), please
> bear with me when I need to attach them to a regular eMail.

Does git send-email handle that correctly?
It will not use base64, as that's rejected by vger.kernel.org.

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
