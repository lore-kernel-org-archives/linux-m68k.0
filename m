Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C857C77B75
	for <linux-m68k@archiver.kernel.org>; Mon, 22 May 2023 11:41:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233010AbjEVLl6 convert rfc822-to-8bit (ORCPT
        <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 22 May 2023 07:41:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51582 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233331AbjEVLlz (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 22 May 2023 07:41:55 -0400
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3AB449B
        for <linux-m68k@lists.linux-m68k.org>; Mon, 22 May 2023 04:41:54 -0700 (PDT)
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-ba827c74187so8600356276.0
        for <linux-m68k@lists.linux-m68k.org>; Mon, 22 May 2023 04:41:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684755713; x=1687347713;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YQM4CisG43A3UU9kY3EcQQPtrr37Ex7+82L60u0Ozu4=;
        b=UxW8scZmvR7vtjY7Un/EgSGhY6FaTRaBhAOi/hqBA0+pCYgFIa9Yowo/QQUNUrWvOi
         EQyuTNxjjVYkpgNJgIw2UhxliOer9AHX5UojFHKHXLLO5CeeXEk6wtDMruFjPglQW4PG
         h+E/k/wIM8ST4JSC9g3O+CMcOCncojpzJvIMaSJmMgo7j8f4iSV+zQRjKKUfgX3L0uGX
         0d+AhhZNQHxXGvabri5DUfASq+++uEtjOBsIG2gWGVWjeqSEW9hAvIGcbDVqW+1snjwh
         I7FVk+k6FAgjIdXH5MLm6aKZGCTlxioYzCLmMCDRwopbwEcFGlDp/hLoM09NITJFlQ0v
         9fjw==
X-Gm-Message-State: AC+VfDwZYkq00XGN6RCyn6Ze/kv4UYtKdxk3jXs1yn/h+/W8tcckvS6Z
        Z6AP0q1VLb+KLlYFVPNsUjP5tP20RgCMOA==
X-Google-Smtp-Source: ACHHUZ61+1um4h5hKI7jBpIHtny2ZbG612e0+S/EjiX1YsnusR7vmoYfr4lL15P7ovCOZVQ7O9vQTQ==
X-Received: by 2002:a25:a304:0:b0:ba8:1ebe:9b96 with SMTP id d4-20020a25a304000000b00ba81ebe9b96mr9831843ybi.1.1684755713106;
        Mon, 22 May 2023 04:41:53 -0700 (PDT)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com. [209.85.128.174])
        by smtp.gmail.com with ESMTPSA id u140-20020a0deb92000000b00561e67c9d7csm2023067ywe.38.2023.05.22.04.41.52
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 May 2023 04:41:52 -0700 (PDT)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-563874afe98so39791697b3.1
        for <linux-m68k@lists.linux-m68k.org>; Mon, 22 May 2023 04:41:52 -0700 (PDT)
X-Received: by 2002:a0d:ea43:0:b0:559:d3a0:4270 with SMTP id
 t64-20020a0dea43000000b00559d3a04270mr11018198ywe.34.1684755712500; Mon, 22
 May 2023 04:41:52 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1683365892.git.fthain@linux-m68k.org> <9e66262a754fcba50208aa424188896cc52a1dd1.1683365892.git.fthain@linux-m68k.org>
In-Reply-To: <9e66262a754fcba50208aa424188896cc52a1dd1.1683365892.git.fthain@linux-m68k.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 22 May 2023 13:41:41 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX_0F0hSZKqBBCN3876BmfwbQb1_+N3h-V8xs5ouRXF=A@mail.gmail.com>
Message-ID: <CAMuHMdX_0F0hSZKqBBCN3876BmfwbQb1_+N3h-V8xs5ouRXF=A@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] m68k: Move signal frame following exception on 68020/030
To:     Finn Thain <fthain@linux-m68k.org>
Cc:     Michael Schmitz <schmitzmic@gmail.com>,
        Andreas Schwab <schwab@linux-m68k.org>, stable@vger.kernel.org,
        linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Sat, May 6, 2023 at 11:36 AM Finn Thain <fthain@linux-m68k.org> wrote:
> On 68030/020, an instruction such as, moveml %a2-%a3/%a5,%sp@- may cause
> a stack page fault during instruction execution (i.e. not at an
> instruction boundary) and produce a format 0xB exception frame.
>
> In this situation, the value of USP will be unreliable. If a signal is to
> be delivered following the exception, this USP value is used to calculate
> the location for a signal frame. This can result in a corrupted user
> stack.
>
> The corruption was detected in dash (actually in glibc) where it showed
> up as an intermittent "stack smashing detected" message and crash
> following signal delivery for SIGCHLD.
>
> It was hard to reproduce that failure because delivery of the signal
> raced with the page fault and because the kernel places an unpredictable
> gap of up to 7 bytes between the USP and the signal frame.
>
> A format 0xB exception frame can be produced by a bus error or an address
> error. The 68030 Users Manual says that address errors occur immediately
> upon detection during instruction prefetch. The instruction pipeline
> allows prefetch to overlap with other instructions, which means an
> address error can arise during the execution of a different instruction.
> So it seems likely that this patch may help in the address error case also.
>
> Reported-and-tested-by: Stan Johnson <userm57@yahoo.com>
> Link: https://lore.kernel.org/all/CAMuHMdW3yD22_ApemzW_6me3adq6A458u1_F0v-1EYwK_62jPA@mail.gmail.com/
> Cc: Michael Schmitz <schmitzmic@gmail.com>
> Cc: Andreas Schwab <schwab@linux-m68k.org>
> Cc: stable@vger.kernel.org
> Co-developed-by: Michael Schmitz <schmitzmic@gmail.com>
> Signed-off-by: Michael Schmitz <schmitzmic@gmail.com>
> Signed-off-by: Finn Thain <fthain@linux-m68k.org>

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
i.e. will queue as a fix in the m68k for-v6.4 branch.

I plan to send this upstream later this week, so any additional
testing would be appreciated.

Thanks!

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
