From: Michael Schmitz <schmitzmic@gmail.com>
Subject: Re: atafb and X/fbdev
Date: Sun, 08 Jul 2012 15:47:40 +1200
Message-ID: <4FF902DC.4010208@gmail.com>
References: <Pine.BSM.4.64L.1207062301330.12225@herc.mirbsd.org> <4FF7AFD7.8000005@biophys.uni-duesseldorf.de> <Pine.BSM.4.64L.1207070751590.7146@herc.mirbsd.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pb0-f46.google.com ([209.85.160.46]:64489 "EHLO
	mail-pb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752063Ab2GHDrs (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sat, 7 Jul 2012 23:47:48 -0400
Received: by pbbrp8 with SMTP id rp8so17153427pbb.19
        for <linux-m68k@vger.kernel.org>; Sat, 07 Jul 2012 20:47:47 -0700 (PDT)
In-Reply-To: <Pine.BSM.4.64L.1207070751590.7146@herc.mirbsd.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Thorsten Glaser <tg@mirbsd.de>
Cc: Debian m68k <debian-68k@lists.debian.org>, linux-m68k@vger.kernel.org

Thorsten,
>> Have you tried the VGA modes (vga256 for instance)? That might boil =
down to
>> interleaved planes in the end though.
>>    =20
>
> Yes, vgs256 was interleaved too. From my limited understanding of
> atafb.c all modes are interleaved or monochrome.
>  =20

That's the way the Falcon VIDEL is wired up then.

>> You will have to go back to one of the earlier Debian releases (slin=
k or
>> potato) for Atari support in the X server. potato should still have =
the
>> required code.
>>    =20
>
> Hrm, okay. I couldn=E2=80=99t find much in the =E2=80=99net except a =
reference to
> xfree68 but was unable to find that, either. Too bad, all the history=
=E2=80=A6
>  =20

Seaching for "xfree86 fbdev server m68k" does refresh my memory a bit -
the server package was called xserver-fbdev and you will find a sample=20
config
file at http://people.debian.org/~cts/debian-m68k/slink/XF86Config -=20
Christian is
away overseas ATM or else he might be able to give a few hints here.

The entry

    Driver      "FBDev"


in the 'Screen' section is what directs xfree86 to use the generic fram=
e=20
buffer server.
> you don=E2=80=99t happen to know the _package_ name of the server, an=
d the
> needed config? ;-)
>
>  =20

See above - it's xserver-fbdev, IIRC version 3.3.6 was the last to work=
=2E=20
Also take a look at=20
http://people.debian.org/~cts/debian-m68k/slink/debian-m68k-faq
for a few likely X troubleshooting hints.

Blast from the past really - I never had much fun running X on my=20
(unaccelerated) Falcon
mainly because the system became really unstable at high resolution or=20
color depth.
Waiting for 10 minutes while the X server starts up was a bit annoying,=
=20
too.

Are you trying to get the old X server running in ARAnyM, or 'just' por=
t=20
the interleaved bit
planes code to current Xorg? If it's questions on the framebuffer memor=
y=20
layout and the VIDEL
that you need answered, Andreas and Petr might be better suited here.=20
Regarding building
xfree from source - that's memories well suppressed which do not bear=20
recalling.

Cheers,

  Michael
