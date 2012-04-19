From: Thorsten Glaser <tg@mirbsd.de>
Subject: Re: Atari ROM port ISA
Date: Thu, 19 Apr 2012 20:43:21 +0000 (UTC)
Message-ID: <Pine.BSM.4.64L.1204192041320.27380@herc.mirbsd.org>
References: <alpine.DEB.2.00.1204151113430.31626@ayla.of.borg>
 <4F8BCF49.4060109@gmail.com> <20120417050500.GA14387@cynthia.pants.nu>
 <loom.20120419T165359-796@post.gmane.org>
 <CAOmrzkKRE2SsJM532itFRd5fG2Bx-wxfno=ftb0SjXC1vWkbgQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from static-87-79-237-121.netcologne.de ([87.79.237.121]:40407 "EHLO
	herc.mirbsd.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932281Ab2DSUwA convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Thu, 19 Apr 2012 16:52:00 -0400
In-Reply-To: <CAOmrzkKRE2SsJM532itFRd5fG2Bx-wxfno=ftb0SjXC1vWkbgQ@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitzmic@googlemail.com>
Cc: linux-m68k@vger.kernel.org

Michael Schmitz dixit:

>Thanks for explaining this to me - to be honest I've never cared too
>much about ISA and friends.

No problem. (I practically grew up with them, so while the knowledge
isn=E2=80=99t fresh, some is there.)

>I'll check the layout - my guess would be that there's no memory
>read/write selects wired up on the adapter. The RTL8019 doesn't need
>them, the ISP1160  on the NetUSBee doesn't need them either.

I=E2=80=99d guess the same. You=E2=80=99d need them for things like an =
ISA graphics
card, but not (most) I/O devices.

>If someone ever comes up with a way to hook up a fully featured ISA
>slot to the ROM port (mapping ports 0x00 to 0x7f to IO and above to
>mem access should be possible) we might revisit the code. For now,
>anything except for 8 bit IO can be turned into dummy functions or
>compile warnings.

Might be nice, if possible. But for now, that would indeed be
the way to go (and clean up code).

bye,
//mirabilos
--=20
  =E2=80=9CHaving a smoking section in a restaurant is like having
          a peeing section in a swimming pool.=E2=80=9D
						-- Edward Burr
