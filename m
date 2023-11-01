Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35A34C4167B
	for <linux-m68k@archiver.kernel.org>; Wed,  1 Nov 2023 10:23:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231902AbjKAKXa (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 1 Nov 2023 06:23:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51298 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231719AbjKAKX3 (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 1 Nov 2023 06:23:29 -0400
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 52339DA
        for <linux-m68k@lists.linux-m68k.org>; Wed,  1 Nov 2023 03:23:27 -0700 (PDT)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-5a82c2eb50cso60963057b3.2
        for <linux-m68k@lists.linux-m68k.org>; Wed, 01 Nov 2023 03:23:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698834206; x=1699439006;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1VPifwlNIp+n5BnRjITtLVMY4+mU/dE+c30uuT14VYw=;
        b=vXn2jqlFgVWj6KNiV42MOldnt9qr0+FEwtm53++j1q8mZvhxKN38LbaGUBAsLpiZS5
         8ILCYnVcMrM7DtnWE9ATzf+uEAhpB7uKU5srckf1E+SXu81lLpCUUPE6j9Hd6ZBCmEJM
         elEd7FzF7i4Xrunu1Y87gDVhG5hfklkMVs54E1B0IATJ61Shhsa2oUBKKh/XRctNCKmb
         1sAm2C5LGRhia09lRYVXeMc6KATH1ppltAMERZVuzhrD0d/hKtl7spTx+TupugEIMChz
         dW1K5ADqawaBxT2obbVBVBp/NzmSxverfg1NojZGtQeiQFuz/MQqMMhS8n3LIJH4GvOs
         6ydw==
X-Gm-Message-State: AOJu0YyfA39XVOR5BYwcxsGgalP245uhc1RZOh3isLWDeaHH4m0EvHmU
        bbGzYfsCe/wzbiWvyldYPZWrXO2U9CR/xg==
X-Google-Smtp-Source: AGHT+IGfOGAh23cdi3guEz6DrXkMh3di/HEQto/Vzgp4D6EB+ApJFFaHJPUxHDO35HTIgtgkkWp86Q==
X-Received: by 2002:a81:af09:0:b0:5a8:181e:8d6c with SMTP id n9-20020a81af09000000b005a8181e8d6cmr11528777ywh.10.1698834206090;
        Wed, 01 Nov 2023 03:23:26 -0700 (PDT)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com. [209.85.128.169])
        by smtp.gmail.com with ESMTPSA id w190-20020a8149c7000000b005af6df31bb0sm1900222ywa.105.2023.11.01.03.23.25
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Nov 2023 03:23:25 -0700 (PDT)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-5afa5dbc378so50879947b3.0
        for <linux-m68k@lists.linux-m68k.org>; Wed, 01 Nov 2023 03:23:25 -0700 (PDT)
X-Received: by 2002:a81:9252:0:b0:5af:7330:9f1e with SMTP id
 j79-20020a819252000000b005af73309f1emr12810976ywg.28.1698834205701; Wed, 01
 Nov 2023 03:23:25 -0700 (PDT)
MIME-Version: 1.0
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 1 Nov 2023 11:23:14 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWL2TnYmkt2W6=ohBuKmyof8kR3p7ZPzmXmWSGnKj9c3g@mail.gmail.com>
Message-ID: <CAMuHMdWL2TnYmkt2W6=ohBuKmyof8kR3p7ZPzmXmWSGnKj9c3g@mail.gmail.com>
Subject: Does anyone use Appletalk?
To:     linux-m68k <linux-m68k@lists.linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Appletalk, cops, and ipdpp are being removed.
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=1dab47139e6118a420acec8426a860ea4b40c379

Please shout if you have any objections.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
