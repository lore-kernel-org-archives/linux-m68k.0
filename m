Return-Path: <SRS0=j0Rh=54=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C31A2C2BA2B
	for <linux-m68k@archiver.kernel.org>; Sun, 12 Apr 2020 08:27:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 947D1206E9
	for <linux-m68k@archiver.kernel.org>; Sun, 12 Apr 2020 08:27:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725873AbgDLI1d convert rfc822-to-8bit (ORCPT
        <rfc822;linux-m68k@archiver.kernel.org>);
        Sun, 12 Apr 2020 04:27:33 -0400
Received: from outpost1.zedat.fu-berlin.de ([130.133.4.66]:36103 "EHLO
        outpost1.zedat.fu-berlin.de" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725832AbgDLI1d (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>);
        Sun, 12 Apr 2020 04:27:33 -0400
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.93)
          with esmtps (TLS1.2)
          tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1jNXxi-000Awy-Ky; Sun, 12 Apr 2020 10:27:30 +0200
Received: from tmo-087-66.customers.d1-online.com ([80.187.87.66] helo=[10.72.55.194])
          by inpost2.zedat.fu-berlin.de (Exim 4.93)
          with esmtpsa (TLS1.2)
          tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1jNXxi-001IpD-Dl; Sun, 12 Apr 2020 10:27:30 +0200
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT
From:   John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Mime-Version: 1.0 (1.0)
Subject: Re: Running m68k on qemu with external initramfs?
Date:   Sun, 12 Apr 2020 10:27:28 +0200
Message-Id: <08DCD73D-7BC1-4F38-87DE-ED4DBD5978DA@physik.fu-berlin.de>
References: <0e69cfc4-3bcd-25c3-0d32-665ef50f815c@landley.net>
Cc:     Finn Thain <fthain@telegraphics.com.au>,
        linux-m68k@vger.kernel.org, Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <0e69cfc4-3bcd-25c3-0d32-665ef50f815c@landley.net>
To:     Rob Landley <rob@landley.net>
X-Mailer: iPhone Mail (17E255)
X-Original-Sender: glaubitz@physik.fu-berlin.de
X-Originating-IP: 80.187.87.66
Sender: linux-m68k-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi!

> On Apr 12, 2020, at 5:31 AM, Rob Landley <rob@landley.net> wrote:
> 
> ﻿On 4/11/20 1:12 AM, Finn Thain wrote:
>>> On Fri, 10 Apr 2020, Rob Landley wrote:
>>> 
>>> I'm adding m68k support to toybox's "make root" target and I have a 
>>> kernel and a rootfs.cpio.gz, but qemu's -initrd option doesn't put the 
>>> rootfs image somewhere the m68k kernel can find it.
>>> 
>>> Is this a "modify qemu" problem or a "modify kernel" problem?
>> 
>> It sounds more like a "modify kernel .config" problem. But it could be a 
>> regression; what versions of qemu and kernel did you try?
> 
> "Works for me", got it. I'll keep digging.
> 
> QEMU is the one Laurent Vivier maintains that's been out of tree for something
> like 12 years now, the default branch claims to be "q800-dev" and the last
> commit was in december. It still runs my old aboriginal linux system image from
> 2014 (boots to a shell prompt).

I think most of these things should be merged upstream these days but Laurent probably needs to correct me on what’s missing.

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
>  sed -E '/^$/d;s/([^,]*)($|,)/CONFIG_\1=y\n/g' <<< "$BASE,$KCONF > mini.conf
>  make ARCH=$KARCH allnoconfig KCONFIG_ALLCONFIG=mini.conf
>  make ARCH=$KARCH CROSS_COMPILE="$CROSS_COMPILE" -j $(nproc)
> 
> Plus of course:
> 
>  echo "qemu-system-$QEMU" '"$@"' -nographic -no-reboot -m 256 \
>       "-kernel $(basename "$VMLINUX") -initrd root.cpio.gz" \
>       "-append \"quiet panic=1 HOST=$TARGET console=$KARGS \$KARGS\"" \
>       ${DTB:+-dtb "$(basename "$DTB")"} > "$OUTPUT/qemu-$TARGET.sh"
> 
> I.E. the usual. (I'm trying to add m68k support to
> https://github.com/landley/toybox/blob/master/scripts/mkroot.sh which already
> boots armv5l, armv7l, aarch64, i486, i686, x86_64, mips, mipsel, powerpc, s390x,
> and sh4 to a shell prompt under qemu, although you still have to
> KARGS=rdinit=/bin/sh because I haven't QUITE got my new shell making it through
> the end of the init script. Should do in another couple days.)

Very cool. Thanks a lot for doing this!

Adrian
