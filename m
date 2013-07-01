From: Joe Perches <joe@perches.com>
Subject: Re: [PATCH] m68k/setup: Use pr_*() instead of plain printk()
Date: Mon, 01 Jul 2013 14:07:33 -0700
Message-ID: <1372712853.2481.24.camel@joe-AO722>
References: <1372585689-29492-1-git-send-email-geert@linux-m68k.org>
	 <1372630948.2083.3.camel@joe-AO722>
	 <CAMuHMdUA3+gLi00Tvik2SjZaRYSC2sMMmP9TMH=Vb1dAubXx3Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <CAMuHMdUA3+gLi00Tvik2SjZaRYSC2sMMmP9TMH=Vb1dAubXx3Q@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k <linux-m68k@lists.linux-m68k.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Mon, 2013-07-01 at 23:02 +0200, Geert Uytterhoeven wrote:
> On Mon, Jul 1, 2013 at 12:22 AM, Joe Perches <joe@perches.com> wrote:
> >> diff --git a/arch/m68k/kernel/setup_mm.c b/arch/m68k/kernel/setup_mm.c
> >
> >> @@ -161,7 +161,7 @@ static void __init m68k_parse_bootinfo(const struct bi_record *record)
> > []
> >> -                             printk("m68k_parse_bootinfo: too many memory chunks\n");
> >> +                             pr_warn("m68k_parse_bootinfo: too many memory chunks\n");
> >
> > These are generally better written by
> > removing the hand-written function name
> > and using "%s: ", __func__
> >
> >                                 pr_warn("%s: too many memory chunks\n",
> >                                         __func__);
> 
> I had tried that, too. But surprisingly (although the same function
> name was in two
> messages), it increased the size of the kernel image.

That's not surprising really.
There is more call frame stack per use too.

It does eliminate any issue with function renaming
though and is also less typo prone.

And, at some point, those __func__ uses could be
identified and rolled into a mechanism to emit the
function name via a standardized use of %pf and
__builtin_return_address(0) in the printk subsystem.

cheers, Joe
