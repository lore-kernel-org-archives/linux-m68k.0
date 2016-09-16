From: Matthias Reis <matthias.reis@hu-berlin.de>
Subject: Re: Crash in entry.S:resume on Atari ST
Date: Fri, 16 Sep 2016 15:53:08 +0200
Message-ID: <20160916135307.GA6030@hu-berlin.de>
References: <8132f924080d98f2bbe149d35352507d@hu-berlin.de>
 <7d38f54e-4b7a-af7b-3cc8-15be7369f0e4@linux-m68k.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-m68k-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <7d38f54e-4b7a-af7b-3cc8-15be7369f0e4@linux-m68k.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Greg Ungerer <gerg@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org

Hi Greg,

On Fri, Sep 16, 2016 at 04:39:06PM +1000, Greg Ungerer wrote:
> What procedure did you follow to build your apps?

In short, I used the -m68000 gcc switch and set the following options:

uClibc .config:
TARGET_ARCH="m68k"
# UCLIBC_FORMAT_FLAT is not set
UCLIBC_FORMAT_FLAT_SEP_DATA=y
# UCLIBC_FORMAT_SHARED_FLAT is not set

busybox .config:
CONFIG_STATIC=y
# CONFIG_PIE is not set
CONFIG_NOMMU=y


The full details can be found under:
https://ford.biologie.hu-berlin.de/matze/linux-m68k-atarinommu/uploads/22f7c78b30c92605adcc8dc40af3220e/build-binutils-gcc-uClibc-busybox.tar.bz2

In the tarball, you can there is a script that should include all steps,
including the ./configure options, as well as all .config's.

> Are you using flat format binaries?

$ ./flthdr ../busybox/busybox_unstripped
../busybox/busybox_unstripped
     Magic:        bFLT
     Rev:          4
     Build Date:   Mon Sep  5 16:26:38 2016
     Entry:        0x44
     Data Start:   0x20eb4
     Data End:     0x25238
     BSS End:      0x27ae0
     Stack Size:   0x3e80
     Reloc Start:  0x25238
     Reloc Count:  0x73
     Flags:        0x2 ( Has-PIC-GOT )

> So is this crashing at the step of trying to load and run the
> first user app?

It happens after run_init_process() is called.

Thanks!

Matthias
