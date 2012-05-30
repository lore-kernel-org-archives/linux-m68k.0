From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] m68k: Use generic strncpy_from_user(), strlen_user(), and strnlen_user()
Date: Wed, 30 May 2012 13:20:02 +0200
Message-ID: <CAMuHMdV5GVZR1BvGD3EncDFfPt=Bt9ndkKE8Mp7euE9KoSaGNQ__3572.00809889964$1338377280$gmane$org@mail.gmail.com>
References: <1338327216-15309-1-git-send-email-geert@linux-m68k.org>
	<20120530102226.GA28628@frolo.macqel>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <20120530102226.GA28628@frolo.macqel>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Philippe De Muyter <phdm@macqel.be>
Cc: linux-m68k@lists.linux-m68k.org, Greg Ungerer <gerg@uclinux.org>, linux-kernel@vger.kernel.org

On Wed, May 30, 2012 at 12:22 PM, Philippe De Muyter <phdm@macqel.be> w=
rote:
> On Tue, May 29, 2012 at 11:33:36PM +0200, Geert Uytterhoeven wrote:
>> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
>> ---
>> Do we also want
>>
>> =C2=A0 =C2=A0 select HAVE_EFFICIENT_UNALIGNED_ACCESS if (!COLDFIRE &=
& !M68000)
>
> Sorry, I did not follow what happened to unaligned accesses, but
> CPU32 family (at least 68340) crashes on unaligned accesses.

We don't seem to have CONFIG_M68340 in arch/m68k/Kconfig.cpu?
But Freescale's website confirms both 68340 and 68360 are CPU32.

arch/m68k/include/asm/unaligned.h assumes CPU32 (CONFIG_MCPU32)
can do unaligned accesses:

#if defined(CONFIG_COLDFIRE) || defined(CONFIG_M68000)
#include <linux/unaligned/be_struct.h>
#include <linux/unaligned/le_byteshift.h>
#include <linux/unaligned/generic.h>

#define get_unaligned   __get_unaligned_be
#define put_unaligned   __put_unaligned_be

#else
/*
 * The m68k can do unaligned accesses itself.
 */
#include <linux/unaligned/access_ok.h>
#include <linux/unaligned/generic.h>

#define get_unaligned   __get_unaligned_be
#define put_unaligned   __put_unaligned_be

#endif

Is this wrong?

However, for CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS,
the question is not whether unaligned accesses are supported, but
whether they are more efficient than byte copies when copying larger bl=
ocks.

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
