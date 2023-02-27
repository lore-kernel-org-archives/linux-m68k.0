Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AE64C7EE2D
	for <linux-m68k@archiver.kernel.org>; Mon, 27 Feb 2023 19:42:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230049AbjB0TmM (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 27 Feb 2023 14:42:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229737AbjB0TmL (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 27 Feb 2023 14:42:11 -0500
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6FDCC7ECE
        for <linux-m68k@lists.linux-m68k.org>; Mon, 27 Feb 2023 11:41:59 -0800 (PST)
Received: by mail-qt1-f171.google.com with SMTP id z6so8097613qtv.0
        for <linux-m68k@lists.linux-m68k.org>; Mon, 27 Feb 2023 11:41:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+M8MoXObVraILUYUNZQa6sssikj2rSxS/rHvRcYnSnU=;
        b=GAHqbeNJp3jcd9v7CJZmachVBGvKLr04xdnbur0hVNIOaRU0D7VfhhEpsOmPss33qI
         ii48PaR2OjgEuQhu39CvDny2C0QEGa7IftjjSISmChilfHOlNfg6Py2L0tS5AnHoKU+l
         KkxrUcZ1EHTLIiCaIpZKSZFqo8/n92Lk6MGKXJ2Gltp8XMcFnU5TqHQzoxplES6xWObK
         6hN50K0nosi2X/LrPWqa+SPCgR7sHHysHmNtVB/DbLNf0zgrnjlV00DrogxGzs7ttqE5
         i75BK6uC5kyMKaSM+YWxu1aUEOFBxV1eS0ta4kvysy7WOj8U9/X9cadcWyQoF4IIfHmo
         MprA==
X-Gm-Message-State: AO0yUKW1Y2X/YWz1cjp7x0IdUpAFQ/iAsOP7PAUdlgw2xZJJm+DAyR2v
        VzZhiTr8FsO3rU/BByogWKNYExiW5gmx9A==
X-Google-Smtp-Source: AK7set87osQ/52cfqGcRm9kXGiFyAN3RVGt1ncb/SWlhCCHKG4yRkNo9RWwL+EMmblVCqQyrLWAOfw==
X-Received: by 2002:ac8:5dd1:0:b0:3bf:d00e:9908 with SMTP id e17-20020ac85dd1000000b003bfd00e9908mr679854qtx.44.1677526918196;
        Mon, 27 Feb 2023 11:41:58 -0800 (PST)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com. [209.85.128.175])
        by smtp.gmail.com with ESMTPSA id q190-20020a3743c7000000b00742a23cada8sm3177850qka.131.2023.02.27.11.41.57
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Feb 2023 11:41:58 -0800 (PST)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-536af432ee5so208586177b3.0
        for <linux-m68k@lists.linux-m68k.org>; Mon, 27 Feb 2023 11:41:57 -0800 (PST)
X-Received: by 2002:a81:ad5c:0:b0:538:112b:67a0 with SMTP id
 l28-20020a81ad5c000000b00538112b67a0mr10431853ywk.5.1677526917514; Mon, 27
 Feb 2023 11:41:57 -0800 (PST)
MIME-Version: 1.0
References: <167751329962.149247.12935751231288858919.stgit@bazille.1015granger.net>
In-Reply-To: <167751329962.149247.12935751231288858919.stgit@bazille.1015granger.net>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 27 Feb 2023 20:41:41 +0100
X-Gmail-Original-Message-ID: <CAMuHMdU428G9=Vg6tc6JrWTkE-KD52Agasz3VY5KAJ+1DfT_Zg@mail.gmail.com>
Message-ID: <CAMuHMdU428G9=Vg6tc6JrWTkE-KD52Agasz3VY5KAJ+1DfT_Zg@mail.gmail.com>
Subject: Re: [PATCH] SUNRPC: Let Kunit tests run with some enctypes compiled out
To:     Chuck Lever <cel@kernel.org>
Cc:     linux-nfs@vger.kernel.org, linux-kselftest@vger.kernel.org,
        linux-m68k@lists.linux-m68k.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Chuck,

On Mon, Feb 27, 2023 at 4:58 PM Chuck Lever <cel@kernel.org> wrote:
> From: Chuck Lever <chuck.lever@oracle.com>
>
> Allow the new GSS Kerberos encryption type test suites to run
> outside of the kunit infrastructure. Replace the assertion that
> fires when lookup_enctype() so that the case is skipped instead of
> failing outright.
>
> Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Signed-off-by: Chuck Lever <chuck.lever@oracle.com>
> ---
>
> Hey Geert -
>
> This patch addresses part of your concern: with this patch applied,
> you should be able to run only the tests that target the encryption
> types that are enabled in your kernel. The other tests will be
> skipped rather than fail outright.

Thanks, works fine!

Tested-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
