From: Greg Ungerer <gerg@snapgear.com>
Subject: Re: [PATCH] m68k: print memory layout info in boot log
Date: Sat, 22 Oct 2011 07:36:56 +1000
Message-ID: <4EA1E5F8.7080108@snapgear.com>
References: <1319180852-11105-1-git-send-email-gerg@snapgear.com> <CAMuHMdWYBDd+rVe4FF7TYhNcyr_na09u8csVvw7L19Ry9Y2GWA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from sncsmrelay2.nai.com ([67.97.80.206]:54983 "EHLO
	sncsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752770Ab1JUVhm convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Fri, 21 Oct 2011 17:37:42 -0400
In-Reply-To: <CAMuHMdWYBDd+rVe4FF7TYhNcyr_na09u8csVvw7L19Ry9Y2GWA@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org, Greg Ungerer <gerg@uclinux.org>


Hi Geert,

On 10/22/2011 12:56 AM, Geert Uytterhoeven wrote:
> On Fri, Oct 21, 2011 at 09:07,<gerg@snapgear.com>  wrote:
>> Output a table of the kernel memory regions at boot time.
>> This is taken directly from the ARM architecture code that does this=
=2E
>> The table looks like this:
>
> arch/m68k/mm/init_mm.c: In function =C3=A6print_memmap=C3=86:
> arch/m68k/mm/init_mm.c:108: error: =C3=A6_sbss=C3=86 undeclared (firs=
t use in
> this function)
> arch/m68k/mm/init_mm.c:108: error: (Each undeclared identifier is
> reported only once
> arch/m68k/mm/init_mm.c:108: error: for each function it appears in.)
> arch/m68k/mm/init_mm.c:108: error: =C3=A6_ebss=C3=86 undeclared (firs=
t use in
> this function)

This patch relies on one I posted a little while back:

   http://www.spinics.net/lists/linux-m68k/msg04054.html

which is currently in linux-next. So I am getting a little ahead
of things here I guess :-)


>> + =C3=A1 =C3=A1 =C3=A1 printk(KERN_NOTICE "Virtual kernel memory lay=
out:\n"
>
> pr_notice

Yep, I will change that.


>> + =C3=A1 =C3=A1 =C3=A1 =C3=A1 =C3=A1 =C3=A1 =C3=A1 " =C3=A1 =C3=A1ve=
ctor =C3=A1: 0x%08lx - 0x%08lx =C3=A1 (%4ld kB)\n"
>> + =C3=A1 =C3=A1 =C3=A1 =C3=A1 =C3=A1 =C3=A1 =C3=A1 " =C3=A1 =C3=A1km=
ap =C3=A1 =C3=A1: 0x%08lx - 0x%08lx =C3=A1 (%4ld MB)\n"
>> + =C3=A1 =C3=A1 =C3=A1 =C3=A1 =C3=A1 =C3=A1 =C3=A1 " =C3=A1 =C3=A1vm=
alloc : 0x%08lx - 0x%08lx =C3=A1 (%4ld MB)\n"
>> + =C3=A1 =C3=A1 =C3=A1 =C3=A1 =C3=A1 =C3=A1 =C3=A1 " =C3=A1 =C3=A1lo=
wmem =C3=A1: 0x%08lx - 0x%08lx =C3=A1 (%4ld MB)\n"
>> + =C3=A1 =C3=A1 =C3=A1 =C3=A1 =C3=A1 =C3=A1 =C3=A1 " =C3=A1 =C3=A1 =C3=
=A1.init : 0x%p" " - 0x%p" " =C3=A1 (%4d kB)\n"
>> + =C3=A1 =C3=A1 =C3=A1 =C3=A1 =C3=A1 =C3=A1 =C3=A1 " =C3=A1 =C3=A1 =C3=
=A1.text : 0x%p" " - 0x%p" " =C3=A1 (%4d kB)\n"
>> + =C3=A1 =C3=A1 =C3=A1 =C3=A1 =C3=A1 =C3=A1 =C3=A1 " =C3=A1 =C3=A1 =C3=
=A1.data : 0x%p" " - 0x%p" " =C3=A1 (%4d kB)\n"
>> + =C3=A1 =C3=A1 =C3=A1 =C3=A1 =C3=A1 =C3=A1 =C3=A1 " =C3=A1 =C3=A1 =C3=
=A1.bss =C3=A1: 0x%p" " - 0x%p" " =C3=A1 (%4d kB)\n",
>
> KiB, MiB?

Yep, thats better. I'll change that too. Thanks.

Regards
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
