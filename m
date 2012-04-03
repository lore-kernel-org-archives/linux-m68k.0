From: Thorsten Glaser <tg@mirbsd.de>
Subject: Re: [PATCH 1/5] m68k/atari: EtherNAT - change number of Atari
 interrupts to make room for EtherNAT interrupts
Date: Tue, 3 Apr 2012 22:31:08 +0000 (UTC)
Message-ID: <Pine.BSM.4.64L.1204032229300.9030@herc.mirbsd.org>
References: <1327085843-6980-1-git-send-email-geert@linux-m68k.org>
 <4F4B2BB6.900@gmail.com> <4F77C245.5090002@gmail.com>
 <CAMuHMdUm8Mot6ioYemQVacCZxgYKBGBDGUz2X4Xh_zJf_ZPgKQ@mail.gmail.com>
 <CAOmrzkJqkLC=dhsY0AUduv3Mm7PVmbtHrsjgS6v=V14eXuuA8g@mail.gmail.com>
 <CAMuHMdXnVU2ZuCVLWA27RaCm2COi_AdDE9F2hj=qBGQLB6KxuA@mail.gmail.com>
 <CAOmrzkJGonrmY4jztegh3JqZRW17H1sF7en765=Em+_G7SodXw@mail.gmail.com>
 <4F7B6880.9050605@gmail.com> <Pine.BSM.4.64L.1204032152530.9030@herc.mirbsd.org>
 <4F7B77FF.200@gmail.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from static-87-79-237-121.netcologne.de ([87.79.237.121]:47452 "EHLO
	herc.mirbsd.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753519Ab2DCWer convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 3 Apr 2012 18:34:47 -0400
In-Reply-To: <4F7B77FF.200@gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitzmic@googlemail.com>
Cc: linux-m68k@vger.kernel.org, debian-68k@lists.debian.org

Michael Schmitz dixit:

>>> For some reason, I have to set NUM_ATARI_SOURCES to 141 to actually=
 get
>>> interrupt source 140 to register. Off-by-one error somewhere in the=
 generic
>>> interrupt code I'd think, but I've not been able to spot it. (Just =
increasing
>>>   =20
>>
>> I think 141 interrupt sources covers sources #0 to #140, no?
>> =20
> What's interrupt #0? #1 to #7 are level 1 to 7 autovector interrupts.=
 #8 to

I was just guessing. An all-uppercase identifier in a C context
that expands to an integer and has NUMber in its name might just
be used in the declarartion of a C array, that=E2=80=99s why.

> ragnar rings a bell, is that ragnar@chaosdorf.de?

Chaosdorf yes, so, probably yes.

bye,
//mirabilos
--=20
=E2=80=9CIt is inappropriate to require that a time represented as
 seconds since the Epoch precisely represent the number of
 seconds between the referenced time and the Epoch.=E2=80=9D
	-- IEEE Std 1003.1b-1993 (POSIX) Section B.2.2.2
