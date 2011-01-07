From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: Signal patchset
Date: Fri, 7 Jan 2011 14:21:34 +0100
Message-ID: <AANLkTinBix+uEhWrzcqXPsoJ5VPq6zH=uOBX4VKO_6wW@mail.gmail.com>
References: <AANLkTi=9B-8KN0oiXoiU+KqPt6B8Vs=d7yu9cui-7e1r@mail.gmail.com>
	<20101215101027.GA31097@ZenIV.linux.org.uk>
	<Pine.BSM.4.64L.1101011938470.1114@herc.mirbsd.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-fx0-f66.google.com ([209.85.161.66]:33616 "EHLO
	mail-fx0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753280Ab1AGNVf convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Fri, 7 Jan 2011 08:21:35 -0500
Received: by fxm14 with SMTP id 14so5172249fxm.1
        for <linux-m68k@vger.kernel.org>; Fri, 07 Jan 2011 05:21:34 -0800 (PST)
In-Reply-To: <Pine.BSM.4.64L.1101011938470.1114@herc.mirbsd.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Thorsten Glaser <tg@mirbsd.de>
Cc: linux-m68k@vger.kernel.org

On Sat, Jan 1, 2011 at 20:40, Thorsten Glaser <tg@mirbsd.de> wrote:
>>FWIW, there's an m68knommu counterpart (ACKed by gerg a while ago). =C2=
=A0The
>>entire bunch is on ftp.linux.org.uk/pub/people/viro/m68k-signals - bo=
th m68k
>>and m68knommu sets.
>
> I=E2=80=99ve made it apply on top of the current m68k-queue (I though=
t
> I=E2=80=99d learn why people think git makes merging patches easy=E2=80=
=A6 well,
> in the end, I got a result, but it was everything but). Attached.

It's a bit tricky as threadinfo_*.h got merged, so I ended up editing t=
he
patch series manually.

Anyway, you want to either use `git am -3' or apply it to the original =
version
it was made for, and `git cherry-pick' or `git-rebase --onto' it to
move it to the current
version. Caveat: my git incorrectly applied one part to an h8300
include instead,
as it missed one rename.

In the end, I got the exact same result as you did, so it must be corre=
ct ;-)

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
