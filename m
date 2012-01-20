From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: coldfire v4e
Date: Fri, 20 Jan 2012 14:59:36 +0100
Message-ID: <CAMuHMdX8zeFHmkXvUuK1V5iBPWs5tnB2bD8bkTQvCn=wwhpk0A@mail.gmail.com>
References: <4E469720BAB3C44DA563C197C2E672CF010E5B@DHREUSVXM02.danaher.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <4E469720BAB3C44DA563C197C2E672CF010E5B@DHREUSVXM02.danaher.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: "Jensen, Bjarne" <bkj@doms.dk>
Cc: "linux-m68k@lists.linux-m68k.org" <linux-m68k@lists.linux-m68k.org>

Hi Bjarne,

On Fri, Jan 20, 2012 at 14:47, Jensen, Bjarne <bkj@doms.dk> wrote:
> We are developing an application on a board with a Coldfire v4e proce=
ssor (m54418) and are wondering if it will be possible to make the kern=
el preemptive and how much effort it will take. Has anyone tried it wit=
h this processor?
>
> I have noticed that when I enable the "MMU-based Paged Memory Managem=
ent Support" option, the "Preemption Model" option disappears no matter=
 which "Processor type" I choose. Is it simply because it is not implem=
ented or is it just not possible on this type of processors?

Generic preempt support relies on the spinlocks that were introduced wh=
en
adding SMP support. So far we never had SMP support for m68k, hence we
didn't do a proper conversion from disable_irq()/enable_irq() to spinlo=
cks,
and kept on using the simpler local_irq_*() ops in arch/m68k and in sev=
eral
drivers. These have to be fixed first.

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
