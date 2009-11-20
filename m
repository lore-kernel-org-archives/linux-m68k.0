From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v2 1/2] m68k: Make thread_info.h usable from assembly.
Date: Fri, 20 Nov 2009 08:56:27 +0100
Message-ID: <10f740e80911192356i5f256751yf5a5c7f80081011c@mail.gmail.com>
References: <1253119466-19488-1-git-send-email-tabbott@ksplice.com>
	 <1253119466-19488-2-git-send-email-tabbott@ksplice.com>
	 <10f740e80909270255y18c2840bh14c6a4ddfdb0a916@mail.gmail.com>
	 <20090927115833.GA10316@merkur.ravnborg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from ey-out-2122.google.com ([74.125.78.26]:2717 "EHLO
	ey-out-2122.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750867AbZKTH4W convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Fri, 20 Nov 2009 02:56:22 -0500
In-Reply-To: <20090927115833.GA10316@merkur.ravnborg.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Sam Ravnborg <sam@ravnborg.org>
Cc: Tim Abbott <tabbott@ksplice.com>, Roman Zippel <zippel@linux-m68k.org>, linux-m68k@vger.kernel.org, linux-kernel@vger.kernel.org

On Sun, Sep 27, 2009 at 12:58, Sam Ravnborg <sam@ravnborg.org> wrote:
> On Sun, Sep 27, 2009 at 11:55:55AM +0200, Geert Uytterhoeven wrote:
>> On Wed, Sep 16, 2009 at 18:44, Tim Abbott <tabbott@ksplice.com> wrot=
e:
>> > Signed-off-by: Tim Abbott <tabbott@ksplice.com>
>> > Cc: Geert Uytterhoeven <geert@linux-m68k.org>
>> > Cc: Roman Zippel <zippel@linux-m68k.org>
>> > Cc: linux-m68k@lists.linux-m68k.org
>> > Cc: Sam Ravnborg <sam@ravnborg.org>
>> > ---
>> > =C2=A0arch/m68k/include/asm/thread_info_mm.h | =C2=A0 =C2=A02 ++
>> > =C2=A01 files changed, 2 insertions(+), 0 deletions(-)
>> >
>> > diff --git a/arch/m68k/include/asm/thread_info_mm.h b/arch/m68k/in=
clude/asm/thread_info_mm.h
>> > index b6da388..5f36cf1 100644
>> > --- a/arch/m68k/include/asm/thread_info_mm.h
>> > +++ b/arch/m68k/include/asm/thread_info_mm.h
>> > @@ -8,6 +8,7 @@
>> > =C2=A0#include <asm/types.h>
>> > =C2=A0#include <asm/page.h>
>> >
>> > +#ifndef __ASSEMBLY__
>> > =C2=A0struct thread_info {
>> > =C2=A0 =C2=A0 =C2=A0 =C2=A0struct task_struct =C2=A0 =C2=A0 =C2=A0=
*task; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* main task structure */
>> > =C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned long =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 flags;
>> > @@ -16,6 +17,7 @@ struct thread_info {
>> > =C2=A0 =C2=A0 =C2=A0 =C2=A0__u32 cpu; /* should always be 0 on m68=
k */
>> > =C2=A0 =C2=A0 =C2=A0 =C2=A0struct restart_block =C2=A0 =C2=A0resta=
rt_block;
>> > =C2=A0};
>> > +#endif /* __ASSEMBLY__ */
>> >
>> > =C2=A0#define PREEMPT_ACTIVE =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x4000000
>>
>> This is not sufficient. <asm/thread_info_mm.h> pulls in <asm/current=
=2Eh>,
>> which contains C only. So you also need:
>>
>> --- a/arch/m68k/include/asm/thread_info_mm.h
>> +++ b/arch/m68k/include/asm/thread_info_mm.h
>> @@ -4,11 +4,12 @@
>> =C2=A0#ifndef ASM_OFFSETS_C
>> =C2=A0#include <asm/asm-offsets.h>
>> =C2=A0#endif
>> -#include <asm/current.h>
>> =C2=A0#include <asm/types.h>
>> =C2=A0#include <asm/page.h>
>>
>> =C2=A0#ifndef __ASSEMBLY__
>> +#include <asm/current.h>
>> +
>> =C2=A0struct thread_info {
>> =C2=A0 =C2=A0 =C2=A0 struct task_struct =C2=A0 =C2=A0 =C2=A0*task; =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* main task structure */
>> =C2=A0 =C2=A0 =C2=A0 unsigned long =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 flags;
>
>
> upstream m68k does not build for me so I could not test.
> But I think the correct fix is to drop the include or current from th=
read_info.
> No-one except m68k needs to include current.h in thread_info.h.

Dropping it causes lots of undeclared errors, so I'm gonna apply Tim's
patch with my additional fix.

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
