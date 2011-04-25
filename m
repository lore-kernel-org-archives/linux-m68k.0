From: Michael Schmitz <schmitzmic@googlemail.com>
Subject: Re: [patch] m68k, mm: set all online nodes in N_NORMAL_MEMORY
Date: Mon, 25 Apr 2011 14:41:35 +1200
Message-ID: <4DB4DF5F.809@gmail.com>
References: <1303317178.2587.30.camel@mulgrave.site> <alpine.DEB.2.00.1104201410350.31768@chino.kir.corp.google.com> <20110421220351.9180.A69D9226@jp.fujitsu.com> <alpine.DEB.2.00.1104211237250.5829@chino.kir.corp.google.com> <alpine.DEB.2.00.1104211500170.5741@router.home> <alpine.DEB.2.00.1104211411540.20201@chino.kir.corp.google.com> <alpine.DEB.2.00.1104211501470.20201@chino.kir.corp.google.com> <4DB3840F.3060503@gmail.com> <BANLkTi=vm-qs48-JySCpv+YHyC+9sO9U0A@mail.gmail.com> <Pine.BSM.4.64L.1104241131460.8787@herc.mirbsd.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pv0-f174.google.com ([74.125.83.174]:61757 "EHLO
	mail-pv0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758021Ab1DYClr (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 24 Apr 2011 22:41:47 -0400
In-Reply-To: <Pine.BSM.4.64L.1104241131460.8787@herc.mirbsd.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Thorsten Glaser <tg@mirbsd.de>
Cc: Michael Schmitz <schmitzmic@googlemail.com>, KOSAKI Motohiro <kosaki.motohiro@gmail.com>, David Rientjes <rientjes@google.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Andrew Morton <akpm@linux-foundation.org>, Roman Zippel <zippel@linux-m68k.org>, linux-m68k@vger.kernel.org, linux-kernel@vger.kernel.org, schwab@linux-m68k.org

Hello Thorsten,
>> Tested on my ARAnyM test setup so far. I'd like to wait for an indep=
endent
>> kernel image built by Thorsten before I test on the actual hardware.=
 Sorry but
>> you'll have to restart your build Thorsten :-)
>>    =20
>
> Heh okay, if you want. But only cross-compiling :D
>  =20
Thought so. That's fine actually. Your cross toolchain will be a lot=20
more recent than mine.
>
> KOSAKI Motohiro dixit:
>
>  =20
>> I think you are right. however I doubt m68k need to care memoryless =
node check.
>> probably following patch just work.
>>    =20
>
> That=E2=80=99s what we have now. Compiles, boots, works fine.
>
>
> So, which of these do you guys want?
>  =20
Whatever is cleaner and easier to understand. I'm a poor judge of code=20
elegance.

Cheers,

  Michael
