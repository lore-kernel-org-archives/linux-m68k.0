Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6D2CC07E9D
	for <linux-m68k@archiver.kernel.org>; Tue, 27 Sep 2022 13:13:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232445AbiI0NN6 (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 27 Sep 2022 09:13:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56782 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232531AbiI0NNf (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 27 Sep 2022 09:13:35 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C310B1893B5
        for <linux-m68k@lists.linux-m68k.org>; Tue, 27 Sep 2022 06:13:10 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id C0ADFB819D6
        for <linux-m68k@lists.linux-m68k.org>; Tue, 27 Sep 2022 13:13:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C973C433D6
        for <linux-m68k@lists.linux-m68k.org>; Tue, 27 Sep 2022 13:13:00 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
        dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="pxJWXHl5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
        t=1664284378;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=bRnR9flE68otiWXlR8Xn6O6TiRVSaIGTNBL+SYU+R2M=;
        b=pxJWXHl5PZDlglRhsyi8niow5QUjq241SOuoyMlDVbkw6YBg4G0TQIRh7kpQ28T22Lmgsz
        j7M/bm8cbHo0N8KeTxPyAOwDqY1C5qcqsht3xWLikybL8qoNuLiYcb8cuKCDDJigPvKtPI
        hGG24zwUvoUQDYFNU33mx3YiY4OuVF8=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id e7aaa723 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
        for <linux-m68k@lists.linux-m68k.org>;
        Tue, 27 Sep 2022 13:12:57 +0000 (UTC)
Received: by mail-vk1-f181.google.com with SMTP id s192so4897796vkb.9
        for <linux-m68k@lists.linux-m68k.org>; Tue, 27 Sep 2022 06:12:57 -0700 (PDT)
X-Gm-Message-State: ACrzQf3NJkZMXlKTwjHKExuskUGBh3PUMKLD2UMoBMkSxOJCZH7GjLfn
        odico5RCtAS2Qkpd9zVg3dbadvEDGf+qwbdC0Qg=
X-Google-Smtp-Source: AMsMyM5dRSgJ9ksZxZ3Y+bh/g/Py8w/iVHXgey+ZKcR7bvzWAmWzo8djrd0WjE/M+JWV5JRWeaXRWsjEsoKoIuhTI0I=
X-Received: by 2002:ac5:c7a6:0:b0:3a2:7f3c:8170 with SMTP id
 d6-20020ac5c7a6000000b003a27f3c8170mr11439799vkn.6.1664284376821; Tue, 27 Sep
 2022 06:12:56 -0700 (PDT)
MIME-Version: 1.0
References: <CAHmME9q==_BaqaYR-H68Tzxppbme33bb4fSrU57BVGzk_oBq5g@mail.gmail.com>
 <CAHmME9ooqESMd4Hb_=KTSuYqiDNm3akojo_CdWW6fgd-+J+ZWA@mail.gmail.com> <CAHmME9rxCP=kmqVbiKrdknrDjfrHOr71E9MXgkSGadF3QZ1DZA@mail.gmail.com>
In-Reply-To: <CAHmME9rxCP=kmqVbiKrdknrDjfrHOr71E9MXgkSGadF3QZ1DZA@mail.gmail.com>
From:   "Jason A. Donenfeld" <Jason@zx2c4.com>
Date:   Tue, 27 Sep 2022 15:12:45 +0200
X-Gmail-Original-Message-ID: <CAHmME9pB3dsqd=BKFRBjcJWLR4=tjzzOLGUqWmSSjJGs-r94Bw@mail.gmail.com>
Message-ID: <CAHmME9pB3dsqd=BKFRBjcJWLR4=tjzzOLGUqWmSSjJGs-r94Bw@mail.gmail.com>
Subject: Re: rubric to the m68k rng seed rework
To:     Laurent Vivier <laurent@vivier.eu>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-m68k <linux-m68k@lists.linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hey again,

Here's the current status:

v5 of the kernel side is the same as v4, but without the last patch:
- https://lore.kernel.org/lkml/20220927130835.1629806-1-Jason@zx2c4.com/
- https://lore.kernel.org/lkml/20220927130835.1629806-2-Jason@zx2c4.com/

v2 of kexec-tools remains the same:
- https://lore.kernel.org/kexec/20220923164152.4079868-1-Jason@zx2c4.com/

v2 of qemu remains the same, but 2/2 has already been taken by
Laurent, so excluding from list:
- https://lore.kernel.org/qemu-devel/20220926113900.1256630-1-Jason@zx2c4.com/

Laurent is waiting on Geert to merge the kernel part before he merges
the QEMU part. And I assume the same is so for kexec-tools. So Geert -
next step is yours.

Thanks,
Jason
