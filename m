Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0FF5C433E9
	for <linux-m68k@archiver.kernel.org>; Fri, 29 Jan 2021 20:46:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7BC0564E05
	for <linux-m68k@archiver.kernel.org>; Fri, 29 Jan 2021 20:46:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233247AbhA2UqY (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Fri, 29 Jan 2021 15:46:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233214AbhA2UqO (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Fri, 29 Jan 2021 15:46:14 -0500
Received: from mail-qv1-xf29.google.com (mail-qv1-xf29.google.com [IPv6:2607:f8b0:4864:20::f29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1628DC061574
        for <linux-m68k@lists.linux-m68k.org>; Fri, 29 Jan 2021 12:45:34 -0800 (PST)
Received: by mail-qv1-xf29.google.com with SMTP id a1so5097060qvd.13
        for <linux-m68k@lists.linux-m68k.org>; Fri, 29 Jan 2021 12:45:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GKOpnXxDr9dCifdGlykAdjfxcEels+yZrBFyjGlcvhs=;
        b=qplpwATB3theU+9FpF0Z/kz4ECrFxRbcM4pQhO/uvuSh1dnspRFP21c5BIQZc5o28n
         bEiXQo3gNnR1nSLbW6vUi3Zd+91SEj+7imh7NsmWCDFYsr4fVZHzhAcjKT53DJQOjDnv
         xpQd5EgC1rpNHxd5ZBp7MYIvbUgyrQk4lAxa/OmAl2QI5tZdidWi9G3ErCfYx67hdGpx
         dGKDWClcVIseJB7npMrHMgh5SbnsRrMdxDR17UoO3HKQlVCll70IQfj0Ab4c+E4U/5GW
         BwB5uyd1LvdMyVLlQ8rSIJ6hMaxPzyXWeAdmXKS0HuFr3pP+RiLCQ6ky6romzB6jfQUm
         39hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GKOpnXxDr9dCifdGlykAdjfxcEels+yZrBFyjGlcvhs=;
        b=g6W4Guhwy7Y5u/wUpcHbnIif07Ct2l6UJy8kJ8J9/O32cUO6GeNknrz0lezygsKIdr
         XW5pkefJritxemVbge0o/w/2OM44v+vEtssuImqpURM2M9ri2LXgVNzhvZsPxKA7YsMr
         3lPs7eOrb2rhzvEoHOsXMbxBO016ArN+Ik3XHko6/L1fkwE14IVaV+m069//0j8TZ8LZ
         2W6gXP+vgKxlP9AsRt2fdEW3PexbKE1eyaT+mURFBX5tN1OZqYVGnf/bka99TsCEFKMH
         aLFC84hVTCagZYMAMXc6qtsgjTsmhGvuihCIrTKz+PIemUS+QDVujgt5VVH/AmaSM+82
         dsFQ==
X-Gm-Message-State: AOAM531BN/pofkNgfn/a+Azm80jbjtSZtZqyX5ky20gULUzN8YtRgOs9
        pjzwBsDjRI5OhGm/GGmwluZW+ziZ6lbpWQ0S
X-Google-Smtp-Source: ABdhPJwUVBZVUjUsFOW7DwUiH6eCLcAvboAf+Eo4Bsra3y+Eldyw4QwDTJpYTjT/FDUwWwJ4+CcZwg==
X-Received: by 2002:a05:6214:10e7:: with SMTP id q7mr5985349qvt.28.1611953132827;
        Fri, 29 Jan 2021 12:45:32 -0800 (PST)
Received: from localhost (d27-96-190-162.evv.wideopenwest.com. [96.27.162.190])
        by smtp.gmail.com with ESMTPSA id p23sm7013359qtu.4.2021.01.29.12.45.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Jan 2021 12:45:32 -0800 (PST)
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
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Subject: [PATCH 0/6] lib/find_bit: fast path for small bitmaps
Date:   Fri, 29 Jan 2021 12:45:22 -0800
Message-Id: <20210129204528.2118168-1-yury.norov@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Bitmap operations are much simpler and faster in case of small bitmaps, whicn
fit into a single word. In linux/bitmap.h we have a machinery that allows
compiler to replace actual function call with a few instructions if bitmaps
passed into the function is small and its size is known at compile time.

find_*_bit() API lacks this functionality; despite users will benefit from it
a lot. One important example is cpumask subsystem, when NR_CPUS <= BITS_PER_LONG.
In the very best case, the compiler may replace a find_*_bit() call for such a
bitmap with a single ffs or ffz instruction.

Tools is synchronized with new implementation where needed.

Yury Norov (6):
  arch: rearrange headers inclusion order in asm/bitops for m68k and sh
  lib: inttroduce BITS_{FIRST,LAST}() macro
  bits_per_long.h: introduce SMALL_CONST() macro
  lib: inline _find_next_bit() wrappers
  lib: add fast path for find_next_*_bit()
  lib: add fast path for find_first_*_bit() and find_last_bit()

 arch/m68k/include/asm/bitops.h          |   4 +-
 arch/sh/include/asm/bitops.h            |   3 +-
 include/asm-generic/bitops/find.h       | 108 +++++++++++++++++++++---
 include/asm-generic/bitops/le.h         |  38 ++++++++-
 include/asm-generic/bitsperlong.h       |   2 +
 include/linux/bitmap.h                  |  60 ++++++-------
 include/linux/bitops.h                  |  12 ---
 include/linux/bits.h                    |   6 ++
 include/linux/cpumask.h                 |   8 +-
 include/linux/netdev_features.h         |   2 +-
 include/linux/nodemask.h                |   2 +-
 lib/bitmap.c                            |  26 +++---
 lib/find_bit.c                          |  72 +++-------------
 lib/genalloc.c                          |   8 +-
 tools/include/asm-generic/bitops/find.h |  85 +++++++++++++++++--
 tools/include/asm-generic/bitsperlong.h |   2 +
 tools/include/linux/bitmap.h            |  39 +++------
 tools/include/linux/bits.h              |   6 ++
 tools/lib/bitmap.c                      |   6 +-
 tools/lib/find_bit.c                    |  56 +++++-------
 tools/testing/radix-tree/bitmap.c       |   4 +-
 21 files changed, 330 insertions(+), 219 deletions(-)

-- 
2.25.1

