From: Greg Ungerer <gerg@snapgear.com>
Subject: Re: [PATCH] m68knommu: add missing make rule for Palm/Pilot bitmap
 boot logo
Date: Fri, 30 Dec 2011 10:30:44 +1000
Message-ID: <4EFD0634.4000102@snapgear.com>
References: <1324537383-16741-1-git-send-email-gerg@snapgear.com> <CAMuHMdVjEn2cNvPCYegp3gweNp_98XjPvoBEf20J5jQ++UNLkA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from dalsmrelay2.nai.com ([205.227.136.216]:21065 "EHLO
	dalsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754910Ab1L3AbZ convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Thu, 29 Dec 2011 19:31:25 -0500
In-Reply-To: <CAMuHMdVjEn2cNvPCYegp3gweNp_98XjPvoBEf20J5jQ++UNLkA@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org, Greg Ungerer <gerg@uclinux.org>

Hi Geert,

On 22/12/11 17:18, Geert Uytterhoeven wrote:
> On Thu, Dec 22, 2011 at 08:03,<gerg@snapgear.com>  wrote:
>> From: Greg Ungerer<gerg@uclinux.org>
>>
>> Compiling for the m68knommu/68328 Palm/Pilot target you get:
>>
>> arch/m68k/platform/68328/head-pilot.o
>> arch/m68k/platform/68328/head-pilot.S:37:23: fatal error: bootlogo.r=
h: No such file or directory
>>
>> The Makefile contains rules to make the bootlogo.rh file from the C =
source
>> bootlogo.h. But it is missing a dependency that compiling head-pilot=
=2ES needs
>> bootlogo.rh.
>>
>> Signed-off-by: Greg Ungerer<gerg@uclinux.org>
>> ---
>> arch/m68k/platform/68328/Makefile | =C3=A1 =C3=A13 +++
>> 1 files changed, 3 insertions(+), 0 deletions(-)
>>
>> diff --git a/arch/m68k/platform/68328/Makefile b/arch/m68k/platform/=
68328/Makefile
>> index e4dfd8f..704e36d 100644
>> --- a/arch/m68k/platform/68328/Makefile
>> +++ b/arch/m68k/platform/68328/Makefile
>> @@ -16,6 +16,9 @@ obj-$(CONFIG_ROM) +=3D romvec.o
>>  extra-y		   :=3D head.o
>>  extra-$(CONFIG_M68328) +=3D bootlogo.rh head.o
>>
>> +$(obj)/head-pilot.o: $(obj)/bootlogo.rh
>> +$(obj)/head-rom.o: $(obj)/bootlogo.rh
>> +
>>  $(obj)/bootlogo.rh: $(src)/bootlogo.h
>>  	perl $(src)/bootlogo.pl<  $(src)/bootlogo.h>  $(obj)/bootlogo.rh
>
> Nothing serious, you just made me wondering:
>   1. Any chance bootlogo.h can be generated from a more edit-friendly=
 format,
>      cfr. drivers/video/logo/?

Looking at this I think you are right. This could be in the same way
with all the others in drivers/video/logo.


>   2. Why do you include the *.rh file from an assembler source file, =
instead of
>      including the *.h file from a C source file?

Although the fix involves more change to do it in C code, at least
it improves this code a little :-)  So I have a different patch to fix
this that does it this way. Sending patch after this.

Regards
Greg


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
