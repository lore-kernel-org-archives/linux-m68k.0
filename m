From: Luis Alves <ljalvs@gmail.com>
Subject: Re: [PATCH 1/1] 68000 code integration
Date: Fri, 4 May 2012 10:48:00 +0100
Message-ID: <CAGj5WxA=uO0Pkbn5UM4Tu3oGFO9JAXA7mEiwNQ3cuiOHM2b+hg@mail.gmail.com>
References: <1335818553-14402-1-git-send-email-ljalvs@gmail.com>
	<4FA37D01.2000107@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-gg0-f174.google.com ([209.85.161.174]:55619 "EHLO
	mail-gg0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753917Ab2EDJsC convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Fri, 4 May 2012 05:48:02 -0400
Received: by gghe5 with SMTP id e5so384095ggh.19
        for <linux-m68k@vger.kernel.org>; Fri, 04 May 2012 02:48:01 -0700 (PDT)
In-Reply-To: <4FA37D01.2000107@snapgear.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: uClinux development list <uclinux-dev@uclinux.org>, linux-m68k@vger.kernel.org
Cc: gerg@uclinux.org

Hi Greg,

On Fri, May 4, 2012 at 7:53 AM, Greg Ungerer <gerg@snapgear.com> wrote:
> Hi Luis,
>
> On 01/05/12 06:42, Luis Alves wrote:
>>
>> Here is my second attempt for the 68000 code integration.
>>
>> What I have done:
>> =A0Merged all 68000 based cpu's in platform/68000 and deleted 68*328
>> subdirs.
>> =A0Modified respective Makefile's to correctly build each target.
>> =A0Added support for my board/cpu in Kconfig's
>> =A0Merged all head.S files into one.
>
>
> Overall this is starting to look really good. I like the common
> 68000 platform directory. That has worked out well.
>
> Did you send this to the m68k-linux list as well?
> I don't see it in the CC list.

Yes, but in two separated emails (I had some headache with google smtp =
server).

>
> This is a big patch on its own though. Do you think there is any
> way you can break it up, into logical but smaller pieces?
> Something like firstly a patch that reorgs the directories for
> current 68x328 targets. Then follow on patches that add your
> board support.
>
> Oh, and another suggestion :-)
> Did you use git to generate this?
> If you use git format-patch with the -B and -M options it will
> handle moves and renames a little better, producing much smaller
> patches for email list review. It will collapse those pesky
> bootlogo.h files in this patch for example. And it also makes it
> much easier to see any changes made to moved files that are
> otherwise no obvious.

Yes, I've used git with Linus kernel as base, but I've just started
using git and don't know all the available options and features.
I'll try out the referred options.

>
> Oh, sorry, another suggestion as well :-)
> If you run this patch through the kernels scripts/checkpatch.pl
> checker it will list out any formating issues. It would be good to
> fix those up as well.

Your suggestions are always welcome :)
I'll run that script.

>
> An observation from the patch, the 68000/entry-*.S files all look
> quite similar. Is there any way they can be merged into a single
> file?

I'm just noticed that accidentally I've added the 'entry-68000.S'!
This file should be removed.

About merging, yes I plan to do it later. The thing is that in my
first attempt of running this kernel in the 68000 the entry code from
the  68328 had a strange behavior (you should remember debugging this
with me - lots of softlocks).
Then I've used the entry.S from coldfire sources as base and it worked =
smooth.
Also, the existing trap exception code doesn't work with 68000 cpu's
since they don't provide the vector in the stack.


>
> Thanks for doing this, it is looking really nice.

The pleasure is all mine :)

Regards,
Luis


>
> Regards
> Greg
>
>
>
>
>> In future iterations, more code can/will be merged.
>>
>> For the 68000 (and my board) the code is working fine. I have a fast=
 and
>> stable kernel running in the old 68000.
>> It would be nice if someone could test the 68[xx]328 target code and
>> eventually fix any bugs.
>>
>> The exception code for the 68000 is not yet completed (not having th=
e
>> exception vector on the stack is boring).
>> I plan to send future updates for the 68000 (and the code for my boa=
rd
>> drivers, not included in this patch)
>>
>>
>> Regards,
>> Luis Alves
>>
>>
>> ---
>> =A0arch/m68k/Kconfig.cpu =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =A0=
 =A02 +-
>> =A0arch/m68k/Kconfig.machine =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =A0 =A0=
6 +
>> =A0arch/m68k/Makefile =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
| =A0 =A06 +-
>> =A0arch/m68k/include/asm/alce68k.h =A0 =A0 =A0 =A0 =A0 | =A0136 ++
>> =A0arch/m68k/kernel/setup_no.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =A0 =A0=
3 +
>> =A0arch/m68k/platform/68000/Makefile =A0 =A0 =A0 =A0 | =A0 26 +
>> =A0arch/m68k/platform/68000/bootlogo-vz.h =A0 =A0| 3204
>> +++++++++++++++++++++++++++++
>> =A0arch/m68k/platform/68000/bootlogo.h =A0 =A0 =A0 | =A0270 +++
>> =A0arch/m68k/platform/68000/config-alce68k.c | =A0179 ++
>> =A0arch/m68k/platform/68000/config-ez.c =A0 =A0 =A0| =A0 76 +
>> =A0arch/m68k/platform/68000/config-vz.c =A0 =A0 =A0| =A0188 ++
>> =A0arch/m68k/platform/68000/config.c =A0 =A0 =A0 =A0 | =A0 55 +
>> =A0arch/m68k/platform/68000/entry-68000.S =A0 =A0| =A0463 +++++
>> =A0arch/m68k/platform/68000/entry-alce68k.S =A0| =A0453 ++++
>> =A0arch/m68k/platform/68000/entry.S =A0 =A0 =A0 =A0 =A0| =A0261 +++
>> =A0arch/m68k/platform/68000/head.S =A0 =A0 =A0 =A0 =A0 | =A0310 +++
>> =A0arch/m68k/platform/68000/ints-alce68k.c =A0 | =A0387 ++++
>> =A0arch/m68k/platform/68000/ints.c =A0 =A0 =A0 =A0 =A0 | =A0186 ++
>> =A0arch/m68k/platform/68000/romvec.S =A0 =A0 =A0 =A0 | =A0 35 +
>> =A0arch/m68k/platform/68000/timers-alce68k.c | =A0112 +
>> =A0arch/m68k/platform/68000/timers.c =A0 =A0 =A0 =A0 | =A0135 ++
>> =A0arch/m68k/platform/68328/Makefile =A0 =A0 =A0 =A0 | =A0 21 -
>> =A0arch/m68k/platform/68328/bootlogo.h =A0 =A0 =A0 | =A0270 ---
>> =A0arch/m68k/platform/68328/config.c =A0 =A0 =A0 =A0 | =A0 55 -
>> =A0arch/m68k/platform/68328/entry.S =A0 =A0 =A0 =A0 =A0| =A0261 ---
>> =A0arch/m68k/platform/68328/head-de2.S =A0 =A0 =A0 | =A0128 --
>> =A0arch/m68k/platform/68328/head-pilot.S =A0 =A0 | =A0207 --
>> =A0arch/m68k/platform/68328/head-ram.S =A0 =A0 =A0 | =A0141 --
>> =A0arch/m68k/platform/68328/head-rom.S =A0 =A0 =A0 | =A0105 -
>> =A0arch/m68k/platform/68328/ints.c =A0 =A0 =A0 =A0 =A0 | =A0186 --
>> =A0arch/m68k/platform/68328/romvec.S =A0 =A0 =A0 =A0 | =A0 35 -
>> =A0arch/m68k/platform/68328/timers.c =A0 =A0 =A0 =A0 | =A0135 --
>> =A0arch/m68k/platform/68EZ328/Makefile =A0 =A0 =A0 | =A0 =A05 -
>> =A0arch/m68k/platform/68EZ328/config.c =A0 =A0 =A0 | =A0 76 -
>> =A0arch/m68k/platform/68VZ328/Makefile =A0 =A0 =A0 | =A0 11 -
>> =A0arch/m68k/platform/68VZ328/bootlogo.h =A0 =A0 | 3204
>> -----------------------------
>> =A0arch/m68k/platform/68VZ328/config.c =A0 =A0 =A0 | =A0188 --
>> =A037 files changed, 6488 insertions(+), 5033 deletions(-)
>> =A0create mode 100644 arch/m68k/include/asm/alce68k.h
>> =A0create mode 100644 arch/m68k/platform/68000/Makefile
>> =A0create mode 100644 arch/m68k/platform/68000/bootlogo-vz.h
>> =A0create mode 100644 arch/m68k/platform/68000/bootlogo.h
>> =A0create mode 100644 arch/m68k/platform/68000/config-alce68k.c
>> =A0create mode 100644 arch/m68k/platform/68000/config-ez.c
>> =A0create mode 100644 arch/m68k/platform/68000/config-vz.c
>> =A0create mode 100644 arch/m68k/platform/68000/config.c
>> =A0create mode 100644 arch/m68k/platform/68000/entry-68000.S
>> =A0create mode 100644 arch/m68k/platform/68000/entry-alce68k.S
>> =A0create mode 100644 arch/m68k/platform/68000/entry.S
>> =A0create mode 100644 arch/m68k/platform/68000/head.S
>> =A0create mode 100644 arch/m68k/platform/68000/ints-alce68k.c
>> =A0create mode 100644 arch/m68k/platform/68000/ints.c
>> =A0create mode 100644 arch/m68k/platform/68000/romvec.S
>> =A0create mode 100644 arch/m68k/platform/68000/timers-alce68k.c
>> =A0create mode 100644 arch/m68k/platform/68000/timers.c
>> =A0delete mode 100644 arch/m68k/platform/68328/Makefile
>> =A0delete mode 100644 arch/m68k/platform/68328/bootlogo.h
>> =A0delete mode 100644 arch/m68k/platform/68328/config.c
>> =A0delete mode 100644 arch/m68k/platform/68328/entry.S
>> =A0delete mode 100644 arch/m68k/platform/68328/head-de2.S
>> =A0delete mode 100644 arch/m68k/platform/68328/head-pilot.S
>> =A0delete mode 100644 arch/m68k/platform/68328/head-ram.S
>> =A0delete mode 100644 arch/m68k/platform/68328/head-rom.S
>> =A0delete mode 100644 arch/m68k/platform/68328/ints.c
>> =A0delete mode 100644 arch/m68k/platform/68328/romvec.S
>> =A0delete mode 100644 arch/m68k/platform/68328/timers.c
>> =A0delete mode 100644 arch/m68k/platform/68EZ328/Makefile
>> =A0delete mode 100644 arch/m68k/platform/68EZ328/config.c
>> =A0delete mode 100644 arch/m68k/platform/68VZ328/Makefile
>> =A0delete mode 100644 arch/m68k/platform/68VZ328/bootlogo.h
>> =A0delete mode 100644 arch/m68k/platform/68VZ328/config.c
>
>
>
>
> --
> ---------------------------------------------------------------------=
---
> Greg Ungerer =A0-- =A0Principal Engineer =A0 =A0 =A0 =A0EMAIL: =A0 =A0=
 gerg@snapgear.com
> SnapGear Group, McAfee =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0PHO=
NE: =A0 =A0 =A0 +61 7 3435 2888
> 8 Gardner Close =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 FAX: =A0 =A0 =A0 =A0 +61 7 3217 5323
> Milton, QLD, 4064, Australia =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0WEB: http=
://www.SnapGear.com
