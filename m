From: Michael Schmitz <schmitzmic@googlemail.com>
Subject: Re: [PATCH 1/5] m68k/atari: EtherNAT - change number of Atari interrupts
 to make room for EtherNAT interrupts
Date: Wed, 04 Apr 2012 10:21:51 +1200
Message-ID: <4F7B77FF.200@gmail.com>
References: <1327085843-6980-1-git-send-email-geert@linux-m68k.org> <4F4B2BB6.900@gmail.com> <4F77C245.5090002@gmail.com> <CAMuHMdUm8Mot6ioYemQVacCZxgYKBGBDGUz2X4Xh_zJf_ZPgKQ@mail.gmail.com> <CAOmrzkJqkLC=dhsY0AUduv3Mm7PVmbtHrsjgS6v=V14eXuuA8g@mail.gmail.com> <CAMuHMdXnVU2ZuCVLWA27RaCm2COi_AdDE9F2hj=qBGQLB6KxuA@mail.gmail.com> <CAOmrzkJGonrmY4jztegh3JqZRW17H1sF7en765=Em+_G7SodXw@mail.gmail.com> <4F7B6880.9050605@gmail.com> <Pine.BSM.4.64L.1204032152530.9030@herc.mirbsd.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-iy0-f174.google.com ([209.85.210.174]:55437 "EHLO
	mail-iy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753502Ab2DCWWA (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 3 Apr 2012 18:22:00 -0400
Received: by iagz16 with SMTP id z16so249325iag.19
        for <linux-m68k@vger.kernel.org>; Tue, 03 Apr 2012 15:21:58 -0700 (PDT)
In-Reply-To: <Pine.BSM.4.64L.1204032152530.9030@herc.mirbsd.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Thorsten Glaser <tg@mirbsd.de>
Cc: Michael Schmitz <schmitzmic@googlemail.com>, linux-m68k@vger.kernel.org, debian-68k@lists.debian.org

Thorsten,
>> For some reason, I have to set NUM_ATARI_SOURCES to 141 to actually =
get
>> interrupt source 140 to register. Off-by-one error somewhere in the =
generic
>> interrupt code I'd think, but I've not been able to spot it. (Just i=
ncreasing
>>    =20
>
> I think 141 interrupt sources covers sources #0 to #140, no?
>  =20
What's interrupt #0? #1 to #7 are level 1 to 7 autovector interrupts. #=
8=20
to #140 are the vectored ones starting with the ST-MFP.
>> Next project : SCSI, SCC serial, or what?...
>>    =20
>
> PCI bus. Then radeonfb. I got someone asking for that. =E2=98=BA
>  =20
Throw hardware my way ... PCI bridge should not be that difficult reall=
y.

Seriously - at this stage I don't know whether my EtherNAT or the CT60'=
s=20
bus drivers are shot. So _don't_ throw hardware.
> They actually took Linux=E2=80=99 radeonfb and ported that to the
> other Atari OSes, so only the PCI bridge should remain.
>
> #atari-home on OFTC, talk to ragnar76.
>  =20
ragnar rings a bell, is that ragnar@chaosdorf.de?

Cheers,

  Michael
