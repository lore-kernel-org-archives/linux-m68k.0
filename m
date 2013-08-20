From: Petr Stehlik <pstehlik@sophics.cz>
Subject: Re: nfhd performance
Date: Tue, 20 Aug 2013 08:24:58 +0200
Message-ID: <1376979898.5651.10.camel@pracovni>
References: <CAMuHMdUwzzx5Ae7sdvbRBtgY4UoXpo5-ig4PfdqFH4beWv_AHQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mx.zln.cz ([188.246.101.4]:47090 "EHLO mx.zln.cz"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751926Ab3HTGZF convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 20 Aug 2013 02:25:05 -0400
In-Reply-To: <CAMuHMdUwzzx5Ae7sdvbRBtgY4UoXpo5-ig4PfdqFH4beWv_AHQ@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linux/m68k <linux-m68k@vger.kernel.org>, aranym@lists.bobek.cz

Geert Uytterhoeven p=ED=B9e v P=E1 16. 08. 2013 v 23:57 +0200:

> In a kernel that has both IDE and nfhd support, once everything is in=
 the
> buffer cache, I get:
>=20
> atari:~# dd if=3D/dev/hda2 bs=3D1M of=3D/dev/null
> 141114880 bytes (141 MB) copied, 5.91 seconds, 23.9 MB/s
> atari:~# dd if=3D/dev/nfhd8p2 bs=3D1M of=3D/dev/null
> 141114880 bytes (141 MB) copied, 17.09 seconds, 8.3 MB/s

=46YI, I have just tried running XFERRATE.TTP (freeware by
AnodyneSoftware.com) under plain TOS with clock driven by RTC and disk
image without byteswap (it's still my original 1000 MB disk from Atari
=46alcon). I got the following results with a small 30 MB partition tha=
t
most probably fully fit into host buffer cache:

Rwabs() transfer rate: 26660-26220 kb/sec
XHDI transfer rate: 26750 kb/sec

Please note that the Rwabs is a direct BIOS access. I think it's rather
close if not equivalent to your 'dd if=3D/dev/hda2'.

It basically means that since the XHDI path is slightly shorter code
path so the data transfer is very slightly faster. That's actually what
one could expect.

I will try more tests, especially with ByteSwap in ARAnyM enabled (to
see if there's a performance penalty). Will also try changing fread to
read and implement reading more sectors at once in the XHDI NatFeat
implementation. Will post my results here.

In summary, the slow nfhd above seems to be caused by the linux-m68k
implementation as I can't see such slow down under plain TOS.

Petr
