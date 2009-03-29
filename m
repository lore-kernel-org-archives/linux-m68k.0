From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: debian kernel m68k patches for 2.6.29
Date: Sun, 29 Mar 2009 15:07:57 +0200
Message-ID: <10f740e80903290607y743bada9w829754722e9f7d9f__11042.430290445$1238332217$gmane$org@mail.gmail.com>
References: <20090326123822.GD8081@marenka.net>
	 <10f740e80903260610k29f73c4ci76594f46881e17a5@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <10f740e80903260610k29f73c4ci76594f46881e17a5@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Stephen R Marenka <stephen@marenka.net>, debian-68k@lists.debian.org
Cc: linux-m68k@lists.linux-m68k.org

On Thu, Mar 26, 2009 at 15:10, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Thu, Mar 26, 2009 at 13:38, Stephen R Marenka <stephen@marenka.net> wrote:
>> So 2.6.29 has hit sid. Anyone want to update the kernel patches? Also,
>> what patches to apply now that we have git-based goodness?
>
> You can start with the ones on the for-next branch.
> I still have to cherry-pick the others to the (to be created) queue branch.
> I'll let you know when I'm finished.

Now my git skills have been growing, I created two new branches:
  - m68k-v2.6.29
  - queue

Currently they're identical, but queue will soon be updated (rebased),
to track Linus' latest.

The idea is that:
  - master is never rebased, as it's a continuous development branch,
  - queue contains everything sufficiently stable, against Linus' latest.
    I.e. it contains cherry-picked and rebased commits from master.
  - m68k-vX.y.Z contains the stable stuff you want to see in e.g. Debian,
    against a vX.Y.Z tag (I don't track stable vX.Y.Z.T)

m68k-v2.6.29 contains commits from the following topic branches:
  - for-2.6.30
        Already taken by Linus, incl. mac-swim
  - atari-aranym
  - atari-ethernat
  - atari-ethernec
  - atari-scc
  - atari-fat
        Should this be dropped? Last time nobody spoke up to care about it
  - device-model
        Only "Add Amiga Zorro bus modalias and uevent support",
        I'm working on converting Amiga drivers to the platform device framework
  - misc
        "m68k: Fix debug=mem on Amiga"
        "m68k-allow-all-kernel-traps-to-be-handled-via-exception-fixups-all.diff"
        "m68k: Add support for EARLY_PRINTK on MVME16x" and
        "Update for m68k: Add support for EARLY_PRINTK on MVME16x"
And a few things from master, the continuous development branch:
  - atari mouse/keyboard fixes (are they complete? IIRC not yet)
  - adb raw (anyone who cares?)
  - defconfigs updates (may still need some work, comments are welcome!)

If you want to create a patch series from m68k-v2.6.29 against v2.6.29:

    git format-patch v2.6.29..m68k-v2.6.29


git shortlog v2.6.29.. says:
Andreas Schwab (1):
      m68k-allow-all-kernel-traps-to-be-handled-via-exception-fixups-all.diff

Geert Uytterhoeven (22):
      MAINTAINERS: Replace dead link to m68k CVS repository by link to new git r
      m68k: irq_node.handler() should return irqreturn_t
      m68k: Export ARAnyM native feature API
      m68k/ARAnyM: early_param() does not exist in the modular case
      m68k: Wrap nfblock natfeat calls
      m68k: Atari EtherNAT warning fixes
      m68k: Atari SCC serial driver needs atari_SCC_init_done
      m68k: Atari SCC serial driver needs CONFIG_ATARI_SCC
      m68k: Atari SCC serial driver checkpatch cleanups
      m68k: Atari SCC serial driver gs update
      m68k: Atari SCC serial driver break_ctl update
      m68k: Disable Atari serial console support if modular
      m68k: Atari SCC support for ST
      m68k: atari_scc - kill warn_unused_result warnings
      m68k: atari_scc - kill fake config variables
      Revert "msdos fs: remove unsettable atari option"
      Add Amiga Zorro bus modalias support
      m68k: Fix debug=mem on Amiga
      Update for m68k: Add support for EARLY_PRINTK on MVME16x
      m68k: atari_scc - Upstream updates
      m68k: atari - Rename "mfp" to "st_mfp"
      m68k: Update defconfigs for 2.6.29

Kars de Jong (1):
      m68k: Add support for EARLY_PRINTK on MVME16x

Laurent Vivier (3):
      m68k: Add install target
      m68k: mac - Add a new entry in mac_model to identify the floppy controller
      m68k: mac - Add SWIM floppy support

Linux/m68k legacy (2):
      Atari FAT updates
      ADB raw packets

Michael Schmitz (13):
      m68k: section mismatch fixes: DMAsound for Atari
      m68k: section mismatch fixes: Atari SCSI
      m68k: Atari ARAnyM support
      m68k: Atari EtherNAT (SMC91C111) driver
      m68k: Atari EtherNAT updates
      m68k: section mismatch fixes: EtherNAT
      m68k: Atari ROM port ISA adapter support
      m68k: Atari io.h fixes for EtherNAT driver
      m68k: Atari EtherNEC driver
      atari-ethernec-fixes.diff
      m68k: Atari SCC serial driver
      atari: Use the correct mouse interrupt hook
      m68k: Fix atarimouse init

Roman Zippel (1):
      m68k: Add support for ARAnyM block and console access


If you (talking to `owners' of the stuff on the big topic branches now ;-) think
something is finished and ready for upstream, I can squash the commits together
using `git rebase -i' and submit them upstream...


Other stuff (a.o. garbage? :-) still on master:
  - Amiga/Atari/Mac platform device beginnings
  - Make SERIAL_PORT_DFNS depend on CONFIG_ISA
  - Amiga GVP I/O Extender PLIP
  - MC68681 DUART register definitions for the Amiga MultiFace III serial
  - scsi: Clean up mvme147.c
  - CONFIG_SWAP=n: include/linux/swap.h needs <linux/pagemap.h>
  - module: Kill warning: label 'free_init' defined but not used
  - drivers/net/dnet.c needs <linux/io.h>

Enjoy!

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
