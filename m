Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEA9DC6FA90
	for <linux-m68k@archiver.kernel.org>; Mon, 26 Sep 2022 14:48:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234627AbiIZOsS (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 26 Sep 2022 10:48:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54534 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234625AbiIZOrv (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 26 Sep 2022 10:47:51 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB716371B3
        for <linux-m68k@lists.linux-m68k.org>; Mon, 26 Sep 2022 06:13:17 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 646A7B80957
        for <linux-m68k@lists.linux-m68k.org>; Mon, 26 Sep 2022 13:13:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA5D3C433C1
        for <linux-m68k@lists.linux-m68k.org>; Mon, 26 Sep 2022 13:13:14 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
        dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="Kebt/2zh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
        t=1664197993;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=obNGAPkaDHmrdAWUMTY1WqSolKxfLoT5Ler9LUNymfQ=;
        b=Kebt/2zhP6fXXMj4S45B3eVSdOLacPgXstiCEb06Gu9suA+uNP42IsQYoQel+dXU9WaFhb
        v91V9MBD79yzgErjRtO8T+37H4HWrwOxJjDo1c0VtVsyjTxpSv1g/Cu04Oqap8iFC+V+Lp
        D1qD9E45Wuoju7mlWZDw071ZzT4O8rg=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id b7b5c911 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
        for <linux-m68k@lists.linux-m68k.org>;
        Mon, 26 Sep 2022 13:13:13 +0000 (UTC)
Received: by mail-vk1-f171.google.com with SMTP id k14so3394649vkk.0
        for <linux-m68k@lists.linux-m68k.org>; Mon, 26 Sep 2022 06:13:12 -0700 (PDT)
X-Gm-Message-State: ACrzQf2tG78FjC1ABG4x3JVf6P/QN9hgKdv437dGVd8gdUywZOKhA0rH
        XbdgDM34UpBM8co+CFG/t8B7q6Zj8NtclR2xblI=
X-Google-Smtp-Source: AMsMyM4zQQQbkFjJq9+tni1CuJZ2ORzEo4PHSVZsrbgPN1OR+yAmXxYtlOfnPluQCpPj/04/1Bckw3G0fp2hDAUuxeI=
X-Received: by 2002:a1f:1b45:0:b0:3a7:ba13:11ce with SMTP id
 b66-20020a1f1b45000000b003a7ba1311cemr2099990vkb.3.1664197992274; Mon, 26 Sep
 2022 06:13:12 -0700 (PDT)
MIME-Version: 1.0
References: <20220926113754.1256358-1-Jason@zx2c4.com> <20220926113754.1256358-3-Jason@zx2c4.com>
In-Reply-To: <20220926113754.1256358-3-Jason@zx2c4.com>
From:   "Jason A. Donenfeld" <Jason@zx2c4.com>
Date:   Mon, 26 Sep 2022 15:13:01 +0200
X-Gmail-Original-Message-ID: <CAHmME9qLcfT5Mjw1cudhA-zGaLUubkPCTF7trw1ek40==BwumQ@mail.gmail.com>
Message-ID: <CAHmME9qLcfT5Mjw1cudhA-zGaLUubkPCTF7trw1ek40==BwumQ@mail.gmail.com>
Subject: Re: [PATCH v4 3/3] m68k: generate new RNG seed on reboot
To:     Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org,
        Laurent Vivier <laurent@vivier.eu>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Geert,

On Mon, Sep 26, 2022 at 1:38 PM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>
> Rather than rebooting into a system with no entropy, regenerate the RNG
> seed before rebooting, so that the new system has a fresh seed.
>
> Fixes: a1ee38ab1a75 ("m68k: virt: Use RNG seed from bootinfo block")
> Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>

Laurent made a compelling case *against* this approach. So feel free
to drop this 3/3 patch. However, 1/3 and 2/3 should still be
committed.

Thanks,
Jason
