From: "Christian T. Steigies" <cts@debian.org>
Subject: Re: [PATCH 00/11] Atari Ethernet/USB patch series - for upstream
 and debian-kernel
Date: Fri, 29 Mar 2013 00:10:39 +0100
Message-ID: <20130328231039.GA14587@chumley.earth.sol>
References: <1364193464-3890-1-git-send-email-schmitz@debian.org>
 <Pine.BSM.4.64L.1303251751380.27649@herc.mirbsd.org>
 <51515889.6040106@uter.be>
 <5152996E.50800@gmail.com>
 <20130328211747.GA10917@chumley.earth.sol>
 <5154C5E0.3040608@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-in-06.arcor-online.net ([151.189.21.46]:33988 "EHLO
	mail-in-06.arcor-online.net" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1753965Ab3C1XKq (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>);
	Thu, 28 Mar 2013 19:10:46 -0400
Content-Disposition: inline
In-Reply-To: <5154C5E0.3040608@gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitzmic@gmail.com>
Cc: Wouter Verhelst <w@uter.be>, Thorsten Glaser <tg@mirbsd.de>, geert@linux-m68k.org, linux-m68k@vger.kernel.org, Ingo J?rgensmann <ij@2012.bluespice.org>

On Fri, Mar 29, 2013 at 11:36:16AM +1300, Michael Schmitz wrote:
> Christian,
> >>If that's possible - does anyone have a kernel cross-compile machine
> >>set up for that purpose?IJ?
> >I have the cross-compilers from Thorsten installed and could just build a
> >kernel for amiga from Geert's m68k repo.  I trimmed down the config a bit
> 
> Let's wait until Geert has applied my patches to m68k-queue.

I still need to figure out again how kernel building works nowadays, so I am
not in a big hurry.
 
> >and removed some not needed drivers.  The kernel is now 3698472 bytes big.
> >I still find that huge, but it allowed me to boot without a memfile to
> >reduce the RAM!  Alas, no SCSI support for the B2060...
> 
> Not entirely unexpected.

yup. CONFIG_SCSI_ZORRO7XX is enabled, will this be the new driver?
The blizzard and cyberstorm options are still set in the amiga config, but
the are filtered out, since the drivers are not present anymor I think.

> >The official Debian package fails to cross-compile when building the
> >hid-microsoft module, maybe its time to disable that? Probably this is not
> >set in the m68k config, but in the "main" debian config. I am not sure if I
> >can override that, it may be easier to build kernels (for testing and the
> 
> Why not? Just add another m68k patch that removes this option from
> the defconfig used.

As far as I remember, the config is combined of a generic config, an m68k
config, and an amiga config. Each file set only part of the total config,
probably so that the kernels across all arches support more of less the same
features. Thats a good idea, but I think many drivers are useless for the
buildds, by removing them the kernel can fit into memory again, just barely.
The HID drivers seem to be enabled in the official kernel, which runs on
kullervo, I don't seem to be able to switch off just the microsoft one.
Maybe by modifying the generic config, but I am afraid the magical package
building breaks again, genconfig.py does not run on my testing box, not sure
why. In Geert's tree, memcmp is not used in the driver, thats probably why
this one builds:

@@ -47,9 +46,9 @@
                rdesc[559] = 0x45;
        }
        /* the same as above (s/usage/physical/) */
-       if ((quirks & MS_RDESC_3K) && *rsize == 106 &&
-                       !memcmp((char []){ 0x19, 0x00, 0x29, 0xff },
-                               &rdesc[94], 4)) {
+       if ((quirks & MS_RDESC_3K) && *rsize == 106 && rdesc[94] == 0x19 &&
+                       rdesc[95] == 0x00 && rdesc[96] == 0x29 &&
+                       rdesc[97] == 0xff) {
                rdesc[94] = 0x35;
                rdesc[96] = 0x45;
        }
 
> >buildds) another way. kernel-package?
> 
> No idea really - how are the kernel packages built otherwise?

I tried: 4.5 Building a custom kernel from Debian kernel source:
http://kernel-handbook.alioth.debian.org/ch-common-tasks.html

with linux-source-3.8, which is easier to modify than the linux source
package (it does not run genconfig for one). Cross-compiling is easy:
make ARCH=m68k CROSS_COMPILE=m68k-linux-gnu- deb-pkg

but it creates the same failure due to memcmp. I wonder how the debian
packages have been built, or maybe the cross-compilers are outdated on my
system?

The kernel packages are built with python magic, it seems. kernel-package
does not seem to be used anymore.  You do not look at the kernel for four
and a half years, and BOOM, suddenly everything has changed!

Christian
