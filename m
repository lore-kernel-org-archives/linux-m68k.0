From: Thorsten Glaser <tg@mirbsd.de>
Subject: Re: build warnings
Date: Sun, 16 Jan 2011 13:54:59 +0000 (UTC)
Message-ID: <Pine.BSM.4.64L.1101161347480.11797@herc.mirbsd.org>
References: <alpine.DEB.2.00.1101131539400.19098@tglase.bonn.tarent.de>
 <alpine.DEB.2.00.1101141023130.5300@tglase.bonn.tarent.de>
 <AANLkTi=2Cb+EHR9xAgNPa7wGsSWWydZ56_iAGRDN-hXU@mail.gmail.com>
 <AANLkTinN+0i9gZxvUn0cig1kp0aM9iJ+fph0=-R-ChKZ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from static-87-79-237-121.netcologne.de ([87.79.237.121]:24632 "EHLO
	herc.mirbsd.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752218Ab1APOJw convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 16 Jan 2011 09:09:52 -0500
In-Reply-To: <AANLkTinN+0i9gZxvUn0cig1kp0aM9iJ+fph0=-R-ChKZ@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitzmic@googlemail.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k@vger.kernel.org

Michael Schmitz dixit:

>The reference to slab allocation in the above error message does ring
>a bell - a colleague has panics that look kinda similar (Intel
>hardware running virtual machines there). Does look like the kernel
>can get out of memory without the proper plugs being pulled (my gut

Oh, ouch.

>feeling). I'll have to look into that some more. Maybe play with
>memory or ST-RAM pool size in ARAnyM.

Well, I do have a large number of patches applied (all of Debian=E2=80=99=
s
and the entire m68k queue)=E2=80=A6

>Can you send me a copy of that kernel image so I can give it a try on
>my working ARAnyM config, Thorsten?

Sure: https://pfau.mirbsd.org/~tg/pub/vmlinux.gz

>(on the buildd chroot image test: had to discover the spare IDE disk I
>used for tests has died; need to get a new one finally)

Ah okay. Good luck anyway=E2=80=A6

bye,
//mirabilos
--=20
<ch> you introduced a merge commit        =E2=94=82<mika> % g rebase -i=
 HEAD^^
<mika> sorry, no idea and rebasing just fscked =E2=94=82<mika> Segmenta=
tion
<ch> should have cloned into a clean repo      =E2=94=82  fault (core d=
umped)
<ch> if I rebase that now, it's really ugh     =E2=94=82<mika:#grml> wu=
ahhhhhh
