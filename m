Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2F0BCD13AE
	for <linux-m68k@archiver.kernel.org>; Fri, 15 Sep 2023 19:33:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236959AbjIOTdW (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Fri, 15 Sep 2023 15:33:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236988AbjIOTdA (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Fri, 15 Sep 2023 15:33:00 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4EB5319BC
        for <linux-m68k@lists.linux-m68k.org>; Fri, 15 Sep 2023 12:32:55 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-501eec0a373so4010488e87.3
        for <linux-m68k@lists.linux-m68k.org>; Fri, 15 Sep 2023 12:32:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1694806373; x=1695411173; darn=lists.linux-m68k.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=qBds5z+NJpOb5bJHssQMRX8nwTbVaqnNS4P35Wp01u8=;
        b=KEaX0cKbg3N2JSIirSF2+ydhrCWb3hTr4Qe1DsluXgkfNdkXCBg5nra/WN7rCrOICy
         BRjQEH9GgilzOaM8ja+Tzu/AaV1QZ28hth9nuj2ipPoPBrCxxh1c2/DC43cookknNCNx
         6dkjUtp8KW+s6PdrmGP5nV6spNgFhriqjutpY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694806373; x=1695411173;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qBds5z+NJpOb5bJHssQMRX8nwTbVaqnNS4P35Wp01u8=;
        b=aEtCzLKIUOAVdrE84ldy6KKmWjsiowjGFQDdTVpY1D5vwRmQowfHK/ijrrjKSopJgv
         nmCgvs5mLGWtTz8YamRbXsXf/lc4BxwdM3pzwlC+eOoNPu7tem18DZGTAEWukzif+zyO
         1RTg8Hx6FEXI1RgH+ocfciQ7mUVfcWaJZX6YB7h8sX1h8zpRTqyIPhvMaaqZY6ONUw/p
         nGnxzsVTinCE1WRA3F5DB/8FJ8piZa5n+V797Df9wb6tgvvwFgrKPNtT9OLCyjWbC55X
         Qm7kTK1wQCfaROByfcZl7SCrwosHJ5W1B2UJAFfowazhLlLBPqgOK9pOfK1nDU3dltXB
         YfLg==
X-Gm-Message-State: AOJu0Ywhewex92hmXNMpxTGELUkLrpOpv68UqBRuGzl2kaF1H96V0vpB
        xTZRDFDykuInL+OtqK/EUNTisjPz+efqa2wokePvKBqO
X-Google-Smtp-Source: AGHT+IHtnmTK1SBdJHnSpoEDPceHpTvMI45Afti2jhcLNl7K2n5pP2CTe4C/PtQw12UmXHe8leXnoA==
X-Received: by 2002:a05:6512:788:b0:500:a08e:2fd3 with SMTP id x8-20020a056512078800b00500a08e2fd3mr2082597lfr.21.1694806373204;
        Fri, 15 Sep 2023 12:32:53 -0700 (PDT)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com. [209.85.208.41])
        by smtp.gmail.com with ESMTPSA id e10-20020a50ec8a000000b0052565298bedsm2631708edr.34.2023.09.15.12.32.52
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 Sep 2023 12:32:52 -0700 (PDT)
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-530ab2d9e89so532071a12.2
        for <linux-m68k@lists.linux-m68k.org>; Fri, 15 Sep 2023 12:32:52 -0700 (PDT)
X-Received: by 2002:a05:6402:1159:b0:523:3fff:5ce2 with SMTP id
 g25-20020a056402115900b005233fff5ce2mr2114923edw.41.1694806371880; Fri, 15
 Sep 2023 12:32:51 -0700 (PDT)
MIME-Version: 1.0
References: <20230915082416.3949600-1-geert@linux-m68k.org>
In-Reply-To: <20230915082416.3949600-1-geert@linux-m68k.org>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Fri, 15 Sep 2023 12:32:34 -0700
X-Gmail-Original-Message-ID: <CAHk-=witemuuUen2Gr_+uUq1nSWb=MxNVTXS2f2hiTeqfywKrQ@mail.gmail.com>
Message-ID: <CAHk-=witemuuUen2Gr_+uUq1nSWb=MxNVTXS2f2hiTeqfywKrQ@mail.gmail.com>
Subject: Re: [GIT PULL] m68k updates for v6.6 (take two)
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Greg Ungerer <gerg@linux-m68k.org>,
        linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Fri, 15 Sept 2023 at 01:24, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> m68k updates for v6.6 (take two)
>
>   - Miscellaneous esthetical improvements for the floating point
>     emulator,
>   - Miscellaneous fixes for W=1 builds.

This is not appropriate for a "fixes" pull. It's about an order of
magnitude bigger than the pull you sent during the merge window, and
the merge window is closed now.

                Linus
