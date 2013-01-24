From: Thorsten Glaser <tg@mirbsd.de>
Subject: Re: Atari TT
Date: Thu, 24 Jan 2013 20:50:52 +0000 (UTC)
Message-ID: <Pine.BSM.4.64L.1301242049350.6423@herc.mirbsd.org>
References: <20130120205231.GC32291@mail.biophys.uni-duesseldorf.de>
 <Pine.BSM.4.64L.1301202117270.27441@herc.mirbsd.org>
 <20130120225718.GA1459@mail.biophys.uni-duesseldorf.de>
 <Pine.BSM.4.64L.1301232011550.14843@herc.mirbsd.org>
 <20130123212251.GA14282@mail.biophys.uni-duesseldorf.de>
 <Pine.BSM.4.64L.1301232213380.14843@herc.mirbsd.org>
 <20130124000856.GA15759@mail.biophys.uni-duesseldorf.de>
 <Pine.BSM.4.64L.1301241759530.6423@herc.mirbsd.org>
 <20130124185341.GA27701@mail.biophys.uni-duesseldorf.de>
 <Pine.BSM.4.64L.1301241946080.6423@herc.mirbsd.org>
 <20130124202050.GA28593@mail.biophys.uni-duesseldorf.de>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from static-87-79-237-121.netcologne.de ([87.79.237.121]:42733 "EHLO
	herc.mirbsd.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756715Ab3AXU7e convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Thu, 24 Jan 2013 15:59:34 -0500
In-Reply-To: <20130124202050.GA28593@mail.biophys.uni-duesseldorf.de>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitz@opal-mail.biophys.uni-duesseldorf.de>
Cc: debian-68k@lists.debian.org, linux-m68k@vger.kernel.org

Michael Schmitz dixit:

>If the other kernel (nonet) shows a proper boot screen, that's a kerne=
l size
>issue.=20

They have very few difference, though.

>That does not include my more recent patches to the interrupt code. I
>suspect you may be using the atari_ethernec driver instead of the gene=
ric ne
>one as well. I'll check your kernel image to see what it does use.=20

I=E2=80=99m using Geert=E2=80=99s m68k-queue branch plus Alan=E2=80=99s=
 patch.
Is that not correct?

And yes, of course I selected the EtherNAT and EtherNEC drivers.

bye,
//mirabilos
--=20
=E2=80=9Enein: BerliOS und Sourceforge sind Plattformen f=C3=BCr Projek=
te, github ist
eine Plattform f=C3=BCr Einzelk=C3=A4mpfer=E2=80=9C
	-- dieses Zitat ist ein Beweis daf=C3=BCr, da=C3=9F auch ein blindes H=
uhn
	   mal ein Korn findet, bzw. =E2=80=93 in diesem Fall =E2=80=93 Recht =
haben kann
