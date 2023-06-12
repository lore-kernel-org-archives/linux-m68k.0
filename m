Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84CB0C7EE2F
	for <linux-m68k@archiver.kernel.org>; Mon, 12 Jun 2023 19:39:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230302AbjFLTjI convert rfc822-to-8bit (ORCPT
        <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 12 Jun 2023 15:39:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59140 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229513AbjFLTjG (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 12 Jun 2023 15:39:06 -0400
Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com [209.85.160.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4649AE3
        for <linux-m68k@lists.linux-m68k.org>; Mon, 12 Jun 2023 12:39:05 -0700 (PDT)
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-1a68c02553aso1419408fac.0
        for <linux-m68k@lists.linux-m68k.org>; Mon, 12 Jun 2023 12:39:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686598744; x=1689190744;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QqdHZRyf0AXNBHWGF0CLQrBOhqQeYTmWOmQD+ocjfOs=;
        b=FA0Jdb2RoDfWg6dc/uidEqxzZWZwlVraCyNdJmHV5F8j9MHfd/Op4sKPPpUH9DIrlM
         lCTXYWSyh8aQv96OIxSGjlbt6RdhRgg4ZsPgVLJRw1TRNFd4GuECOF1pz3LnkCv3Tioc
         5Xfvzyei68cwD3m4ILFDYw623LRJCOhr1o1AI6cvFdZLMjfOXNjyWA8ttscRe5snozyL
         mFA4wzI5M4e4RxNf5+qjffHvIxXTVz5b/QFgBBctCOABM2AGNYebremZpksPlxaeA4sM
         gitFxpiirapfqz/UkjkplbnJAojF+YBIHiDUxbjeljaWNRhZBSylwp94kNctJJMKi2uj
         0RIw==
X-Gm-Message-State: AC+VfDzA1Bwjb/NRcLDxR+NnhqTqAeLmI4oQfqDC0t/nYFWcqfkE+iXr
        cFEmZ/JLopf8SxVXQAS5TJkF261BVwLJzg==
X-Google-Smtp-Source: ACHHUZ7ZM0+qHW66gUDD5K/oziDaxPoExY85Q/Tiqd3IayqAgcvAhs7BmHRTTeKh+pYYD7LtJtaThw==
X-Received: by 2002:a05:6808:148b:b0:398:4ad8:5ce6 with SMTP id e11-20020a056808148b00b003984ad85ce6mr6623980oiw.30.1686598744246;
        Mon, 12 Jun 2023 12:39:04 -0700 (PDT)
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com. [209.85.210.44])
        by smtp.gmail.com with ESMTPSA id p186-20020acad8c3000000b0039cbfd4f708sm2334046oig.53.2023.06.12.12.39.02
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Jun 2023 12:39:03 -0700 (PDT)
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-6b29b9f5a94so2878188a34.2
        for <linux-m68k@lists.linux-m68k.org>; Mon, 12 Jun 2023 12:39:02 -0700 (PDT)
X-Received: by 2002:a05:6358:c6a9:b0:12b:db2f:9d2b with SMTP id
 fe41-20020a056358c6a900b0012bdb2f9d2bmr2288064rwb.22.1686598742584; Mon, 12
 Jun 2023 12:39:02 -0700 (PDT)
MIME-Version: 1.0
References: <20230612172805.681179-1-eric.devolder@oracle.com> <20230612172805.681179-8-eric.devolder@oracle.com>
In-Reply-To: <20230612172805.681179-8-eric.devolder@oracle.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 12 Jun 2023 21:38:50 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXAbRVALNVwFhO1S3zsOuVj7OidEF8=0K=qQ-kFn6JQiA@mail.gmail.com>
Message-ID: <CAMuHMdXAbRVALNVwFhO1S3zsOuVj7OidEF8=0K=qQ-kFn6JQiA@mail.gmail.com>
Subject: Re: [PATCH v1 07/21] m68k/kexec: refactor for kernel/Kconfig.kexec
To:     Eric DeVolder <eric.devolder@oracle.com>
Cc:     linux@armlinux.org.uk, catalin.marinas@arm.com, will@kernel.org,
        chenhuacai@kernel.org, tsbogend@alpha.franken.de,
        James.Bottomley@hansenpartnership.com, deller@gmx.de,
        ysato@users.sourceforge.jp, dalias@libc.org,
        glaubitz@physik.fu-berlin.de, tglx@linutronix.de, mingo@redhat.com,
        bp@alien8.de, dave.hansen@linux.intel.com, 86@kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-ia64@vger.kernel.org, loongarch@lists.linux.dev,
        linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
        linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
        linux-sh@vger.kernel.org, kernel@xen0n.name, mpe@ellerman.id.au,
        npiggin@gmail.com, christophe.leroy@csgroup.eu,
        paul.walmsley@sifive.com, palmer@dabbelt.com,
        aou@eecs.berkeley.edu, hca@linux.ibm.com, gor@linux.ibm.com,
        agordeev@linux.ibm.com, borntraeger@linux.ibm.com,
        svens@linux.ibm.com, hpa@zytor.com, keescook@chromium.org,
        paulmck@kernel.org, peterz@infradead.org, frederic@kernel.org,
        akpm@linux-foundation.org, ardb@kernel.org,
        samitolvanen@google.com, juerg.haefliger@canonical.com,
        arnd@arndb.de, rmk+kernel@armlinux.org.uk,
        linus.walleij@linaro.org, sebastian.reichel@collabora.com,
        rppt@kernel.org, kirill.shutemov@linux.intel.com,
        anshuman.khandual@arm.com, ziy@nvidia.com, masahiroy@kernel.org,
        ndesaulniers@google.com, mhiramat@kernel.org, ojeda@kernel.org,
        thunder.leizhen@huawei.com, xin3.li@intel.com, tj@kernel.org,
        gregkh@linuxfoundation.org, tsi@tuyoix.net, bhe@redhat.com,
        hbathini@linux.ibm.com, sourabhjain@linux.ibm.com,
        boris.ostrovsky@oracle.com, konrad.wilk@oracle.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Mon, Jun 12, 2023 at 7:29 PM Eric DeVolder <eric.devolder@oracle.com> wrote:
> The kexec and crash kernel options are provided in the common
> kernel/Kconfig.kexec. Utilize the common options and provide
> the ARCH_HAS_ and ARCH_SUPPORTS_ entries to recreate the
> equivalent set of KEXEC and CRASH options.
>
> Signed-off-by: Eric DeVolder <eric.devolder@oracle.com>

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
