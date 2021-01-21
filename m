Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DF4EC433E0
	for <linux-m68k@archiver.kernel.org>; Thu, 21 Jan 2021 01:46:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 12F4D23730
	for <linux-m68k@archiver.kernel.org>; Thu, 21 Jan 2021 01:46:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728075AbhAUAzz (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 20 Jan 2021 19:55:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36294 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730910AbhAUAHX (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 20 Jan 2021 19:07:23 -0500
Received: from mail-qv1-xf2b.google.com (mail-qv1-xf2b.google.com [IPv6:2607:f8b0:4864:20::f2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D42F4C0613CF
        for <linux-m68k@lists.linux-m68k.org>; Wed, 20 Jan 2021 16:06:36 -0800 (PST)
Received: by mail-qv1-xf2b.google.com with SMTP id et9so114347qvb.10
        for <linux-m68k@lists.linux-m68k.org>; Wed, 20 Jan 2021 16:06:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Xq2mU7OrVeGPTcxA188YnFoob4ru+nBZ6S/huK+o6i0=;
        b=H6+23XVfkVA18ccIGaJGJhR+g280khYkE3BxT7jrGwkiTdVD/r+g+WOjI+A8wd/HQe
         w4WRcHwotkQ6hK7UldM8ZDqP9GbBt9RidoOK7q/G9WJCuq7JbnZW3Oii2Y9FvQq3OIr0
         lLjYFFFl9Qeep2e49ViwNzpHkojD+5WIgkAn/8bWdujhIUQqRbN1+sOPy1oGS5HC9fQY
         2hj/sr5NtoKme2y3NaRAS/a79cTxaqE66Su6Az1RzRMXvoTXV1vmYcllV5t8En/kOcXU
         BmoXYba5u/UAZ1CgsJmUkQ74golR7cct+jMMWnLcFnDWFNwr8IGFsCNnRZ49RqqMkIuc
         Jhtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Xq2mU7OrVeGPTcxA188YnFoob4ru+nBZ6S/huK+o6i0=;
        b=nEA1fw4u71MmhjH0tZ3+ylww2oG/ftVpiDx+rImWMNxbQP2g9FR2lcbEk5LUMbxw2A
         OkFFtbdT1zvMngc5buuDRGI5cAwIAEHp2mC0T/6v8/JxvV8sfdAtIkLkxftGuLyIqa5X
         5z5hW7QotOQYJKd+BVjk9cVjOLOL67PogZJH9DVdjMd7hbdd/H1hdc784L2tutjHkbCC
         t7LZGRHX9m+LdvG+BFi/0HfJnwEd0LaXHt5CcNuEzfNtnFXI4dg95ae1OtTmlXXDBBun
         k0yxT4EigDsHLeIrRBlqXeVcnytNYf8LxYdlSrGzp19k16KysEG18nQyCPX/0GqpWvdg
         rPbA==
X-Gm-Message-State: AOAM5313DXJbLYwmJgFexmKrUhQBguFGMhHOB2NVReQ9WRLYvFSOOOGk
        Xl8yW3UStFb8Dxz58/NOl9XIlu0yR1FvkS1u
X-Google-Smtp-Source: ABdhPJxpoAehXDqLMJQECWz6+rWOBFDlP1o9TdiUvJhrl51jSOmANePT/DqVuAJyhHr1sxiCymASyw==
X-Received: by 2002:ad4:46a1:: with SMTP id br1mr12152632qvb.28.1611187595785;
        Wed, 20 Jan 2021 16:06:35 -0800 (PST)
Received: from localhost (d27-96-190-162.evv.wideopenwest.com. [96.27.162.190])
        by smtp.gmail.com with ESMTPSA id x28sm2235985qtv.8.2021.01.20.16.06.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Jan 2021 16:06:34 -0800 (PST)
From:   Yury Norov <yury.norov@gmail.com>
To:     linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org,
        linux-sh@vger.kernel.org, linux-arch@vger.kernel.org
Cc:     Yury Norov <yury.norov@gmail.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>, Arnd Bergmann <arnd@arndb.de>,
        Dennis Zhou <dennis@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        David Sterba <dsterba@suse.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Stefano Brivio <sbrivio@redhat.com>,
        "Ma, Jianpeng" <jianpeng.ma@intel.com>,
        Wei Yang <richard.weiyang@linux.alibaba.com>,
        Josh Poimboeuf <jpoimboe@redhat.com>,
        Rasmus Villemoes <rasmus.villemoes@prevas.dk>
Subject: [PATCH 0/6] lib/find_bit: fast path for small bitmaps
Date:   Wed, 20 Jan 2021 16:06:24 -0800
Message-Id: <20210121000630.371883-1-yury.norov@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Bitmap operations are much simpler and faster in case of small bitmaps,
whicn fit into a single word. In linux/bitmap.h we have a machinery that
allows compiler to replace actual function call with a few instructions
if bitmaps passed into the function is small and its size is known at
compile time.

find_next_*_bit() lacks this functionality; despite users will
benefit from it a lot. One important example is cpumask subsystem if
NR_CPUS <= BITS_PER_LONG. In the very best case, the compiler may replace
a find_*_bit() call for such a bitmap with a single ffs or ffz instruction.

Yury Norov (6):
  arch: rearrahge headers inclusion order in asm/bitops for m68k and sh
  bitmap: move some macros from linux/bitmap.h to linux/bitops.h
  tools: sync bitops macro definitions with the kernel
  lib: inline _find_next_bit() wrappers
  lib: add fast path for find_next_*_bit()
  lib: add fast path for find_first_*_bit() and find_last_bit()

 arch/m68k/include/asm/bitops.h    |   4 +-
 arch/sh/include/asm/bitops.h      |   3 +-
 include/asm-generic/bitops/find.h | 123 +++++++++++++++++++++++++++---
 include/asm-generic/bitops/le.h   |  45 ++++++++++-
 include/linux/bitmap.h            |  11 ---
 include/linux/bitops.h            |  23 +++---
 lib/find_bit.c                    |  68 ++---------------
 tools/include/linux/bitmap.h      |  11 ---
 tools/include/linux/bitops.h      |  11 +++
 9 files changed, 188 insertions(+), 111 deletions(-)

-- 
2.25.1

