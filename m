From: Thorsten Glaser <tg@mirbsd.de>
Subject: Re: The BigRAMPlus works - Re: kullervo with bigram
Date: Sun, 18 Jan 2015 15:19:23 +0000 (UTC)
Message-ID: <Pine.BSM.4.64L.1501181517170.24685@herc.mirbsd.org>
References: <54BACEB6.6060805@debian.org> <20150118115355.GA20168@guido.earth.sol>
 <CAMuHMdXTyYp=7SOL4qG1JoK6x6zO5mqkGt9wKGXceqbjejMwgA@mail.gmail.com>
 <54BBA8D3.8020703@physik.fu-berlin.de> <CAMuHMdX6yV8ptj0E=9HOH5kGEMiOD3gmbD=v8qYXQnmbUZ7O2Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from static-87-79-237-121.netcologne.de ([87.79.237.121]:12709 "EHLO
	herc.mirbsd.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751924AbbARPZ1 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 18 Jan 2015 10:25:27 -0500
In-Reply-To: <CAMuHMdX6yV8ptj0E=9HOH5kGEMiOD3gmbD=v8qYXQnmbUZ7O2Q@mail.gmail.com>
Content-Language: de-DE-1901, en-GB
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
Cc: Linux/m68k <linux-m68k@vger.kernel.org>, Debian m68k <debian-68k@lists.debian.org>

Geert Uytterhoeven dixit:

>> Furthermore, we just wanted to use the BigRAMPlus as a swap device
>> now following Ingo's description [1]. Unfortunately, CONFIG_MTD
>> is not set in the current Debian m68k kernel and we therefore
>> can't use it.
>>
>> Any chance we can activate that?
>
>Build your own kernel?

Either that, or ask the Debian kernel maintainers to enable that
symbol for us. If it=E2=80=99s already enabled in other architectures,
this may be done as-is; otherwise, they may want to enable it
generically, which will need to wait until after the unblock.

>But I think a real block device driver would perform better.
>drivers/block/ps3vram.c would be a good example.

Or that, sure.

But I think that, if the kernel source is going to be changed
at all, using it as RAM straight would be better, since more
RAM means not only less need to swap but also better RAM use
and all that.

bye,
//mirabilos

PS: Who=E2=80=99s going to write a report about the weekend? Not me=E2=80=
=A6
    but having one would be nice =E2=98=BA
--=20
<igli> exceptions: a truly awful implementation of quite a nice idea.
<igli> just about the worst way you could do something like that, afaic=
=2E
<igli> it's like anti-design.  <mirabilos> that too=E2=80=A6 may I quot=
e you on that?
<igli> sure, tho i doubt anyone will listen ;)
