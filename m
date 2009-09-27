From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v2 1/2] m68k: Make thread_info.h usable from assembly.
Date: Sun, 27 Sep 2009 11:55:55 +0200
Message-ID: <10f740e80909270255y18c2840bh14c6a4ddfdb0a916@mail.gmail.com>
References: <1253119466-19488-1-git-send-email-tabbott@ksplice.com>
	 <1253119466-19488-2-git-send-email-tabbott@ksplice.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pz0-f188.google.com ([209.85.222.188]:62360 "EHLO
	mail-pz0-f188.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752621AbZI0Jzv convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 27 Sep 2009 05:55:51 -0400
In-Reply-To: <1253119466-19488-2-git-send-email-tabbott@ksplice.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Tim Abbott <tabbott@ksplice.com>
Cc: Roman Zippel <zippel@linux-m68k.org>, linux-m68k@vger.kernel.org, linux-kernel@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>

On Wed, Sep 16, 2009 at 18:44, Tim Abbott <tabbott@ksplice.com> wrote:
> Signed-off-by: Tim Abbott <tabbott@ksplice.com>
> Cc: Geert Uytterhoeven <geert@linux-m68k.org>
> Cc: Roman Zippel <zippel@linux-m68k.org>
> Cc: linux-m68k@lists.linux-m68k.org
> Cc: Sam Ravnborg <sam@ravnborg.org>
> ---
> =C2=A0arch/m68k/include/asm/thread_info_mm.h | =C2=A0 =C2=A02 ++
> =C2=A01 files changed, 2 insertions(+), 0 deletions(-)
>
> diff --git a/arch/m68k/include/asm/thread_info_mm.h b/arch/m68k/inclu=
de/asm/thread_info_mm.h
> index b6da388..5f36cf1 100644
> --- a/arch/m68k/include/asm/thread_info_mm.h
> +++ b/arch/m68k/include/asm/thread_info_mm.h
> @@ -8,6 +8,7 @@
> =C2=A0#include <asm/types.h>
> =C2=A0#include <asm/page.h>
>
> +#ifndef __ASSEMBLY__
> =C2=A0struct thread_info {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0struct task_struct =C2=A0 =C2=A0 =C2=A0*ta=
sk; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* main task structure */
> =C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned long =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 flags;
> @@ -16,6 +17,7 @@ struct thread_info {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0__u32 cpu; /* should always be 0 on m68k *=
/
> =C2=A0 =C2=A0 =C2=A0 =C2=A0struct restart_block =C2=A0 =C2=A0restart_=
block;
> =C2=A0};
> +#endif /* __ASSEMBLY__ */
>
> =C2=A0#define PREEMPT_ACTIVE =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x4000000

This is not sufficient. <asm/thread_info_mm.h> pulls in <asm/current.h>=
,
which contains C only. So you also need:

--- a/arch/m68k/include/asm/thread_info_mm.h
+++ b/arch/m68k/include/asm/thread_info_mm.h
@@ -4,11 +4,12 @@
 #ifndef ASM_OFFSETS_C
 #include <asm/asm-offsets.h>
 #endif
-#include <asm/current.h>
 #include <asm/types.h>
 #include <asm/page.h>

 #ifndef __ASSEMBLY__
+#include <asm/current.h>
+
 struct thread_info {
 	struct task_struct	*task;		/* main task structure */
 	unsigned long		flags;


Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-=
m68k.org

In personal conversations with technical people, I call myself a hacker=
=2E But
when I'm talking to journalists I just say "programmer" or something li=
ke that.
							    -- Linus Torvalds
--
To unsubscribe from this list: send the line "unsubscribe linux-m68k" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
