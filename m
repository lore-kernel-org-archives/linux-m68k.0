From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: kullervo with bigram
Date: Sun, 18 Jan 2015 13:19:33 +0100
Message-ID: <CAMuHMdXTyYp=7SOL4qG1JoK6x6zO5mqkGt9wKGXceqbjejMwgA@mail.gmail.com>
References: <54BACEB6.6060805@debian.org>
	<20150118115355.GA20168@guido.earth.sol>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <20150118115355.GA20168@guido.earth.sol>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Linux/m68k <linux-m68k@lists.linux-m68k.org>, Debian m68k <debian-68k@lists.debian.org>

On Sun, Jan 18, 2015 at 12:53 PM, Christian T. Steigies <cts@debian.org> wrote:
>> [   10.340000] pc=0x122478, fa=0x8000ef4c

00122460 T __clear_user

Fault Address is logical, i.e. virtual.

>> [   10.350000] 68060 access error, fslw=810040

# define MMU060_W       (0x00800000)    /* general write, includes rmw */
#define MMU060_TM       (0x00070000)    /* transfer modifier (TM) bits */

'1' means Debug Access for alternate accesses, which is here the case
(moves).

#define MMU060_TWE      (0x00000040)    /* bus error on table search */

>> [   10.360000] Failed to execute /init (error -14)
>> [   10.380000] pc=0x9c23e, fa=0x2ce0c8

0009c234 t get_user_arg_ptr

002ce0c8 d argv_init

As the kernel runs in the first memory chunk, which is not BigRAMPlus,
this should work. Or is the page table for that page stored in BigRAMPlus
memory?

>> [   10.390000] 68060 access error, fslw=1010040

# define MMU060_RW_R    (0x01000000)    /* read */

Same as above, but read.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
