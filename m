From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v2 1/2] m68k: Make thread_info.h usable from assembly.
Date: Sun, 27 Sep 2009 13:58:33 +0200
Message-ID: <20090927115833.GA10316@merkur.ravnborg.org>
References: <1253119466-19488-1-git-send-email-tabbott@ksplice.com> <1253119466-19488-2-git-send-email-tabbott@ksplice.com> <10f740e80909270255y18c2840bh14c6a4ddfdb0a916@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from pfepa.post.tele.dk ([195.41.46.235]:40748 "EHLO
	pfepa.post.tele.dk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753327AbZI0L6b (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 27 Sep 2009 07:58:31 -0400
Content-Disposition: inline
In-Reply-To: <10f740e80909270255y18c2840bh14c6a4ddfdb0a916@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Tim Abbott <tabbott@ksplice.com>, Roman Zippel <zippel@linux-m68k.org>, linux-m68k@vger.kernel.org, linux-kernel@vger.kernel.org

On Sun, Sep 27, 2009 at 11:55:55AM +0200, Geert Uytterhoeven wrote:
> On Wed, Sep 16, 2009 at 18:44, Tim Abbott <tabbott@ksplice.com> wrote=
:
> > Signed-off-by: Tim Abbott <tabbott@ksplice.com>
> > Cc: Geert Uytterhoeven <geert@linux-m68k.org>
> > Cc: Roman Zippel <zippel@linux-m68k.org>
> > Cc: linux-m68k@lists.linux-m68k.org
> > Cc: Sam Ravnborg <sam@ravnborg.org>
> > ---
> > =A0arch/m68k/include/asm/thread_info_mm.h | =A0 =A02 ++
> > =A01 files changed, 2 insertions(+), 0 deletions(-)
> >
> > diff --git a/arch/m68k/include/asm/thread_info_mm.h b/arch/m68k/inc=
lude/asm/thread_info_mm.h
> > index b6da388..5f36cf1 100644
> > --- a/arch/m68k/include/asm/thread_info_mm.h
> > +++ b/arch/m68k/include/asm/thread_info_mm.h
> > @@ -8,6 +8,7 @@
> > =A0#include <asm/types.h>
> > =A0#include <asm/page.h>
> >
> > +#ifndef __ASSEMBLY__
> > =A0struct thread_info {
> > =A0 =A0 =A0 =A0struct task_struct =A0 =A0 =A0*task; =A0 =A0 =A0 =A0=
 =A0/* main task structure */
> > =A0 =A0 =A0 =A0unsigned long =A0 =A0 =A0 =A0 =A0 flags;
> > @@ -16,6 +17,7 @@ struct thread_info {
> > =A0 =A0 =A0 =A0__u32 cpu; /* should always be 0 on m68k */
> > =A0 =A0 =A0 =A0struct restart_block =A0 =A0restart_block;
> > =A0};
> > +#endif /* __ASSEMBLY__ */
> >
> > =A0#define PREEMPT_ACTIVE =A0 =A0 =A0 =A0 0x4000000
>=20
> This is not sufficient. <asm/thread_info_mm.h> pulls in <asm/current.=
h>,
> which contains C only. So you also need:
>=20
> --- a/arch/m68k/include/asm/thread_info_mm.h
> +++ b/arch/m68k/include/asm/thread_info_mm.h
> @@ -4,11 +4,12 @@
>  #ifndef ASM_OFFSETS_C
>  #include <asm/asm-offsets.h>
>  #endif
> -#include <asm/current.h>
>  #include <asm/types.h>
>  #include <asm/page.h>
>=20
>  #ifndef __ASSEMBLY__
> +#include <asm/current.h>
> +
>  struct thread_info {
>  	struct task_struct	*task;		/* main task structure */
>  	unsigned long		flags;


upstream m68k does not build for me so I could not test.
But I think the correct fix is to drop the include or current from thre=
ad_info.
No-one except m68k needs to include current.h in thread_info.h.

	Sam
--
To unsubscribe from this list: send the line "unsubscribe linux-m68k" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
