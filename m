From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] [m68k] Atari: support for NetUSBee register access to isp116x.h
Date: Tue, 5 Jun 2012 18:45:36 +0200
Message-ID: <CAMuHMdXgbJzDJxkQxxg3+Jb+6mNoQ-0BuD3_9CXtA1ZL9dFrqg@mail.gmail.com>
References: <CAOmrzkL4BNWr6aLijfpg91m8VKU4A0DRsx1mjOa22qWPrysqtQ@mail.gmail.com>
	<CAMuHMdWpW5aPKasazs2yJX8BZv2F_KXreSAY3+_kXGUqGZVJEw@mail.gmail.com>
	<CAOmrzk+2bYgDNtcW6DVy4WYT2i+07n8xR4bbNbwFJ@mail.gmail.com>
	<loom.20120605T174709-209@post.gmane.org>
	<CAMuHMdWC8agVJoPt5uoxkK-Z6hpEwhoVq6hyniqP6XSXSuzwQg@mail.gmail.com>
	<Pine.BSM.4.64L.1206051623360.9588@herc.mirbsd.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-yx0-f174.google.com ([209.85.213.174]:47383 "EHLO
	mail-yx0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754024Ab2FEQph convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 5 Jun 2012 12:45:37 -0400
Received: by yenm10 with SMTP id m10so4174628yen.19
        for <linux-m68k@vger.kernel.org>; Tue, 05 Jun 2012 09:45:37 -0700 (PDT)
In-Reply-To: <Pine.BSM.4.64L.1206051623360.9588@herc.mirbsd.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Thorsten Glaser <tg@mirbsd.de>
Cc: linux-m68k@vger.kernel.org

On Tue, Jun 5, 2012 at 6:26 PM, Thorsten Glaser <tg@mirbsd.de> wrote:
>>On Tue, Jun 5, 2012 at 5:51 PM, Thorsten Glaser <tg@mirbsd.org> wrote=
:
>>> =E2=91=A1 $EDITOR 00*
>>> =E2=91=A2 Add a To: line, and possibly a In-Reply-To: line referenc=
ing
>>> =C2=A0the Message-ID from the introductory mail (to get them thread=
ed),
>>> =C2=A0to each file; save and exit https://www.mirbsd.org/jupp.htm ^=
Wthe editor
>>> =E2=91=A3 for a in 00*; do sendmail -oem -oi -t -f sender@mydomain.=
com <"$a"; done
>>
>>"git send-email --to user@domain 00*"?
>
> You conveniently cut off Item #1 above, which involves copying
> the patches to a machine that can mail out.

Rsync over ssh is the easy part ;-)

Alternatively, you probably can configure git to use ssh to call into s=
endmail
on a remote machine for the actual sending.

>>Does git send-email handle that correctly?
>
> There is no way to handle 8bit correctly in SMTP, that does not
> involve converting them to QP or Base64.
>
>>It will not use base64, as that's rejected by vger.kernel.org.
>
> Interesting. How are QP encoded patches handled (other than,
> what I assume, spit from Linux developers)?

Decent mail clients allow to save the mail body to a file, after
QP decoding?

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
