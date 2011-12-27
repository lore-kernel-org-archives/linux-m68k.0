From: Greg Ungerer <gerg@snapgear.com>
Subject: Re: [PATCH 32/35] m68k: add ColdFire FPU support for the V4e ColdFire
 CPU's
Date: Tue, 27 Dec 2011 22:36:00 +1000
Message-ID: <4EF9BBB0.5040904@snapgear.com>
References: <1324610148-20666-1-git-send-email-gerg@snapgear.com>	<1324610148-20666-33-git-send-email-gerg@snapgear.com> <CAMuHMdVBGR9p1f_dnk8abYwosvBm9n7j1foaGd+gMESKXm8+Vw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from sncsmrelay2.nai.com ([67.97.80.206]:23731 "EHLO
	sncsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753450Ab1L0Mja convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 27 Dec 2011 07:39:30 -0500
In-Reply-To: <CAMuHMdVBGR9p1f_dnk8abYwosvBm9n7j1foaGd+gMESKXm8+Vw@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org, Greg Ungerer <gerg@uclinux.org>

Hi Geert,

On 12/25/2011 05:38 AM, Geert Uytterhoeven wrote:
> On Fri, Dec 23, 2011 at 04:15,<gerg@snapgear.com>  wrote:
>> @@ -570,15 +616,12 @@ static inline int rt_save_fpu_state(struct uco=
ntext __user *uc, struct pt_regs *
>> =C3=A1 =C3=A1 =C3=A1 =C3=A1 =C3=A1 =C3=A1 =C3=A1 =C3=A1return err;
>> =C3=A1 =C3=A1 =C3=A1 =C3=A1}
>>
>> - =C3=A1 =C3=A1 =C3=A1 __asm__ volatile (".chip 68k/68881\n\t"
>> - =C3=A1 =C3=A1 =C3=A1 =C3=A1 =C3=A1 =C3=A1 =C3=A1 =C3=A1 =C3=A1 =C3=
=A1 =C3=A1 =C3=A1 "fsave %0\n\t"
>> - =C3=A1 =C3=A1 =C3=A1 =C3=A1 =C3=A1 =C3=A1 =C3=A1 =C3=A1 =C3=A1 =C3=
=A1 =C3=A1 =C3=A1 ".chip 68k"
>> - =C3=A1 =C3=A1 =C3=A1 =C3=A1 =C3=A1 =C3=A1 =C3=A1 =C3=A1 =C3=A1 =C3=
=A1 =C3=A1 =C3=A1 : : "m" (*fpstate) : "memory");
>> + =C3=A1 =C3=A1 =C3=A1 __asm__ volatile ("fsave %0" : : "m" (*fpstat=
e) : "memory");
>
> This change breaks one of my test configs, which builds for 68040 onl=
y:
>
> {standard input}: Assembler messages:
> {standard input}:475: Error: invalid instruction for this
> architecture; needs 68020 [68k, 68ec020], 68030 [68ec030], 68040
> [68ec040], 68060 [68ec060], cpu32 [68330, 68331, 68332, 68333, 68334,
> 68336, 68340, 68341, 68349, 68360], 547x [5470, 5471, 5472, 5473,
> 5474, 5475], 548x [5480, 5481, 5482, 5483, 5484, 5485] -- statement
> `fsave -540(%fp)' ignored
>
> You can reproduce it by taking e.g. amiga_defconfig and disabling all=
 of
> CONFIG_M68[236]0, or by manually compiling arch/m68k/kernel/signal.c
> with "-m68040" added (that's what 68040-only does).
>
> By convention, we always switch to the needed CPU type using the ".ch=
ip"
> directive, and switch back to generic 68k afterwards. So I'd expect i=
t to fail
> for all my builds, but it only does for the 68040-only ones...

Ok, I'll need to dig into this one again then :-)
I think the problem for me was that the the switch back using
".chip 68k" is no longer correct when compiling for ColdFire.

I'll have a closer look tomorrow when I have some time.

Thanks
Greg


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
