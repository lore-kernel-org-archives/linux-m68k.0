Return-Path: <SRS0=j0Rh=54=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F0E3C2BA2B
	for <linux-m68k@archiver.kernel.org>; Sun, 12 Apr 2020 13:02:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id DCA9320705
	for <linux-m68k@archiver.kernel.org>; Sun, 12 Apr 2020 13:02:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726689AbgDLNCn (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Sun, 12 Apr 2020 09:02:43 -0400
Received: from outpost1.zedat.fu-berlin.de ([130.133.4.66]:48789 "EHLO
        outpost1.zedat.fu-berlin.de" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726043AbgDLNCm (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>);
        Sun, 12 Apr 2020 09:02:42 -0400
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.93)
          with esmtps (TLS1.2)
          tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1jNcFz-0011nQ-Ut; Sun, 12 Apr 2020 15:02:39 +0200
Received: from x590c26c5.dyn.telefonica.de ([89.12.38.197] helo=[192.168.1.6])
          by inpost2.zedat.fu-berlin.de (Exim 4.93)
          with esmtpsa (TLS1.2)
          tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1jNcFz-0023Mo-Nv; Sun, 12 Apr 2020 15:02:39 +0200
Subject: Re: Running m68k on qemu with external initramfs?
To:     Rob Landley <rob@landley.net>, linux-m68k@vger.kernel.org,
        Laurent Vivier <Laurent@Vivier.EU>
References: <b1e930f3-7775-6955-860e-a2886627caa8@landley.net>
 <c4a784d9-2fef-ee90-9ff3-b1d8487e8a8b@physik.fu-berlin.de>
 <238ea76c-fa8e-0134-667b-3864938d9a78@landley.net>
From:   John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Autocrypt: addr=glaubitz@physik.fu-berlin.de; keydata=
 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
 scOkTAZQGVpD/8AaLH4v1w==
Message-ID: <32e46b0f-9071-b48e-92f1-f3aa34a17dd8@physik.fu-berlin.de>
Date:   Sun, 12 Apr 2020 15:02:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <238ea76c-fa8e-0134-667b-3864938d9a78@landley.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Original-Sender: glaubitz@physik.fu-berlin.de
X-Originating-IP: 89.12.38.197
Sender: linux-m68k-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On 4/12/20 2:48 PM, Rob Landley wrote:
> Install debian to a block device to see why initramfs isn't working?

d-i uses a ramdisk so I assume that should be similar to what you are
using.

> I already downloaded and ran
> http://landley.net/aboriginal/downloads/binaries/system-image-m68k.tar.gz to
> make sure laurent's tip of tree qemu-m68k is working, and that booted to a shell
> prompt fine, but that's using a static initramfs instead of an external once,
> which is why I thought that was the issue. (It used to be back when I first made
> that work, which was something like 2014.)

Not sure I understand what your particular configuration is but I have never
run into issues with an initramfs and the root filesystem in RAM on m68k,
native or with qemu.

> I also ran my toybox binary under qemu-m68k to smoketest that the compiler was
> making binaries that ran, but it turns out that I had two problems:
> 
> 1) I'd run "make defconfig in the wrong directory and toybox switched the shell
> back off (because it's still in "pending" until I finish it), hence the not
> finding init. I stuck enough printk(KERN_ERR) into init/initramfs.c to list all
> the filenames it was extracting and figured that one out.
> 
> 2) THEN the problem was that gcc is doing something in cd_main so that the
> "chdir ." at the start of the shell setup (to set $PWD and friends) is
> segfaulting, but it's a segfault that went away when I got near it with printf()
> calls, and even write(1, "", 0); right before it made it go away. Given that
> this code has run on 32 and 64 bit, big and little endian, glibc musl and
> bionic, and on a target that's both nommu and cares about alignment?
> 
> Someday I might build gdb for m68k, but until then I should check it next time I
> upgrade compiler versions. (Or go through disabling every optimization one by
> one until I find the one that's making the registers go nuts the way sh4 had
> that https://landley.net/notes-2020.html#29-01-2020 thing.)
> 
> Rob
> 
> P.S: For context, I built a musl-cross-make toolchain and symlinked it into
> toybox, and then used "make root CROSS=m68k LINUX=~/linux" to build a system:
> 
> git clone https://github.com/landley/musl-cross-make
> git clone https://github.com/landley/toybox
> cd musl-cross-make
> sed -Ei 's/(BINUTILS_VER =).*/\1 2.32/;s/(LINUX_VER =).*/\1 4.19.90/' Makefile
> ../toybox/scripts/mcm-buildall.sh i686:: m68k::
> cd ../toybox
> ln -s ccc ../musl-cross-make/ccc
> make root CROSS=i686 LINUX=~/linux
> make root CROSS=m68k LINUX=~/linux
> 
> If you (cd root/i686; ./qemu-*.sh) it boots to a shell prompt.... well, if you
> KARGS=rdinit=/bin/sh it does, running the init script still says:
> 
> ln: cannot create symbolic link from '/proc/self/fdi/,*/}' to 'dev/i/*,/}': No y
> ln: cannot create symbolic link from '/proc/self/fdi/,*/}' to 'dev/i/*,/}': No y
> ln: cannot create symbolic link from '/proc/self/fdi/,*/}' to 'dev/i/*,/}': No y
> ln: cannot create symbolic link from '/proc/self/fdi/,*/}' to 'dev/i/*,/}': No y
> sh: exec /etc/rc/*: No such file or directory
> Type exit when done.
> oneit: /dev/CONSOLE:-console}: No such file or directory
> 
> Because I'm still halfway through teaching toysh about all the ${} constructs.
> (Also, remind me to stick echo -e '\e[?7h' at the start of my init script to
> undo the STUPID wordwrap disable escape that qemu's bios outputs, which screws
> up bash's command line history too!)
> 
> Anyway, at least it's known behavior. But in root/m68k I'm getting:
> 
> Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b
> CPU: 0 PID: 1 Comm: init Not tainted 5.6.0 #1
> Stack from 0f81bdfc:

So, do I understand correctly that this is buildroot with musl?

Adrian

-- 
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer - glaubitz@debian.org
`. `'   Freie Universitaet Berlin - glaubitz@physik.fu-berlin.de
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
