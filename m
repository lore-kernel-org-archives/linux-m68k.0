Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08181C433EF
	for <linux-m68k@archiver.kernel.org>; Wed, 22 Jun 2022 07:46:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353765AbiFVHqo (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 22 Jun 2022 03:46:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47150 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351628AbiFVHqo (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 22 Jun 2022 03:46:44 -0400
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 917F01EEC3
        for <linux-m68k@lists.linux-m68k.org>; Wed, 22 Jun 2022 00:46:43 -0700 (PDT)
Received: by mail-qv1-f51.google.com with SMTP id o43so23996565qvo.4
        for <linux-m68k@lists.linux-m68k.org>; Wed, 22 Jun 2022 00:46:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dmGPFZPTP5s26NzZgE/CmdswraC7MuQTQKrQzx6Alt0=;
        b=UjIyDc8gqYriuRrjdVvPg6o9bEo86C2fXw79julevw23HSYw11VQZ1b0mzFWytvKPJ
         wqE5tjSICF5QlS+pQubbv8x37bNxuA05qqoo5vwOY186iF5Whu5p2LDqEb9/00nP75EX
         fYA1WTFPnhJSq1dxQyv46FS0Ke6Z35+iqcD+DXsvobMRg0jrltp8pYCsXlUP1Sbm4+PO
         b64lFMtmpjJG/Ac2rv4hkp+Wk3JABQ4Sqok0RQ9GcrsXtw1Zgij63bHDutYVuIBYX9a1
         BoSBcfre/5bHe6+coRuUFg0RuHi9EGVgiYz7jAStGSA3C7KK8ZfpgOdb/zmrg5z2gjoA
         JBJw==
X-Gm-Message-State: AJIora9i/B0C+5kb5uQPxQEiURwis2roG0z+Z66uUcHvf7VyPlOY98vB
        1cBDmMU3dgXJfZLtTVBgipD4mtNNV3Ybpg==
X-Google-Smtp-Source: AGRyM1sn5xgXFoqd3I0aL30Jiz9uVQjUsYoMCq4nN7dNuE6m9vL6xhLQIorYDe4e725euu8TrDOwyQ==
X-Received: by 2002:a05:6214:ccd:b0:46b:b0ee:bece with SMTP id 13-20020a0562140ccd00b0046bb0eebecemr26482354qvx.114.1655884002284;
        Wed, 22 Jun 2022 00:46:42 -0700 (PDT)
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com. [209.85.219.171])
        by smtp.gmail.com with ESMTPSA id r10-20020ae9d60a000000b006a73cb957dasm15910704qkk.20.2022.06.22.00.46.41
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Jun 2022 00:46:41 -0700 (PDT)
Received: by mail-yb1-f171.google.com with SMTP id v81so28792931ybe.0
        for <linux-m68k@lists.linux-m68k.org>; Wed, 22 Jun 2022 00:46:41 -0700 (PDT)
X-Received: by 2002:a05:6902:120e:b0:634:6f29:6b84 with SMTP id
 s14-20020a056902120e00b006346f296b84mr2322150ybu.604.1655884001424; Wed, 22
 Jun 2022 00:46:41 -0700 (PDT)
MIME-Version: 1.0
References: <20220622073553.64991-1-yuanjilin@cdjrlc.com>
In-Reply-To: <20220622073553.64991-1-yuanjilin@cdjrlc.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 22 Jun 2022 09:46:30 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUjsSwMwKjuKQ+h-ki_SwUThNJksALXK5cNoOikY0M-Fw@mail.gmail.com>
Message-ID: <CAMuHMdUjsSwMwKjuKQ+h-ki_SwUThNJksALXK5cNoOikY0M-Fw@mail.gmail.com>
Subject: Re: [PATCH] m68k:coldfire:Fix typos in comments
To:     yuanjilin@cdjrlc.com
Cc:     Greg Ungerer <gerg@linux-m68k.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Wed, Jun 22, 2022 at 9:36 AM Jilin Yuan <yuanjilin@cdjrlc.com> wrote:
> The "the" should be replaced by "of" instead.
>
> Signed-off-by: Jilin Yuan <yuanjilin@cdjrlc.com>

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
