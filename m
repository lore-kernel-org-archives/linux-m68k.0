From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [uClinux-dev] [PATCH] m68k: Merge mmu and non-mmu versions of sys_call_table
Date: Wed, 13 Apr 2011 20:03:35 +0200
Message-ID: <BANLkTimL=nzyaLPk1b4WS38-BbbycsiS8Q__40943.2910303169$1302718278$gmane$org@mail.gmail.com>
References: <alpine.DEB.2.00.1104062231190.11240@ayla.of.borg>
	<20110406220510.GA17350@frolo.macqel>
	<4D9D0AF3.9070100@snapgear.com>
	<000301cbf4c9$40339fc0$c09adf40$@com>
	<4D9D24BB.3060804@snapgear.com>
	<000d01cbf4d1$d50e2f90$7f2a8eb0$@com>
	<4D9D3A28.9060104@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <4D9D3A28.9060104@snapgear.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Greg Ungerer <gerg@snapgear.com>
Cc: Gavin Lambert <gavinl@compacsort.com>, uClinux development list <uclinux-dev@uclinux.org>, Philippe De Muyter <phdm@macqel.be>, Linux/m68k <linux-m68k@lists.linux-m68k.org>

On Thu, Apr 7, 2011 at 06:14, Greg Ungerer <gerg@snapgear.com> wrote:
> On 07/04/11 13:13, Gavin Lambert wrote:
>>
>> Quoth Greg Ungerer:
>>>>
>>>> Doesn't that have XIP consequences? =C2=A0.text (and presumably .r=
odata)
>>>> can be stored and executed from ROM, since they can't be changed a=
t
>>>> runtime. =C2=A0.data has to be in RAM, since it can be.
>>>
>>> Yes, but even in the kernel XIP case the very early startup code
>>> moves the kernels data to RAM. Well before the system call table
>>> will be needed.
>>
>> But presumably if the syscall table was previously in .text, it was =
not
>> subject to this. =C2=A0And now it will be.
>>
>> I doubt this would actually break anything (as you've already confir=
med),
>> since it's only a tiny RAM usage increase, but unless there's some r=
eason
>> for the syscall table to be read-write it seems a bit odd.
>
> To be read-write yes, odd, but a data table being in the .text
> section is also odd. It really belongs in the .rodata section.
> And then it will be packed with the .text in our linkers script,
> and wouldn't be copied out to RAM.
>
> So Geert, can we move this to the .rodata section?
>
> I just tried changing the .data section to
>
> =C2=A0 =C2=A0.section ".rodata"
>
> It compiled and work on both m68k and m68knommu targets for me.

Thanks, I'll move it .rodata.

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
