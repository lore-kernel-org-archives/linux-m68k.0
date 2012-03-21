From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: new ARAnyM with better FPU
Date: Wed, 21 Mar 2012 11:08:16 +0100
Message-ID: <CAMuHMdWNktLMKTCkBitY0VQjtaXRaaWR-L4bmKYdvyeadwOkJg@mail.gmail.com>
References: <1332282242.3352.7.camel@aspire>
	<Pine.BSM.4.64L.1203210905300.23907@herc.mirbsd.org>
	<1332322473.10247.56.camel@petr>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-we0-f174.google.com ([74.125.82.174]:41433 "EHLO
	mail-we0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S965130Ab2CUKIS convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 21 Mar 2012 06:08:18 -0400
Received: by wejx9 with SMTP id x9so783182wej.19
        for <linux-m68k@vger.kernel.org>; Wed, 21 Mar 2012 03:08:16 -0700 (PDT)
In-Reply-To: <1332322473.10247.56.camel@petr>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Petr Stehlik <pstehlik@sophics.cz>
Cc: Thorsten Glaser <tg@mirbsd.de>, debian-68k@lists.debian.org, Linux/m68k <linux-m68k@vger.kernel.org>

Hi Petr,

On Wed, Mar 21, 2012 at 10:34, Petr Stehlik <pstehlik@sophics.cz> wrote=
:
> Thorsten Glaser p=C3=AD=C5=A1e v St 21. 03. 2012 v 09:07 +0000:
>> >ARAnyM Debian maintainer is working on updating the package in Debi=
an
>> >sid as well.
>>
>> OK, great. I=E2=80=99ll wait for that, upgrade the box with sid on
>> it and will backport to *shudder* hardy
>
> Well, beware: Ubuntu < 10.10 (including the 10.04 LTS Lucid Lynx) doe=
s
> not have the necessary libmpfr3+. That also means that the Ubuntu Luc=
id
> packages I have prepared at
>
> http://sourceforge.net/projects/aranym/files/aranym/0.9.12/
>
> do NOT contain the new MPFR based FPU core made by Andreas.
>
> So if you really want to try out the new ARAnyM FPU on your Hardy mak=
e
> sure you'll backport libmpfr3+ there first.

Thanks!

I've just installed the binary for Lucid, and now cp/mv/du from coreuti=
ls
work again (they failed with out-of-memory errors under Ubuntu's 0.9.9)=
=2E
I guess that was due to the CAS/CAS2 bugs?

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
