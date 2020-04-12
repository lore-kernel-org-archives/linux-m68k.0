Return-Path: <SRS0=j0Rh=54=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B3D1C2D0EC
	for <linux-m68k@archiver.kernel.org>; Sun, 12 Apr 2020 05:29:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E369D2051A
	for <linux-m68k@archiver.kernel.org>; Sun, 12 Apr 2020 05:29:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725815AbgDLF30 (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Sun, 12 Apr 2020 01:29:26 -0400
Received: from kvm5.telegraphics.com.au ([98.124.60.144]:35380 "EHLO
        kvm5.telegraphics.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725878AbgDLF30 (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Sun, 12 Apr 2020 01:29:26 -0400
Received: from localhost (localhost.localdomain [127.0.0.1])
        by kvm5.telegraphics.com.au (Postfix) with ESMTP id 244FF28D2C;
        Sun, 12 Apr 2020 01:29:22 -0400 (EDT)
Date:   Sun, 12 Apr 2020 15:29:19 +1000 (AEST)
From:   Finn Thain <fthain@telegraphics.com.au>
To:     Rob Landley <rob@landley.net>
cc:     linux-m68k@vger.kernel.org, Laurent Vivier <Laurent@Vivier.EU>
Subject: Re: Running m68k on qemu with external initramfs?
In-Reply-To: <0e69cfc4-3bcd-25c3-0d32-665ef50f815c@landley.net>
Message-ID: <alpine.LNX.2.22.394.2004121508200.50@nippy.intranet>
References: <b1e930f3-7775-6955-860e-a2886627caa8@landley.net> <alpine.LNX.2.22.394.2004111608380.43@nippy.intranet> <0e69cfc4-3bcd-25c3-0d32-665ef50f815c@landley.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-m68k-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Sat, 11 Apr 2020, Rob Landley wrote:

> On 4/11/20 1:12 AM, Finn Thain wrote:
> > On Fri, 10 Apr 2020, Rob Landley wrote:
> > 
> >> I'm adding m68k support to toybox's "make root" target and I have a 
> >> kernel and a rootfs.cpio.gz, but qemu's -initrd option doesn't put the 
> >> rootfs image somewhere the m68k kernel can find it.
> >>
> >> Is this a "modify qemu" problem or a "modify kernel" problem?
> > 
> > It sounds more like a "modify kernel .config" problem. But it could be a 
> > regression; what versions of qemu and kernel did you try?
> 
> "Works for me", got it. I'll keep digging.
> 

If you want to try a kernel binary that works for me, so as to narrow down 
the problem, you can get one from here:
https://sourceforge.net/projects/linux-mac68k/files/

> QEMU is the one Laurent Vivier maintains that's been out of tree for 
> something like 12 years now, the default branch claims to be "q800-dev" 
> and the last commit was in december.

Should be fine. For the last few months I've used mainline QEMU instead.

> It still runs my old aboriginal linux system image from 2014 (boots to a 
> shell prompt).
> 
> Kernel is vanilla v5.6 with the arch configured with:
> 
> QEMU="m68k -M q800" KARCH=m68k KARGS=ttyS0 VMLINUX=vmlinux
> KCONF=MMU,M68040,M68KFPU_EMU,MAC,SCSI_MAC_ESP,MACINTOSH_DRIVERS,ADB,ADB_MACII,NET_CORE,MACSONIC,SERIAL_PMACZILOG,SERIAL_PMACZILOG_TTYS,SERIAL_PMACZILOG_CONSOLE
> 
> Which is top of:
> 
> BASE=EARLY_PRINTK,BINFMT_ELF,BINFMT_SCRIPT,NO_HZ,HIGH_RES_TIMERS,BLK_DEV,BLK_DEV_INITRD,RD_GZIP,BLK_DEV_LOOP,EXT4_FS,EXT4_USE_FOR_EXT2,VFAT_FS,FAT_DEFAULT_UTF8,MISC_FILESYSTEMS,SQUASHFS,SQUASHFS_XATTR,SQUASHFS_ZLIB,DEVTMPFS,DEVTMPFS_MOUNT,TMPFS,TMPFS_POSIX_ACL,NET,PACKET,UNIX,INET,IPV6,NETDEVICES,NET_CORE,NETCONSOLE,ETHERNET
> 
> As interpreted by:
> 
>   sed -E '/^$/d;s/([^,]*)($|,)/CONFIG_\1=y\n/g' <<< "$BASE,$KCONF > mini.conf
>   make ARCH=$KARCH allnoconfig KCONFIG_ALLCONFIG=mini.conf
>   make ARCH=$KARCH CROSS_COMPILE="$CROSS_COMPILE" -j $(nproc)
> 
> Plus of course:
> 
>   echo "qemu-system-$QEMU" '"$@"' -nographic -no-reboot -m 256 \
>        "-kernel $(basename "$VMLINUX") -initrd root.cpio.gz" \
>        "-append \"quiet panic=1 HOST=$TARGET console=$KARGS \$KARGS\"" \
>        ${DTB:+-dtb "$(basename "$DTB")"} > "$OUTPUT/qemu-$TARGET.sh"
> 

That works for me, with a few tweaks:

qemu-system-m68k -M q800 -serial none -serial mon:stdio -nographic 
-no-reboot -m 256 -kernel vmlinux-4.14.167-mac-backport+ 
-initrd sysroot.cpio.gz -append console=ttyS0

> I.E. the usual. 

This is my usual invocation:

qemu-system-m68k -M q800 -m 992M
-serial none -serial mon:stdio -g 800x600x4
-drive file=guest-root,format=raw
-drive file=guest-swap,format=raw
-append "fbcon=font:ProFont6x11 console=tty0 console=ttyS0 root=/dev/sda rw ignore_loglevel"
-kernel vmlinux
-net nic,model=dp83932,addr=00:00:00:01:02:03 -net bridge
-rtc base=localtime

> (I'm trying to add m68k support to 
> https://github.com/landley/toybox/blob/master/scripts/mkroot.sh which 
> already boots armv5l, armv7l, aarch64, i486, i686, x86_64, mips, mipsel, 
> powerpc, s390x, and sh4 to a shell prompt under qemu, although you still 
> have to KARGS=rdinit=/bin/sh because I haven't QUITE got my new shell 
> making it through the end of the init script. Should do in another 
> couple days.)
> 

Nice!

> Rob
> 
