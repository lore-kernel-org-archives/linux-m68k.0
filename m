Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CDA6ECAAD8
	for <linux-m68k@archiver.kernel.org>; Fri, 23 Sep 2022 12:53:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230079AbiIWMxl (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Fri, 23 Sep 2022 08:53:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43442 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229549AbiIWMxk (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Fri, 23 Sep 2022 08:53:40 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 057EA1166C9
        for <linux-m68k@lists.linux-m68k.org>; Fri, 23 Sep 2022 05:53:40 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 93E6E610A5
        for <linux-m68k@lists.linux-m68k.org>; Fri, 23 Sep 2022 12:53:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBFDFC433D6
        for <linux-m68k@lists.linux-m68k.org>; Fri, 23 Sep 2022 12:53:38 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
        dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="EnUv5rQf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
        t=1663937617;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=nLbY6ODoYVoZFTe6xNbVnO76pCYvWYbmh/vjo3Dz0B4=;
        b=EnUv5rQfpn7WazacqxuDct3GlGS4b5FZluX705VcyjZkuE8ujKHIkCYdiYA2FMwOb4igId
        PM7BWWzn6coiMEYKeE5QJ7vxm80iJ1O5ZPB0XS1YKEO+XqPxUxCdw1yp94OGWgOY6ro9H7
        hnVgwrsgvyP3XBdMdo+ebDy1Ytey1vU=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id ce326487 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
        for <linux-m68k@lists.linux-m68k.org>;
        Fri, 23 Sep 2022 12:53:37 +0000 (UTC)
Received: by mail-vk1-f180.google.com with SMTP id s192so81898vkb.9
        for <linux-m68k@lists.linux-m68k.org>; Fri, 23 Sep 2022 05:53:36 -0700 (PDT)
X-Gm-Message-State: ACrzQf0NFKzfCRDBZH+eL/BvNiyk1WcvV27oESi6h15mD/da784KsSQp
        itw8nQbyWp4m7++OBRMTMEjyHdko0HPqKUckQfE=
X-Google-Smtp-Source: AMsMyM49F2E1RfHUIS29gKKqtrhnKDF7bU4c1ATOUKbLDO4SdTHVfoTpPsFM6N9D7ksMiGb0DrIWFULscllGaTv7usU=
X-Received: by 2002:a1f:19cf:0:b0:375:6144:dc41 with SMTP id
 198-20020a1f19cf000000b003756144dc41mr3668869vkz.3.1663937615691; Fri, 23 Sep
 2022 05:53:35 -0700 (PDT)
MIME-Version: 1.0
References: <20220923124642.3942806-1-Jason@zx2c4.com>
In-Reply-To: <20220923124642.3942806-1-Jason@zx2c4.com>
From:   "Jason A. Donenfeld" <Jason@zx2c4.com>
Date:   Fri, 23 Sep 2022 14:53:24 +0200
X-Gmail-Original-Message-ID: <CAHmME9rH5=JViW6dDyiaFZvuCaFpHZwXSC7xDNj6MEH6rb7+Tg@mail.gmail.com>
Message-ID: <CAHmME9rH5=JViW6dDyiaFZvuCaFpHZwXSC7xDNj6MEH6rb7+Tg@mail.gmail.com>
Subject: Re: [PATCH kexec-tools] m68k: pass rng seed via BI_VIRT_RNG_SEED
To:     Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-m68k@lists.linux-m68k.org, kexec@lists.infradead.org,
        Simon Horman <horms@verge.net.au>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Fri, Sep 23, 2022 at 2:47 PM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
> Geert - I don't have a toolchain for testing this. Could you verify it
> works, if you have a chance? -Jason
>
>  kexec/arch/m68k/bootinfo.c       | 22 ++++++++++++++++++++++
>  kexec/arch/m68k/bootinfo.h       |  6 ++++++
>  kexec/arch/m68k/kexec-elf-m68k.c |  1 +
>  3 files changed, 29 insertions(+)
>
> diff --git a/kexec/arch/m68k/bootinfo.c b/kexec/arch/m68k/bootinfo.c
> index 18bf226..74e65a0 100644
> --- a/kexec/arch/m68k/bootinfo.c
> +++ b/kexec/arch/m68k/bootinfo.c

I forgot to add `#include <sys/random.h>` I suspect.
