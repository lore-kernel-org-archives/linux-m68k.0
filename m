From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] m68k: Merge mmu and non-mmu versions of sys_call_table
Date: Tue, 19 Apr 2011 10:30:26 +0200
Message-ID: <BANLkTimXgpDduP_etBnJ=vFcCXLCLjwt3Q@mail.gmail.com>
References: <alpine.DEB.2.00.1104062231190.11240@ayla.of.borg>
	<201104172213.01258.arnd@arndb.de>
	<4DAD1062.2020309@snapgear.com>
	<201104191021.20293.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <201104191021.20293.arnd@arndb.de>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Greg Ungerer <gerg@snapgear.com>, Linux/m68k <linux-m68k@lists.linux-m68k.org>, uClinux list <uclinux-dev@uclinux.org>

On Tue, Apr 19, 2011 at 10:21, Arnd Bergmann <arnd@arndb.de> wrote:
> On Tuesday 19 April 2011, Greg Ungerer wrote:
>> On 18/04/11 06:13, Arnd Bergmann wrote:
>> >> M68knommu does not implement:
>> >> =C2=A0 =C2=A0- sys_mremap
>> >> =C2=A0 =C2=A0- sys_nfsservct
>> >
>> > Shouldn't you get a warning about these from scripts/checksyscalls=
=2Esh ?
>>
>> It doesn't complain.
>
> Ah, you actually define the syscall numbers for these, so it will not=
 warn,
> despite the fact that the entry is missing.

Yep, asm/unistd.h is shared between mmu and nommu.

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
