From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] m68k: Use generic strncpy_from_user(), strlen_user(), and strnlen_user()
Date: Tue, 5 Jun 2012 22:57:29 +0200
Message-ID: <CAMuHMdW29QYN6XpBb9F3GGoJ-9frrD-00Wx=FchT9ALqW1LcPg__35950.1799954616$1338930180$gmane$org@mail.gmail.com>
References: <1338327216-15309-1-git-send-email-geert@linux-m68k.org>
	<20120530102226.GA28628@frolo.macqel>
	<CAMuHMdV5GVZR1BvGD3EncDFfPt=Bt9ndkKE8Mp7euE9KoSaGNQ@mail.gmail.com>
	<20120530140444.GA10543@frolo.macqel>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <20120530140444.GA10543@frolo.macqel>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Philippe De Muyter <phdm@macqel.be>, Greg Ungerer <gerg@uclinux.org>
Cc: linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org

On Wed, May 30, 2012 at 4:04 PM, Philippe De Muyter <phdm@macqel.be> wr=
ote:
> On Wed, May 30, 2012 at 01:20:02PM +0200, Geert Uytterhoeven wrote:
>> On Wed, May 30, 2012 at 12:22 PM, Philippe De Muyter <phdm@macqel.be=
> wrote:
>> > On Tue, May 29, 2012 at 11:33:36PM +0200, Geert Uytterhoeven wrote=
:
>> >> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
>> >> ---
>> >> Do we also want
>> >>
>> >> =C2=A0 =C2=A0 select HAVE_EFFICIENT_UNALIGNED_ACCESS if (!COLDFIR=
E && !M68000)
>> >
>> > Sorry, I did not follow what happened to unaligned accesses, but
>> > CPU32 family (at least 68340) crashes on unaligned accesses.
>>
>> We don't seem to have CONFIG_M68340 in arch/m68k/Kconfig.cpu?
>
> I have a local port here (but based on an ancient linux kernel, 2.6.2=
 IIRC)
>
>> But Freescale's website confirms both 68340 and 68360 are CPU32.
>>
>> arch/m68k/include/asm/unaligned.h assumes CPU32 (CONFIG_MCPU32)
>> can do unaligned accesses:
>
> That's not true. =C2=A0Accessing a 16- or 32-bit word at an odd addre=
ss
> with a 68340 generates an Address Error Exception. =C2=A0I remember
> discovering a bug in the ppp kernel code because of that.
>
>>
>> #if defined(CONFIG_COLDFIRE) || defined(CONFIG_M68000)
>> #include <linux/unaligned/be_struct.h>
>> #include <linux/unaligned/le_byteshift.h>
>> #include <linux/unaligned/generic.h>
>>
>> #define get_unaligned =C2=A0 __get_unaligned_be
>> #define put_unaligned =C2=A0 __put_unaligned_be
>>
>> #else
>> /*
>> =C2=A0* The m68k can do unaligned accesses itself.
>> =C2=A0*/
>> #include <linux/unaligned/access_ok.h>
>> #include <linux/unaligned/generic.h>
>>
>> #define get_unaligned =C2=A0 __get_unaligned_be
>> #define put_unaligned =C2=A0 __put_unaligned_be
>>
>> #endif
>>
>> Is this wrong?
>
> I can't tell from reading just the lines above, but I think one shoul=
d add
> "|| defined(CONFIG_MCPU32)" at the end of the if condition.

Greg?

If more CPUs cannot handle unaligned accesses, I propose to add
CONFIG_CPU_HAS_NO_UNALIGNED.

> I also think that the Coldfire 5272 can do unaligned accesses, but I
> cannot test that at the moment.

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
