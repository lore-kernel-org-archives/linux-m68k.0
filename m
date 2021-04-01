Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F31BC43470
	for <linux-m68k@archiver.kernel.org>; Thu,  1 Apr 2021 00:33:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7178561055
	for <linux-m68k@archiver.kernel.org>; Thu,  1 Apr 2021 00:33:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232789AbhDAAc1 (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 31 Mar 2021 20:32:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229497AbhDAAb5 (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 31 Mar 2021 20:31:57 -0400
Received: from mail-qk1-x729.google.com (mail-qk1-x729.google.com [IPv6:2607:f8b0:4864:20::729])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC9A6C061574
        for <linux-m68k@lists.linux-m68k.org>; Wed, 31 Mar 2021 17:31:56 -0700 (PDT)
Received: by mail-qk1-x729.google.com with SMTP id g20so694227qkk.1
        for <linux-m68k@lists.linux-m68k.org>; Wed, 31 Mar 2021 17:31:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xAzR599KcHkusYoyCthJWRSJNTrJEZGLzRzijIZ9dFE=;
        b=mhuW/MeabnwhqQYOyf8XV26ZlwLE30jHJU75sgwXu1nfJEc6aGKB4JRQ9a6rwz48U4
         FZcx6tR9M6Q/LcMAyhzcrQN+66ysXYrIG/uAKjTwOHUK1WmuAKSt+yEKxv8bAAL2dqC1
         SOln3kJMVpi8mnbuQrXqthsSYsWzRr+6BM706FNiNIK8NTR2UuNSRo3vH0CvhaWaUFqB
         EkABBCP/9i0wK4xcXTk+VktHjZxLqOLzh8DLcCHi8WiwATYqyad7mewkKMfY2K2KIMsR
         XIjlsQv1ZoITbPYMOldyTQjLz8jXTMyZH9AzEdP0/eedvhs74ndrEGlpEWJC9QLsoWy1
         LCdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xAzR599KcHkusYoyCthJWRSJNTrJEZGLzRzijIZ9dFE=;
        b=niJp+wKN+5XLxWSZl4JEXKdTzBX3pfKQXnhJamqs1esyrhybsudrXQYevFPKESBuDH
         0kFvnXdXpoE1HubSc+rWrJ7LUECMhSqtVlzOzLorr5Op3XkrPSQrGo1l2/410UoPxcxj
         ZZzaUjU811evxHzPlfBx7U5/RJW8TDTouRjuGGSLHDC8s8sCvWxMyX34JFMigccoyVYr
         Ao7TdWYmRv7bSn160kSBwG5DfGxdVhbW+FLtCsvkGLqWTUQyRTEPAu89/DlLBjCe6RL0
         AIXmkOi+J4LhCR4Re0Yo+xsmd+FGKft02WlC0WsFLtPgiC8NBRDV9LuY8Z3aQkj6hARs
         4olw==
X-Gm-Message-State: AOAM530kOr23jNIseKpFRYtMKdPQ/I39cEc2Nz5HEMOUtTJ91517+HBF
        X1oHxouFfTtStglqT6vTi80=
X-Google-Smtp-Source: ABdhPJz9v+FUdEs6QVK6GkaNRvP4kGDk4YpDXylnYHJAY3NLL90tbfcCQt/E63mmkxQrhbOyMYmQlQ==
X-Received: by 2002:a37:4017:: with SMTP id n23mr5587255qka.338.1617237115772;
        Wed, 31 Mar 2021 17:31:55 -0700 (PDT)
Received: from localhost ([207.98.216.60])
        by smtp.gmail.com with ESMTPSA id p66sm2762108qka.108.2021.03.31.17.31.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Mar 2021 17:31:55 -0700 (PDT)
From:   Yury Norov <yury.norov@gmail.com>
To:     linux-kernel@vger.kernel.org,
        Andrew Morton <akpm@linux-foundation.org>
Cc:     Yury Norov <yury.norov@gmail.com>, linux-m68k@lists.linux-m68k.org,
        linux-arch@vger.kernel.org, linux-sh@vger.kernel.org,
        Alexey Klimov <aklimov@redhat.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Arnd Bergmann <arnd@arndb.de>, David Sterba <dsterba@suse.com>,
        Dennis Zhou <dennis@kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Jianpeng Ma <jianpeng.ma@intel.com>,
        Joe Perches <joe@perches.com>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        Josh Poimboeuf <jpoimboe@redhat.com>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Rich Felker <dalias@libc.org>,
        Stefano Brivio <sbrivio@redhat.com>,
        Wei Yang <richard.weiyang@linux.alibaba.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Yoshinori Sato <ysato@users.sourceforge.jp>
Subject: [PATCH v6 00/12] lib/find_bit: fast path for small bitmaps
Date:   Wed, 31 Mar 2021 17:31:41 -0700
Message-Id: <20210401003153.97325-1-yury.norov@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Bitmap operations are much simpler and faster in case of small bitmaps
which fit into a single word. In linux/bitmap.c we have a machinery that
allows compiler to replace actual function call with a few instructions
if bitmaps passed into the function are small and their size is known at
compile time.

find_*_bit() API lacks this functionality; but users will benefit from it
a lot. One important example is cpumask subsystem when
NR_CPUS <= BITS_PER_LONG.

v6 is mostly a resend. The only change comparing to v5 is a fix of
small_const_nbits() synchronization patch.

v1: https://www.spinics.net/lists/kernel/msg3804727.html
v2: https://www.spinics.net/lists/linux-m68k/msg16945.html
v3: https://www.spinics.net/lists/kernel/msg3837020.html
v4: https://patchwork.kernel.org/project/linux-sh/cover/20210316015424.1999082-1-yury.norov@gmail.com/
v5: https://lore.kernel.org/linux-arch/20210321215457.588554-1-yury.norov@gmail.com/T/
v6: - sync small_const_nbits() properly (patch 6).
    - Rasmus' ack added.

Yury Norov (12):
  tools: disable -Wno-type-limits
  tools: bitmap: sync function declarations with the kernel
  tools: sync BITMAP_LAST_WORD_MASK() macro with the kernel
  arch: rearrange headers inclusion order in asm/bitops for m68k and sh
  lib: extend the scope of small_const_nbits() macro
  tools: sync small_const_nbits() macro with the kernel
  lib: inline _find_next_bit() wrappers
  tools: sync find_next_bit implementation
  lib: add fast path for find_next_*_bit()
  lib: add fast path for find_first_*_bit() and find_last_bit()
  tools: sync lib/find_bit implementation
  MAINTAINERS: Add entry for the bitmap API

 MAINTAINERS                             |  16 ++++
 arch/m68k/include/asm/bitops.h          |   6 +-
 arch/sh/include/asm/bitops.h            |   5 +-
 include/asm-generic/bitops/find.h       | 108 +++++++++++++++++++++---
 include/asm-generic/bitops/le.h         |  38 ++++++++-
 include/asm-generic/bitsperlong.h       |  12 +++
 include/linux/bitmap.h                  |   8 --
 include/linux/bitops.h                  |  12 ---
 lib/find_bit.c                          |  68 ++-------------
 tools/include/asm-generic/bitops/find.h |  85 +++++++++++++++++--
 tools/include/asm-generic/bitsperlong.h |   3 +
 tools/include/linux/bitmap.h            |  18 ++--
 tools/lib/bitmap.c                      |   4 +-
 tools/lib/find_bit.c                    |  56 +++++-------
 tools/scripts/Makefile.include          |   1 +
 15 files changed, 284 insertions(+), 156 deletions(-)

-- 
2.25.1

