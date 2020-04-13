Return-Path: <SRS0=0yiB=55=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B221C2BA19
	for <linux-m68k@archiver.kernel.org>; Mon, 13 Apr 2020 05:36:38 +0000 (UTC)
Received: from vger.kernel.org (unknown [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9DEC3206A1
	for <linux-m68k@archiver.kernel.org>; Mon, 13 Apr 2020 05:36:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9DEC3206A1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=telegraphics.com.au
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-m68k-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727823AbgDMFgh (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 13 Apr 2020 01:36:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.18]:41870 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727822AbgDMFgh (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Mon, 13 Apr 2020 01:36:37 -0400
Received: from kvm5.telegraphics.com.au (kvm5.telegraphics.com.au [98.124.60.144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id D4A61C008673
        for <linux-m68k@vger.kernel.org>; Sun, 12 Apr 2020 22:17:45 -0700 (PDT)
Received: from localhost (localhost.localdomain [127.0.0.1])
        by kvm5.telegraphics.com.au (Postfix) with ESMTP id C875D28D1A;
        Mon, 13 Apr 2020 01:17:42 -0400 (EDT)
Date:   Mon, 13 Apr 2020 15:17:39 +1000 (AEST)
From:   Finn Thain <fthain@telegraphics.com.au>
To:     Rob Landley <rob@landley.net>
cc:     John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        linux-m68k@vger.kernel.org, Laurent Vivier <Laurent@Vivier.EU>
Subject: Re: GCC?, was Re: Running m68k on qemu with external initramfs?
In-Reply-To: <7a9ada44-e0d4-6743-3819-92dc44f3f156@landley.net>
Message-ID: <alpine.LNX.2.22.394.2004131146180.15@nippy.intranet>
References: <b1e930f3-7775-6955-860e-a2886627caa8@landley.net> <c4a784d9-2fef-ee90-9ff3-b1d8487e8a8b@physik.fu-berlin.de> <238ea76c-fa8e-0134-667b-3864938d9a78@landley.net> <alpine.LNX.2.22.394.2004130922090.8@nippy.intranet>
 <7a9ada44-e0d4-6743-3819-92dc44f3f156@landley.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-m68k-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Sun, 12 Apr 2020, Rob Landley wrote:

> Target: m68k-linux-musl
> Configured with: ../src_gcc/configure --enable-languages=c,c++ CFLAGS=' -g0 -Os'

Was toysh also built with -Os in CFLAGS? If so, I suggest you try -O2. The 
reason being that my Gentoo/m68k system failed to build Python with -Os.
Like your toysh seg fault, this python seg fault also happened on 
qemu-system-m68k. This toolchain uses glibc 2.31, gcc 9.3 and binutils 
2.34.

building '_ctypes' extension
...
/bin/sh: line 9: 11966 Segmentation fault      
LD_LIBRARY_PATH=/var/tmp/portage/dev-lang/python-3.7.7-r1/work/Python-3.7.7 
CC='m68k-unknown-linux-gnu-gcc -pthread' 
LDSHARED='m68k-unknown-linux-gnu-gcc -pthread -shared -Wl,-O1 
-Wl,--as-needed -L.   ' CFLAGS='-Wno-unused-result -Wsign-compare -DNDEBUG  
-Os -fwrapv  ' _TCLTK_INCLUDES='' _TCLTK_LIBS='' ./python -E ./setup.py 
$quiet build
make: *** [Makefile:628: sharedmods] Error 139

> I have a todo item to pare my 2700 line toysh source file (plus however 
> muchof main.c and lib/*.c it's pulling in, "LDFLAGS=--static 
> CROSS_COMPILE=ccc/m68k-linux-musl-cross/bin/m68k-linux-musl- make sh" 
> makes a 99k m68k binary) down into a minimal reproduction thingy, but 
> I'm trying to get the other targets to finish parsing the init script so 
> I can cut a toybox release.

It would be great to have a minimal reproducer from toysh. Getting that 
from the python build looks hard, even with creduce.
https://embed.cs.utah.edu/creduce/
