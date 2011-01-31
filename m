From: Thorsten Glaser <tg@mirbsd.de>
Subject: Re: Atari console corruption
Date: Mon, 31 Jan 2011 22:04:21 +0000 (UTC)
Message-ID: <Pine.BSM.4.64L.1101312159540.30566@herc.mirbsd.org>
References: <AANLkTimZ4q3mGhy27qVo5gQHMCM2U8jrc_fNPH4YUXev@mail.gmail.com>
 <m2fww9dczv.fsf@igel.home> <Pine.BSM.4.64L.1101301417070.30539@herc.mirbsd.org>
 <AANLkTikQ26zuDvt6WsHAg_Mn4y3KY+eroSJiKwP8rSWE@mail.gmail.com>
 <Pine.BSM.4.64L.1101301913500.30539@herc.mirbsd.org>
 <AANLkTimEeLfHJrcFhk+38og1GDP1KZLaiXVqYRhMfhbc@mail.gmail.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from static-87-79-237-121.netcologne.de ([87.79.237.121]:46828 "EHLO
	herc.mirbsd.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754113Ab1AaWEm convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Mon, 31 Jan 2011 17:04:42 -0500
Received: from herc.mirbsd.org (tg@localhost [IPv6:::1])
	by herc.mirbsd.org (8.14.5.Beta0/8.14.5.Beta0) with ESMTP id p0VM4PL9026294
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-m68k@vger.kernel.org>; Mon, 31 Jan 2011 22:04:29 GMT
In-Reply-To: <AANLkTimEeLfHJrcFhk+38og1GDP1KZLaiXVqYRhMfhbc@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
Cc: linux-m68k@vger.kernel.org

Geert Uytterhoeven dixit:

>What does `fbset -i' say?

*installs fbset* (if it helps, the lightwhite text of linux_logo -uy
is fine, but the normal shell lightgrey on black looks yellowish)

mode "640x480-60"
    # D: 25.176 MHz, H: 31.470 kHz, V: 59.943 Hz
    geometry 640 480 640 960 4
    timings 39720 42 18 31 11 100 3
    rgba 4/0,4/0,4/0,0/0
endmode

=46rame buffer device informaion:
    Name	: Atari Builtin
    Address	: 0xb27000
    Size	: 307200
    Type	: INTERLEAVED PLANES (2 bytes interleave)
    Visual	: PSEUDOCOLOR
    XPanStep	: 1
    YPanStep	: 1
    YWrapStep	: 0
    LineLength	: 320
    Accelerator	: Atari Blitter

Hm, so it appears I *am* using an interleaved mode but do not
have the corruption. Nice=E2=80=A6 (but then, this is an old kernel wit=
h
only a few of the modern patches=E2=80=A6 OTOH, I never saw it=E2=80=A6=
)

ARAnyM config looks like:

[VIDEO]
=46ullScreen =3D No
BootColorDepth =3D 8
VidelRefresh =3D 1

and
Args =3D root=3D/dev/hda1 console=3Dtty debug=3Dpar
(using video=3Datafb:vga2 is no longer needed thanks to the stram fix)

bye,
//mirabilos
--=20
22:20=E2=8E=9C<asarch> The crazy that persists in his craziness becomes=
 a master
22:21=E2=8E=9C<asarch> And the distance between the craziness and genia=
lity is
only measured by the success                       22:21=E2=8E=9C<mksh>=
 it=E2=80=99s a
very thin line anyway=E2=80=A6 with some, you don=E2=80=99t know which =
side they=E2=80=99re on
