Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4EFCC07E9D
	for <linux-m68k@archiver.kernel.org>; Fri, 23 Sep 2022 17:03:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231281AbiIWRDk (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Fri, 23 Sep 2022 13:03:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34888 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231532AbiIWRDd (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Fri, 23 Sep 2022 13:03:33 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 545561497AE
        for <linux-m68k@lists.linux-m68k.org>; Fri, 23 Sep 2022 10:03:30 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 05EF3B83093
        for <linux-m68k@lists.linux-m68k.org>; Fri, 23 Sep 2022 17:03:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89E21C433D6
        for <linux-m68k@lists.linux-m68k.org>; Fri, 23 Sep 2022 17:03:27 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
        dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="pTQfPAdd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
        t=1663952606;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=HpNbwnr41Jz+qm/MSd2bLabbvT8x6BkuQby5GkCJIvQ=;
        b=pTQfPAddiSoOvjUNOnT3RewXWSHIp+xGZiXvV039SYhZB0GDiSd6TTk0HLT8mAIDyxS2gy
        JzPigJHaD2uFYitWQAodKVKHNrF1A+3M22jyQ2c7irRl2kUMP1Z8hv5hNtS8HiNOE/z1wD
        dkoYMd+tfn983i2KrJ0YlYBC6IFQCDo=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 615bd12b (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
        for <linux-m68k@lists.linux-m68k.org>;
        Fri, 23 Sep 2022 17:03:25 +0000 (UTC)
Received: by mail-vs1-f46.google.com with SMTP id q26so568160vsr.7
        for <linux-m68k@lists.linux-m68k.org>; Fri, 23 Sep 2022 10:03:25 -0700 (PDT)
X-Gm-Message-State: ACrzQf1LdiQMlVk/z5XTMyPwv02xcpDEPQFVEwC73zaHEV8iZAd01ivK
        ntYxOyvLa7Iy87c3FWuQX+vbDgDydgg3QNAdyYI=
X-Google-Smtp-Source: AMsMyM7dl3ufaa/9Eq2oIgZVdve1Nlfkzf2UvHu17kGBiltgzEkMjeSuxt+evuFSuCrwq5h9+0tdEE4Qyloc+/F2On8=
X-Received: by 2002:a67:e401:0:b0:398:89f1:492f with SMTP id
 d1-20020a67e401000000b0039889f1492fmr4255092vsf.21.1663952599078; Fri, 23 Sep
 2022 10:03:19 -0700 (PDT)
MIME-Version: 1.0
References: <20220923122830.3941367-1-Jason@zx2c4.com> <20220923122830.3941367-2-Jason@zx2c4.com>
In-Reply-To: <20220923122830.3941367-2-Jason@zx2c4.com>
From:   "Jason A. Donenfeld" <Jason@zx2c4.com>
Date:   Fri, 23 Sep 2022 19:03:07 +0200
X-Gmail-Original-Message-ID: <CAHmME9rNK_N2FnkyTBTtUP6yvb-K21BaEnKeH43pFOitihaUUw@mail.gmail.com>
Message-ID: <CAHmME9rNK_N2FnkyTBTtUP6yvb-K21BaEnKeH43pFOitihaUUw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] m68k: virt: generate new RNG seed on reboot
To:     Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

v3 on its way now with the generalization thing.
