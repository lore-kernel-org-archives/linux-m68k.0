From: Thorsten Glaser <tg@mirbsd.de>
Subject: Re: Debian/m68k kernel (preview)
Date: Sun, 24 Apr 2011 11:18:13 +0000 (UTC)
Message-ID: <Pine.BSM.4.64L.1104241116160.8787@herc.mirbsd.org>
References: <BANLkTi=6T8SxqnsXTY5ceyikg2NTKLVSKw@mail.gmail.com>
 <BANLkTimN4vbAPJVKgH8iTZy7B5Fr8B+ibA@mail.gmail.com>
 <BANLkTikSRStQO6cyE+L2vHHe0TnkoBe8=A@mail.gmail.com>
 <BANLkTim_A-r4Khdx20tLKFU8ybtB+=wcyg@mail.gmail.com>
 <BANLkTin4=QFyQUT95d7eoXXrdkNJc=T9Tw@mail.gmail.com>
 <Pine.BSM.4.64L.1104231534340.3979@herc.mirbsd.org>  <20110423185725.GA16947@chumley.earth.sol>
  <Pine.BSM.4.64L.1104232054070.3979@herc.mirbsd.org> <1303617602.3032.86.camel@localhost>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from static-87-79-237-121.netcologne.de ([87.79.237.121]:7954 "EHLO
	herc.mirbsd.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756597Ab1DXL16 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 24 Apr 2011 07:27:58 -0400
In-Reply-To: <1303617602.3032.86.camel@localhost>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Ben Hutchings <ben@decadent.org.uk>, "Stephen R. Marenka" <stephen@marenka.net>
Cc: Debian Kernel Team <debian-kernel@lists.debian.org>, linux-m68k@vger.kernel.org

Ben Hutchings dixit:

>You don't need to unset ECONET or X25 in debian/config/m68k/config; th=
ey

OK. As I said, for the configs I just merged what was there in
Debian=E2=80=99s 2.6.32 tree already, added one RTC option and made the
others from m into y on atari. Feel free to twiddle them around
in any way you want. (Stephen Marenka, any input on the config?)

>> I don=E2=80=99t know how the ABI files are generated, there=E2=80=99=
s none for
>> m68k yet. Please tell me if I have to do something.

>They are based on the Module.symvers files generated during a build an=
d
>included in the linux-headers-* packages.  They are added to the *next=
*
>version of the source package if we are intending to maintain the ABI,

Ah! Many thanks for the explanation!

bye,
//mirabilos
--=20
16:47=E2=8E=9C=C2=ABmika:#grml=C2=BB .oO(mira ist einfach gut....)     =
 23:22=E2=8E=9C=C2=ABmikap:#grml=C2=BB
mirabilos: und dein bootloader ist geil :)    23:29=E2=8E=9C=C2=ABmikap=
:#grml=C2=BB und ich
finds saugeil dass ich ein bsd zum booten mit grml hab, das muss ich da=
nn
gleich mal auf usb-stick installieren	-- Michael Prokop =C3=BCber MirOS=
 bsd4grml
