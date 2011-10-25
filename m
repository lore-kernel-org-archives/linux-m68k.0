From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [git pull] m68k updates for 3.2
Date: Tue, 25 Oct 2011 10:36:25 +0200
Message-ID: <CAMuHMdURW7QT+2tEfZDeH_z-OJEksx_j2gRg2BN-NfoXFTdOdA__10266.738307155$1319531818$gmane$org@mail.gmail.com>
References: <alpine.DEB.2.00.1110242118500.9114@ayla.of.borg>
	<CA+55aFxK-OJXDNsJ37wSN+MGhGp-j50BX-52eEjBHVSepTTm9w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <CA+55aFxK-OJXDNsJ37wSN+MGhGp-j50BX-52eEjBHVSepTTm9w@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Greg Ungerer <gerg@uclinux.org>, Greg Ungerer <gerg@snapgear.com>, Andrew Morton <akpm@linux-foundation.org>, Linux/m68k <linux-m68k@lists.linux-m68k.org>, Linux Kernel Development <linux-kernel@vger.kernel.org>

Hi Linus,

On Tue, Oct 25, 2011 at 09:38, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
> On Mon, Oct 24, 2011 at 9:26 PM, Geert Uytterhoeven
> <geert@linux-m68k.org> wrote:
>>
>> =C2=A0git://git.kernel.org:/pub/scm/linux/kernel/git/geert/linux-m68=
k.git for-linus
>
> Please fix your pull script. There's an extraneous ":" there. Spot it=
?

Sorry, I should _start_ scripting it.

> Also, while I see these commits in linux-next, I also see that they
> have been rebased in the last day, which means that looking for them
> in linux-next is actually much harder than they need to be.
>
> In other words - WHY DID YOU REBASE? It just generates more work for
> me, and adds absolutely zero value.

I always rebase m68k-queue (of which the for-{linus,next,x.y} are subse=
ts)
to the latest tagged release, as this allows to:
  - check that m68k-queue and master are (almost) identical, to detect
    mismerges on master, and misrebases on m68k-queue,
  - clearly see which commits in m68k-queue have bubbled up to the for-=
*
    queues.

If you really hate this, I'll break these rules for for-linus, and
make sure it's
identical to yesterday's for-next.

> I pulled it, but some of the silly details annoyed me.

Thanks!

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
