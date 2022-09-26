Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54FE2C6FA86
	for <linux-m68k@archiver.kernel.org>; Mon, 26 Sep 2022 13:07:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235488AbiIZNHm (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 26 Sep 2022 09:07:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55334 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235112AbiIZNHV (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 26 Sep 2022 09:07:21 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F020754CA2
        for <linux-m68k@lists.linux-m68k.org>; Mon, 26 Sep 2022 04:38:04 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 64A7560B2F
        for <linux-m68k@lists.linux-m68k.org>; Mon, 26 Sep 2022 11:37:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BEB5C433C1
        for <linux-m68k@lists.linux-m68k.org>; Mon, 26 Sep 2022 11:37:01 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
        dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="Hwf952TM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
        t=1664192220;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=0zXQQXhCqwhsaxCCEPdCRlZoB3PvoQf9Fi0hF1JYE9E=;
        b=Hwf952TMQ/d/IQyCcErjpTeYp/aueT0eDggn5AN9TEHFeV8gt3P+1dcMDJz6cE0DO+lcEJ
        stkD/9J4DVrg6FsnwWLU+GKfu64p1l6XcYDaTgg6d/6sS5sCddUh4G+9JJlzelxtMGvn8Z
        EqaMzVn18MMOHnpFZVvbpqWximA/y5I=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id f63faa41 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
        for <linux-m68k@lists.linux-m68k.org>;
        Mon, 26 Sep 2022 11:36:59 +0000 (UTC)
Received: by mail-vs1-f51.google.com with SMTP id 63so6243300vse.2
        for <linux-m68k@lists.linux-m68k.org>; Mon, 26 Sep 2022 04:36:59 -0700 (PDT)
X-Gm-Message-State: ACrzQf2X32gkn0yx73qDYD5YGsQJ7qUGzOjih1zZppfXcu1Id13MQ46D
        Y5ScEOukW8JOoVar4kzoMCBaxCKqQ+st5Bj9PTo=
X-Google-Smtp-Source: AMsMyM7AFryVAOqJzAt+m7xpXl8z6L1FZ1Ttvzd2rwSq5O9GzfWd23cBRh79WuhVVUkJEY8QBXprdxdYeak4WR1Ix7c=
X-Received: by 2002:a67:d81e:0:b0:398:2c98:229b with SMTP id
 e30-20020a67d81e000000b003982c98229bmr7963486vsj.73.1664192218723; Mon, 26
 Sep 2022 04:36:58 -0700 (PDT)
MIME-Version: 1.0
References: <20220923170340.4099226-1-Jason@zx2c4.com> <20220923170340.4099226-3-Jason@zx2c4.com>
 <CAMuHMdXPcXq_F0dQdJ5nV2io1eDhJs7BZf+TmXWPqGVn9xeLNA@mail.gmail.com> <YzGIO4IK9WXFyXsD@zx2c4.com>
In-Reply-To: <YzGIO4IK9WXFyXsD@zx2c4.com>
From:   "Jason A. Donenfeld" <Jason@zx2c4.com>
Date:   Mon, 26 Sep 2022 13:36:47 +0200
X-Gmail-Original-Message-ID: <CAHmME9oTruc1eyBGGWmsGnnXOU1_xXi=MiM5V3fHTFBKCX30Mw@mail.gmail.com>
Message-ID: <CAHmME9oTruc1eyBGGWmsGnnXOU1_xXi=MiM5V3fHTFBKCX30Mw@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] m68k: rework BI_VIRT_RNG_SEED as BI_RNG_SEED
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org,
        Laurent Vivier <laurent@vivier.eu>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Okay v4 on its way now. Also updating the qemu patch to fix the bug you found.
