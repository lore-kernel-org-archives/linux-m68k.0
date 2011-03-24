From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 0/1] m68k: merge m68k and m68knommu arch directories
Date: Thu, 24 Mar 2011 09:04:23 +0100
Message-ID: <AANLkTi=O76yY1NtiX5EVCA7=kGB6Tj1UsuXigKwZdKUk@mail.gmail.com>
References: <1300768985-902-1-git-send-email-gerg@snapgear.com>
	<AANLkTimHzPn2Xe1RVRQKjwdynDvc3iL2=8kJ1p8kRZQ4@mail.gmail.com>
	<AANLkTi=ohXGdwfAtWmDJKCq+cJtFqJdTCmPCxFOg6dY6@mail.gmail.com>
	<4D8A89E7.6060204@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-fx0-f46.google.com ([209.85.161.46]:34207 "EHLO
	mail-fx0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933179Ab1CXIEY convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Thu, 24 Mar 2011 04:04:24 -0400
In-Reply-To: <4D8A89E7.6060204@snapgear.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Greg Ungerer <gerg@snapgear.com>
Cc: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org, linux-kernel@vger.kernel.org

On Thu, Mar 24, 2011 at 01:01, Greg Ungerer <gerg@snapgear.com> wrote:
> Hi Geert,
>
> On 24/03/11 08:14, Geert Uytterhoeven wrote:
>>
>> On Wed, Mar 23, 2011 at 23:07, Geert Uytterhoeven<geert@linux-m68k.o=
rg>
>> =C2=A0wrote:
>>>
>>> On Tue, Mar 22, 2011 at 05:43, =C3=83=C2=A1<gerg@snapgear.com> =C2=A0=
wrote:
>>>>
>>>> The following patch merges the m68k and m68knommu arch directories=
=2E
>>>> This patch has been trimmed for review purposes - the automated fi=
le
>>>> moving and mergeing carried out by the script contained in this em=
ail
>>>> has been removed. Only the manually required changes after running=
 the
>>>> script are shown as the patch. (So to end up with the final requir=
ed
>>>> change you need to run this script then apply the patch).
>>>>
>>>> This change is available as the only commit on the m68knommu git t=
ree,
>>>> for-linux branch:
>>>>
>>>> The following changes since commit
>>>> a952baa034ae7c2e4a66932005cbc7ebbccfe28d:
>>>> =C3=83=C2=A1Linus Torvalds (1):
>>>> =C3=83=C2=A1 =C3=83=C2=A1 =C3=83=C2=A1 =C3=83=C2=A1Merge branch 'f=
or-linus' of
>>>> git://git.kernel.org/.../dtor/input
>>>>
>>>> are available in the git repository at:
>>>>
>>>> =C3=83=C2=A1git://git.kernel.org/pub/scm/linux/kernel/git/gerg/m68=
knommu.git
>>>> for-linus
>>>>
>>>> Greg Ungerer (1):
>>>> =C3=83=C2=A1 =C3=83=C2=A1 =C3=83=C2=A1m68k: merge m68k and m68knom=
mu arch directories
>>>>
>>>>
>>>> It is also on the for-next branch in that tree, so will get some t=
esting
>>>> in the next tree for the next few days.
>>>
>>> defconfig is now a nommu-config, and it fails?
>>
>> BTW, haven't tried it myself yet. I'm busy bisecting an issue with
>> initrds, which
>> got introduced between 2.6.37 and 2.6.38.
>>
>> Init fails with "init: cannot open inittab", followed by
>> "Kernel panic - not syncing: Attempted to kill init!".
>>
>> As I can't get ramdisks to work on ARAnyM, I need to use real hardwa=
re,
>> which
>> suffers a lot from long reboot/copy kernel/test cycles...
>
> As one data point (though not sure how useful this is to you... :-)
> I can compile for an Atari target with the merge tree and load it
> and run it on ARAnyM - using a ramdisk for root fs. Seems to work
> ok.

Strange. On ARAnyM I get:

    Trying to unpack rootfs image as initramfs...
    rootfs image is not initramfs (junk in compressed archive); looks
like an initrd
    Freeing initrd memory: 350k freed

but later it fails with:

    RAMDISK: Couldn't find valid RAM disk image starting at 0.

It "works" (i.e. mounts) on the Amiga, but later it fails with the
inittab error.
Will  bisect more tonight...

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
