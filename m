From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] m68k/atari: EtherNEC - rewrite to use mainstream ne.c
Date: Fri, 9 Mar 2012 07:35:12 +0100
Message-ID: <CAMuHMdX=4Vn=OsNTp04YcrhDOwz8NOFrWKankj2+3utvEfE-2A@mail.gmail.com>
References: <1327085843-6980-1-git-send-email-geert@linux-m68k.org>
	<4F4B2BB6.900@gmail.com>
	<CAP=VYLqxtE4OamrdN2RXaQu_2kK5_57-x80z48JXzt+xEtQ7pw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-we0-f174.google.com ([74.125.82.174]:37962 "EHLO
	mail-we0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752230Ab2CIGnC convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Fri, 9 Mar 2012 01:43:02 -0500
In-Reply-To: <CAP=VYLqxtE4OamrdN2RXaQu_2kK5_57-x80z48JXzt+xEtQ7pw@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Paul Gortmaker <paul.gortmaker@windriver.com>
Cc: Michael Schmitz <schmitzmic@googlemail.com>, linux-m68k@vger.kernel.org, netdev@vger.kernel.org

On Fri, Mar 9, 2012 at 04:11, Paul Gortmaker
<paul.gortmaker@windriver.com> wrote:
>> diff --git a/drivers/net/ethernet/8390/ne.c b/drivers/net/ethernet/8=
390/ne.c
>> index f92ea2a..28b8781 100644
>> --- a/drivers/net/ethernet/8390/ne.c
>> +++ b/drivers/net/ethernet/8390/ne.c
>> @@ -55,6 +55,9 @@ static const char version2[] =3D
>>
>> =C2=A0#include <asm/system.h>
>> =C2=A0#include <asm/io.h>
>> +#if IS_ENABLED(CONFIG_ATARI_ETHERNEC)
>> +#include <asm/atariints.h>
>> +#endif
>
> Do you really need the #if here? =C2=A0Should be avoidable.

<asm/atariints.h> exists on m68k only, and is not included by any heade=
r in
arch/m68k/include/.

Gr{oetje,eeting}s,

=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-=
m68k.org

In personal conversations with technical people, I call myself a hacker=
=2E But
when I'm talking to journalists I just say "programmer" or something li=
ke that.
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0=C2=A0 -- Linus Torvalds
