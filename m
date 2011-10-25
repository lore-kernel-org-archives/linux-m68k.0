From: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [git pull] m68knommu arch updates for 3.2
Date: Tue, 25 Oct 2011 09:42:02 +0200
Message-ID: <CA+55aFzLBaLpBWA8tspNbCyzMYeruK-waRCpRwVnZEOGw9FhRQ@mail.gmail.com>
References: <201110250229.p9P2Tvth015729@goober.corp.nai.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-ww0-f44.google.com ([74.125.82.44]:59031 "EHLO
	mail-ww0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752604Ab1JYHmY convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 25 Oct 2011 03:42:24 -0400
In-Reply-To: <201110250229.p9P2Tvth015729@goober.corp.nai.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Greg Ungerer <gerg@snapgear.com>
Cc: gerg@uclinux.org, linux-kernel@vger.kernel.org, linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org, geert@linux-m68k.org

[ Another cut-and-paste reply, please replace "p9" with "m68knommu".
Also note that signed emails aren't convenient (the tools that
actually verify signed emails are unusuable in all other respects), so
an extra signed tag that actually specifies both the top commit and
the repository I'm supposed to pull is likely the best approach if you
don't have access to a trusted host ]

So for the merge window, I *really* want the development trees I pull
from explicitly verified some way.

Now, the p9 patches seem to be small enough, and not core enough, for
me to care deeply, but I really *really* want to not see unsigned
github things.

Putting a signed tag on there somewhere that actually signs the top
commit *and* mentions the repository and branch it is on (ie github)
is not wonderfully convenient, but it's at least relatively
straightforward (do I have a gpg key I can trust?).

Or using a host that I can trust is being maintained by you guys (or
some trusted third party like kernel.org).

(Also, I'm only seeing about half the patches mentioned in linux-next. =
Hmm?)

Please? Not pulled.

                  Linus

On Tue, Oct 25, 2011 at 4:29 AM, Greg Ungerer <gerg@snapgear.com> wrote=
:
>
> Hi Linus,
>
> Can you please pull the m68knommu git tree, for-linus branch:
>
> =A0git@github.com:gregungerer/m68knommu.git for-linus
>
> There is a big cleanup and reworking of the Kconfig files. They are n=
o
> longer splilt on the somewhat arbitary basis of MMU and non-MMU targe=
ts.
> Also some other merging and cleaning up of arch Makefiles, and the tr=
ap
> handling code. Of course a couple of bug fixes in there too.
>
> Thanks
> Greg
>
>
>
>
> The following changes since commit 899e3ee404961a90b828ad527573aaaac3=
9f0ab1:
> =A0Linus Torvalds (1):
> =A0 =A0 =A0 =A0Linux 3.1-rc10
>
> are available in the git repository at:
>
> =A0git@github.com:gregungerer/m68knommu.git for-linus
>
> Greg Ungerer (11):
> =A0 =A0 =A0m68k: fix memcpy to unmatched/unaligned source and dest on=
 68000
> =A0 =A0 =A0m68k: reorganize Kconfig options to improve mmu/non-mmu se=
lections
> =A0 =A0 =A0m68k: merge mmu and non-mmu arch Makefiles
> =A0 =A0 =A0m68k: merge the mmu and non-mmu kernel/Makefiles
> =A0 =A0 =A0m68k: merge mmu and non-mmu include/asm/entry.h files
> =A0 =A0 =A0m68k: move hardware vector setting from traps.c to its own=
 file
> =A0 =A0 =A0m68k: merge the mmu and non-mmu traps.c files
> =A0 =A0 =A0m68knommu: use generic section names in setup code
> =A0 =A0 =A0m68knommu: use generic section names in mm/init code
> =A0 =A0 =A0m68knommu: remove extern declarations of memory_start/memo=
ry_end from mm/init
> =A0 =A0 =A0m68knommu: create common externs for _ram* vars
>
> Paul Bolle (2):
> =A0 =A0 =A0m68k: drop unused Kconfig symbols
> =A0 =A0 =A0m68k: drop unused Kconfig symbols
>
> Peter Turczak (1):
> =A0 =A0 =A0m68knommu: fix problems with SPI/GPIO on ColdFire 520x
>
> =A0arch/m68k/Kconfig =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0| =A0195 +----
> =A0arch/m68k/Kconfig.bus =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0| =A0 55 ++
> =A0arch/m68k/Kconfig.cpu =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0| =A0429 +++++++++
> =A0arch/m68k/Kconfig.devices =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0|=
 =A0123 +++
> =A0arch/m68k/{Kconfig.nommu =3D> Kconfig.machine} | =A0562 ++++------=
--
> =A0arch/m68k/Kconfig.mmu =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0| =A0411 ---------
> =A0arch/m68k/Makefile =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 | =A0168 ++++-
> =A0arch/m68k/Makefile_mm =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0| =A0121 ---
> =A0arch/m68k/Makefile_no =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0| =A0124 ---
> =A0arch/m68k/include/asm/entry.h =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| =A0=
255 ++++++-
> =A0arch/m68k/include/asm/entry_mm.h =A0 =A0 =A0 =A0 =A0 =A0 | =A0128 =
---
> =A0arch/m68k/include/asm/entry_no.h =A0 =A0 =A0 =A0 =A0 =A0 | =A0181 =
----
> =A0arch/m68k/include/asm/m520xsim.h =A0 =A0 =A0 =A0 =A0 =A0 | =A0 26 =
+-
> =A0arch/m68k/include/asm/mcfqspi.h =A0 =A0 =A0 =A0 =A0 =A0 =A0| =A0 =A0=
8 +-
> =A0arch/m68k/include/asm/page_no.h =A0 =A0 =A0 =A0 =A0 =A0 =A0| =A0 =A0=
3 +
> =A0arch/m68k/include/asm/processor.h =A0 =A0 =A0 =A0 =A0 =A0| =A0 =A0=
6 +
> =A0arch/m68k/include/asm/sections.h =A0 =A0 =A0 =A0 =A0 =A0 | =A0 =A0=
2 +
> =A0arch/m68k/kernel/Makefile =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0|=
 =A0 24 +-
> =A0arch/m68k/kernel/Makefile_mm =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =A0=
 17 -
> =A0arch/m68k/kernel/Makefile_no =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =A0=
 10 -
> =A0arch/m68k/kernel/entry_no.S =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| =A0=
 =A06 +-
> =A0arch/m68k/kernel/setup_no.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| =A0=
 =A04 +-
> =A0arch/m68k/kernel/traps.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 |=
 1108 +++++++++++++++++++++++-
> =A0arch/m68k/kernel/traps_mm.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| 1=
207 --------------------------
> =A0arch/m68k/kernel/traps_no.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| =A0=
361 --------
> =A0arch/m68k/kernel/vectors.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =A0=
145 +++
> =A0arch/m68k/lib/memcpy.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 | =A0 =A09 +
> =A0arch/m68k/mm/init_no.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 | =A0 21 +-
> =A0arch/m68k/platform/520x/config.c =A0 =A0 =A0 =A0 =A0 =A0 | =A0 =A0=
6 +-
> =A0arch/m68k/platform/520x/gpio.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =A0 5=
0 +-
> =A0arch/m68k/platform/68328/Makefile =A0 =A0 =A0 =A0 =A0 =A0| =A0 =A0=
5 +-
> =A0arch/m68k/platform/68328/entry.S =A0 =A0 =A0 =A0 =A0 =A0 | =A0 18 =
+-
> =A0arch/m68k/platform/68360/Makefile =A0 =A0 =A0 =A0 =A0 =A0| =A0 =A0=
6 +-
> =A0arch/m68k/platform/68360/entry.S =A0 =A0 =A0 =A0 =A0 =A0 | =A0 =A0=
4 +-
> =A0arch/m68k/platform/coldfire/entry.S =A0 =A0 =A0 =A0 =A0| =A0 =A06 =
+-
> =A035 files changed, 2596 insertions(+), 3208 deletions(-)
> =A0create mode 100644 arch/m68k/Kconfig.bus
> =A0create mode 100644 arch/m68k/Kconfig.cpu
> =A0create mode 100644 arch/m68k/Kconfig.devices
> =A0rename arch/m68k/{Kconfig.nommu =3D> Kconfig.machine} (58%)
> =A0delete mode 100644 arch/m68k/Kconfig.mmu
> =A0delete mode 100644 arch/m68k/Makefile_mm
> =A0delete mode 100644 arch/m68k/Makefile_no
> =A0delete mode 100644 arch/m68k/include/asm/entry_mm.h
> =A0delete mode 100644 arch/m68k/include/asm/entry_no.h
> =A0delete mode 100644 arch/m68k/kernel/Makefile_mm
> =A0delete mode 100644 arch/m68k/kernel/Makefile_no
> =A0delete mode 100644 arch/m68k/kernel/traps_mm.c
> =A0delete mode 100644 arch/m68k/kernel/traps_no.c
> =A0create mode 100644 arch/m68k/kernel/vectors.c
>
