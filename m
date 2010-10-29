From: Greg Ungerer <gerg@snapgear.com>
Subject: Re: [PATCH][resend] m68k,m68knommu: Do not include linux/hardirq.h
 in asm/irqflags.h
Date: Sat, 30 Oct 2010 07:57:30 +1000
Message-ID: <4CCB434A.7010400@snapgear.com>
References: <4CCAD4E8.8040801@snapgear.com> <AANLkTin4v0=R0Q2etqi+WkLSJTV7T5J01rd+AbymutqG@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <AANLkTin4v0=R0Q2etqi+WkLSJTV7T5J01rd+AbymutqG@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@vger.kernel.org, dhowells@redhat.com, gerg@uclinux.org, phdm@macqel.be, linux-kernel@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org


Hi Geert,

On 30/10/10 02:31, Geert Uytterhoeven wrote:
> On Fri, Oct 29, 2010 at 16:06, Greg Ungerer<gerg@snapgear.com>  wrote=
:
>> Philippe DeMuyter noticed this build failure with Linus' current git
>> tree. I think it is m68k clean too. If all are ok with it I'll
>> pass it directly to Linus.
>
> Sorry, I saw his patch before, but had no spare cycles left for testi=
ng.
>
> Unfortunately that breaks CONFIG_MMU=3Dy:
>
> arch/m68k/include/asm/irqflags.h: In function =E2=80=98arch_local_irq=
_enable=E2=80=99:
> arch/m68k/include/asm/irqflags.h:43: error: implicit declaration of
> function =E2=80=98hardirq_count=E2=80=99
>
> But if you protect the #include<linux/hardirq.h>  by #ifdef
> CONFIG_MMU, I'm happy with
> it.

Thanks, I'll rework it with that.

Regards
Greg


>> m68k,m68knommu: Do not include linux/hardirq.h in asm/irqflags.h
>>
>> Recent changes to header files made kernel compilation for m68k/m68k=
nommu
>> fail with :
>>   CC      arch/m68knommu/kernel/asm-offsets.s
>> In file included from /archives/linux/git/arch/m68k/include/asm/syst=
em.h:2,
>>                  from include/linux/wait.h:25,
>>                  from include/linux/mmzone.h:9,
>>                  from include/linux/gfp.h:4,
>>                  from include/linux/irq.h:20,
>>                  from include/asm-generic/hardirq.h:12,
>>                  from
>> /archives/linux/git/arch/m68k/include/asm/hardirq_no.h:17,
>>                  from /archives/linux/git/arch/m68k/include/asm/hard=
irq.h:2,
>>                  from include/linux/hardirq.h:10,
>>                  from /archives/linux/git/arch/m68k/include/asm/irqf=
lags.h:5,
>>                  from include/linux/irqflags.h:15,
>>                  from include/linux/spinlock.h:53,
>>                  from include/linux/seqlock.h:29,
>>                  from include/linux/time.h:8,
>>                  from include/linux/timex.h:56,
>>                  from include/linux/sched.h:56,
>>                  from arch/m68knommu/kernel/asm-offsets.c:12:
>> /archives/linux/git/arch/m68k/include/asm/system_no.h: In function
>> =C3=A2=E2=82=AC=CB=9C__xchg=C3=A2=E2=82=AC=E2=84=A2:
>> /archives/linux/git/arch/m68k/include/asm/system_no.h:79: error: imp=
licit
>> declaration of function =C3=A2=E2=82=AC=CB=9Clocal_irq_save=C3=A2=E2=
=82=AC=E2=84=A2
>> /archives/linux/git/arch/m68k/include/asm/system_no.h:101: error: im=
plicit
>> declaration of function =C3=A2=E2=82=AC=CB=9Clocal_irq_restore=C3=A2=
=E2=82=AC=E2=84=A2
>>
>> Fix that
>>
>> Signed-off-by: Philippe De Muyter<phdm@macqel.be>
>>
>> ---
>> diff --git a/arch/m68k/include/asm/irqflags.h
>> b/arch/m68k/include/asm/irqflags.h
>> index 4a5b284..38b414d 100644
>> --- a/arch/m68k/include/asm/irqflags.h
>> +++ b/arch/m68k/include/asm/irqflags.h
>> @@ -2,7 +2,6 @@
>>   #define _M68K_IRQFLAGS_H
>>   #include<linux/types.h>
>> -#include<linux/hardirq.h>
>>   #include<linux/preempt.h>
>>   #include<asm/thread_info.h>
>>   #include<asm/entry.h>
>
> Gr{oetje,eeting}s,
>
>                          Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linu=
x-m68k.org
>
> In personal conversations with technical people, I call myself a hack=
er. But
> when I'm talking to journalists I just say "programmer" or something =
like that.
>                                  -- Linus Torvalds
>


--=20
-----------------------------------------------------------------------=
-
Greg Ungerer  --  Principal Engineer        EMAIL:     gerg@snapgear.co=
m
SnapGear Group, McAfee                      PHONE:       +61 7 3435 288=
8
8 Gardner Close,                            FAX:         +61 7 3891 363=
0
Milton, QLD, 4064, Australia                WEB: http://www.SnapGear.co=
m
