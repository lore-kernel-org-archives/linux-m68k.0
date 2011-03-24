From: Greg Ungerer <gerg@snapgear.com>
Subject: Re: [PATCH 0/1] m68k: merge m68k and m68knommu arch directories
Date: Thu, 24 Mar 2011 10:01:43 +1000
Message-ID: <4D8A89E7.6060204@snapgear.com>
References: <1300768985-902-1-git-send-email-gerg@snapgear.com>	<AANLkTimHzPn2Xe1RVRQKjwdynDvc3iL2=8kJ1p8kRZQ4@mail.gmail.com> <AANLkTi=ohXGdwfAtWmDJKCq+cJtFqJdTCmPCxFOg6dY6@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from sncsmrelay2.nai.com ([67.97.80.206]:10900 "EHLO
	sncsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933125Ab1CXAD3 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 23 Mar 2011 20:03:29 -0400
In-Reply-To: <AANLkTi=ohXGdwfAtWmDJKCq+cJtFqJdTCmPCxFOg6dY6@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org, linux-kernel@vger.kernel.org

Hi Geert,

On 24/03/11 08:14, Geert Uytterhoeven wrote:
> On Wed, Mar 23, 2011 at 23:07, Geert Uytterhoeven<geert@linux-m68k.or=
g>  wrote:
>> On Tue, Mar 22, 2011 at 05:43, =C3=A1<gerg@snapgear.com>  wrote:
>>> The following patch merges the m68k and m68knommu arch directories.
>>> This patch has been trimmed for review purposes - the automated fil=
e
>>> moving and mergeing carried out by the script contained in this ema=
il
>>> has been removed. Only the manually required changes after running =
the
>>> script are shown as the patch. (So to end up with the final require=
d
>>> change you need to run this script then apply the patch).
>>>
>>> This change is available as the only commit on the m68knommu git tr=
ee,
>>> for-linux branch:
>>>
>>> The following changes since commit a952baa034ae7c2e4a66932005cbc7eb=
bccfe28d:
>>> =C3=A1Linus Torvalds (1):
>>> =C3=A1 =C3=A1 =C3=A1 =C3=A1Merge branch 'for-linus' of git://git.ke=
rnel.org/.../dtor/input
>>>
>>> are available in the git repository at:
>>>
>>> =C3=A1git://git.kernel.org/pub/scm/linux/kernel/git/gerg/m68knommu.=
git for-linus
>>>
>>> Greg Ungerer (1):
>>> =C3=A1 =C3=A1 =C3=A1m68k: merge m68k and m68knommu arch directories
>>>
>>>
>>> It is also on the for-next branch in that tree, so will get some te=
sting
>>> in the next tree for the next few days.
>>
>> defconfig is now a nommu-config, and it fails?
>
> BTW, haven't tried it myself yet. I'm busy bisecting an issue with
> initrds, which
> got introduced between 2.6.37 and 2.6.38.
>
> Init fails with "init: cannot open inittab", followed by
> "Kernel panic - not syncing: Attempted to kill init!".
>
> As I can't get ramdisks to work on ARAnyM, I need to use real hardwar=
e, which
> suffers a lot from long reboot/copy kernel/test cycles...

As one data point (though not sure how useful this is to you... :-)
I can compile for an Atari target with the merge tree and load it
and run it on ARAnyM - using a ramdisk for root fs. Seems to work
ok.

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
