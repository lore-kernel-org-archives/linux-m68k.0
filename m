From: Thorsten Glaser <tg@mirbsd.de>
Subject: Re: Debian kernel v2.6.38
Date: Sun, 24 Apr 2011 11:37:55 +0000 (UTC)
Message-ID: <Pine.BSM.4.64L.1104241134030.8787@herc.mirbsd.org>
References: <BANLkTimCKhPbp3wOCpVusHu1JmoyhwKX0w@mail.gmail.com>
 <Pine.BSM.4.64L.1104231809290.3979@herc.mirbsd.org>
 <BANLkTimNekxddcHFFV1cAAyiCWsz2EY11g@mail.gmail.com> <4DB34EE6.6010004@gmail.com>
 <BANLkTinPijbiOCN_uTokGwT79ua0YyhOEw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from static-87-79-237-121.netcologne.de ([87.79.237.121]:32342 "EHLO
	herc.mirbsd.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751439Ab1DXLj0 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 24 Apr 2011 07:39:26 -0400
Received: from herc.mirbsd.org (tg@localhost [IPv6:::1])
	by herc.mirbsd.org (8.14.5.Beta0/8.14.5.Beta0) with ESMTP id p3OBbvcs009838
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-m68k@vger.kernel.org>; Sun, 24 Apr 2011 11:38:01 GMT
In-Reply-To: <BANLkTinPijbiOCN_uTokGwT79ua0YyhOEw@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org

Geert Uytterhoeven dixit:

>On Sun, Apr 24, 2011 at 00:12, Michael Schmitz
><schmitzmic@googlemail.com> wrote:

>> If there is a generic lowmem allocator

There=E2=80=99s bound to be one. For example, on i386 you have two kind=
s
of lowmem to take care of: ISA DMA (first 16 MiB), and DMA and/or
BIOS call space within the first 640 KiB (both preferably not
crossing a 64 KiB boundary). But then, I=E2=80=99m not a kernel program=
mer
(either BSD or Linux), so I don=E2=80=99t know how things are handled t=
hese
days.

>  - ataflop, atari_scsi, and atafb allocate ST-RAM only at driver
>initialization,

Speaking of atafb, with the trimmed-down patch I get garbled video
with BootColorDepth 1, 4 or 8, and no option or video=3Datafb:vga2
both; using video=3Datafb:vga4 (with BCD=3D4) has no output at all.

This is no biggie for me, since the boxen work, but e.g. when
there=E2=80=99s an =E2=80=9Cmounted n times=E2=80=9D fsck, the machine =
takes ages longer
to get up, and people will think it has frozen, so I=E2=80=99d very muc=
h
like to get _some_ kind of fix into at least the second version
of the Debian kernel, once we get past the initial hurdle=E2=80=A6

bye,
//mirabilos
--=20
13:47=E2=8E=9C<tobiasu> if i were omnipotent, i would divide by zero
                all day long ;)
(thinking about http://lobacevski.tumblr.com/post/3260866481 by waga)
