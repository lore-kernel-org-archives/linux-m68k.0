Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D7FBC64ED8
	for <linux-m68k@archiver.kernel.org>; Mon, 27 Feb 2023 19:43:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230157AbjB0Tnl (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 27 Feb 2023 14:43:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53324 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230130AbjB0Tnl (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 27 Feb 2023 14:43:41 -0500
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E4832448E
        for <linux-m68k@lists.linux-m68k.org>; Mon, 27 Feb 2023 11:43:38 -0800 (PST)
Received: by mail-qt1-f180.google.com with SMTP id ay9so7981691qtb.9
        for <linux-m68k@lists.linux-m68k.org>; Mon, 27 Feb 2023 11:43:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yKY+VbY0FCl1BqoxDKxydDXKFwBbKHMwhMyu/F0WRtQ=;
        b=sbBsDXA/NI6QZsvbUKp3ASBKsC/8P8esSHNd47c+j48qP6ybW+4PPsHJnZLIz5H8sq
         /uuXASOx6W7MOuEMfTVa/eyOVjaHuCryWICREU13eFKLNpAZSnUft2KrBigh3mnisX58
         7XNCUR+EFFMRduaJ2EWw4gQ8+VvgNXWFWTBN0zJBZr+06p9/yAeAXqFZBI8op2bz0Bp9
         QSH/S+jIA7j+u9mbRs1pX7wigDAw/GjRQIzmUmzPoZexMuES4iUWmsUce0n5P5rA3gjq
         rBB6SQ0Edd3skCuQw8uMPR8jRomfoPeTuQPk9dKbEchVnS4vQgN5mDT+48CncomHlson
         4eBg==
X-Gm-Message-State: AO0yUKUHnDgoSscRtm7dnUXAwqu98UWAU7ntZPDbYDZg9JbsRgAe8C5F
        F8vK5g0MUhcB8ahb53E8mKc9pFNY/9E8Eg==
X-Google-Smtp-Source: AK7set8CN3SdK5vfuS8Jsygcku3xyzQyLgbsB1I+PcZP4vQg20Kn+7Olzg023LGj5/Ik2E+mKym2Tg==
X-Received: by 2002:a05:622a:1991:b0:3b9:bdb0:7aa1 with SMTP id u17-20020a05622a199100b003b9bdb07aa1mr598229qtc.41.1677527017140;
        Mon, 27 Feb 2023 11:43:37 -0800 (PST)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com. [209.85.128.176])
        by smtp.gmail.com with ESMTPSA id h9-20020ac85489000000b003b62e9c82ebsm5169432qtq.48.2023.02.27.11.43.36
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Feb 2023 11:43:36 -0800 (PST)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-536bbef1c5eso206634157b3.9
        for <linux-m68k@lists.linux-m68k.org>; Mon, 27 Feb 2023 11:43:36 -0800 (PST)
X-Received: by 2002:a81:b603:0:b0:533:99bb:c296 with SMTP id
 u3-20020a81b603000000b0053399bbc296mr10724897ywh.5.1677527016482; Mon, 27 Feb
 2023 11:43:36 -0800 (PST)
MIME-Version: 1.0
References: <167751664019.187639.5290505948970809072.stgit@bazille.1015granger.net>
In-Reply-To: <167751664019.187639.5290505948970809072.stgit@bazille.1015granger.net>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 27 Feb 2023 20:43:23 +0100
X-Gmail-Original-Message-ID: <CAMuHMdW7mKmji6yyd2w+TrX0toyMN5r=hWvyxtM8D=qdBLcdww@mail.gmail.com>
Message-ID: <CAMuHMdW7mKmji6yyd2w+TrX0toyMN5r=hWvyxtM8D=qdBLcdww@mail.gmail.com>
Subject: Re: [PATCH] SUNRPC: Ensure test case arrays are properly terminated
To:     Chuck Lever <cel@kernel.org>
Cc:     linux-nfs@vger.kernel.org, linux-kselftest@vger.kernel.org,
        linux-m68k@lists.linux-m68k.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Chuck,

On Mon, Feb 27, 2023 at 5:53 PM Chuck Lever <cel@kernel.org> wrote:
> From: Chuck Lever <chuck.lever@oracle.com>
>
> Geert Uytterhoeven reports:
>
> ...
>         ok 9 Encrypt 13 bytes with camellia256-cts-cmac
>         ok 10 Encrypt 30 bytes with camellia256-cts-cmac
>     # RFC 6803 encryption: pass:0 fail:0 skip:10 total:10
>     ok 3 RFC 6803 encryption # SKIP Encryption type is not available
> 8<--- cut here ---
> Unable to handle kernel paging request at virtual address 73657420 when execute
> [73657420] *pgd=00000000
> Internal error: Oops: 80000005 [#1] ARM
> CPU: 0 PID: 1 Comm: swapper Tainted: G                 N 6.2.0-rc7-00133-g373f26a81164-dirty #9
> Hardware name: Generic DT based system
> PC is at 0x73657420
> LR is at kunit_run_tests+0x3e0/0x5f4
>
> On x86 with GCC 12, the missing array terminators did not seem to
> matter. Other platforms appear to be more picky.

Doesn't gcc on x86 align all arrays to a 16-byte boundary, hence
adding zero-padding here?

>
> Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Signed-off-by: Chuck Lever <chuck.lever@oracle.com>

Tested-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
