Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15C22C433EF
	for <linux-m68k@archiver.kernel.org>; Mon, 14 Feb 2022 14:05:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242560AbiBNOFb (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 14 Feb 2022 09:05:31 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:44238 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354877AbiBNOF3 (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 14 Feb 2022 09:05:29 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 39CCA49FB2
        for <linux-m68k@lists.linux-m68k.org>; Mon, 14 Feb 2022 06:05:21 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id B22D560AFE
        for <linux-m68k@lists.linux-m68k.org>; Mon, 14 Feb 2022 14:05:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05239C340E9
        for <linux-m68k@lists.linux-m68k.org>; Mon, 14 Feb 2022 14:05:19 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
        dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="jsJSfRFC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
        t=1644847518;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=QLgXSQB9b7XXmln9u8fQm/jVMLmkRr2wWxHA9OmWt1Q=;
        b=jsJSfRFCu4REnj2t+ywKG5b4Ild3UNTHAu55fgQ/yH1ndujNSlpTYdBlKfz/vUIvXX0GTE
        sQGnR6HAKaikPqhtKe3a0agV0cZbeYbGk+swrAomNJyJHUeN2826SZ9XaoFRwS6j8l+3D0
        zEjl94e0a4+BDJ88FCiFFHTiJSljVaQ=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id f62dd5b1 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
        for <linux-m68k@lists.linux-m68k.org>;
        Mon, 14 Feb 2022 14:05:18 +0000 (UTC)
Received: by mail-yb1-f179.google.com with SMTP id j2so46556130ybu.0
        for <linux-m68k@lists.linux-m68k.org>; Mon, 14 Feb 2022 06:05:16 -0800 (PST)
X-Gm-Message-State: AOAM5317hg2IhCIT4gfXXUcnMuevacgFjS1CqNi3GAaKbZz0woaxNBEP
        /uBqLFMsODptbU7ukh/kENjPMxtVp56nHbgjIBQ=
X-Google-Smtp-Source: ABdhPJx1rAQYW+BsQ/vOucuTQJhI9pVZ01yF0DPyTFL1e5L2Bmfiie7EtWck0pGXAqYbtpOZPqa2kzjO14vEvrtdV/A=
X-Received: by 2002:a25:4144:: with SMTP id o65mr12095580yba.113.1644847514782;
 Mon, 14 Feb 2022 06:05:14 -0800 (PST)
MIME-Version: 1.0
References: <20220211210757.612595-1-Jason@zx2c4.com> <fcab986b-d0bd-c798-de17-266abcdc7da2@gentoo.org>
In-Reply-To: <fcab986b-d0bd-c798-de17-266abcdc7da2@gentoo.org>
From:   "Jason A. Donenfeld" <Jason@zx2c4.com>
Date:   Mon, 14 Feb 2022 15:05:03 +0100
X-Gmail-Original-Message-ID: <CAHmME9ooEbgiv3DRk87ei+rUoVNMJthY7UuG_xCgm=kfMZAajw@mail.gmail.com>
Message-ID: <CAHmME9ooEbgiv3DRk87ei+rUoVNMJthY7UuG_xCgm=kfMZAajw@mail.gmail.com>
Subject: Re: [PATCH RFC v0] random: block in /dev/urandom
To:     Joshua Kinard <kumba@gentoo.org>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        linux-riscv <linux-riscv@lists.infradead.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
        Dominik Brodowski <linux@dominikbrodowski.net>,
        Eric Biggers <ebiggers@google.com>,
        Ard Biesheuvel <ardb@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Thomas Gleixner <tglx@linutronix.de>,
        Andy Lutomirski <luto@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Lennart Poettering <mzxreary@0pointer.de>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Theodore Ts'o" <tytso@mit.edu>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Joshua,

Thanks a lot for the historical background.

On Sun, Feb 13, 2022 at 12:06 AM Joshua Kinard <kumba@gentoo.org> wrote:
> The R6000/R6000A CPU only ever existed in systems in the late 1980's that
> were fairly large, and I don't think there is a complete, working unit out
> there that can actually boot up, let alone boot a Linux kernel.

So from what you've written, it sounds like MIPS is actually not a problem here.

So the only systems we're actually talking about without a good cycle
counter are non-Amiga m68k? If so, that'd be a pretty terrific
finding. It'd mean that this idea can move forward, and we only need
to worry about some m68k museum pieces with misconfigured
userspaces...

Jason
