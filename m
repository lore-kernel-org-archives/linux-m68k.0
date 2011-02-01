From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: Early crash (was: Re: module: show version information for
 built-in modules in sysfs)
Date: Tue, 1 Feb 2011 23:03:23 +0100
Message-ID: <AANLkTimv=KqtuR36dMNa+=OMi0mgd8JK4qsb_SpmKmhs@mail.gmail.com>
References: <AANLkTin4gOnEMruLDM=TkNYsNf5S370WqbcDVJzT7_Z4@mail.gmail.com>
	<20110201210944.GA12348@dtor-ws.eng.vmware.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20110201210944.GA12348@dtor-ws.eng.vmware.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Torokhov <dtor@vmware.com>
Cc: Rusty Russell <rusty@rustcorp.com.au>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Linux/m68k <linux-m68k@vger.kernel.org>
List-Id: linux-m68k@vger.kernel.org

On Tue, Feb 1, 2011 at 22:09, Dmitry Torokhov <dtor@vmware.com> wrote:
> On Tue, Feb 01, 2011 at 12:33:29PM -0800, Geert Uytterhoeven wrote:
>> On Mon, Jan 24, 2011 at 11:59, Linux Kernel Mailing List
>> <linux-kernel@vger.kernel.org> wrote:
>> > Gitweb: =C2=A0 =C2=A0 http://git.kernel.org/linus/e94965ed5beb23c6=
fabf7ed31f625e66d7ff28de
>>
>> > =C2=A0 =C2=A0module: show version information for built-in modules=
 in sysfs
>> >
>> > =C2=A0 =C2=A0Currently only drivers that are built as modules have=
 their versions
>> > =C2=A0 =C2=A0shown in /sys/module/<module_name>/version, but this =
information might
>> > =C2=A0 =C2=A0also be useful for built-in drivers as well. This esp=
ecially important
>> > =C2=A0 =C2=A0for drivers that do not define any parameters - such =
drivers, if
>> > =C2=A0 =C2=A0built-in, are completely invisible from userspace.
>> >
>> > =C2=A0 =C2=A0This patch changes MODULE_VERSION() macro so that in =
case when we are
>> > =C2=A0 =C2=A0compiling built-in module, version information is sto=
red in a separate
>> > =C2=A0 =C2=A0section. Kernel then uses this data to create 'versio=
n' sysfs attribute
>> > =C2=A0 =C2=A0in the same fashion it creates attributes for module =
parameters.
>>
>> This commit causes the crash below on m68k (ARAnyM).
>> Reverting this commit and its dependency
>> 3b90a5b292321b2acac3921f77046ae195aef53f
>> ("module: fix linker error for MODULE_VERSION when !MODULE and CONFI=
G_SYSFS=3Dn")
>> makes it boot again.
>>
>
> Hi Geert,
>
> Does the follwing help by any chance?
>
> From d6fd4a6e0fc2d3f0a74962d4a6f663a46d230ecd Mon Sep 17 00:00:00 200=
1
> diff --git a/arch/m68knommu/kernel/vmlinux.lds.S b/arch/m68knommu/ker=
nel/vmlinux.lds.S
> index ef33213..47e15eb 100644
> --- a/arch/m68knommu/kernel/vmlinux.lds.S
> +++ b/arch/m68knommu/kernel/vmlinux.lds.S

The crash happened on m68k with MMU, not m68knommu.

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
