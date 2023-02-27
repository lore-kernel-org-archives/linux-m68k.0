Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C28BC7EE23
	for <linux-m68k@archiver.kernel.org>; Mon, 27 Feb 2023 15:37:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229732AbjB0PhU convert rfc822-to-8bit (ORCPT
        <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 27 Feb 2023 10:37:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229702AbjB0PhT (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 27 Feb 2023 10:37:19 -0500
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15345222FF
        for <linux-m68k@lists.linux-m68k.org>; Mon, 27 Feb 2023 07:37:18 -0800 (PST)
Received: by mail-qt1-f175.google.com with SMTP id ay9so7037505qtb.9
        for <linux-m68k@lists.linux-m68k.org>; Mon, 27 Feb 2023 07:37:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4y6TQuxqGxL/zvrpovcLVAHICHhhLF7siniZA3gFbXI=;
        b=qTxCLwp+nNI5aZtwch1UVUNJStGik56mSRK31qZfLHnz7RBDEUHfdthqFfg5x1bQwr
         IDdL+WPIDxMF/2GVopa7i0hpcCunS6hnxA0I7gOWaPALszPzqt6gO+JuQF0SgTmm0XjQ
         M+3A0iQF6bhGLkDyff/OJagZ5zoyTnY967wAC18YnaJTOLKRn7rU7DxVvsBRMDfsKkdd
         ADOOdkDJYXZQLCM1lwzxWa2VrSu/QxKTNHEwaUOC1DeariKFqrV95T65yLkqoH0HKanY
         w6ZvdhF/m9YacdtifMY35GDCqWydQCKxT5RJ9x5LyCCGZ7llPjFngksfKQ856CZwx0ga
         t/Mg==
X-Gm-Message-State: AO0yUKVmtyzMI63Uvyf3lgpaJiLI+MyPHTx6/u2Mz4p47p2/lDaacydE
        OK6AUIYHjyssAEzvWuthy2RLMVgBAGFzJw==
X-Google-Smtp-Source: AK7set8rbXgpRfifPrpHA6kkRjgwXaohgcWhNMu7kTWpn6vJn/17w3eZEdjv/ZEH103Hu4sGV/0NTw==
X-Received: by 2002:ac8:5b06:0:b0:3bf:a5e2:79af with SMTP id m6-20020ac85b06000000b003bfa5e279afmr38250680qtw.37.1677512237009;
        Mon, 27 Feb 2023 07:37:17 -0800 (PST)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com. [209.85.128.181])
        by smtp.gmail.com with ESMTPSA id o12-20020ac8698c000000b003ba19e53e43sm4826836qtq.25.2023.02.27.07.37.16
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Feb 2023 07:37:16 -0800 (PST)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-53916ab0c6bso186681717b3.7
        for <linux-m68k@lists.linux-m68k.org>; Mon, 27 Feb 2023 07:37:16 -0800 (PST)
X-Received: by 2002:a81:ad43:0:b0:532:e887:2c32 with SMTP id
 l3-20020a81ad43000000b00532e8872c32mr10398864ywk.5.1677512236398; Mon, 27 Feb
 2023 07:37:16 -0800 (PST)
MIME-Version: 1.0
References: <167380196429.10651.4103075913257868035.stgit@bazille.1015granger.net>
 <b3e0b5e6-1d0-cdb2-186c-6b4f50e0a3aa@linux-m68k.org> <D5221DC2-2A9C-43DC-AC21-FA96E7F76E5B@oracle.com>
 <CAMuHMdVtsZ-jU5foR7V_4XeXT_0f3Nx5vfoJo5pH2jMga0SpWA@mail.gmail.com>
 <58CCF033-58C3-4AF0-B958-BE1AAF1695F3@oracle.com> <CAMuHMdUG5cthYp3u6GeYqTqMaNgW0Ernq_ce0AZ22rgFQ5J24A@mail.gmail.com>
 <CAMuHMdXYXO+D==BrN4h57cmuNyOG2Jd3_NwOWNgpjaoBdWQvOg@mail.gmail.com> <7ECA014B-3910-4E65-9084-32F790A733D3@oracle.com>
In-Reply-To: <7ECA014B-3910-4E65-9084-32F790A733D3@oracle.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 27 Feb 2023 16:37:02 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWNbwJDXJO8YJkJic-AN64LsUAEf6Jzrur_Ky0j_L=49g@mail.gmail.com>
Message-ID: <CAMuHMdWNbwJDXJO8YJkJic-AN64LsUAEf6Jzrur_Ky0j_L=49g@mail.gmail.com>
Subject: Re: [PATCH v2 00/41] RPCSEC GSS krb5 enhancements
To:     Chuck Lever III <chuck.lever@oracle.com>
Cc:     Chuck Lever <cel@kernel.org>,
        Linux NFS Mailing List <linux-nfs@vger.kernel.org>,
        David Howells <dhowells@redhat.com>,
        "simo@redhat.com" <simo@redhat.com>,
        "linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>,
        "linux-m68k@lists.linux-m68k.org" <linux-m68k@lists.linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Chuck,

On Mon, Feb 27, 2023 at 4:06 PM Chuck Lever III <chuck.lever@oracle.com> wrote:
> > On Feb 27, 2023, at 4:51 AM, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > On Thu, Feb 23, 2023 at 5:52 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> >> On Thu, Feb 23, 2023 at 5:19 PM Chuck Lever III <chuck.lever@oracle.com> wrote:
> >>>> On Feb 23, 2023, at 10:16 AM, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> >>> Unable to handle kernel access at virtual address af06da84
> >>
> >>>> I.e. a slightly different crash.
> >>>> As the difference between the two crashes is modular vs. builtin,
> >>>> this looks like an out-of-bound access in the test.
> >
> > Just ran it on physical arm32 and arm64 (Renesas APE6EVM and
> > Salvator-XS), and the test crashes there, too.
> >
> >>> Why not run the test suite just as I suggested?
> >
> > kunit_kernel.ConfigError: m68k is not a valid arch, options are
> > ['alpha', 'arm', 'arm64', 'i386', 'powerpc', 'riscv', 's390', 'sparc',
> > 'x86_64']
> >
> > Will look into adding m68k support ;-)
> >
> > But the issue can easily be reproduced using
> > ".../tools/testing/kunit/kunit.py run --arch=arm
> > --cross_compile=arm-linux-gnueabihf- --raw_output=all --kunitconfig
> > ./net/sunrpc/.kunitconfig" on current upstream[1]:

> I'm still not able to reproduce:
>
> [cel@bazille odd-releases]$ tools/testing/kunit/kunit.py run --arch=arm
> --cross_compile=arm-linux-gnueabihf- --raw_output=all --kunitconfig
> ./net/sunrpc/.kunitconfig
> [10:04:14] Configuring KUnit Kernel ...
> Generating .config ...
> Populating config with:
> $ make ARCH=arm O=.kunit olddefconfig
> [10:04:18] Building KUnit Kernel ...
> Populating config with:
> $ make ARCH=arm O=.kunit olddefconfig
> Building with:
> $ make ARCH=arm O=.kunit --jobs=4
> ERROR:root:gcc: error: unrecognized argument in option ‘-mabi=aapcs-linux’
> gcc: note: valid arguments to ‘-mabi=’ are: ms sysv
> gcc: error: unrecognized argument in option ‘-mabi=aapcs-linux’
> gcc: note: valid arguments to ‘-mabi=’ are: ms sysv
> gcc: error: unrecognized command-line option ‘-mlittle-endian’
> gcc: error: unrecognized command-line option ‘-mlittle-endian’
> gcc: error: unrecognized command-line option ‘-mtp=cp15’
> gcc: error: unrecognized command-line option ‘-mtp=cp15’
> gcc: error: unrecognized command-line option ‘-mfpu=vfp’
> make[2]: *** [../scripts/Makefile.build:252: scripts/mod/empty.o] Error 1
> make[2]: *** Waiting for unfinished jobs....
> gcc: error: unrecognized command-line option ‘-mfpu=vfp’
> make[2]: *** [../scripts/Makefile.build:114: scripts/mod/devicetable-offsets.s] Error 1
> make[1]: *** [/home/cel/src/linux/odd-releases/Makefile:1297: prepare0] Error 2
> make: *** [Makefile:242: __sub-make] Error 2
>
> -bash: --cross_compile=arm-linux-gnueabihf-: command not found
> -bash: ./net/sunrpc/.kunitconfig: Permission denied
> [cel@bazille odd-releases]$ gcc --version
> gcc (GCC) 12.2.1 20221121 (Red Hat 12.2.1-4)
> Copyright (C) 2022 Free Software Foundation, Inc.
> This is free software; see the source for copying conditions.  There is NO
> warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
>
> [cel@bazille odd-releases]$
>
> What am I missing?

Please run that as a single command, not split across 3 lines.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
