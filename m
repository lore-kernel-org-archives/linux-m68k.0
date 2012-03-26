From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: new ARAnyM with better FPU
Date: Mon, 26 Mar 2012 22:41:13 +0200
Message-ID: <CAMuHMdVegR=pb_JPYH_PBWjYCZzt0Ga4jgFdTcFjEuyxhm_DJQ@mail.gmail.com>
References: <1332282242.3352.7.camel@aspire>
	<Pine.BSM.4.64L.1203210905300.23907@herc.mirbsd.org>
	<1332322473.10247.56.camel@petr>
	<CAMuHMdWNktLMKTCkBitY0VQjtaXRaaWR-L4bmKYdvyeadwOkJg@mail.gmail.com>
	<1332337279.5083.3.camel@aspire>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-we0-f174.google.com ([74.125.82.174]:34949 "EHLO
	mail-we0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751759Ab2CZUlP convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Mon, 26 Mar 2012 16:41:15 -0400
Received: by wejx9 with SMTP id x9so4474218wej.19
        for <linux-m68k@vger.kernel.org>; Mon, 26 Mar 2012 13:41:13 -0700 (PDT)
In-Reply-To: <1332337279.5083.3.camel@aspire>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Petr Stehlik <pstehlik@sophics.cz>
Cc: debian-68k@lists.debian.org, Linux/m68k <linux-m68k@vger.kernel.org>

Hi Petr,

On Wed, Mar 21, 2012 at 14:41, Petr Stehlik <pstehlik@sophics.cz> wrote=
:
> Geert Uytterhoeven p=C3=AD=C5=A1e v Wed 21. 03. 2012 v 11:08 +0100:
>> I've just installed the binary for Lucid, and now cp/mv/du from core=
utils
>> work again (they failed with out-of-memory errors under Ubuntu's 0.9=
=2E9).
>> I guess that was due to the CAS/CAS2 bugs?
>
> Most probably.

Bad news:

aranym_0.9.12-1.lucid_amd64.deb: du works
aranym_0.9.13-1.lucid.mpfr4_amd64.deb: du fails with "memory exhausted"=
,
just like in 0.9.9.

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
