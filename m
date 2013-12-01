From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH v3 0/2] kexec support for Linux/m68k (kernel part)
Date: Sun,  1 Dec 2013 12:30:33 +0100
Message-ID: <1385897435-18618-1-git-send-email-geert__44606.1179893606$1385897486$gmane$org@linux-m68k.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@lists.linux-m68k.org
Cc: kexec@lists.infradead.org, linux-kernel@vger.kernel.org

This is a set of patches to add kexec support for m68k to the Linux kernel.

  - Kexec only, no kdump support yet (do you have enough RAM to keep a
    crashdump kernel in memory at all times? ;-)

  - Tested on ARAnyM, with emulated 68040 (Atari has identical virt/phys RAM
    mapping),
  - Tested on Amiga 4000/040, with real 68040 (Amiga has non-identical
    virt/phys RAM mapping).

  - Test results on machines with different CPUs would be welcome!

    You can download a kexec binary from
    http://users.telenet.be/geertu/Download/kexec-m68k-2013-10-15.tar.bz2

  - To have automatic "kexec -e" on reboot, copy /etc/rc6.d/S85kexec from
    another system, and fix it up for kexec living in /usr/local/sbin instead
    of /sbin.

  - Sample invocation:

        kexec -d -l vmlinux --reuse-cmdline
        reboot

Patches:
  - [PATCH 1/2] m68k: Add kexec support
      - v2:
          - KEXEC depends on M68KCLASSIC,
          - Fix handling of virtual and physical addresses, for machines where
            memory doesn't start at zero,
          - Support for other CPUs than 68040.
      - v3:
	  - Clear '040/'060 transparent translation registers on MMU disable

  - [PATCH 2/2] m68k: Add support to export bootinfo in procfs
       - v2:
          - No changes
       - v3:
	  - Rebased on top of current m68k tree

  - "m68k: Add System RAM to /proc/iomem" was dropped in v2.
  - "kexec: Add debug printing of kimage table entries" was dropped in v3.

Have fun!
