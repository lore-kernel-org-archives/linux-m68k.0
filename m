From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 0164/1529] Fix typo
Date: Sun, 3 Jul 2016 14:06:53 +0200
Message-ID: <CAMuHMdV5o7ZZ8nqGcsHenzJve24wGraEY8etDsv8S1wmHQSnaA@mail.gmail.com>
References: <20160521115739.8325-1-andrea.gelmini@gelma.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <20160521115739.8325-1-andrea.gelmini@gelma.net>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Andrea Gelmini <andrea.gelmini@gelma.net>
Cc: Jiri Kosina <trivial@kernel.org>, linux-m68k <linux-m68k@lists.linux-m68k.org>

On Sat, May 21, 2016 at 1:57 PM, Andrea Gelmini
<andrea.gelmini@gelma.net> wrote:
> diff --git a/arch/m68k/ifpsp060/src/fpsp.S b/arch/m68k/ifpsp060/src/fpsp.S
> index 78cb60f..9bbffeb 100644
> --- a/arch/m68k/ifpsp060/src/fpsp.S
> +++ b/arch/m68k/ifpsp060/src/fpsp.S
> @@ -23196,14 +23196,14 @@ m_sign:
>  #
>  #  1. Branch on the sign of the adjusted exponent.
>  #  2p.(positive exp)
> -#   2. Check M16 and the digits in lwords 2 and 3 in decending order.
> +#   2. Check M16 and the digits in lwords 2 and 3 in descending order.
>  #   3. Add one for each zero encountered until a non-zero digit.
>  #   4. Subtract the count from the exp.
>  #   5. Check if the exp has crossed zero in #3 above; make the exp abs
>  #         and set SE.
>  #      6. Multiply the mantissa by 10**count.
>  #  2n.(negative exp)
> -#   2. Check the digits in lwords 3 and 2 in decending order.
> +#   2. Check the digits in lwords 3 and 2 in descending order.
>  #   3. Add one for each zero encountered until a non-zero digit.
>  #   4. Add the count to the exp.
>  #   5. Check if the exp has crossed zero in #3 above; clear SE.

Funny, you've missed the same typo in arch/m68k/ifpsp060/src/pfpsp.S ;-)

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
