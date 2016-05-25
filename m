From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 00/10] String hash improvements
Date: Wed, 25 May 2016 10:50:11 +0200
Message-ID: <CAMuHMdUuAi_EdWPJmYNgNpUv_Zh34Oc3G7TgqcsChwzuyz0c-Q__41068.8738724732$1464166223$gmane$org@mail.gmail.com>
References: <CAMuHMdUUCYfGfX1CDVxxihGSC+dz2D1JJVXUWC5H0_W-MmHe7Q@mail.gmail.com>
	<20160525081128.6920.qmail@ns.sciencehorizons.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <20160525081128.6920.qmail@ns.sciencehorizons.net>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: George Spelvin <linux@sciencehorizons.net>
Cc: alistair.francis@xilinx.com, Bruce Fields <bfields@fieldses.org>, Greg Ungerer <gerg@linux-m68k.org>, Jeff Layton <jlayton@poochiereds.net>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-m68k <linux-m68k@lists.linux-m68k.org>, "open list:NFS, SUNRPC, AND..." <linux-nfs@vger.kernel.org>, Michal Simek <michal.simek@xilinx.com>, Thomas Gleixner <tglx@linutronix.de>, Linus Torvalds <torvalds@linux-foundation.org>, uclinux-h8-devel@lists.sourceforge.jp, Yoshinori Sato <ysato@users.sourceforge.jp>

On Wed, May 25, 2016 at 10:11 AM, George Spelvin
<linux@sciencehorizons.net> wrote:
> Geert Uytterhoeven wrote:
>> Usually this is handled through include/asm-generic/.
>> Put the generic default implementation in include/asm-generic/hash.h.
>>
>> Architectures that need to override provide their own version, e.g.
>> arch/m68k/include/asm/hash.h. They may #include <asm-generic/hash.h>
>> if they still want to reuse parts of the generic implementation.
>>
>> Other architectures add "generic-y += hash.h" to their
>> arch/<ARCH>/include/asm/Kbuild.
>
> I thought about that, but then I'd have to edit *every* architecture,
> and might need acks from all the maintainers.
>
> I was looking for something that was a total no-op on most architectures.
>
> But if this is preferred, it's not technically difficult at all.

As you only include <asm/archhash.h> if CONFIG_HAVE_ARCH_HASH
is defined, you can also just call the arch-specific one <asm/hash.h>.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
