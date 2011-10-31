From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] m68k: Revive lost DIO bus config option
Date: Mon, 31 Oct 2011 18:08:13 +0100
Message-ID: <CAMuHMdXSMcbb3AOtwj2pErSsGQpUDXq98ziyZLvumFgRSDqDaw@mail.gmail.com>
References: <1319835295-19519-1-git-send-email-geert@linux-m68k.org>
	<4EAE1B3A.7010303@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <4EAE1B3A.7010303@snapgear.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Greg Ungerer <gerg@snapgear.com>
Cc: Greg Ungerer <gerg@uclinux.org>, linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org

Hi Greg,

On Mon, Oct 31, 2011 at 04:51, Greg Ungerer <gerg@snapgear.com> wrote:
> On 29/10/11 06:54, Geert Uytterhoeven wrote:
>> commit 0e152d80507b75c00aac60f2ffc586360687cd52 ("m68k: reorganize K=
config
>> options to improve mmu/non-mmu selections") accidentally dropped the=
 DIO
>> bus config option. Re-add it to the "Bus support" section.
>>
>> Signed-off-by: Geert Uytterhoeven<geert@linux-m68k.org>
>
> Oops, another one.

That's the last one. I double checked all config changes in my test tre=
es.

> Acked-by: Greg Ungerer <gerg@uclinux.org>
>
> Are you going to push these to Linus, or do you want me to
> collect these fixes and push?

I've added these to my for-3.2 branch, to push out after v3.2-rc1.

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
