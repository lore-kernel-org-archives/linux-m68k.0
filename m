From: Finn Thain <fthain@telegraphics.com.au>
Subject: Re: FPU emulation incorrect for 68LC040?
Date: Thu, 22 Jul 2010 11:05:42 +1000 (EST)
Message-ID: <alpine.OSX.2.00.1007221056390.354@localhost>
References: <08EC3395-75C3-4E81-B468-C9978DDCF85D@bredband.net> <AANLkTilKXTCUJIOEvQ-H5GjGfPwYV5_QufuD46twmNvS@mail.gmail.com> <41EF646C-8866-4070-B772-94E39EF4620B@bredband.net>
Mime-Version: 1.0
Content-Type: MULTIPART/MIXED; BOUNDARY="0-1601364300-1279760742=:354"
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from www.telegraphics.com.au ([204.15.192.19]:64825 "EHLO
	mail.telegraphics.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751575Ab0GVBOf (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 21 Jul 2010 21:14:35 -0400
In-Reply-To: <41EF646C-8866-4070-B772-94E39EF4620B@bredband.net>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: =?ISO-8859-15?Q?Mattias_Engdeg=E5rd?= <mattiase@bredband.net>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k@vger.kernel.org, zippel@linux-m68k.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--0-1601364300-1279760742=:354
Content-Type: TEXT/PLAIN; charset=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE


On Wed, 21 Jul 2010, Mattias Engdeg=E5rd wrote:

> 21 jul 2010 kl. 22.32 skrev Geert Uytterhoeven:
>=20
> > As the 'LC040 doesn't implement FPU instructions, I'd expect it to=20
> > just generate an exception when the "fadd.d (a0)+,fp0" is encountered.=
=20
> > I.e. not do anything else, like postincrementing a0.
>=20
> According to the manual, it generates a special 8-word exception frame=20
> that contains the decoded effective address, as a help to the emulator.=
=20
> It only makes sense if the user can just use that EA right away (after=20
> having established that it is a memory operand). I suppose the only way=
=20
> to find out is to find someone with a genuine 'LC040 (a non-buggy one).

I have both kinds, buggy and non-buggy. Unfortunately, these machines=20
(PowerBooks) don't have working SCSI and the one with IDE has no Linux=20
filesystem.

But if you send me some inline asm, I'll patch it into busybox and test a=
=20
2.6.34 initramfs for you.

Finn
--0-1601364300-1279760742=:354--
