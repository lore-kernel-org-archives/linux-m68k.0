From: Thorsten Glaser <tg@mirbsd.de>
Subject: Re: [PATCH 1/5] m68k/atari: EtherNAT - change number of Atari
 interrupts to make room for EtherNAT interrupts
Date: Tue, 3 Apr 2012 21:54:29 +0000 (UTC)
Message-ID: <Pine.BSM.4.64L.1204032152530.9030@herc.mirbsd.org>
References: <1327085843-6980-1-git-send-email-geert@linux-m68k.org>
 <4F4B2BB6.900@gmail.com> <4F77C245.5090002@gmail.com>
 <CAMuHMdUm8Mot6ioYemQVacCZxgYKBGBDGUz2X4Xh_zJf_ZPgKQ@mail.gmail.com>
 <CAOmrzkJqkLC=dhsY0AUduv3Mm7PVmbtHrsjgS6v=V14eXuuA8g@mail.gmail.com>
 <CAMuHMdXnVU2ZuCVLWA27RaCm2COi_AdDE9F2hj=qBGQLB6KxuA@mail.gmail.com>
 <CAOmrzkJGonrmY4jztegh3JqZRW17H1sF7en765=Em+_G7SodXw@mail.gmail.com>
 <4F7B6880.9050605@gmail.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from static-87-79-237-121.netcologne.de ([87.79.237.121]:18861 "EHLO
	herc.mirbsd.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753846Ab2DCV6w convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 3 Apr 2012 17:58:52 -0400
In-Reply-To: <4F7B6880.9050605@gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitzmic@googlemail.com>
Cc: linux-m68k@vger.kernel.org, debian-68k@lists.debian.org

Michael Schmitz dixit:

> For some reason, I have to set NUM_ATARI_SOURCES to 141 to actually g=
et
> interrupt source 140 to register. Off-by-one error somewhere in the g=
eneric
> interrupt code I'd think, but I've not been able to spot it. (Just in=
creasing

I think 141 interrupt sources covers sources #0 to #140, no?

> Next project : SCSI, SCC serial, or what?...

PCI bus. Then radeonfb. I got someone asking for that. =E2=98=BA

They actually took Linux=E2=80=99 radeonfb and ported that to the
other Atari OSes, so only the PCI bridge should remain.

#atari-home on OFTC, talk to ragnar76.

bye,
//mirabilos
--=20
  =E2=80=9CHaving a smoking section in a restaurant is like having
          a peeing section in a swimming pool.=E2=80=9D
						-- Edward Burr
