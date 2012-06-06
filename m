From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 6/11] Atari: new EtherNEC driver (ne.c)
Date: Wed, 6 Jun 2012 10:12:19 +0200
Message-ID: <CAMuHMdV0GudNYRvnDXj74KLoFtH4pkcAn93ufc-TCJhXqAno5g@mail.gmail.com>
References: <E1SXMG4-0002Xo-BD@zirkon.biophys.uni-duesseldorf.de>
	<CAMuHMdVSJ0etRcKUZTPKh_mq8Lz-GK+Ys5QWfq3e9BrsNoN=cA@mail.gmail.com>
	<CAOmrzkJiEe_hd6BJKU-aWv7HU3EH7L-OWzi++2z0arcadAppKw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-gh0-f174.google.com ([209.85.160.174]:35406 "EHLO
	mail-gh0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751894Ab2FFIMV convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 6 Jun 2012 04:12:21 -0400
Received: by ghrr11 with SMTP id r11so5038104ghr.19
        for <linux-m68k@vger.kernel.org>; Wed, 06 Jun 2012 01:12:19 -0700 (PDT)
In-Reply-To: <CAOmrzkJiEe_hd6BJKU-aWv7HU3EH7L-OWzi++2z0arcadAppKw@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitzmic@googlemail.com>
Cc: Michael Schmitz <schmitz@zirkon.biophys.uni-duesseldorf.de>, linux-m68k@vger.kernel.org

On Wed, Jun 6, 2012 at 10:05 AM, Michael Schmitz
<schmitzmic@googlemail.com> wrote:
>>> +config ATARI_ETHERNEC
>>> + =C2=A0 =C2=A0 =C2=A0 tristate "Atari EtherNEC Ethernet support"
>>
>> I would make this bool, and move this section to arch/m68k/Kconfig.d=
evices.
>> Then CONFIG_ATARI_ETHERNEC can control the creation of the platform
>> devices.
>>
>> After that, you still need a way to make CONFIG_NE2000 selectable. E=
=2Eg.
>> in drivers/net/ethernet/8390/Kconfig:
>>
>> =C2=A0config NE2000
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 tristate "NE2000/NE1000 support"
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0depends on (ISA || (Q40 && m) || M32R |=
| MACH_TX49XX)
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0depends on (ISA || (Q40 && m) || M32R |=
| MACH_TX49XX || ATARI_ETHERNEC)
>
> Can't we force NE2000 to be enabled whenever ATARI_ETHERNEC is enable=
d
> by default? We would not want one without the other usually.

You can do a select NE2000 in the ETHERNEC part. But than ETHERNEC cann=
ot
be boolean and must stay tristate. That may bypass other dependencies o=
f NE2000,
though (e.g. NET).

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
