From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 0/2 v3] mkstemp() and m68k support
Date: Sun, 29 Jan 2012 10:44:15 +0100
Message-ID: <CAMuHMdX5Bg1Zu-PGh+8ofM3RH=CJdkr_fVMH5GZ3LdUf9F6j7Q@mail.gmail.com>
References: <Pine.BSM.4.64L.1201290042440.31292@herc.mirbsd.org>
	<4F24B8CA.1070300@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-ww0-f44.google.com ([74.125.82.44]:37057 "EHLO
	mail-ww0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751847Ab2A2JoR convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 29 Jan 2012 04:44:17 -0500
Received: by wgbed3 with SMTP id ed3so3510809wgb.1
        for <linux-m68k@vger.kernel.org>; Sun, 29 Jan 2012 01:44:16 -0800 (PST)
In-Reply-To: <4F24B8CA.1070300@gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitzmic@googlemail.com>
Cc: Thorsten Glaser <tg@mirbsd.de>, klibc@zytor.com, linux-m68k@vger.kernel.org

On Sun, Jan 29, 2012 at 04:11, Michael Schmitz
<schmitzmic@googlemail.com> wrote:
>> The two patches _should_ follow (still not 100% sure how to
>> feed them to sendmail and ensure they end up with the right
>
> You appear to have failed. Care to post it to your p.d.o page?
>
> (I've never tried talking to sendmail directly except for low level t=
esting
> - you'll have to manually prepare a valid mail message with the attac=
hments
> embedded for that to work I guess. That's what mutt and friends are f=
or)

git send-email [--to xxx] [--cc xxx] ... <file>

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
