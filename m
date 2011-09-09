From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 12/62] m64k: irq: Remove IRQF_DISABLED
Date: Fri, 9 Sep 2011 17:05:15 +0200
Message-ID: <CAMuHMdVopb8wkUa5rn48_Zp4y33HaXUr0-BGE6N-6p2PAt=hag__32764.3581819304$1315582212$gmane$org@mail.gmail.com>
References: <1315383059-3673-1-git-send-email-yong.zhang0@gmail.com>
	<1315383059-3673-13-git-send-email-yong.zhang0@gmail.com>
	<4E683413.6010009@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <4E683413.6010009@snapgear.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Yong Zhang <yong.zhang0@gmail.com>
Cc: Greg Ungerer <gerg@snapgear.com>, linux-kernel@vger.kernel.org, tglx@linutronix.de, mingo@elte.hu, Sam Creasey <sammy@sammy.net>, Greg Ungerer <gerg@uclinux.org>, Lucas De Marchi <lucas.demarchi@profusion.mobi>, linux-m68k@lists.linux-m68k.org

On Thu, Sep 8, 2011 at 05:18, Greg Ungerer <gerg@snapgear.com> wrote:
> On 07/09/11 18:10, Yong Zhang wrote:
>>
>> This flag is a NOOP and can be removed now.
>>
>> Signed-off-by: Yong Zhang<yong.zhang0@gmail.com>
>
> Looks ok to me:
>
> Acked-by: Greg Ungerer <gerg@uclinux.org>

Except for the subject, it's m68k, not m64k ;-)

Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

Sorry, I missed the introductary email [0/62]. But do you expect the in=
dividual
maintainers to take these patches, or are you just collecting Acks?

>> ---
>> =C2=A0arch/m68k/include/asm/floppy.h =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=
=A0 =C2=A02 +-
>> =C2=A0arch/m68k/include/asm/irq.h =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0| =C2=A0 =C2=A04 ++--
>> =C2=A0arch/m68k/include/asm/sun3xflop.h =C2=A0 =C2=A0 =C2=A0| =C2=A0=
 =C2=A02 +-
>> =C2=A0arch/m68k/platform/68328/timers.c =C2=A0 =C2=A0 =C2=A0| =C2=A0=
 =C2=A02 +-
>> =C2=A0arch/m68k/platform/68360/config.c =C2=A0 =C2=A0 =C2=A0| =C2=A0=
 =C2=A02 +-
>> =C2=A0arch/m68k/platform/coldfire/pit.c =C2=A0 =C2=A0 =C2=A0| =C2=A0=
 =C2=A02 +-
>> =C2=A0arch/m68k/platform/coldfire/sltimers.c | =C2=A0 =C2=A04 ++--
>> =C2=A0arch/m68k/platform/coldfire/timers.c =C2=A0 | =C2=A0 =C2=A04 +=
+--
>> =C2=A08 files changed, 11 insertions(+), 11 deletions(-)

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
