From: Michael Schmitz <schmitzmic@googlemail.com>
Subject: Re: Debian kernel 2.6.38-5
Date: Tue, 10 May 2011 10:49:45 +1200
Message-ID: <BANLkTinP_U1c+X_zVrT1zXdzVh_p=STP0Q@mail.gmail.com>
References: <BANLkTimCKhPbp3wOCpVusHu1JmoyhwKX0w@mail.gmail.com>
	<Pine.BSM.4.64L.1105081254100.28983@herc.mirbsd.org>
	<20110508165909.GA16281@chumley.earth.sol>
	<Pine.BSM.4.64L.1105081834101.28983@herc.mirbsd.org>
	<20110508200802.GB16281@chumley.earth.sol>
	<alpine.OSX.2.00.1105090909080.194@ibook.intranet>
	<BANLkTim6_gHr_re0bv0eTWCQ7=5AG1HzwQ@mail.gmail.com>
	<20110509202559.GA27320@chumley.earth.sol>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pv0-f174.google.com ([74.125.83.174]:38834 "EHLO
	mail-pv0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755252Ab1EIWtq convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Mon, 9 May 2011 18:49:46 -0400
Received: by pvg12 with SMTP id 12so2562244pvg.19
        for <linux-m68k@vger.kernel.org>; Mon, 09 May 2011 15:49:45 -0700 (PDT)
In-Reply-To: <20110509202559.GA27320@chumley.earth.sol>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>, Finn Thain <fthain@telegraphics.com.au>, Thorsten Glaser <tg@mirbsd.de>, linux-m68k@vger.kernel.org

Christian,


> I applied the following patch and it works! apt-get update that is, t=
here is
> no sshd on this freshly installed system yet...
>
> I also changed this line to have 4 underscores at the beginning:
>
> =A0 =A0 =A0 =A0{ 0xec940559, "____alloc_ei_netdev" },

Where does that appear? Can't find it in drivers/net anywhere.

> it does not show up in git diff, so I am not sure if this is a leftov=
er from
> a previous checkout, or if it is also needed. And if it is needed, if=
 it
> should be two underscores or four or none, and if so why or why not..=
=2E
> Looking at the other drivers, there does not seem to be a lot of cons=
istency?

____alloc_ei_netdev is the function defined in lib8390.c which is
called by the individual drivers from their respective
__alloc_ei_netdev().

The only symbol exported by zorro8390.c should be __alloc_ei_netdev -
if your above change was done in some symbol exports file it should
probably have been left at __alloc_ei_netdev.

Cheers,

  Michael
