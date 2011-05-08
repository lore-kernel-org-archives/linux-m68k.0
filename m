From: Michael Schmitz <schmitzmic@googlemail.com>
Subject: Re: Debian kernel 2.6.38-5
Date: Mon, 9 May 2011 08:58:00 +1200
Message-ID: <BANLkTin7E_Aedv8RAeaAfR_+me3YZgsbjw@mail.gmail.com>
References: <BANLkTimCKhPbp3wOCpVusHu1JmoyhwKX0w@mail.gmail.com>
	<Pine.BSM.4.64L.1105081254100.28983@herc.mirbsd.org>
	<20110508165909.GA16281@chumley.earth.sol>
	<Pine.BSM.4.64L.1105081834101.28983@herc.mirbsd.org>
	<20110508200802.GB16281@chumley.earth.sol>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-px0-f173.google.com ([209.85.212.173]:62553 "EHLO
	mail-px0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751634Ab1EHU6A convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 8 May 2011 16:58:00 -0400
Received: by pxi16 with SMTP id 16so3221824pxi.4
        for <linux-m68k@vger.kernel.org>; Sun, 08 May 2011 13:58:00 -0700 (PDT)
In-Reply-To: <20110508200802.GB16281@chumley.earth.sol>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Thorsten Glaser <tg@mirbsd.de>, linux-m68k@vger.kernel.org

Christian,

> Yes, but I am not trying to build a debian package, I try to build di=
rectly
> from linux-m68k. This has worked, only the Amiga complained a missing
> modules.dep (but I built in the network driver):

Run depmod -a after the Amiga has booted.

> make ARCH=3Dm68k CROSS_COMPILE=3Dm68k-linux-gnu-
> make ARCH=3Dm68k CROSS_COMPILE=3Dm68k-linux-gnu- INSTALL_MOD_PATH=3D/=
data/m68k modules_install
>
> The kernel boots, it configures the network (static). When I try to p=
ing a
> host on my network, I get this oops(?). =A0A few seconds later I also=
 get the
> mismatch message I reported earlier (does not show up in dmesg?).

It should show up - if it's being printed to the console it has to be
in the kernel log buffer for klogd to pick up.

Cheers,

  Michael
