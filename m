Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27849C433EF
	for <linux-m68k@archiver.kernel.org>; Mon,  7 Feb 2022 13:46:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1381761AbiBGNox (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 7 Feb 2022 08:44:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44104 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1384822AbiBGNGm (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 7 Feb 2022 08:06:42 -0500
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com [209.85.222.42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E41E3C043189
        for <linux-m68k@lists.linux-m68k.org>; Mon,  7 Feb 2022 05:06:40 -0800 (PST)
Received: by mail-ua1-f42.google.com with SMTP id w21so22616720uan.7
        for <linux-m68k@lists.linux-m68k.org>; Mon, 07 Feb 2022 05:06:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JZStMkBCEdUkIJefmCWfZykazV+/zPRZRIGtWs+bRb0=;
        b=b+uwvK/jO2sHLzBY9NkE3bYZzeIUAVhyj+5Z+EG2TADgqug8FX5NgapNWsxN97Kilq
         G7lCON6wVSeaB36lBmY5Jo9UHg6nBv+pcfzApTV5BZ7tBQEsZFaVY8hgrPmTOV8Ijux9
         X5UVxug6VElD0v3fneutYbIMFwrBP3RvCyQ9B+S4FoczKyW12HPzmM+zsSlNw7L4Xfrx
         fOJAPOXGPlqIX7a/QDV4ki4uIlf65KyTbLUdGeY4qEFktHYi+KgG5n8ylhUiKHkRJ44r
         XyCm0K+YJcGNFGd90lyGaaMy9/lw72vYkk5YpVMcMS7RQeT4AgKX8gBSwhxICnYcxslK
         n2qw==
X-Gm-Message-State: AOAM531HsvxqlSRU0pR9C8r2gdOGxS5p18oa5F5PyPVfEEJ85L5elklh
        ckkNJ+4ToPa/S7yBkgIdpjb9jzLtExWSnQ==
X-Google-Smtp-Source: ABdhPJz8Sllw3OYl7ogzQCY1l1PQezifSBWg8vlnrNKYiXdChwHwS11VqzuZqIVtl+8PlTWZaW5VnA==
X-Received: by 2002:ab0:3d14:: with SMTP id f20mr4051917uax.36.1644239199621;
        Mon, 07 Feb 2022 05:06:39 -0800 (PST)
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com. [209.85.222.54])
        by smtp.gmail.com with ESMTPSA id d25sm2254007vkl.53.2022.02.07.05.06.39
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Feb 2022 05:06:39 -0800 (PST)
Received: by mail-ua1-f54.google.com with SMTP id 60so22715369uae.1
        for <linux-m68k@lists.linux-m68k.org>; Mon, 07 Feb 2022 05:06:39 -0800 (PST)
X-Received: by 2002:a67:b00e:: with SMTP id z14mr4329049vse.57.1644239199108;
 Mon, 07 Feb 2022 05:06:39 -0800 (PST)
MIME-Version: 1.0
References: <20220128173006.1713210-1-geert@linux-m68k.org> <c1034042-f8f4-b5c9-3b0a-8d1aa1efc8e7@gmail.com>
In-Reply-To: <c1034042-f8f4-b5c9-3b0a-8d1aa1efc8e7@gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 7 Feb 2022 14:06:28 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWS2Eh3c-=GPj8GpMwYesGXqSgwo3__cTfM5_5h5=qYyQ@mail.gmail.com>
Message-ID: <CAMuHMdWS2Eh3c-=GPj8GpMwYesGXqSgwo3__cTfM5_5h5=qYyQ@mail.gmail.com>
Subject: Re: [PATCH] m68k: mm: Remove check for VM_IO to fix deferred I/O
To:     Michael Schmitz <schmitzmic@gmail.com>
Cc:     linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Linux MM <linux-mm@kvack.org>,
        Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Mon, Jan 31, 2022 at 3:22 AM Michael Schmitz <schmitzmic@gmail.com> wrote:
> Am 29.01.2022 um 06:30 schrieb Geert Uytterhoeven:
> > When an application accesses a mapped frame buffer backed by deferred
> > I/O, it receives a segmentation fault.  Fix this by removing the check
> > for VM_IO in do_page_fault().
> >
> > Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
>
> Works fine on my Falcon030 when applied to v5.16.
>
> Tested-by: Michael Schmitz <schmitzmic@gmail.com>

Thanks, queued in the m68k for-v5.18 branch.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
