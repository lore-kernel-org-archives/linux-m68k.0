From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: serial167 (was: Re: [RFC 0/5] tty: move stuff around)
Date: Thu, 17 Mar 2011 11:52:12 +0100
Message-ID: <AANLkTimek6P--jzpPHVe=V8UUo9Qmm9AYL3CF5fLaW9O@mail.gmail.com>
References: <AANLkTi=+ckqwFUH-4U3hyj=FDM7oNtBO9TOPTT3MAwDC@mail.gmail.com>
	<20110317104618.095f16ba@lxorguk.ukuu.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-fx0-f46.google.com ([209.85.161.46]:53677 "EHLO
	mail-fx0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752881Ab1CQKwN convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Thu, 17 Mar 2011 06:52:13 -0400
In-Reply-To: <20110317104618.095f16ba@lxorguk.ukuu.org.uk>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Alan Cox <alan@lxorguk.ukuu.org.uk>
Cc: Arnd Bergmann <arnd@arndb.de>, Greg KH <gregkh@suse.de>, Jiri Slaby <jslaby@suse.cz>, linux-kernel@vger.kernel.org, Rogier Wolff <R.E.Wolff@bitwizard.nl>, "Michael H. Warfield" <mhw@wittsend.com>, Linux/m68k <linux-m68k@vger.kernel.org>

Hi Alan,

On Thu, Mar 17, 2011 at 11:46, Alan Cox <alan@lxorguk.ukuu.org.uk> wrot=
e:
>> As serial167 is now in staging in Linus tree...
>>
>> It still builds in 2.6.38. What is unsecure about it? If nothing,
>> please move it back,
>> as the whole MVME167 platform is pretty useless without its console =
driver.
>
> It has no reference counting and it doesn't use tty_port objects.

[...]

Many thanks for your elaborate (and valid) explanation!
I'll let the VME users sort it out...

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
