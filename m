Return-Path: <SRS0=j0Rh=54=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 838B0C2D0EC
	for <linux-m68k@archiver.kernel.org>; Sun, 12 Apr 2020 21:50:21 +0000 (UTC)
Received: from vger.kernel.org (unknown [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3F58F206E5
	for <linux-m68k@archiver.kernel.org>; Sun, 12 Apr 2020 21:50:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=landley-net.20150623.gappssmtp.com header.i=@landley-net.20150623.gappssmtp.com header.b="vruZVoGC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3F58F206E5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=landley.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-m68k-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727426AbgDLVuU (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Sun, 12 Apr 2020 17:50:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.18]:51656 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727388AbgDLVuU (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Sun, 12 Apr 2020 17:50:20 -0400
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com [IPv6:2607:f8b0:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F166BC0A88B5
        for <linux-m68k@vger.kernel.org>; Sun, 12 Apr 2020 14:50:18 -0700 (PDT)
Received: by mail-ot1-x343.google.com with SMTP id w12so6512615otm.13
        for <linux-m68k@vger.kernel.org>; Sun, 12 Apr 2020 14:50:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=landley-net.20150623.gappssmtp.com; s=20150623;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=l9A6Flx8D3zXbQAVkeFgXL5/aghYEKkuzKxKTUMERJM=;
        b=vruZVoGC95ld0x83qs5NWNCygkWXcaTDg2VDlZ4R8yywNoKnr4frburHYpo9eTGJLH
         IF9NrfwxdH8C/ZcVSTrEfBu3Wu8Nwt9jRfawTxfDM+WppvRQqEXZKrYE98p/rUhYzzuB
         EafbvZY3X7ypLE0KDXRuQpLzGlf5r6QZ+GVaiHPlefsBQQkhy+YpJkEpZHMoSZUvGItt
         IBciSDkjxVy5VzlwBhFFWfzdQr6qxDcRX1jVmumBBa2xKG/kNNcLLjukrkX5eq9F28hv
         22We89umKA371fxnlDDi14LPbC4ibgLESZ5RQq5kAzViY1E0SCKDhOTpn+QqePNDcLhZ
         b9IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=l9A6Flx8D3zXbQAVkeFgXL5/aghYEKkuzKxKTUMERJM=;
        b=INDvW+CkcfRhaIPhTmoPfXER9Yf+nCsH+t9Slhqg0Zb7MF5ceSWEfNo9hmrE/E19G1
         pq8DzC0+HxZsHpUDBZC+wDHpddiS7yTRKG9uScRTKECcB2r8mUEheRGX8ZZ+t4nTnoTU
         6BiakKGgIISoJJs1bqG0+MAKmOW0Y3yILfjzGELGnnAdXE9gy9WmFaBZoIE45jB92S9+
         igZjZkvfsw+mRZMWkBdatftZJZm8FD6TGv0/LlTjn//Yb/cUZPTrsIOKnjSIGDdqfXce
         vaBjI+BbK3KIgfG+qx1PTM7T/0IUjzMZ8SHZwvGcslE3cIhOrASMtDTEyHkyJpRkZP/D
         8zqQ==
X-Gm-Message-State: AGi0PuYlrQ7zttGRcKKvGorG/DJNP6vtRq7Vdv5yL9VhjYDQJlce7tSK
        C2VYySJQhH+1AGlgTBMf94gi3Q==
X-Google-Smtp-Source: APiQypKWOxg/LgTFmCGLr222pAv/7dMLjYFjOtCgCQT6tfJvl2ToWpf0XCswWPWA+yEveq5gj/3a0g==
X-Received: by 2002:a05:6830:1d4:: with SMTP id r20mr3788941ota.11.1586728218248;
        Sun, 12 Apr 2020 14:50:18 -0700 (PDT)
Received: from [192.168.86.21] ([136.62.4.88])
        by smtp.googlemail.com with ESMTPSA id a131sm4336053oii.30.2020.04.12.14.50.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 12 Apr 2020 14:50:17 -0700 (PDT)
Subject: Re: Running m68k on qemu with external initramfs?
To:     John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        linux-m68k@vger.kernel.org, Laurent Vivier <Laurent@Vivier.EU>
References: <b1e930f3-7775-6955-860e-a2886627caa8@landley.net>
 <c4a784d9-2fef-ee90-9ff3-b1d8487e8a8b@physik.fu-berlin.de>
 <238ea76c-fa8e-0134-667b-3864938d9a78@landley.net>
 <32e46b0f-9071-b48e-92f1-f3aa34a17dd8@physik.fu-berlin.de>
From:   Rob Landley <rob@landley.net>
Message-ID: <96b81b61-b468-2182-cfb6-87953d4ccd9a@landley.net>
Date:   Sun, 12 Apr 2020 16:56:12 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <32e46b0f-9071-b48e-92f1-f3aa34a17dd8@physik.fu-berlin.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-m68k-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On 4/12/20 8:02 AM, John Paul Adrian Glaubitz wrote:
> On 4/12/20 2:48 PM, Rob Landley wrote:
>> Install debian to a block device to see why initramfs isn't working?
> 
> d-i uses a ramdisk so I assume that should be similar to what you are
> using.

Ah, I'd missed that part. (I did the debian cross-setup for arm and powerpc a
couple years back, but hadn't tried it for m68k.)

> So, do I understand correctly that this is buildroot with musl?

It's mkroot, not buildroot. My current system builder is a single bash script,
currently 231 lines long:

  https://github.com/landley/toybox/blob/master/scripts/mkroot.sh

Adding m68k support to it was 3 lines, which thunderbird does NOT want to indent
properly:

+elif [ "$TARGET" == m68k ]; then
+QEMU="m68k -M q800" KARCH=m68k KARGS=ttyS0 VMLINUX=vmlinux
+KCONF=MMU,M68040,M68KFPU_EMU,MAC,SCSI_MAC_ESP,MACINTOSH_DRIVERS,ADB,ADB_MACII,NET_CORE,MACSONIC,SERIAL_PMACZILOG,SERIAL_PMACZILOG_TTYS,SERIAL_PMACZILOG_CONSOLE

It uses an externally supplied cross compiler, and I'm currently trying to
support every target musl supports using musl-cross-make. (It also works with
the devuan host toolchain (glibc). I made a separate script to build all the
musl-cross-make targets although in theory you could just use the prebuilt
binary ones on https://musl.cc/ and at one point I had it working with the
Android NDK (bionic) although that was several releases back and I haven't
regression tested recently. Toybox gets regression tested against llvm by the
android guys, but building the kernel with llvm was fiddly.)

To build all supported targets, you do something like:

  git clone https://github.com/landley/musl-cross-make
  git clone https://github.com/landley/toybox
  cd musl-cross-make
  sed -Ei 's/(BINUTILS_VER =).*/\1 2.32/;s/(LINUX_VER =).*/\1 4.19.90/' Makefile
  ../toybox/scripts/mcm-buildall.sh
  cd ../toybox
  ln -s ccc ../musl-cross-make/ccc
  make defconfig
  make menuconfig # switch on sh and route in pending/
  make root CROSS=all LINUX=~/linux ALL=1

(That last ALL=1 tells it to continue to the next architecture instead of
stopping for build breaks. I haven't got kernel configs and QEMU invocations for
the armv7r and such.)

Then booting one under qemu is just:

  (cd root/sh4; ./qemu-*.sh)

Except I'm still implementing the shell so it doesn't QUITE make it through the
init script, so to get a prompt you need to:

  (cd root/sh4; KARGS=rdinit=/bin/sh ./qemu-*.sh)

*shrug* Working on it...

Rob
