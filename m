From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 09/36] m68k: set register a2 to current if MMU enabled on ColdFire
Date: Sun, 30 Oct 2011 14:06:01 +0100
Message-ID: <CAMuHMdWU-W9jDYs4KMRvyB7uxs2gKS7_FEz6QQr1jDxWY2xPKQ@mail.gmail.com>
References: <1319527168-11166-1-git-send-email-gerg@snapgear.com>
	<1319527168-11166-10-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-iy0-f174.google.com ([209.85.210.174]:51402 "EHLO
	mail-iy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754519Ab1J3NGC convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 30 Oct 2011 09:06:02 -0400
Received: by iaby12 with SMTP id y12so6086397iab.19
        for <linux-m68k@vger.kernel.org>; Sun, 30 Oct 2011 06:06:02 -0700 (PDT)
In-Reply-To: <1319527168-11166-10-git-send-email-gerg@snapgear.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: gerg@snapgear.com
Cc: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org, Greg Ungerer <gerg@uclinux.org>

On Tue, Oct 25, 2011 at 09:19,  <gerg@snapgear.com> wrote:
> From: Greg Ungerer <gerg@uclinux.org>
>
> Virtual memory m68k systems build with register a2 dedicated to being=
 the
> current proc pointer. Add code to the ColdFire interrupt and exceptio=
n
> processing to set this on entry, and also at context switch time.
>
> Signed-off-by: Greg Ungerer <gerg@uclinux.org>
> ---
> =C2=A0arch/m68k/kernel/entry_no.S =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0=
 24 ++++++++++++++++++------
> =C2=A0arch/m68k/platform/coldfire/entry.S | =C2=A0 18 +++++++++++++++=
++-
> =C2=A02 files changed, 35 insertions(+), 7 deletions(-)
>
> diff --git a/arch/m68k/kernel/entry_no.S b/arch/m68k/kernel/entry_no.=
S
> index 1b42890..050d7ea 100644
> --- a/arch/m68k/kernel/entry_no.S
> +++ b/arch/m68k/kernel/entry_no.S
> @@ -44,8 +44,12 @@
>
> =C2=A0ENTRY(buserr)
> =C2=A0 =C2=A0 =C2=A0 =C2=A0SAVE_ALL_INT
> - =C2=A0 =C2=A0 =C2=A0 moveq =C2=A0 #-1,%d0
> - =C2=A0 =C2=A0 =C2=A0 movel =C2=A0 %d0,%sp@(PT_OFF_ORIG_D0)

Don't you need the above anymore, at least on nommu?

> +#ifdef CONFIG_MMU
> + =C2=A0 =C2=A0 =C2=A0 movel =C2=A0 %sp,%d0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* get thread_info pointer */
> + =C2=A0 =C2=A0 =C2=A0 andl =C2=A0 =C2=A0#-THREAD_SIZE,%d0 =C2=A0 =C2=
=A0 =C2=A0 /* at start of kernel stack */
> + =C2=A0 =C2=A0 =C2=A0 movel =C2=A0 %d0,%a2
> + =C2=A0 =C2=A0 =C2=A0 movel =C2=A0 %a2@,%a2 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* current pointer into a2 */
> +#endif
> =C2=A0 =C2=A0 =C2=A0 =C2=A0movel =C2=A0 %sp,%sp@- =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* stack frame pointer argument */
> =C2=A0 =C2=A0 =C2=A0 =C2=A0jsr =C2=A0 =C2=A0 buserr_c
> =C2=A0 =C2=A0 =C2=A0 =C2=A0addql =C2=A0 #4,%sp
> @@ -53,8 +57,12 @@ ENTRY(buserr)
>
> =C2=A0ENTRY(trap)
> =C2=A0 =C2=A0 =C2=A0 =C2=A0SAVE_ALL_INT
> - =C2=A0 =C2=A0 =C2=A0 moveq =C2=A0 #-1,%d0
> - =C2=A0 =C2=A0 =C2=A0 movel =C2=A0 %d0,%sp@(PT_OFF_ORIG_D0)

Same here.

> +#ifdef CONFIG_MMU
> + =C2=A0 =C2=A0 =C2=A0 movel =C2=A0 %sp,%d0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* get thread_info pointer */
> + =C2=A0 =C2=A0 =C2=A0 andl =C2=A0 =C2=A0#-THREAD_SIZE,%d0 =C2=A0 =C2=
=A0 =C2=A0 /* at start of kernel stack */
> + =C2=A0 =C2=A0 =C2=A0 movel =C2=A0 %d0,%a2
> + =C2=A0 =C2=A0 =C2=A0 movel =C2=A0 %a2@,%a2 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* current pointer into a2 */
> +#endif
> =C2=A0 =C2=A0 =C2=A0 =C2=A0movel =C2=A0 %sp,%sp@- =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* stack frame pointer argument */
> =C2=A0 =C2=A0 =C2=A0 =C2=A0jsr =C2=A0 =C2=A0 trap_c
> =C2=A0 =C2=A0 =C2=A0 =C2=A0addql =C2=A0 #4,%sp
> @@ -65,8 +73,12 @@ ENTRY(trap)
> =C2=A0.globl dbginterrupt
> =C2=A0ENTRY(dbginterrupt)
> =C2=A0 =C2=A0 =C2=A0 =C2=A0SAVE_ALL_INT
> - =C2=A0 =C2=A0 =C2=A0 moveq =C2=A0 #-1,%d0
> - =C2=A0 =C2=A0 =C2=A0 movel =C2=A0 %d0,%sp@(PT_OFF_ORIG_D0)
> +#ifdef CONFIG_MMU
> + =C2=A0 =C2=A0 =C2=A0 movel =C2=A0 %sp,%d0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* get thread_info pointer */
> + =C2=A0 =C2=A0 =C2=A0 andl =C2=A0 =C2=A0#-THREAD_SIZE,%d0 =C2=A0 =C2=
=A0 =C2=A0 /* at start of kernel stack */
> + =C2=A0 =C2=A0 =C2=A0 movel =C2=A0 %d0,%a2
> + =C2=A0 =C2=A0 =C2=A0 movel =C2=A0 %a2@,%a2 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* current pointer into a2 */
> +#endif
> =C2=A0 =C2=A0 =C2=A0 =C2=A0movel =C2=A0 %sp,%sp@- =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* stack frame pointer argument */
> =C2=A0 =C2=A0 =C2=A0 =C2=A0jsr =C2=A0 =C2=A0 dbginterrupt_c
> =C2=A0 =C2=A0 =C2=A0 =C2=A0addql =C2=A0 #4,%sp
> diff --git a/arch/m68k/platform/coldfire/entry.S b/arch/m68k/platform=
/coldfire/entry.S
> index f567a16..5fc1f40 100644
> --- a/arch/m68k/platform/coldfire/entry.S
> +++ b/arch/m68k/platform/coldfire/entry.S
> @@ -63,6 +63,13 @@ ENTRY(system_call)
> =C2=A0 =C2=A0 =C2=A0 =C2=A0SAVE_ALL_SYS
> =C2=A0 =C2=A0 =C2=A0 =C2=A0move =C2=A0 =C2=A0#0x2000,%sr =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* enable intrs again */
>
> +#ifdef CONFIG_MMU
> + =C2=A0 =C2=A0 =C2=A0 movel =C2=A0 %sp,%d2 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* get thread_info pointer */
> + =C2=A0 =C2=A0 =C2=A0 andl =C2=A0 =C2=A0#-THREAD_SIZE,%d2 =C2=A0 =C2=
=A0 =C2=A0 /* at start of kernel stack */
> + =C2=A0 =C2=A0 =C2=A0 movel =C2=A0 %d2,%a2
> + =C2=A0 =C2=A0 =C2=A0 movel =C2=A0 %a2@,%a2 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* current pointer into a2 */
> +#endif
> +
> =C2=A0 =C2=A0 =C2=A0 =C2=A0cmpl =C2=A0 =C2=A0#NR_syscalls,%d0
> =C2=A0 =C2=A0 =C2=A0 =C2=A0jcc =C2=A0 =C2=A0 enosys
> =C2=A0 =C2=A0 =C2=A0 =C2=A0lea =C2=A0 =C2=A0 sys_call_table,%a0
> @@ -166,6 +173,13 @@ Lsignal_return:
> =C2=A0ENTRY(inthandler)
> =C2=A0 =C2=A0 =C2=A0 =C2=A0SAVE_ALL_INT
>
> +#ifdef CONFIG_MMU
> + =C2=A0 =C2=A0 =C2=A0 movel =C2=A0 %sp,%d2 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* get thread_info pointer */
> + =C2=A0 =C2=A0 =C2=A0 andl =C2=A0 =C2=A0#-THREAD_SIZE,%d2 =C2=A0 =C2=
=A0 =C2=A0 /* at start of kernel stack */
> + =C2=A0 =C2=A0 =C2=A0 movel =C2=A0 %d2,%a2
> + =C2=A0 =C2=A0 =C2=A0 movel =C2=A0 %a2@,%a2 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* current pointer into a2 */
> +#endif
> +
> =C2=A0 =C2=A0 =C2=A0 =C2=A0movew =C2=A0 %sp@(PT_OFF_FORMATVEC),%d0 /*=
 put exception # in d0 */
> =C2=A0 =C2=A0 =C2=A0 =C2=A0andl =C2=A0 =C2=A0#0x03fc,%d0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* mask out vector only */
>
> @@ -190,7 +204,9 @@ ENTRY(resume)
> =C2=A0 =C2=A0 =C2=A0 =C2=A0movel =C2=A0 %sp,%a0@(TASK_THREAD+THREAD_K=
SP) /* save kernel stack pointer */
> =C2=A0 =C2=A0 =C2=A0 =C2=A0RDUSP =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0/* movel %usp,%a3 */
> =C2=A0 =C2=A0 =C2=A0 =C2=A0movel =C2=A0 %a3,%a0@(TASK_THREAD+THREAD_U=
SP) /* save thread user stack */
> -
> +#ifdef CONFIG_MMU
> + =C2=A0 =C2=A0 =C2=A0 movel =C2=A0 %a1,%a2 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* set n=
ew current */
> +#endif
> =C2=A0 =C2=A0 =C2=A0 =C2=A0movel =C2=A0 %a1@(TASK_THREAD+THREAD_USP),=
%a3 /* restore thread user stack */
> =C2=A0 =C2=A0 =C2=A0 =C2=A0WRUSP =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0/* movel %a3,%usp */
> =C2=A0 =C2=A0 =C2=A0 =C2=A0movel =C2=A0 %a1@(TASK_THREAD+THREAD_KSP),=
%sp /* restore new kernel stack */

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
