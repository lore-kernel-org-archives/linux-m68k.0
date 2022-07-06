Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECEC0C43334
	for <linux-m68k@archiver.kernel.org>; Wed,  6 Jul 2022 09:23:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232248AbiGFJXg (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 6 Jul 2022 05:23:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37910 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231992AbiGFJXd (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 6 Jul 2022 05:23:33 -0400
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0626CB5E
        for <linux-m68k@lists.linux-m68k.org>; Wed,  6 Jul 2022 02:23:31 -0700 (PDT)
Received: by mail-qk1-f174.google.com with SMTP id b125so10569821qkg.11
        for <linux-m68k@lists.linux-m68k.org>; Wed, 06 Jul 2022 02:23:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jPeOBkcoQYbxVD0wRneW2mTNAwjpOVPDYXCesVf/zic=;
        b=s1XwtFrbHnRbqBTmOVYUQtxIYj4jFg3/PUU/iNiCVHgY3jfZhuSk3hgj3FNQQ6dI3h
         aFAu2jG4E3Cs5FSUElK8Bn49ww1bIeMXteUYD/M/dm5GvBVkCIpMMYh06bj+PjDbmg44
         81jFPgTALc3x5XryOwp1caVJ4uSfngWKkKP7nNLzw1o4bVn7Jc/1wEsKTzejZAMSO8WY
         9lR6jCV0MxTzRhr/ZSfNny0Y4JXV5t9HREq+bxEoEXlsWDxUG44JIjisG7iHEvhwcaQ0
         RNsldXqOyns8uD1/cDPMP7tO6ZBbYcZ559+Ky0TY7LxJghFFtqUlwkwBMSlDgFN8HsOz
         7QFw==
X-Gm-Message-State: AJIora8rFVhp7JtXsrVi+M7eTNNoU4U4drINBWXPoP03hSBAd2vxt8gO
        WB25Zh4682q2f+4gBsNBIOk/LTyrCv7Ikg==
X-Google-Smtp-Source: AGRyM1tOZtCOLffZ38NrOgEJmUAiRGfenes+Qi3TQjwnxtxazLGUcjNLLLnihdPSXAmNrKPPOkAktw==
X-Received: by 2002:a05:620a:1924:b0:6b2:85c1:7c7e with SMTP id bj36-20020a05620a192400b006b285c17c7emr11050938qkb.142.1657099410737;
        Wed, 06 Jul 2022 02:23:30 -0700 (PDT)
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com. [209.85.219.180])
        by smtp.gmail.com with ESMTPSA id 20-20020ac85654000000b00304ec60f711sm23355436qtt.39.2022.07.06.02.23.30
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Jul 2022 02:23:30 -0700 (PDT)
Received: by mail-yb1-f180.google.com with SMTP id l11so26279149ybu.13
        for <linux-m68k@lists.linux-m68k.org>; Wed, 06 Jul 2022 02:23:30 -0700 (PDT)
X-Received: by 2002:a05:6902:701:b0:66e:a06d:53d7 with SMTP id
 k1-20020a056902070100b0066ea06d53d7mr762670ybt.604.1657099410009; Wed, 06 Jul
 2022 02:23:30 -0700 (PDT)
MIME-Version: 1.0
References: <20220524075848.21684-1-juergh@canonical.com> <20220524075848.21684-2-juergh@canonical.com>
In-Reply-To: <20220524075848.21684-2-juergh@canonical.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 6 Jul 2022 11:23:18 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXrQXhc8MtzGML596podVrT6gkr7XrSAOSCppMc+6qPqA@mail.gmail.com>
Message-ID: <CAMuHMdXrQXhc8MtzGML596podVrT6gkr7XrSAOSCppMc+6qPqA@mail.gmail.com>
Subject: Re: [PATCH 1/3] m68k: Kconfig.cpu: Fix indentation and add endif comments
To:     Juerg Haefliger <juerg.haefliger@canonical.com>
Cc:     linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Juerg Haefliger <juergh@canonical.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Tue, May 24, 2022 at 9:58 AM Juerg Haefliger
<juerg.haefliger@canonical.com> wrote:
> The convention for indentation seems to be a single tab. Help text is
> further indented by an additional two whitespaces. Fix the lines that
> violate these rules.
>
> While add it, add missing trailing endif comments and squeeze multiple
> empty lines.
>
> Signed-off-by: Juerg Haefliger <juergh@canonical.com>

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
i.e. will queue in the m68k for-v5.20 branch.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
