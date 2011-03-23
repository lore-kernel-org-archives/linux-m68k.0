From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 0/1] m68k: merge m68k and m68knommu arch directories
Date: Wed, 23 Mar 2011 23:14:58 +0100
Message-ID: <AANLkTi=ohXGdwfAtWmDJKCq+cJtFqJdTCmPCxFOg6dY6@mail.gmail.com>
References: <1300768985-902-1-git-send-email-gerg@snapgear.com>
	<AANLkTimHzPn2Xe1RVRQKjwdynDvc3iL2=8kJ1p8kRZQ4@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-fx0-f46.google.com ([209.85.161.46]:59904 "EHLO
	mail-fx0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753945Ab1CWWPO convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 23 Mar 2011 18:15:14 -0400
In-Reply-To: <AANLkTimHzPn2Xe1RVRQKjwdynDvc3iL2=8kJ1p8kRZQ4@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: gerg@snapgear.com
Cc: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org, linux-kernel@vger.kernel.org

On Wed, Mar 23, 2011 at 23:07, Geert Uytterhoeven <geert@linux-m68k.org=
> wrote:
> On Tue, Mar 22, 2011 at 05:43, =C2=A0<gerg@snapgear.com> wrote:
>> The following patch merges the m68k and m68knommu arch directories.
>> This patch has been trimmed for review purposes - the automated file
>> moving and mergeing carried out by the script contained in this emai=
l
>> has been removed. Only the manually required changes after running t=
he
>> script are shown as the patch. (So to end up with the final required
>> change you need to run this script then apply the patch).
>>
>> This change is available as the only commit on the m68knommu git tre=
e,
>> for-linux branch:
>>
>> The following changes since commit a952baa034ae7c2e4a66932005cbc7ebb=
ccfe28d:
>> =C2=A0Linus Torvalds (1):
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0Merge branch 'for-linus' of git://git.ker=
nel.org/.../dtor/input
>>
>> are available in the git repository at:
>>
>> =C2=A0git://git.kernel.org/pub/scm/linux/kernel/git/gerg/m68knommu.g=
it for-linus
>>
>> Greg Ungerer (1):
>> =C2=A0 =C2=A0 =C2=A0m68k: merge m68k and m68knommu arch directories
>>
>>
>> It is also on the for-next branch in that tree, so will get some tes=
ting
>> in the next tree for the next few days.
>
> defconfig is now a nommu-config, and it fails?

BTW, haven't tried it myself yet. I'm busy bisecting an issue with
initrds, which
got introduced between 2.6.37 and 2.6.38.

Init fails with "init: cannot open inittab", followed by
"Kernel panic - not syncing: Attempted to kill init!".

As I can't get ramdisks to work on ARAnyM, I need to use real hardware,=
 which
suffers a lot from long reboot/copy kernel/test cycles...

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
