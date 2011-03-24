From: Greg Ungerer <gerg@snapgear.com>
Subject: Re: [PATCH 0/1] m68k: merge m68k and m68knommu arch directories
Date: Thu, 24 Mar 2011 22:05:54 +1000
Message-ID: <4D8B33A2.4090105@snapgear.com>
References: <1300768985-902-1-git-send-email-gerg@snapgear.com>	<AANLkTimHzPn2Xe1RVRQKjwdynDvc3iL2=8kJ1p8kRZQ4@mail.gmail.com>	<AANLkTi=ohXGdwfAtWmDJKCq+cJtFqJdTCmPCxFOg6dY6@mail.gmail.com>	<4D8A89E7.6060204@snapgear.com> <AANLkTi=O76yY1NtiX5EVCA7=kGB6Tj1UsuXigKwZdKUk@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from sncsmrelay2.nai.com ([67.97.80.206]:49286 "EHLO
	sncsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755628Ab1CXMMn convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Thu, 24 Mar 2011 08:12:43 -0400
In-Reply-To: <AANLkTi=O76yY1NtiX5EVCA7=kGB6Tj1UsuXigKwZdKUk@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org, linux-kernel@vger.kernel.org

On 24/03/11 18:04, Geert Uytterhoeven wrote:
> On Thu, Mar 24, 2011 at 01:01, Greg Ungerer<gerg@snapgear.com>  wrote=
:
>> Hi Geert,
>>
>> On 24/03/11 08:14, Geert Uytterhoeven wrote:
>>>
>>> On Wed, Mar 23, 2011 at 23:07, Geert Uytterhoeven<geert@linux-m68k.=
org>
>>> =C3=A1wrote:
>>>>
>>>> On Tue, Mar 22, 2011 at 05:43, =E2=94=9C=C3=AD<gerg@snapgear.com> =
 =C3=A1wrote:
>>>>>
>>>>> The following patch merges the m68k and m68knommu arch directorie=
s.
>>>>> This patch has been trimmed for review purposes - the automated f=
ile
>>>>> moving and mergeing carried out by the script contained in this e=
mail
>>>>> has been removed. Only the manually required changes after runnin=
g the
>>>>> script are shown as the patch. (So to end up with the final requi=
red
>>>>> change you need to run this script then apply the patch).
>>>>>
>>>>> This change is available as the only commit on the m68knommu git =
tree,
>>>>> for-linux branch:
>>>>>
>>>>> The following changes since commit
>>>>> a952baa034ae7c2e4a66932005cbc7ebbccfe28d:
>>>>> =E2=94=9C=C3=ADLinus Torvalds (1):
>>>>> =E2=94=9C=C3=AD =E2=94=9C=C3=AD =E2=94=9C=C3=AD =E2=94=9C=C3=ADMe=
rge branch 'for-linus' of
>>>>> git://git.kernel.org/.../dtor/input
>>>>>
>>>>> are available in the git repository at:
>>>>>
>>>>> =E2=94=9C=C3=ADgit://git.kernel.org/pub/scm/linux/kernel/git/gerg=
/m68knommu.git
>>>>> for-linus
>>>>>
>>>>> Greg Ungerer (1):
>>>>> =E2=94=9C=C3=AD =E2=94=9C=C3=AD =E2=94=9C=C3=ADm68k: merge m68k a=
nd m68knommu arch directories
>>>>>
>>>>>
>>>>> It is also on the for-next branch in that tree, so will get some =
testing
>>>>> in the next tree for the next few days.
>>>>
>>>> defconfig is now a nommu-config, and it fails?
>>>
>>> BTW, haven't tried it myself yet. I'm busy bisecting an issue with
>>> initrds, which
>>> got introduced between 2.6.37 and 2.6.38.
>>>
>>> Init fails with "init: cannot open inittab", followed by
>>> "Kernel panic - not syncing: Attempted to kill init!".
>>>
>>> As I can't get ramdisks to work on ARAnyM, I need to use real hardw=
are,
>>> which
>>> suffers a lot from long reboot/copy kernel/test cycles...
>>
>> As one data point (though not sure how useful this is to you... :-)
>> I can compile for an Atari target with the merge tree and load it
>> and run it on ARAnyM - using a ramdisk for root fs. Seems to work
>> ok.
>
> Strange. On ARAnyM I get:
>
>      Trying to unpack rootfs image as initramfs...
>      rootfs image is not initramfs (junk in compressed archive); look=
s
> like an initrd
>      Freeing initrd memory: 350k freed

I see that too.


> but later it fails with:
>
>      RAMDISK: Couldn't find valid RAM disk image starting at 0.

But later I get:

RAMDISK: ext2 filesystem found at block 0
RAMDISK: Loading 4096KiB [1 disk] into ram disk... done.
VFS: Mounted root (ext2 filesystem) readonly on device 1:0.


BTW the command boot args are:

Kernel command line: root=3D/dev/ram load_ramdisk=3D1 ramdisk_size=3D40=
96=20
video=3Datafb:tthigh console=3Dtty0 debug stram_swap=3D0 BOOT_IMAGE=3Dv=
mlinux

> It "works" (i.e. mounts) on the Amiga, but later it fails with the
> inittab error.
> Will  bisect more tonight...

Good luck :-)

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
