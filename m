Return-Path: <SRS0=j0Rh=54=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 815E2C2D0EC
	for <linux-m68k@archiver.kernel.org>; Sun, 12 Apr 2020 03:31:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4429620739
	for <linux-m68k@archiver.kernel.org>; Sun, 12 Apr 2020 03:31:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=landley-net.20150623.gappssmtp.com header.i=@landley-net.20150623.gappssmtp.com header.b="zlrya/p+"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726689AbgDLDbB (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Sat, 11 Apr 2020 23:31:01 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:41416 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726565AbgDLDbB (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Sat, 11 Apr 2020 23:31:01 -0400
Received: by mail-ot1-f65.google.com with SMTP id f52so5852055otf.8
        for <linux-m68k@vger.kernel.org>; Sat, 11 Apr 2020 20:31:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=landley-net.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=He4QKdvXsWLamPjOPXt0a0W67Ip4i0qTohz/9LTrXi0=;
        b=zlrya/p+nerQ/QBgnkql7xQ0OcJIiQfoB9B+EA3wPbfO+Lne5EcvUQZkXgUxCZRNe0
         jzfG58+8vnZnD/m+k1tawAAK9YEffuKMCZXf3BcExpcPhmVvzyAMfOD/8sHHKLHUh8+q
         idgokE9QOyoCroeuQ3ju2cg1eOjUeTf8o3Gl5XhMS9xHSeWD8R3JB7y1BzJHCfIfbjt0
         8+7nxpmeHyPV3rKdNlsP5kQuJfxgBAhAdQR5SX10kj5WGTipd7l0+9LRSA2NAwMTEWZI
         zinook9zfK1tcEyl7QwsSIAA1ulaowP9W3YDzAnrrawMDcs3DD0d4QgXltCkPzIb+4ad
         mU+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=He4QKdvXsWLamPjOPXt0a0W67Ip4i0qTohz/9LTrXi0=;
        b=P5MPc7Z+1lWsR7bkT15Mj3a3tHA8q41gjPvR/QWi7TNuDoCXMmlolwxNqqLT2+k704
         kVZt94hBMNY6PQyIhmyRnhDCKNWYYtE7CFytvVSglMLAhWBdvAXtR+iMXCAjZBZD6w6u
         KwTeiisBLV3IaSRv97eV3h3Kr68ESC0wVF4wJh7vPHHsnWKSUiMYNCJ4wMJgFy1K3WYH
         0WWHECpp3uipTb70jPcFvcEdrf7mVxXm+ToFrnxCo8HcQ8CqUbqcrflehWrE5aW2t+4l
         ebK9YHG97AhMBZY5m3uwkKdoip3T1rQUy9c75IlVrPdbVKdMl8IzVVnDS+Zf5BEbGjfF
         U9Wg==
X-Gm-Message-State: AGi0PubHitB29aKuMc6YIRN0lg8on0dvxxnYxvcVMlMvTyogrSOHsx1g
        SuOw3/OeaR4IOdbr8DUC0sVpLF67D30=
X-Google-Smtp-Source: APiQypIEVGSkpFO5b5qZTttcdR9VrBMpQ67C0WlePuQaV8Sjjf40SE/xx0ILwBSVhxbiMbPPkDzmFg==
X-Received: by 2002:a05:6830:1104:: with SMTP id w4mr10348838otq.54.1586662260788;
        Sat, 11 Apr 2020 20:31:00 -0700 (PDT)
Received: from [192.168.86.21] ([136.62.4.88])
        by smtp.googlemail.com with ESMTPSA id l20sm3803860oih.40.2020.04.11.20.30.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 11 Apr 2020 20:31:00 -0700 (PDT)
Subject: Re: Running m68k on qemu with external initramfs?
To:     Finn Thain <fthain@telegraphics.com.au>
Cc:     linux-m68k@vger.kernel.org, Laurent Vivier <Laurent@Vivier.EU>
References: <b1e930f3-7775-6955-860e-a2886627caa8@landley.net>
 <alpine.LNX.2.22.394.2004111608380.43@nippy.intranet>
From:   Rob Landley <rob@landley.net>
Message-ID: <0e69cfc4-3bcd-25c3-0d32-665ef50f815c@landley.net>
Date:   Sat, 11 Apr 2020 22:36:54 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <alpine.LNX.2.22.394.2004111608380.43@nippy.intranet>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-m68k-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On 4/11/20 1:12 AM, Finn Thain wrote:
> On Fri, 10 Apr 2020, Rob Landley wrote:
> 
>> I'm adding m68k support to toybox's "make root" target and I have a 
>> kernel and a rootfs.cpio.gz, but qemu's -initrd option doesn't put the 
>> rootfs image somewhere the m68k kernel can find it.
>>
>> Is this a "modify qemu" problem or a "modify kernel" problem?
> 
> It sounds more like a "modify kernel .config" problem. But it could be a 
> regression; what versions of qemu and kernel did you try?

"Works for me", got it. I'll keep digging.

QEMU is the one Laurent Vivier maintains that's been out of tree for something
like 12 years now, the default branch claims to be "q800-dev" and the last
commit was in december. It still runs my old aboriginal linux system image from
2014 (boots to a shell prompt).

Kernel is vanilla v5.6 with the arch configured with:

QEMU="m68k -M q800" KARCH=m68k KARGS=ttyS0 VMLINUX=vmlinux
KCONF=MMU,M68040,M68KFPU_EMU,MAC,SCSI_MAC_ESP,MACINTOSH_DRIVERS,ADB,ADB_MACII,NET_CORE,MACSONIC,SERIAL_PMACZILOG,SERIAL_PMACZILOG_TTYS,SERIAL_PMACZILOG_CONSOLE

Which is top of:

BASE=EARLY_PRINTK,BINFMT_ELF,BINFMT_SCRIPT,NO_HZ,HIGH_RES_TIMERS,BLK_DEV,BLK_DEV_INITRD,RD_GZIP,BLK_DEV_LOOP,EXT4_FS,EXT4_USE_FOR_EXT2,VFAT_FS,FAT_DEFAULT_UTF8,MISC_FILESYSTEMS,SQUASHFS,SQUASHFS_XATTR,SQUASHFS_ZLIB,DEVTMPFS,DEVTMPFS_MOUNT,TMPFS,TMPFS_POSIX_ACL,NET,PACKET,UNIX,INET,IPV6,NETDEVICES,NET_CORE,NETCONSOLE,ETHERNET

As interpreted by:

  sed -E '/^$/d;s/([^,]*)($|,)/CONFIG_\1=y\n/g' <<< "$BASE,$KCONF > mini.conf
  make ARCH=$KARCH allnoconfig KCONFIG_ALLCONFIG=mini.conf
  make ARCH=$KARCH CROSS_COMPILE="$CROSS_COMPILE" -j $(nproc)

Plus of course:

  echo "qemu-system-$QEMU" '"$@"' -nographic -no-reboot -m 256 \
       "-kernel $(basename "$VMLINUX") -initrd root.cpio.gz" \
       "-append \"quiet panic=1 HOST=$TARGET console=$KARGS \$KARGS\"" \
       ${DTB:+-dtb "$(basename "$DTB")"} > "$OUTPUT/qemu-$TARGET.sh"

I.E. the usual. (I'm trying to add m68k support to
https://github.com/landley/toybox/blob/master/scripts/mkroot.sh which already
boots armv5l, armv7l, aarch64, i486, i686, x86_64, mips, mipsel, powerpc, s390x,
and sh4 to a shell prompt under qemu, although you still have to
KARGS=rdinit=/bin/sh because I haven't QUITE got my new shell making it through
the end of the init script. Should do in another couple days.)

Rob
