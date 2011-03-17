From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: serial167 (was: Re: [RFC 0/5] tty: move stuff around)
Date: Thu, 17 Mar 2011 10:59:59 +0100
Message-ID: <AANLkTi=+ckqwFUH-4U3hyj=FDM7oNtBO9TOPTT3MAwDC@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-fx0-f46.google.com ([209.85.161.46]:55381 "EHLO
	mail-fx0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752659Ab1CQKAE convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Thu, 17 Mar 2011 06:00:04 -0400
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Alan Cox <alan@lxorguk.ukuu.org.uk>
Cc: Arnd Bergmann <arnd@arndb.de>, Greg KH <gregkh@suse.de>, Jiri Slaby <jslaby@suse.cz>, linux-kernel@vger.kernel.org, Rogier Wolff <R.E.Wolff@bitwizard.nl>, "Michael H. Warfield" <mhw@wittsend.com>, Linux/m68k <linux-m68k@vger.kernel.org>

On Fri, Sep 3, 2010 at 22:32, Alan Cox <alan@lxorguk.ukuu.org.uk> wrote=
:
> On Fri, 3 Sep 2010 22:08:38 +0200
> Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
>> On Fri, Sep 3, 2010 at 17:29, Arnd Bergmann <arnd@arndb.de> wrote:
>> > amiserial,nozomi,synclink,
>> > rocket,ipwireless
>> > cyclades,moxa,mxser,
>> > isicom,bfin_jtag_comm =C2=A0 -> drivers/tty/
>> >
>> > stallion,istallion,
>> > epca,specialix,ip2,
>> > riscom,serial167 =C2=A0 =C2=A0 =C2=A0 =C2=A0-> drivers/staging/tty=
/*
>>
>> I thought we wanted to keep serial167 alive as long as it builds?
>
> Does it build ? Is it secure ? I was under the impression the answer =
in
> both cases was no.

As serial167 is now in staging in Linus tree...

It still builds in 2.6.38. What is unsecure about it? If nothing,
please move it back,
as the whole MVME167 platform is pretty useless without its console dri=
ver.

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
