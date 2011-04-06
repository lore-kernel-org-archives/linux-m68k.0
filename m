From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [regression v2.6.38] Re: [PATCH v2] brk: fix min_brk lower bound
 computation for COMPAT_BRK
Date: Wed, 6 Apr 2011 22:23:55 +0200
Message-ID: <BANLkTinnvXX70OCrtyYy_2e-zJDqS9f2iw@mail.gmail.com>
References: <alpine.LNX.2.00.1101030002390.26685@pobox.suse.cz>
	<alpine.LNX.2.00.1101031237210.26685@pobox.suse.cz>
	<alpine.LNX.2.00.1101031421470.26685@pobox.suse.cz>
	<AANLkTinK-TYnY70Wst_FTbEtn7Dwm8wEQoWMewsYM8dh@mail.gmail.com>
	<alpine.LNX.2.00.1103251119120.26754@pobox.suse.cz>
	<AANLkTi=g5z+GYkbOGbdLQcLaQkpY6yQ6tjGRjjk1H59R@mail.gmail.com>
	<alpine.LNX.2.00.1103281619320.26754@pobox.suse.cz>
	<AANLkTi=pNxVY8NZjRhT_aJMQNiTpfkmECqc-ZnTD7ynW@mail.gmail.com>
	<alpine.LNX.2.00.1104061155530.5855@pobox.suse.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-bw0-f46.google.com ([209.85.214.46]:47723 "EHLO
	mail-bw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755168Ab1DFUX4 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 6 Apr 2011 16:23:56 -0400
In-Reply-To: <alpine.LNX.2.00.1104061155530.5855@pobox.suse.cz>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Jiri Kosina <jkosina@suse.cz>
Cc: Ingo Molnar <mingo@elte.hu>, Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org, Linux/m68k <linux-m68k@vger.kernel.org>

On Wed, Apr 6, 2011 at 22:08, Jiri Kosina <jkosina@suse.cz> wrote:
> On Tue, 29 Mar 2011, Geert Uytterhoeven wrote:
>
>> I managed to reproduce it inside ARAnyM, by chrooting into the ramdi=
sk image.
>> After adding strace, "strace /sbin/init" for the success case gives:

[...]

>> Seems like the binary doesn't like brk() rounding up the requested
>> value to the next page...
>
> Could you please test with the patch below? Thanks.

This seems to work. Thanks!

> From: Jiri Kosina <jkosina@suse.cz>
> Subject: [PATCH] brk: COMPAT_BRK needs more special handling of legac=
y applications
>
> 5520e89 ("brk: fix min_brk lower bound computation for COMPAT_BRK")
> tried to get the whole logic of brk randomization for legacy (libc5-b=
ased)
> applications finally right.
>
> It turns out that the way to detect whether brk has actually been
> randomized or not introduced by that patch still doesn't work for tho=
se
> binaries, as reported by Geert.
>
> I don't like it, but currently see no better option than a bit flag i=
n
> task_struct to catch the CONFIG_COMPAT_BRK && randomize_va_space =3D=3D=
 2
> case.
>
> Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
> NOT-YET-Signed-off-by: Jiri Kosina <jkosina@suse.cz>
> ---
> =C2=A0fs/binfmt_elf.c =C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A06 +++++-
> =C2=A0include/linux/sched.h | =C2=A0 =C2=A03 +++
> =C2=A0mm/mmap.c =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=
=A02 +-
> =C2=A03 files changed, 9 insertions(+), 2 deletions(-)
>
> diff --git a/fs/binfmt_elf.c b/fs/binfmt_elf.c
> index f34078d..303983f 100644
> --- a/fs/binfmt_elf.c
> +++ b/fs/binfmt_elf.c
> @@ -941,9 +941,13 @@ static int load_elf_binary(struct linux_binprm *=
bprm, struct pt_regs *regs)
> =C2=A0 =C2=A0 =C2=A0 =C2=A0current->mm->start_stack =3D bprm->p;
>
> =C2=A0#ifdef arch_randomize_brk
> - =C2=A0 =C2=A0 =C2=A0 if ((current->flags & PF_RANDOMIZE) && (random=
ize_va_space > 1))
> + =C2=A0 =C2=A0 =C2=A0 if ((current->flags & PF_RANDOMIZE) && (random=
ize_va_space > 1)) {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0current->mm->b=
rk =3D current->mm->start_brk =3D
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0arch_randomize_brk(current->mm);
> +#ifdef CONFIG_COMPAT_BRK
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 current->brk_rando=
mized =3D 1;
> +#endif
> + =C2=A0 =C2=A0 =C2=A0 }
> =C2=A0#endif
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0if (current->personality & MMAP_PAGE_ZERO)=
 {
> diff --git a/include/linux/sched.h b/include/linux/sched.h
> index 83bd2e2..239d2fe 100644
> --- a/include/linux/sched.h
> +++ b/include/linux/sched.h
> @@ -1254,6 +1254,9 @@ struct task_struct {
> =C2=A0#endif
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0struct mm_struct *mm, *active_mm;
> +#ifdef CONFIG_COMPAT_BRK
> + =C2=A0 =C2=A0 =C2=A0 unsigned brk_randomized:1;
> +#endif
> =C2=A0#if defined(SPLIT_RSS_COUNTING)
> =C2=A0 =C2=A0 =C2=A0 =C2=A0struct task_rss_stat =C2=A0 =C2=A0rss_stat=
;
> =C2=A0#endif
> diff --git a/mm/mmap.c b/mm/mmap.c
> index 2ec8eb5..318ed2d 100644
> --- a/mm/mmap.c
> +++ b/mm/mmap.c
> @@ -259,7 +259,7 @@ SYSCALL_DEFINE1(brk, unsigned long, brk)
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 * randomize_va_space to 2, which will sti=
ll cause mm->start_brk
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 * to be arbitrarily shifted
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 */
> - =C2=A0 =C2=A0 =C2=A0 if (mm->start_brk > PAGE_ALIGN(mm->end_data))
> + =C2=A0 =C2=A0 =C2=A0 if (current->brk_randomized)
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0min_brk =3D mm=
->start_brk;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0else
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0min_brk =3D mm=
->end_data;
> --
> 1.7.3.1

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
