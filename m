From: Finn Thain <fthain@telegraphics.com.au>
Subject: Re: I'm back on linux-m68k
Date: Thu, 16 Oct 2008 11:44:07 +1100 (EST)
Message-ID: <Pine.LNX.4.64.0810161121430.6252@loopy.telegraphics.com.au>
References: <6C4F43D4-2A75-48DC-98A2-ABE37A2FB1A9@gmail.com>
 <Pine.LNX.4.64.0810160022330.21195@loopy.telegraphics.com.au>
 <CEE35843-1B20-4782-A5F9-35F0C62FE0A8@lvivier.info>
Mime-Version: 1.0
Content-Type: MULTIPART/MIXED; BOUNDARY="768252030-635996748-1224117847=:6252"
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from loopy.telegraphics.com.au ([202.45.126.152]:40091 "EHLO
	loopy.telegraphics.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752901AbYJPAoJ (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 15 Oct 2008 20:44:09 -0400
In-Reply-To: <CEE35843-1B20-4782-A5F9-35F0C62FE0A8@lvivier.info>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Laurent Vivier <laurent@lvivier.info>
Cc: Joshua Juran <jjuran@gmail.com>, Linux/m68k <linux-m68k@vger.kernel.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--768252030-635996748-1224117847=:6252
Content-Type: TEXT/PLAIN; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE



On Thu, 16 Oct 2008, Laurent Vivier wrote:

>=20
> Le 15 oct. 08 =E0 16:20, Finn Thain a =E9crit :
>=20
> >[...]
> >
> >Laurent can fill in the details (and probably correct me here), but I=20
> >would imagine that, like XPostFacto**, we'd need to copy the boot=20
> >loader to the helper volume, copy the kernel binary, set kernel=20
> >arguments, configure boot blocks on the helper device and set the boot=
=20
> >device in PRAM. The tools to do all this from the linux side are part=20
> >of Emile. But if/when something goes awry, it may be most easily fixed=
=20
> >from MacOS.
>=20
> It's a good idea but the primary goal of EMILE is to totally remove=20
> MacOS from the disk...

That argument would be much more compelling if Linux supported more Mac=20
hardware (by which I mean, co-processor network cards, more powerful=20
display cards, duo docks, audio, scsi ethernet adapters, scsi HBA=20
cards...) and MacOS software.

But even if we supported everything, MacOS will always be a better=20
operating system for certain tasks, since it makes different compromises.

I think dual-booting would make Emile more useful to more people. But it's=
=20
quite possible that no-one else would want this.

Finn
--768252030-635996748-1224117847=:6252--
