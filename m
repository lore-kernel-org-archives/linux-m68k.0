Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42AD7C07E9D
	for <linux-m68k@archiver.kernel.org>; Fri, 23 Sep 2022 17:12:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232518AbiIWRMs (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Fri, 23 Sep 2022 13:12:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49570 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232021AbiIWRM3 (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Fri, 23 Sep 2022 13:12:29 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A87E915444F
        for <linux-m68k@lists.linux-m68k.org>; Fri, 23 Sep 2022 10:11:35 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 3CA3BB82304
        for <linux-m68k@lists.linux-m68k.org>; Fri, 23 Sep 2022 17:11:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC1DAC433D6
        for <linux-m68k@lists.linux-m68k.org>; Fri, 23 Sep 2022 17:11:32 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
        dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="PV/5El3r"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
        t=1663953090;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type;
        bh=KLKLLgHnK0DaJqvxNAHiq3up6fw3GLz66Aj1OvzMxNE=;
        b=PV/5El3rTnSspK9PBw8rtB69Gka+5iC76+9PLmMdklTtcVgoW10Xum5qGMuLVmzbCn+i+n
        JL1umGEdKmV3kWpkkQt7w2jorUqjxsY/Vq1L5c3NxeqZ4urSdvlO4FH10BHrRij4U36IAe
        WDRAIxb1Dimh/AkSIGRtb5kB5sbiyPA=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 95bb8c7f (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
        for <linux-m68k@lists.linux-m68k.org>;
        Fri, 23 Sep 2022 17:11:30 +0000 (UTC)
Received: by mail-ua1-f50.google.com with SMTP id p89so299994uap.12
        for <linux-m68k@lists.linux-m68k.org>; Fri, 23 Sep 2022 10:11:30 -0700 (PDT)
X-Gm-Message-State: ACrzQf3WCeDu4B5WN+XT+klW2xZvWcbg1tQYCZeSIUTgMs5QymgkzTBl
        CeGGwEThlfRCb3q+x5t4wxA0ShHCAKM+cLR0Syo=
X-Google-Smtp-Source: AMsMyM6iHu2jY5/5uAWikYvR+ubDXeAhHDSJX+XaeT+OB6liw1bT48nKkGuzcHpztooPF4eM6byFUKhGToM3ypGuDyE=
X-Received: by 2002:ab0:6154:0:b0:398:c252:23d8 with SMTP id
 w20-20020ab06154000000b00398c25223d8mr4331827uan.65.1663953089294; Fri, 23
 Sep 2022 10:11:29 -0700 (PDT)
MIME-Version: 1.0
From:   "Jason A. Donenfeld" <Jason@zx2c4.com>
Date:   Fri, 23 Sep 2022 19:11:18 +0200
X-Gmail-Original-Message-ID: <CAHmME9q==_BaqaYR-H68Tzxppbme33bb4fSrU57BVGzk_oBq5g@mail.gmail.com>
Message-ID: <CAHmME9q==_BaqaYR-H68Tzxppbme33bb4fSrU57BVGzk_oBq5g@mail.gmail.com>
Subject: rubric to the m68k rng seed rework
To:     Laurent Vivier <laurent@vivier.eu>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-m68k <linux-m68k@lists.linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hey Geert & Laurent,

I just sent a flurry of commits, which might be confusing. Here's the map:

v3 of my reboot set now has the BI_VIRT_RNG_SEED->BI_RNG_SEED change
in it as patch 3 of 3:
- https://lore.kernel.org/lkml/20220923170340.4099226-1-Jason@zx2c4.com/
- https://lore.kernel.org/lkml/20220923170340.4099226-2-Jason@zx2c4.com/
- https://lore.kernel.org/lkml/20220923170340.4099226-3-Jason@zx2c4.com/

v2 of my kexec-tools patch now uses BI_RNG_SEED:
- https://lore.kernel.org/kexec/20220923164152.4079868-1-Jason@zx2c4.com/
(This needs to be compile tested.)

And now there's a qemu patch to make it work over there:
- https://lore.kernel.org/qemu-devel/20220923170637.4099736-1-Jason@zx2c4.com/
I've verified this works well.

Hope this helps explain your current inbox. Please commit these!

Thanks,
Jason
