Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B565C433F5
	for <linux-m68k@archiver.kernel.org>; Tue, 15 Feb 2022 09:40:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234609AbiBOJk3 (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 15 Feb 2022 04:40:29 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:60598 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235979AbiBOJk2 (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 15 Feb 2022 04:40:28 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A013E4499
        for <linux-m68k@lists.linux-m68k.org>; Tue, 15 Feb 2022 01:40:15 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id C59826101E
        for <linux-m68k@lists.linux-m68k.org>; Tue, 15 Feb 2022 09:40:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BE5FC340F3
        for <linux-m68k@lists.linux-m68k.org>; Tue, 15 Feb 2022 09:40:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1644918014;
        bh=hv8AUuEMkapI1zY2x6Wj+fHd7ew8TaKYgsOBPTPrxmw=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=VHH7CU79U316XDMWHeHJ8++Eh1MMKITXbQSzlZ0DrA6kWekzDktkCy5KhY7hZLGK7
         gfiQHmPbEC7L4AF+NDTP3++2HyxQqgay+CXVkTp1m9wIZSWiRsxhjEsRH76HB3HAb3
         /5H0IwFoMYLMdcVT0XuD8P6Vw9GPBTkN9xgNY7hhrRN337S5eN73tDcRKRPLMOcNTg
         NXwi07ICMcsXTT77IYOqmuFqUW8m3AaA+2IJmg2fkpra1D1NcZ3zVXZBTrXdEvv5Oq
         0XRwvrersUnw/PUKjeaOsXZQOemvEGElTmz0nKHB8fy3fN/J5cS0vZm5lHkoOpeHoi
         hdacTJ8dWWJzg==
Received: by mail-wm1-f45.google.com with SMTP id x3-20020a05600c21c300b0037c01ad715bso1016946wmj.2
        for <linux-m68k@lists.linux-m68k.org>; Tue, 15 Feb 2022 01:40:14 -0800 (PST)
X-Gm-Message-State: AOAM531GtZkLNeZ7s1AWgSDxNkEGHJqYe7Rmp/BRF4dYZA/pmwqHH0YF
        3LyWGAjB4Z9IxDWae6VgDTd9uxcwOh9NnuP1wy8=
X-Google-Smtp-Source: ABdhPJxpFSyo2tIfVZXx6xnWqAN7kXzL0SfiKGeaqLH7fIF3GRmujo8Iug1QC1Z1ypgNgRnGoRSGx0exr14yXtWS6QY=
X-Received: by 2002:a05:600c:1d27:b0:37c:74bb:2b4d with SMTP id
 l39-20020a05600c1d2700b0037c74bb2b4dmr2314325wms.82.1644918002508; Tue, 15
 Feb 2022 01:40:02 -0800 (PST)
MIME-Version: 1.0
References: <20220214163452.1568807-1-arnd@kernel.org> <20220214163452.1568807-9-arnd@kernel.org>
 <CAMj1kXHixUFjV=4m3tzfGz7AiRWc-VczymbKuZq7dyZZNuLKxQ@mail.gmail.com>
 <CAK8P3a2VfvDkueaJNTA9SiB+PFsi_Q17AX+aL46ueooW2ahmQw@mail.gmail.com> <CAMj1kXGkG0KMD2rnKAJc3V7X9LP1grbcHTNYMnj_q4GiYfG2pQ@mail.gmail.com>
In-Reply-To: <CAMj1kXGkG0KMD2rnKAJc3V7X9LP1grbcHTNYMnj_q4GiYfG2pQ@mail.gmail.com>
From:   Arnd Bergmann <arnd@kernel.org>
Date:   Tue, 15 Feb 2022 10:39:46 +0100
X-Gmail-Original-Message-ID: <CAK8P3a0NTqK_m7q909d8FN6is8k4_u3zeckC9XOrjEi7kqSvmg@mail.gmail.com>
Message-ID: <CAK8P3a0NTqK_m7q909d8FN6is8k4_u3zeckC9XOrjEi7kqSvmg@mail.gmail.com>
Subject: Re: [PATCH 08/14] arm64: simplify access_ok()
To:     Ard Biesheuvel <ardb@kernel.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Christoph Hellwig <hch@lst.de>,
        linux-arch <linux-arch@vger.kernel.org>,
        Linux Memory Management List <linux-mm@kvack.org>,
        Linux API <linux-api@vger.kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Russell King <linux@armlinux.org.uk>,
        Will Deacon <will@kernel.org>, Guo Ren <guoren@kernel.org>,
        Brian Cain <bcain@codeaurora.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Michal Simek <monstr@monstr.eu>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Nick Hu <nickhu@andestech.com>,
        Greentime Hu <green.hu@gmail.com>,
        Dinh Nguyen <dinguyen@kernel.org>,
        Stafford Horne <shorne@gmail.com>,
        Helge Deller <deller@gmx.de>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@redhat.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Heiko Carstens <hca@linux.ibm.com>,
        Rich Felker <dalias@libc.org>,
        "David S. Miller" <davem@davemloft.net>,
        Richard Weinberger <richard@nod.at>, X86 ML <x86@kernel.org>,
        Max Filippov <jcmvbkbc@gmail.com>,
        "Eric W. Biederman" <ebiederm@xmission.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        alpha <linux-alpha@vger.kernel.org>,
        "open list:SYNOPSYS ARC ARCHITECTURE" 
        <linux-snps-arc@lists.infradead.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-csky@vger.kernel.org,
        "open list:QUALCOMM HEXAGON..." <linux-hexagon@vger.kernel.org>,
        linux-ia64@vger.kernel.org,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        "open list:MIPS" <linux-mips@vger.kernel.org>,
        Openrisc <openrisc@lists.librecores.org>,
        "open list:PARISC ARCHITECTURE" <linux-parisc@vger.kernel.org>,
        "open list:LINUX FOR POWERPC (32-BIT AND 64-BIT)" 
        <linuxppc-dev@lists.ozlabs.org>,
        linux-riscv <linux-riscv@lists.infradead.org>,
        "open list:S390" <linux-s390@vger.kernel.org>,
        Linux-sh list <linux-sh@vger.kernel.org>,
        "open list:SPARC + UltraSPARC (sparc/sparc64)" 
        <sparclinux@vger.kernel.org>,
        linux-um <linux-um@lists.infradead.org>,
        "open list:TENSILICA XTENSA PORT (xtensa)" 
        <linux-xtensa@linux-xtensa.org>,
        Robin Murphy <robin.murphy@arm.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Tue, Feb 15, 2022 at 10:21 AM Ard Biesheuvel <ardb@kernel.org> wrote:
> On Tue, 15 Feb 2022 at 10:13, Arnd Bergmann <arnd@kernel.org> wrote:
>
> arm64 also has this leading up to the range check, and I think we'd no
> longer need it:
>
>     if (IS_ENABLED(CONFIG_ARM64_TAGGED_ADDR_ABI) &&
>         (current->flags & PF_KTHREAD || test_thread_flag(TIF_TAGGED_ADDR)))
>             addr = untagged_addr(addr);

I suspect the expensive part here is checking the two flags, as untagged_addr()
seems to always just add a sbfx instruction. Would this work?

#ifdef CONFIG_ARM64_TAGGED_ADDR_ABI
#define access_ok(ptr, size) __access_ok(untagged_addr(ptr), (size))
#else // the else path is the default, this can be left out.
#define access_ok(ptr, size) __access_ok((ptr), (size))
#endif

       Arnd
