Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30717C433DB
	for <linux-m68k@archiver.kernel.org>; Mon, 18 Jan 2021 12:25:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D9A172225C
	for <linux-m68k@archiver.kernel.org>; Mon, 18 Jan 2021 12:25:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391317AbhARMYy (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 18 Jan 2021 07:24:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54430 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391405AbhARMUt (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 18 Jan 2021 07:20:49 -0500
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com [IPv6:2607:f8b0:4864:20::d33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4FDBDC061573
        for <linux-m68k@lists.linux-m68k.org>; Mon, 18 Jan 2021 04:20:09 -0800 (PST)
Received: by mail-io1-xd33.google.com with SMTP id q1so32324787ion.8
        for <linux-m68k@lists.linux-m68k.org>; Mon, 18 Jan 2021 04:20:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=urEJCrJJgCcbW+S5Hq/CQMe6CrxKgE8uzxdpK93bklA=;
        b=eGMieF+kCQYRDOXL8myg+keIitDtTUgiwCHkpiZRqhS+2RcG8Qsqgo5ydPICjqrHjv
         WcWMtGJ+nNyGW3YNR8rY5dHktoska+khr04BmuAX2OK8Q3khBBP5ywi1lToSPJF83I1P
         TQqDX4np0RmX7snKn345KMRpStvwjIEBgFBcGmthXc3rXHxA69vKOjWQW6LLswa9ZQom
         k7nwxJAS5A2yKKpn0fYTZKvN9eT+uYpi+jkVj6Ns9hGj+6kQR6+kUxYNnIr6iYHOMBBZ
         cgabCbBLNVTnOM0ZA/HOl56eSG7Z6n/v77aA/e0xMj8r4s/Cenfm+mQ9ABRI76nOJl2k
         42Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=urEJCrJJgCcbW+S5Hq/CQMe6CrxKgE8uzxdpK93bklA=;
        b=dwGmOKWfVnzW36bGXW/Andej9mMc2L3BAhQFweh5tDk9fzvzCLBS5Ez0hr+T/oqxH3
         LFo+WZS2GmSNJeJVxZUB6KCb2Mu7Si50N2gORfynl9O2fmDEWm61TTYbGfxxyS21nMUs
         Vg5yigpz/0YZ1G7xiYhUhwQnpMRo2lTDe2Cs/bObxrEfewi4ZdPKKYWONNiwiSJbOP4p
         VaAe4yBfymOSeEkGgZIf2n3JXMF+jkEpH3BEd7oR+0JH79OJggD0qmudS9I37Q8Blwqy
         YN1geHawsNOdpVxZoMePIYCKPPUWjgsQfEQVzwW2VjaEt1rEp58E9JBcmC84RbKcnjJm
         Iy8Q==
X-Gm-Message-State: AOAM533zpSBnCj7p/N24UiOQvaPSRv7PMhmH65Tuc59rrRIe94kh4etI
        5plmpeIM0NuLLoeVBBcQEXgCjyEBZBgReF1oHVgwCQ==
X-Google-Smtp-Source: ABdhPJwAuvvpdShlZ1qA3dowVQQ1Z8Jt0pirZ+y7t33HXqwoQsjY/vFQlehPo/oEHC5HHGoK/vpdtcnPsbzKozcZtm4=
X-Received: by 2002:a92:49cf:: with SMTP id k76mr10584031ilg.52.1610972408488;
 Mon, 18 Jan 2021 04:20:08 -0800 (PST)
MIME-Version: 1.0
References: <202101161658.52rYf3KV-lkp@intel.com> <CA+i-1C19Fdas5PBLYwkD-+265gyEYbEaRkMKuD9t6PXsLr20YQ@mail.gmail.com>
In-Reply-To: <CA+i-1C19Fdas5PBLYwkD-+265gyEYbEaRkMKuD9t6PXsLr20YQ@mail.gmail.com>
From:   Brendan Jackman <jackmanb@google.com>
Date:   Mon, 18 Jan 2021 13:19:57 +0100
Message-ID: <CA+i-1C2Dk_AfqfMH6CttpjWYRxJ98LSQhTRUmYovbionJnAvsQ@mail.gmail.com>
Subject: Re: [ragnatech:net-next 317/356] {standard input}:3148: Error:
 operands mismatch -- statement `andl %a1,%d1' ignored
To:     kernel test robot <lkp@intel.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-m68k@lists.linux-m68k.org
Cc:     kbuild-all@lists.01.org, Alexei Starovoitov <ast@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Mon, 18 Jan 2021 at 12:53, Brendan Jackman <jackmanb@google.com> wrote:
>
> I copied in the attached config, installed the m68k toolchain:
>
> sudo apt install gcc-m68k-linux-gnu  # (m68k-linux-gnu-gcc (Debian
> 10.2.0-9) 10.2.0)
>
> Built with:
>
> CROSS_COMPILE=m68k-linux-gnu- ARCH=m68k make -j
>
> And I get this "needs 68020 or higher" error from all over the kernel
> tree. Sounds like a Kbuild bug to me, I will ignore it if you're OK
> with that.

Sorry, that's nonsense, this email is complaining about "Error:
operands mismatch", not "needs 68020 or higher".

> On Sat, 16 Jan 2021 at 09:20, kernel test robot <lkp@intel.com> wrote:
> >
> > tree:   git://git.ragnatech.se/linux net-next
> > head:   9ab7e76aefc97a9aa664accb59d6e8dc5e52514a
> > commit: 981f94c3e92146705baf97fb417a5ed1ab1a79a5 [317/356] bpf: Add bitwise atomic instructions
> > config: m68k-randconfig-r002-20210115 (attached as .config)
> > compiler: m68k-linux-gcc (GCC) 9.3.0
> > reproduce (this is a W=1 build):
> >         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
> >         chmod +x ~/bin/make.cross
> >         git remote add ragnatech git://git.ragnatech.se/linux
> >         git fetch --no-tags ragnatech net-next
> >         git checkout 981f94c3e92146705baf97fb417a5ed1ab1a79a5
> >         # save the attached .config to linux build tree
> >         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-9.3.0 make.cross ARCH=m68k
> >
> > If you fix the issue, kindly add following tag as appropriate
> > Reported-by: kernel test robot <lkp@intel.com>
> >
> > All errors (new ones prefixed by >>):
> >
> >    kernel/bpf/core.c:1350:12: warning: no previous prototype for 'bpf_probe_read_kernel' [-Wmissing-prototypes]
> >     1350 | u64 __weak bpf_probe_read_kernel(void *dst, u32 size, const void *unsafe_ptr)
> >          |            ^~~~~~~~~~~~~~~~~~~~~
> >    {standard input}: Assembler messages:
> >    {standard input}:3102: Error: invalid instruction for this architecture; needs 68020 or higher (68020 [68k, 68ec020], 68030 [68ec030], 68040 [68ec040], 68060 [68ec060]) -- statement `casl %d0,%d1,(%a6)' ignored
> > >> {standard input}:3148: Error: operands mismatch -- statement `andl %a1,%d1' ignored
> >    {standard input}:3148: Error: invalid instruction for this architecture; needs 68020 or higher (68020 [68k, 68ec020], 68030 [68ec030], 68040 [68ec040], 68060 [68ec060]) -- statement `casl %d0,%d1,(%a6)' ignored
> > >> {standard input}:3201: Error: operands mismatch -- statement `orl %a1,%d1' ignored
> >    {standard input}:3201: Error: invalid instruction for this architecture; needs 68020 or higher (68020 [68k, 68ec020], 68030 [68ec030], 68040 [68ec040], 68060 [68ec060]) -- statement `casl %d0,%d1,(%a6)' ignored
> > >> {standard input}:3247: Error: operands mismatch -- statement `eorl %a1,%d1' ignored
> >    {standard input}:3247: Error: invalid instruction for this architecture; needs 68020 or higher (68020 [68k, 68ec020], 68030 [68ec030], 68040 [68ec040], 68060 [68ec060]) -- statement `casl %d0,%d1,(%a6)' ignored
> >    {standard input}:3270: Error: invalid instruction for this architecture; needs 68020 or higher (68020 [68k, 68ec020], 68030 [68ec030], 68040 [68ec040], 68060 [68ec060]) -- statement `casl %d0,%d5,(%a0)' ignored
> >    {standard input}:3307: Error: invalid instruction for this architecture; needs 68020 or higher (68020 [68k, 68ec020], 68030 [68ec030], 68040 [68ec040], 68060 [68ec060]) -- statement `casl %d0,%d5,(%a6)' ignored
> >

Did some fiddling to find where the error comes from and it is indeed
the new atomics code, specifically the ATOMIC_ALU_OP invocations, on
line 1645 [1]

I got a similar error from 0-day during development, in that case the
core issue seemed to be type casts that only made sense if pointers
were 64-bit. I think this is something different though:

The three errors are for the BPF_AND, BPF_OR and BPF_XOR invocations,
but the BPF_AND invocation doesn't produce the error. That makes me
think this might need some m68k knowledge... I added linux-m68k and
Geert from MAINTAINERS... any ideas?

[1] https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git/tree/kernel/bpf/core.c?id=981f94c3e92146705baf97fb417a5ed1ab1a79a5#n1645
