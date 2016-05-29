From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v3 07/10] <linux/hash.h>: Add support for
 architecture-specific functions
Date: Sun, 29 May 2016 09:57:15 +0200
Message-ID: <CAMuHMdWQmxt2ZF8d=Ck7AX44TWO91WryT_E8_NGwTKF6Xr38Pg@mail.gmail.com>
References: <CAADWXX_F0jOjui1iHti1eC6tsD+cwMzZ0T_16e9nCzAK6raFxA@mail.gmail.com>
	<1464465443-25305-1-git-send-email-linux@sciencehorizons.net>
	<1464465443-25305-8-git-send-email-linux@sciencehorizons.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <1464465443-25305-8-git-send-email-linux@sciencehorizons.net>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: George Spelvin <linux@sciencehorizons.net>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, lkml <linux-kernel@vger.kernel.org>, "J . Bruce Fields" <bfields@redhat.com>, Greg Ungerer <gerg@linux-m68k.org>, Andreas Schwab <schwab@linux-m68k.org>, Philippe De Muyter <phdm@macq.eu>, linux-m68k <linux-m68k@lists.linux-m68k.org>, Alistair Francis <alistai@xilinx.com>, Michal Simek <michal.simek@xilinx.com>, Yoshinori Sato <ysato@users.sourceforge.jp>, uclinux-h8-devel@lists.sourceforge.jp

Hi George,

I see this has been applied in the mean time, but improvements
never hurt...

On Sat, May 28, 2016 at 9:57 PM, George Spelvin
<linux@sciencehorizons.net> wrote:
> --- /dev/null
> +++ b/lib/test_hash.c
> @@ -0,0 +1,250 @@

> +/*
> + * Test the various integer hash functions.  h64 (or its low-order bits)
> + * is the integer to hash.  hash_or accumulates the OR of the hash values,
> + * which are later checked to see that they cover all the requested bits.
> + *
> + * Because these functions (as opposed to the string hashes) are all
> + * inline, the code being tested is actually in the module, and you can
> + * recompile and re-test the module without rebooting.
> + */
> +static bool __init
> +test_int_hash(unsigned long long h64, u32 hash_or[2][33])
> +{
> +       int k;
> +       u32 h0 = (u32)h64, h1, h2;
> +
> +       /* Test __hash32 */
> +       hash_or[0][0] |= h1 = __hash_32(h0);
> +#ifdef HAVE_ARCH__HASH_32
> +       hash_or[1][0] |= h2 = __hash_32_generic(h0);

__hash_32_generic() always exist, right?
So you can reduce #ifdefery and increase compile coverage by dropping the
#ifdef ...

> +#if HAVE_ARCH__HASH_32 == 1
> +       if (h1 != h2) {

... and replacing this test by

        if (identical_hashes && (h1 != h2))

with identical_hashes a static const bool initialized depending on
HAVE_ARCH__HASH_32.

> +               pr_err("__hash_32(%#x) = %#x != __hash_32_generic() = %#x",
> +                       h0, h1, h2);
> +               return false;
> +       }
> +#endif
> +#endif

The same comment applies to the other hunks.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
