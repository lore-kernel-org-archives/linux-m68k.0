Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DDCAC6FA93
	for <linux-m68k@archiver.kernel.org>; Mon, 26 Sep 2022 13:34:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233958AbiIZNeh (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 26 Sep 2022 09:34:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236024AbiIZNeD (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 26 Sep 2022 09:34:03 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3589115A4B
        for <linux-m68k@lists.linux-m68k.org>; Mon, 26 Sep 2022 04:56:06 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id A19E9B8013C
        for <linux-m68k@lists.linux-m68k.org>; Mon, 26 Sep 2022 11:46:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1CF2EC433D7
        for <linux-m68k@lists.linux-m68k.org>; Mon, 26 Sep 2022 11:46:22 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
        dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="nm0L9oJ5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
        t=1664192780;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=jHNGGRe1TromFFFBH3OpxnVB5tKa5alzKGJvoaMvcEY=;
        b=nm0L9oJ5I9cC2TmgpQVkXAVSfSao4anDKOq7UYAQTVObXCgk8Tu9ubsgRuJD7N9EqvXd7l
        wprlfeQlxejkmkfX7Lqeo8vZRtEgAmx44mbYhnszpn0PPbOYBPvWZ55nESwAJ+yRqi2FvJ
        FA5o7WEctrS1JdlMzi8pGyvNAR2yiHE=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 35466582 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
        for <linux-m68k@lists.linux-m68k.org>;
        Mon, 26 Sep 2022 11:46:20 +0000 (UTC)
Received: by mail-ua1-f52.google.com with SMTP id p89so2312588uap.12
        for <linux-m68k@lists.linux-m68k.org>; Mon, 26 Sep 2022 04:46:19 -0700 (PDT)
X-Gm-Message-State: ACrzQf2pWpU1ebmorh7ocguh2iJoU7mxX1qOQHjh9L4YXBZUcmlpHVDm
        a3w7Y7GlrQIpWJlXALitSPEEWy547ow31o12sig=
X-Google-Smtp-Source: AMsMyM4KlAd3EsRdEc8A1rpXIjFOkfSxQ13zAVspNtB6pBLDTSnAUkKusMVlB92N3nyATxbW0sly8HQt7PVUeAw8BoM=
X-Received: by 2002:ab0:6035:0:b0:3bf:2e26:699 with SMTP id
 n21-20020ab06035000000b003bf2e260699mr8774975ual.102.1664192778910; Mon, 26
 Sep 2022 04:46:18 -0700 (PDT)
MIME-Version: 1.0
References: <CAHmME9q==_BaqaYR-H68Tzxppbme33bb4fSrU57BVGzk_oBq5g@mail.gmail.com>
In-Reply-To: <CAHmME9q==_BaqaYR-H68Tzxppbme33bb4fSrU57BVGzk_oBq5g@mail.gmail.com>
From:   "Jason A. Donenfeld" <Jason@zx2c4.com>
Date:   Mon, 26 Sep 2022 13:46:08 +0200
X-Gmail-Original-Message-ID: <CAHmME9ooqESMd4Hb_=KTSuYqiDNm3akojo_CdWW6fgd-+J+ZWA@mail.gmail.com>
Message-ID: <CAHmME9ooqESMd4Hb_=KTSuYqiDNm3akojo_CdWW6fgd-+J+ZWA@mail.gmail.com>
Subject: Re: rubric to the m68k rng seed rework
To:     Laurent Vivier <laurent@vivier.eu>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-m68k <linux-m68k@lists.linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hey again,

New patches posted, so updating this map.

v4 of the kernel side:
- https://lore.kernel.org/lkml/20220926113754.1256358-1-Jason@zx2c4.com/
- https://lore.kernel.org/lkml/20220926113754.1256358-2-Jason@zx2c4.com/
- https://lore.kernel.org/lkml/20220926113754.1256358-3-Jason@zx2c4.com/

v2 of kexec-tools remains the same:
- https://lore.kernel.org/kexec/20220923164152.4079868-1-Jason@zx2c4.com/

v2 of qemu is now a two parter:
- https://lore.kernel.org/qemu-devel/20220926113900.1256630-1-Jason@zx2c4.com/
- https://lore.kernel.org/qemu-devel/20220926113900.1256630-2-Jason@zx2c4.com/

Thanks,
Jason

[PS: As I write this, Greg KH is in the midst of patchbombing vger, so
lore might take a little bit to get those messages. If it says not
found, refresh.]
