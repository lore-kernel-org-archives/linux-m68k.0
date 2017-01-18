From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] m68k: Replaced all gcc specific macros with macros from compiler.h
Date: Wed, 18 Jan 2017 09:36:52 +0100
Message-ID: <CAMuHMdW9uoYSO1=4tCyfByj_Szad+LH6eSo8csT+BpHCYYw7nQ@mail.gmail.com>
References: <1484645966-3592-1-git-send-email-gidisrael@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <1484645966-3592-1-git-send-email-gidisrael@gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Gideon Israel Dsouza <gidisrael@gmail.com>
Cc: Greg Ungerer <gerg@linux-m68k.org>, linux-m68k <linux-m68k@lists.linux-m68k.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, gideon@posteo.net

Hi Gideon,

On Tue, Jan 17, 2017 at 10:39 AM, Gideon Israel Dsouza
<gidisrael@gmail.com> wrote:
> There is <linux/compiler.h> which provides macros for various gcc specific
> constructs. Eg: __weak for __attribute__((weak)). I've cleaned all
> instances of gcc specific attributes with the right macros for all files
> under /arch/m68k
>
> Note: I sent in a patch for a similar cleanup for /crypto this is
> in the commit d8c34b949d8c9
> (crypto: Replaced gcc specific attributes with macros from compiler.h)
> This commit is currently in linux-next and has changes inside
> compiler-gcc.h just like this patch does. Just highlighting this incase
> there are merge issues.

As this series touches two direct subsystems (arch/m68k and include/linux),
I think it would be better to split it in two parts, and get the include/linux
part included first (through Andrew Morton <akpm@linux-foundation.org>?).

> ---
>  arch/m68k/68000/bootlogo-vz.h     |   4 +-
>  arch/m68k/68000/bootlogo.h        |   5 +-
>  arch/m68k/include/asm/MC68328.h   | 110 ++++++++++++++--------------
>  arch/m68k/include/asm/MC68EZ328.h | 148 +++++++++++++++++++-------------------
>  arch/m68k/include/asm/MC68VZ328.h | 148 +++++++++++++++++++-------------------
>  arch/m68k/include/asm/natfeat.h   |   3 +-
>  arch/m68k/lib/ashldi3.c           |   8 +--
>  arch/m68k/lib/ashrdi3.c           |   8 +--
>  arch/m68k/lib/lshrdi3.c           |   8 +--
>  arch/m68k/lib/muldi3.c            |  10 +--
>  include/linux/compiler-gcc.h      |   1 +
>  11 files changed, 232 insertions(+), 221 deletions(-)

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
