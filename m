From: Greg Ungerer <gerg@snapgear.com>
Subject: Re: [PATCH 6/6] m68k: remove no longer used arch/m68k/lib/string.c
Date: Thu, 31 Mar 2011 13:58:40 +1000
Message-ID: <4D93FBF0.3080509@snapgear.com>
References: <de032cfd09b94c8803091bf143890ce48e61304a.1301471809.git.gerg@uclinux.org>	<0868d051884e72c38116ab6c89d619050b319ed0.1301471810.git.gerg@uclinux.org> <AANLkTim6QNn=VkOmCoE0s73WBMsKUP=7QgeDz=8BS2m8@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from sncsmrelay2.nai.com ([67.97.80.206]:23755 "EHLO
	sncsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753515Ab1CaD64 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 30 Mar 2011 23:58:56 -0400
In-Reply-To: <AANLkTim6QNn=VkOmCoE0s73WBMsKUP=7QgeDz=8BS2m8@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Greg Ungerer <gerg@uclinux.org>, linux-m68k@vger.kernel.org

Hi Geert,

On 31/03/11 04:26, Geert Uytterhoeven wrote:
> On Wed, Mar 30, 2011 at 09:58, Greg Ungerer<gerg@uclinux.org>  wrote:
>> The last remaining functions in string.c, strcpy() and strcat(), are
>> not actually used. They are defined inline in asm/string.h. So remov=
e
>> string.h.
>    ^^^^^^^^
> string.c

Thanks, I'll fix that too :-)

Regards
Greg


> Gr{oetje,eeting}s,
>
> =C3=A1 =C3=A1 =C3=A1 =C3=A1 =C3=A1 =C3=A1 =C3=A1 =C3=A1 =C3=A1 =C3=A1=
 =C3=A1 =C3=A1 Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linu=
x-m68k.org
>
> In personal conversations with technical people, I call myself a hack=
er. But
> when I'm talking to journalists I just say "programmer" or something =
like that.
> =C3=A1 =C3=A1 =C3=A1 =C3=A1 =C3=A1 =C3=A1 =C3=A1 =C3=A1 =C3=A1 =C3=A1=
 =C3=A1 =C3=A1 =C3=A1 =C3=A1=C3=A1 =C3=A1=C3=A1 -- Linus Torvalds
> --
> To unsubscribe from this list: send the line "unsubscribe linux-m68k"=
 in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
>
>


--=20
-----------------------------------------------------------------------=
-
Greg Ungerer  --  Principal Engineer        EMAIL:     gerg@snapgear.co=
m
SnapGear Group, McAfee                      PHONE:       +61 7 3435 288=
8
8 Gardner Close                             FAX:         +61 7 3217 532=
3
Milton, QLD, 4064, Australia                WEB: http://www.SnapGear.co=
m
