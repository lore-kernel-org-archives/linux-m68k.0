Return-Path: <SRS0=0yiB=55=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79D7EC2BB85
	for <linux-m68k@archiver.kernel.org>; Mon, 13 Apr 2020 00:22:36 +0000 (UTC)
Received: from vger.kernel.org (unknown [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2166C20692
	for <linux-m68k@archiver.kernel.org>; Mon, 13 Apr 2020 00:22:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=landley-net.20150623.gappssmtp.com header.i=@landley-net.20150623.gappssmtp.com header.b="d4zR8pey"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2166C20692
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=landley.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-m68k-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726828AbgDMAWf (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Sun, 12 Apr 2020 20:22:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.18]:48302 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726185AbgDMAWe (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Sun, 12 Apr 2020 20:22:34 -0400
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com [IPv6:2607:f8b0:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D279C0A3BE0
        for <linux-m68k@vger.kernel.org>; Sun, 12 Apr 2020 17:22:35 -0700 (PDT)
Received: by mail-ot1-x342.google.com with SMTP id l21so2038644otd.9
        for <linux-m68k@vger.kernel.org>; Sun, 12 Apr 2020 17:22:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=landley-net.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=qBXduVOeRLPt9JJxKUrFqAncPQPouSXacsTDlm/RskM=;
        b=d4zR8peyfhY6dBOCd2FASqNFnRfwzUurpoCxhlgerYYO68ZjGP6JBn6mtyc8jGabZ/
         /qL3z/1LHrTD11cC39Cd9Z+plhjMUtfsQsKa5x6hOBqvwPF1R73wksaHvmP2T8Bfo3kg
         AVGny7dQklsLmmiPukdqRUqGCQHAscM78UhnsDyejdTSaJ0LbO13D8Jf91SAFCsPwDAM
         9Zd/xY7/Xjf8Qi4cIjYcgGDk93gHuLnHGRkWel4wjQYf9/mzQ0BwUWYkR+MV1ENDp7Jm
         kvWTygtfU+TOeQXOWEFjycXp74LqwbM4BQ/txeIObbw3EAWwBH7yThbJZFNALHS8w5kj
         5dtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=qBXduVOeRLPt9JJxKUrFqAncPQPouSXacsTDlm/RskM=;
        b=SKzYYwqZA6EcZ+lMSfEZs2I1FrGQLNiGw2i8G0A9CV9D3A9grbhAnXYfWeN1OKGJ7L
         xiEaOMtJPNlnUSLC7JntlZ+oIlRNLL3JijZscsFkag5wouWvjeRxqrq6kqTYsfPeRPi1
         B+GbXLqoZJDBTc+Xm35TAd8RfUgQHpVBo/heGK1BxdGvI6gKOWvnic0chiLTSUjBqqbJ
         pnueD6MHxIsMrc9XB5DKv0hZbUMQwPvr9rs8QY9Ua2JVi8qXPNdi9mgRCILxtbpqqFLi
         5+PNGlL0a6IJkMF4MAIKDyMg4mLe+P3dnUQABFfNhRt17/p3E0QrwsYd2OdKg2j3vYDf
         masw==
X-Gm-Message-State: AGi0PuZyqEreFxokoIBo1GR1cMVyAQzyUEt/cEunIK5CDDteLpI8H6f5
        tAB5fqI4de0J03lzkvW18oBI1XDMevI=
X-Google-Smtp-Source: APiQypKcemotshIr+m/QOS3WZgDd/1xKF0EUWFL3MqVpShl6z2fWxnkY5tKIRvGn6bphmlk0YzQ1xA==
X-Received: by 2002:a05:6830:160c:: with SMTP id g12mr12407102otr.335.1586737354344;
        Sun, 12 Apr 2020 17:22:34 -0700 (PDT)
Received: from [192.168.86.21] ([136.62.4.88])
        by smtp.googlemail.com with ESMTPSA id b2sm4460347oii.20.2020.04.12.17.22.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 12 Apr 2020 17:22:33 -0700 (PDT)
Subject: Re: GCC?, was Re: Running m68k on qemu with external initramfs?
To:     Finn Thain <fthain@telegraphics.com.au>
Cc:     John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        linux-m68k@vger.kernel.org, Laurent Vivier <Laurent@Vivier.EU>
References: <b1e930f3-7775-6955-860e-a2886627caa8@landley.net>
 <c4a784d9-2fef-ee90-9ff3-b1d8487e8a8b@physik.fu-berlin.de>
 <238ea76c-fa8e-0134-667b-3864938d9a78@landley.net>
 <alpine.LNX.2.22.394.2004130922090.8@nippy.intranet>
From:   Rob Landley <rob@landley.net>
Message-ID: <7a9ada44-e0d4-6743-3819-92dc44f3f156@landley.net>
Date:   Sun, 12 Apr 2020 19:28:28 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <alpine.LNX.2.22.394.2004130922090.8@nippy.intranet>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-m68k-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On 4/12/20 6:30 PM, Finn Thain wrote:
> On Sun, 12 Apr 2020, Rob Landley wrote:
> 
>>
>> 2) THEN the problem was that gcc is doing something in cd_main so that 
>> the "chdir ." at the start of the shell setup (to set $PWD and friends) 
>> is segfaulting, but it's a segfault that went away when I got near it 
>> with printf() calls, and even write(1, "", 0); right before it made it 
>> go away. Given that this code has run on 32 and 64 bit, big and little 
>> endian, glibc musl and bionic, and on a target that's both nommu and 
>> cares about alignment?
> 
> Are you sure that "gcc is doing something [wrong]"? Do you think it could 
> be a QEMU bug? Can you provide some information about your tool chain?

I provided the reproduction sequence to build the toolchain from source a post
or two back as part of the general reproduction sequence?

Here's the version and config stuff:

m68k-linux-musl-cc --version
m68k-linux-musl-cc (GCC) 9.2.0
Copyright (C) 2019 Free Software Foundation, Inc.
This is free software; see the source for copying conditions.  There is NO
warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

m68k-linux-musl-ld --version
GNU ld (GNU Binutils) 2.32
Copyright (C) 2019 Free Software Foundation, Inc.
This program is free software; you may redistribute it under the terms of
the GNU General Public License version 3 or (at your option) a later version.
This program has absolutely no warranty.

$ ./m68k-linux-musl-cc -v
Using built-in specs.
COLLECT_GCC=./m68k-linux-musl-cc
COLLECT_LTO_WRAPPER=/home/landley/mcm/clean/ccc/m68k-linux-musl-cross/bin/../libexec/gcc/m68k-linux-musl/9.2.0/lto-wrapper
Target: m68k-linux-musl
Configured with: ../src_gcc/configure --enable-languages=c,c++ CFLAGS=' -g0 -Os'
CXXFLAGS=' -g0 -Os' LDFLAGS=' -s' CC='i686-linux-musl-gcc -static --static'
CXX='i686-linux-musl-g++ -static --static' --disable-nls --disable-libquadmath
--disable-decimal-float --disable-multilib --enable-languages=c,c++
--disable-bootstrap --disable-assembly --disable-werror --target=m68k-linux-musl
--prefix= --libdir=/lib --disable-multilib --with-sysroot=/m68k-linux-musl
--enable-tls --disable-libmudflap --disable-libsanitizer
--disable-gnu-indirect-function --disable-libmpx --enable-libstdcxx-time=rt
--with-build-sysroot=/home/landley/mcm/clean/build/local/m68k-linux-musl/obj_sysroot
AR_FOR_TARGET=/home/landley/mcm/clean/build/local/m68k-linux-musl/obj_binutils/binutils/ar
AS_FOR_TARGET=/home/landley/mcm/clean/build/local/m68k-linux-musl/obj_binutils/gas/as-new
LD_FOR_TARGET=/home/landley/mcm/clean/build/local/m68k-linux-musl/obj_binutils/ld/ld-new
NM_FOR_TARGET=/home/landley/mcm/clean/build/local/m68k-linux-musl/obj_binutils/binutils/nm-new
OBJCOPY_FOR_TARGET=/home/landley/mcm/clean/build/local/m68k-linux-musl/obj_binutils/binutils/objcopy
OBJDUMP_FOR_TARGET=/home/landley/mcm/clean/build/local/m68k-linux-musl/obj_binutils/binutils/objdump
RANLIB_FOR_TARGET=/home/landley/mcm/clean/build/local/m68k-linux-musl/obj_binutils/binutils/ranlib
READELF_FOR_TARGET=/home/landley/mcm/clean/build/local/m68k-linux-musl/obj_binutils/binutils/readelf
STRIP_FOR_TARGET=/home/landley/mcm/clean/build/local/m68k-linux-musl/obj_binutils/binutils/strip-new
--build=x86_64-pc-linux-gnu --host=x86_64-pc-linux-gnu
Thread model: posix
gcc version 9.2.0 (GCC)

(I build toolchains statically linked on against musl on the host so they're
portable and you can just extract the tarball of binaries and run it). And it's
built with i686 instead of x86-64 because that runs faster due to cache
locality: 90% of the reason for x32 was the 32 bit time_t and that got fixed
anyway, so just "statically link 32 bit binary" and you get all the benefits of
that these days...)

I have a todo item to pare my 2700 line toysh source file (plus however much of
main.c and lib/*.c it's pulling in, "LDFLAGS=--static
CROSS_COMPILE=ccc/m68k-linux-musl-cross/bin/m68k-linux-musl- make sh" makes a
99k m68k binary) down into a minimal reproduction thingy, but I'm trying to get
the other targets to finish parsing the init script so I can cut a toybox release.

>> Because I'm still halfway through teaching toysh about all the ${} 
>> constructs. (Also, remind me to stick echo -e '\e[?7h' at the start of 
>> my init script to undo the STUPID wordwrap disable escape that qemu's 
>> bios outputs, which screws up bash's command line history too!)
> 
> How awful. It baffles me every time bash manages to mishandle unprintable 
> output from a command such that it somehow becomes command line input 
> which bash then attempts to execute! I wish I knew how to prevent that.

This isn't bash's fault, this is qemu using a deeply obscure escape sequence
("man 4 console_codes" search for DECAWM) to leave the terminal in a weird state.

Bash is assembling the command line fine, you just can't see the output because
the cursor alignment's off (and it keeps cursoring up one line every time you
edit stuff because bash thinks the cursor went to the next line and it didn't
because line wrap disabled). When it does this I hit home # enter to comment out
the line I'm editing, and then run "reset", then cursor up twice and resume
editing the line.

I just stuck the "fix it" escape sequence at the end of my qemu wrapper script.
I'd submit a patch to qemu, but the last few I've posted to that list got lost
in the noise.

Rob
