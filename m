Return-Path: <SRS0=e93C=AF=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8ED44C433E0
	for <linux-m68k@archiver.kernel.org>; Wed, 24 Jun 2020 01:07:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 65C9E2073E
	for <linux-m68k@archiver.kernel.org>; Wed, 24 Jun 2020 01:07:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387916AbgFXBHp (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 23 Jun 2020 21:07:45 -0400
Received: from kvm5.telegraphics.com.au ([98.124.60.144]:44230 "EHLO
        kvm5.telegraphics.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387890AbgFXBHp (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 23 Jun 2020 21:07:45 -0400
Received: from localhost (localhost.localdomain [127.0.0.1])
        by kvm5.telegraphics.com.au (Postfix) with ESMTP id AB2CA28EFB;
        Tue, 23 Jun 2020 21:07:40 -0400 (EDT)
Date:   Wed, 24 Jun 2020 11:07:39 +1000 (AEST)
From:   Finn Thain <fthain@telegraphics.com.au>
To:     John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
cc:     Debian m68k <debian-68k@lists.debian.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>
Subject: Re: LLVM for m68k completed (but not merged)
In-Reply-To: <131920ba-0da7-7cb7-43a4-f4e93179e5eb@physik.fu-berlin.de>
Message-ID: <alpine.LNX.2.22.394.2006241039120.8@nippy.intranet>
References: <7840bdc7-db9c-8638-c462-bbe03d4c5545@physik.fu-berlin.de> <131920ba-0da7-7cb7-43a4-f4e93179e5eb@physik.fu-berlin.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-m68k-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Tue, 23 Jun 2020, John Paul Adrian Glaubitz wrote:

> Hi!
> 
> On 6/21/20 10:12 PM, John Paul Adrian Glaubitz wrote:
> 
> > I just received the news that the m68k backend for LLVM has been 
> > finished [1].
> 
> I have had a go at the code now and with some changes to clang, I can 
> actually cross-compile "Hello World" in C now, cross-compile it with 
> clang and get a working m68k executable [1].
> 
> > glaubitz@epyc:/tmp/llvm-build> ./bin/clang -target m68k-linux-gnu ~/hello.c -o hello.m68k
> > glaubitz@epyc:/tmp/llvm-build> file hello.m68k 
> > hello.m68k: ELF 32-bit MSB executable, Motorola m68k, 68020, version 1 (SYSV), dynamically linked, interpreter /lib/ld.so.1, for GNU/Linux 3.2.0, not stripped
> > glaubitz@epyc:/tmp/llvm-build> cp -av hello.m68k /local_scratch/glaubitz/
> > 'hello.m68k' -> '/local_scratch/glaubitz/hello.m68k'
> > glaubitz@epyc:/tmp/llvm-build> schroot -c sid-m68k-sbuild
> > glaubitz@epyc:/tmp/llvm-build> uname -a
> > Linux epyc 5.6.0-2-amd64 #1 SMP Debian 5.6.14-1 (2020-05-23) m68k GNU/Linux
> > glaubitz@epyc:/tmp/llvm-build> /glaubitz/hello.m68k 
> > Hello World!
> > glaubitz@epyc:/tmp/llvm-build>
> 
> Adrian
> 
> > [1] https://github.com/M680x0/M680x0-mono-repo/pull/7
> 

Very impressive! I imagine that creating an LLVM backend would be a 
massive undertaking.

Does this backend bring any benefits compared with gcc? E.g. will it help 
gain support for other languages, like rust?

Do you know if anyone has run the LLVM unit tests on Motorola silicon?
