Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30776C05027
	for <linux-m68k@archiver.kernel.org>; Wed,  1 Feb 2023 19:59:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231302AbjBAT7K (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 1 Feb 2023 14:59:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39404 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230462AbjBAT7K (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 1 Feb 2023 14:59:10 -0500
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DEFF73C3F
        for <linux-m68k@lists.linux-m68k.org>; Wed,  1 Feb 2023 11:59:08 -0800 (PST)
Received: by mail-ej1-x635.google.com with SMTP id me3so54750276ejb.7
        for <linux-m68k@lists.linux-m68k.org>; Wed, 01 Feb 2023 11:59:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=vLOt8Htpi1Up/DCPSKgd2HVLgjbb3KJvZ9wNHdxeIi0=;
        b=F70AJ99pkUxssTeL0XhQsULJ+i1q3hIfT9mQJxKYXMRcGN/4hPjNKQXfjgd8TBqpBG
         BetUorZ/VTlYCLAfd+XP2RRKW0JVrfaxYcX4T9dpsWXY9GYLSKeTv64OlMI8Kd6WjuJ/
         BWyXoO4myVBwLlBRPvXQouhFGSPXaEWcUSKkI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vLOt8Htpi1Up/DCPSKgd2HVLgjbb3KJvZ9wNHdxeIi0=;
        b=STojOn7D4VjC5nLuWR1St/fYirLOHFaOO+iiRUhSJTNUJvTAwq+oI42/hAPlgSAxvX
         t663IlTb/DyuUskla9ZLbchvja3bC8O80mmyAuV65MFgLqWKYgyg6ac9yryyf1dcOPiN
         a0lortokdC0ba9aogOxqoUH0+SrzBmIm8h9MBcVBr8wJsuVqIDLeWPBjwJRWE9CPVsCX
         MWhcRxrqYFXFQSmHOegKXAMK1yWSYu6qakFgEB8R7nfFdfVov5Gy8LeJuAtQgXqm+lva
         mQdDleef14Wpwgv4XDJGER8xjYgloVW0PyGEoLET5MOv+7XptSMt0cnLNSpw2YaQ6fPJ
         a6Lg==
X-Gm-Message-State: AO0yUKU5XJX4YEBJTzsyYRHOQX1wpXMVkDNV0ax6epSILiGjtSa5a/Qq
        2fKxopRO0TOVkorCXKID7UFb7XiDguVBJFyFqV4=
X-Google-Smtp-Source: AK7set8vIGpECKA5uNxuQsVZNBQMNFM74SUg/KATdsycKqpMMHQeAsXs71ngsG4LX8mz5HUfp7ptZw==
X-Received: by 2002:a17:907:7672:b0:88d:f759:15b0 with SMTP id kk18-20020a170907767200b0088df75915b0mr3519506ejc.45.1675281547096;
        Wed, 01 Feb 2023 11:59:07 -0800 (PST)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com. [209.85.208.45])
        by smtp.gmail.com with ESMTPSA id op27-20020a170906bcfb00b007add62dafbasm10424406ejb.157.2023.02.01.11.59.06
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Feb 2023 11:59:06 -0800 (PST)
Received: by mail-ed1-f45.google.com with SMTP id eq11so1884205edb.6
        for <linux-m68k@lists.linux-m68k.org>; Wed, 01 Feb 2023 11:59:06 -0800 (PST)
X-Received: by 2002:a17:906:f8d4:b0:878:51a6:ff35 with SMTP id
 lh20-20020a170906f8d400b0087851a6ff35mr995069ejb.43.1675281111261; Wed, 01
 Feb 2023 11:51:51 -0800 (PST)
MIME-Version: 1.0
References: <Y9lz6yk113LmC9SI@ZenIV> <CAHk-=whf73Vm2U3jyTva95ihZzefQbThZZxqZuKAF-Xjwq=G4Q@mail.gmail.com>
 <Y9mD1qp/6zm+jOME@ZenIV> <CAHk-=wjiwFzEGd_60H3nbgVB=R_8KTcfUJmXy=hSXCvLrXQRFA@mail.gmail.com>
 <8f60f7d8-3e2f-2a91-c7a3-6a005d36d7d3@gmx.de>
In-Reply-To: <8f60f7d8-3e2f-2a91-c7a3-6a005d36d7d3@gmx.de>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Wed, 1 Feb 2023 11:51:34 -0800
X-Gmail-Original-Message-ID: <CAHk-=whYidrLJSq80s8C0LSui_h9164cxG6WNV1M77Tk_2QFug@mail.gmail.com>
Message-ID: <CAHk-=whYidrLJSq80s8C0LSui_h9164cxG6WNV1M77Tk_2QFug@mail.gmail.com>
Subject: Re: [RFC][PATCHSET] VM_FAULT_RETRY fixes
To:     Helge Deller <deller@gmx.de>
Cc:     Al Viro <viro@zeniv.linux.org.uk>, Peter Xu <peterx@redhat.com>,
        linux-arch@vger.kernel.org, linux-alpha@vger.kernel.org,
        linux-ia64@vger.kernel.org, linux-hexagon@vger.kernel.org,
        linux-m68k@lists.linux-m68k.org, Michal Simek <monstr@monstr.eu>,
        Dinh Nguyen <dinguyen@kernel.org>,
        openrisc@lists.librecores.org, linux-parisc@vger.kernel.org,
        linux-riscv@lists.infradead.org, sparclinux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Wed, Feb 1, 2023 at 12:21 AM Helge Deller <deller@gmx.de> wrote:
>
> AFAICS, the only applications which really care about the return
> code are
> - testsuites like LTP (i.e. the fstat05 testcase)

Those have actually shown issues with various library implementations,
exactly because real system calls act very differently in this area
from library wrappers.

Things like the vdso implementation of gettimeofday() get a SIGSEGV if
the timeval or timezone pointer is invalid, while the "real system
call" version returns -1/EFAULT instead.

And very similar things happen when glibc ends up wrapping system
calls and converting buffers manually. At some point, glibc had a
special 'struct stat' and basically converted the native system call
to it, so you did 'stat()' on something, and it ended up actually
using a private on-stack buffer for the system call, followed by a
"convert that kernel 'struct stat' to the glibc 'struct stat'" phase.
So once again, instead of -1/EFAULT, you'd first have a successful
system call, and then get a SIGSEGV  in glibc.

And as you say, test suites would notice. But no actual normal app
would ever care.

Of course, there's always the abnormal apps. There _are_ the odd cases
that actually catch faults and fix them up, and can then be confused
by changes like that.

It's very very rare, but it happens - things like emulators do tend to
do some really strange things.

         Linus
