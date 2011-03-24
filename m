From: Greg Ungerer <gerg@snapgear.com>
Subject: Re: [PATCH 0/1] m68k: merge m68k and m68knommu arch directories
Date: Thu, 24 Mar 2011 21:54:42 +1000
Message-ID: <4D8B3102.1080205@snapgear.com>
References: <1300768985-902-1-git-send-email-gerg@snapgear.com>	<AANLkTimHzPn2Xe1RVRQKjwdynDvc3iL2=8kJ1p8kRZQ4@mail.gmail.com>	<4D8A7B7F.2050405@snapgear.com> <AANLkTik37qYtMOWENPvRmhqqPkUCTL79_cqZ-0e_i2o7@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from sncsmrelay2.nai.com ([67.97.80.206]:12943 "EHLO
	sncsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755268Ab1CXL6Z convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Thu, 24 Mar 2011 07:58:25 -0400
In-Reply-To: <AANLkTik37qYtMOWENPvRmhqqPkUCTL79_cqZ-0e_i2o7@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org, linux-kernel@vger.kernel.org, Linux-Next <linux-next@vger.kernel.org>


Hi Geert,

On 24/03/11 18:06, Geert Uytterhoeven wrote:
> On Thu, Mar 24, 2011 at 00:00, Greg Ungerer<gerg@snapgear.com>  wrote=
:
>> On 24/03/11 08:07, Geert Uytterhoeven wrote:
>>> On Tue, Mar 22, 2011 at 05:43,<gerg@snapgear.com>  =C3=A1wrote:
>>>> slso on the for-next branch in that tree, so will get some testing
>>>> in the next tree for the next few days.
>>>
>>> defconfig is now a nommu-config, and it fails?
>>>
>>> http://kisskb.ellerman.id.au/kisskb/buildresult/4012794/
>>
>> Yep, that looks wrong. I'll move the define for KBUILD_DEFCONFIG
>> into arch/m68k/Makefile (and remove the existing defines in Makefile=
_mm
>> and Makefile_no). That will make the DEFCONFIG as it was before,
>> multi_defconfig.
>>
>>> arch/m68k/kernel/entry_no.S:47: Error: Unknown operator -- statemen=
t
>>> `save_all' ignored
>>
>> This is due to compiling for the non-mmu targets and not using
>> a m68k-uclinux- toolchain. Unfortunately the compiler must define
>> __uClinux__ to compile for non-mmu targets. This isn't new, we
>
> For userland...

Yes, they can't see CONFIG_MMU or otherwise.


>> have had this problem ever since the merge of the header files.
>> (The exported headers need some switch to use to base some
>> conditionals on, and kernel config options cannot be used in
>> exported headers).
>
> For kernels, we can explicitly define this in arch/m68k/Makefile if !=
MMU, right?

We certainly can do that, but we don't currently...
I'll make a note to fix that.


>> But with a fixed defconfig, you won't see this anymore :-)
>>
>> I'll fix up the git commit on m68knommu git tree.
>
> Good, thx!

That is updated... Do you want to let this bake for another couple
of days before I ask Linus to pull it?

Regards
Greg


> Gr{oetje,eeting}s,
>
> =C3=A1 =C3=A1 =C3=A1 =C3=A1 =C3=A1 =C3=A1 =C3=A1 =C3=A1 =C3=A1 =C3=A1=
 =C3=A1 =C3=A1 Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linu=
x-m68k.org
>
> In personal conversations with technical people, I call myself a hack=
er. But
> when I'm talking to journalists I just say "programmer" or something =
like that.
> =C3=A1 =C3=A1 =C3=A1 =C3=A1 =C3=A1 =C3=A1 =C3=A1 =C3=A1 =C3=A1 =C3=A1=
 =C3=A1 =C3=A1 =C3=A1 =C3=A1=C3=A1 =C3=A1=C3=A1 -- Linus Torvalds
>
>
>


--=20
-----------------------------------------------------------------------=
-
Greg Ungerer  --  Principal Engineer        EMAIL:     gerg@snapgear.co=
m
SnapGear Group, McAfee                      PHONE:       +61 7 3435 288=
8
8 Gardner Close                             FAX:         +61 7 3217 532=
3
Milton, QLD, 4064, Australia                WEB: http://www.SnapGear.co=
m
