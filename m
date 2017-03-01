From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] uapi: fix asm/signal.h userspace compilation errors
Date: Wed, 1 Mar 2017 17:20:50 +0100
Message-ID: <CAK8P3a0YX3RGAqWN0mwUJtBsqUX0C+QRtJLrT_UA=wX6Z+q0DA__4965.40073440901$1488385727$gmane$org@mail.gmail.com>
References: <20170226010156.GA28831@altlinux.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <20170226010156.GA28831@altlinux.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: "Dmitry V. Levin" <ldv@altlinux.org>
Cc: Russell King <linux@armlinux.org.uk>, Haavard Skinnemoen <hskinnemoen@gmail.com>, Hans-Christian Egtvedt <egtvedt@samfundet.no>, Mikael Starvik <starvik@axis.com>, Jesper Nilsson <jesper.nilsson@axis.com>, Yoshinori Sato <ysato@users.sourceforge.jp>, Tony Luck <tony.luck@intel.com>, Fenghua Yu <fenghua.yu@intel.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Ralf Baechle <ralf@linux-mips.org>, David Howells <dhowells@redhat.com>, "James E.J. Bottomley" <jejb@parisc-linux.org>, Helge Deller <deller@gmx.de>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, Martin Schwidefsky <schwidefsky@de.ibm.com>, Heiko Carstens <heiko.carstens@de.ibm.com>, "David S. Miller" <davem@>

On Sun, Feb 26, 2017 at 2:01 AM, Dmitry V. Levin <ldv@altlinux.org> wrote:
> Include <stddef.h> (guarded by #ifndef __KERNEL__) to fix asm/signal.h
> userspace compilation errors like this:
>
> /usr/include/asm/signal.h:126:2: error: unknown type name 'size_t'
>   size_t ss_size;
>
> As no uapi header provides a definition of size_t, inclusion
> of <stddef.h> seems to be the most conservative fix available.
>
> On the kernel side size_t is typedef'ed to __kernel_size_t, so
> an alternative fix would be to change the type of sigaltstack.ss_size
> from size_t to __kernel_size_t for all architectures except those where
> sizeof(size_t) < sizeof(__kernel_size_t), namely, x32 and mips n32.
>
> On x32 and mips n32, however, #include <stddef.h> seems to be the most
> straightforward way to obtain the definition for sigaltstack.ss_size's
> type.
>
> Signed-off-by: Dmitry V. Levin <ldv@altlinux.org>

I'm not sure if this is the best fix. We generally should not include one
standard header from another standard header. Would it be possible
to use __kernel_size_t instead of size_t?

     Arnd
