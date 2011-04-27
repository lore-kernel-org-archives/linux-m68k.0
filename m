From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [patch] m68k, mm: set all online nodes in N_NORMAL_MEMORY
Date: Wed, 27 Apr 2011 15:19:37 +0200
Message-ID: <BANLkTin3BmJpuzUyBWV1B38oVMDbXe=fbw@mail.gmail.com>
References: <1303317178.2587.30.camel@mulgrave.site>
	<alpine.DEB.2.00.1104201410350.31768@chino.kir.corp.google.com>
	<20110421220351.9180.A69D9226@jp.fujitsu.com>
	<alpine.DEB.2.00.1104211237250.5829@chino.kir.corp.google.com>
	<alpine.DEB.2.00.1104211500170.5741@router.home>
	<alpine.DEB.2.00.1104211411540.20201@chino.kir.corp.google.com>
	<alpine.DEB.2.00.1104211501470.20201@chino.kir.corp.google.com>
	<4DB3840F.3060503@gmail.com>
	<alpine.DEB.2.00.1104251355410.31884@chino.kir.corp.google.com>
	<4DB63349.3070808@gmail.com>
	<Pine.BSM.4.64L.1104261049350.4851@herc.mirbsd.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-bw0-f46.google.com ([209.85.214.46]:49896 "EHLO
	mail-bw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1759187Ab1D0NTj convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 27 Apr 2011 09:19:39 -0400
In-Reply-To: <Pine.BSM.4.64L.1104261049350.4851@herc.mirbsd.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Thorsten Glaser <tg@mirbsd.de>
Cc: Michael Schmitz <schmitzmic@googlemail.com>, David Rientjes <rientjes@google.com>, Andrew Morton <akpm@linux-foundation.org>, Roman Zippel <zippel@linux-m68k.org>, linux-m68k@vger.kernel.org, linux-kernel@vger.kernel.org, schwab@linux-m68k.org

On Tue, Apr 26, 2011 at 12:50, Thorsten Glaser <tg@mirbsd.de> wrote:
> Michael Schmitz dixit:
>
>> =C2=A0 =C2=A0 =C2=A0 be done unconditionally since information about=
 present memory has not
>> yet
>> =C2=A0 =C2=A0 =C2=A0 been recorded.
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
If N_NORMAL_MEMORY is not accurate, slub may encounter
>> errors since it
>
> Hrm=E2=80=A6
>
>> @@ -300,6 +300,8 @@ void __init paging_init(void)
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 zones_size[ZONE_DMA=
] =3D m68k_memory[i].size >> PAGE_SHIFT;
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 free_area_init_node=
(i, zones_size,
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 m68k_memory[i].addr >=
> PAGE_SHIFT, NULL);
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (node_pr=
esent_pages(i))
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0node_set_state(i, N_NORMAL_MEMORY);
>> =C2=A0 =C2=A0 =C2=A0 }
>> }
>
> No, this has whitespace problems (tabs are expanded to spaces).

=46ixed those up, applied, and will send to Linus for 2.6.39-final.

BTW, if I enable CONFIG_SLUB on my ARAnyM setup, I don't get a crash, b=
ut it
hangs after:

| INIT: version 2.86 booting

With Michael's patch, it continues fine.

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
