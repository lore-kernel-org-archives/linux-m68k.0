From: Finn Thain <fthain@telegraphics.com.au>
Subject: Re: [PATCH 1/1] m68k: add missing I/O macros {in,out}{w,l}_p() for
 !CONFIG_ISA
Date: Thu, 7 Oct 2010 01:15:15 +1100 (EST)
Message-ID: <alpine.OSX.2.00.1010070044520.278@localhost>
References: <Pine.BSM.4.64L.1010031832530.15165@herc.mirbsd.org>    <Pine.BSM.4.64L.1010031846060.15165@herc.mirbsd.org>    <alpine.OSX.2.00.1010041149030.285@localhost>    <Pine.BSM.4.64L.1010040738160.22274@herc.mirbsd.org>    <alpine.OSX.2.00.1010041943530.285@localhost>
    <Pine.BSM.4.64L.1010040906400.22591@herc.mirbsd.org>    <alpine.OSX.2.00.1010042115260.285@localhost>    <AANLkTi=TZBpWS1_ybct=fHeZ9N9AZE_+UoJnwM0HxanM@mail.gmail.com>    <Pine.BSM.4.64L.1010041338370.24518@herc.mirbsd.org>
 <3e567f8e50ae806e7dc2b734cc2785f9.squirrel@naiad.marenka.org> <Pine.BSM.4.64L.1010060924250.21623@herc.mirbsd.org>
Mime-Version: 1.0
Content-Type: MULTIPART/MIXED; BOUNDARY="0-1489152872-1286374515=:278"
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from www.telegraphics.com.au ([204.15.192.19]:43649 "EHLO
	mail.telegraphics.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1759031Ab0JFOPN (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 6 Oct 2010 10:15:13 -0400
In-Reply-To: <Pine.BSM.4.64L.1010060924250.21623@herc.mirbsd.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Thorsten Glaser <tg@mirbsd.de>
Cc: linux-m68k@vger.kernel.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--0-1489152872-1286374515=:278
Content-Type: TEXT/PLAIN; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE


On Wed, 6 Oct 2010, Thorsten Glaser wrote:

> the ARAnyM RTC driver added after my last =E2=80=9Creport=E2=80=9D probab=
ly vanished too=20
> (hwclock still says it can=E2=80=99t access it).

I gather that atari uses CONFIG_RTC_DRV_CMOS which needs CONFIG_RTC_CLASS.=
=20
The Debian 2.6.32-23 configs lack these:

linux-2.6-2.6.32$ grep -r RTC_CLASS debian/config/
debian/config/config:CONFIG_RTC_CLASS=3Dy
debian/config/m68k/config.atari:# CONFIG_RTC_CLASS is not set
debian/config/sh4/config.sh7785lcr:CONFIG_RTC_CLASS=3Dy
debian/config/sh4/config.sh7751r:CONFIG_RTC_CLASS=3Dy
debian/config/hppa/config:# CONFIG_RTC_CLASS is not set
linux-2.6-2.6.32$=20

That's about all I can tell from looking at the sources. Hopefully someone=
=20
who knows something about atari/aranym can say more. This link might jog=20
some memories:=20
http://permalink.gmane.org/gmane.linux.debian.ports.68k/9157

Finn
--0-1489152872-1286374515=:278--
