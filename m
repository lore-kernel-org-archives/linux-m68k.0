Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1531C433EF
	for <linux-m68k@archiver.kernel.org>; Mon, 25 Oct 2021 13:55:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A537260E73
	for <linux-m68k@archiver.kernel.org>; Mon, 25 Oct 2021 13:55:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232473AbhJYN5Y (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 25 Oct 2021 09:57:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60414 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232779AbhJYN5X (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Mon, 25 Oct 2021 09:57:23 -0400
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com [IPv6:2607:f8b0:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 236CFC061348
        for <linux-m68k@vger.kernel.org>; Mon, 25 Oct 2021 06:55:01 -0700 (PDT)
Received: by mail-ot1-x32a.google.com with SMTP id p6-20020a9d7446000000b0054e6bb223f3so15070012otk.3
        for <linux-m68k@vger.kernel.org>; Mon, 25 Oct 2021 06:55:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:in-reply-to:references:subject:message-id:date
         :mime-version:content-transfer-encoding;
        bh=g/hnU3t00+1A81Pi2iQfQrduz1UKfIHTUfOlKH4icUA=;
        b=sBowr1desc5xmrd4rikGfEG96vGBOo3CPo06yQVtY0D2oxBDzZejzjaaarA153FcZN
         pGSIOQgok2XU1+Dzg+j0Ha2mdejxkuyrPknbwd95gC89a6gkhzsWF+KJekV8JPWPrZwK
         UaC/yRZzrMuHCfFs3OxSBy7WRHsC03bCOIVjTKBm1CWBbcObMJ6ci0uQP4eZ+J1/Hp8r
         b3WB04kyRBVNNCXhTS0r0vavld5rpahJZuxiU7s/iZg1lxqbp3MzqA3NHm3kIaY/MBGK
         eo9A9t7YbuUF1m2P5CDMdu8A2oXUdTNL8P0zj0ifvIEbLO5ralHdHNk5MqONX3jX9SGm
         Swuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject
         :message-id:date:mime-version:content-transfer-encoding;
        bh=g/hnU3t00+1A81Pi2iQfQrduz1UKfIHTUfOlKH4icUA=;
        b=Cj2t5WdBn90VJbeo2Zuek2jLiMAU7sxsw9RJ8S0s89UwLxjyN2iwH5CkXyp65ff1IY
         617WF9X/kVq47tXokqGoqBmnyNKE1VDtQoYkdKgSKWJgpUW7eUxCpRuxBz31nCIjYxPL
         Kn7t6swHxEtfigr6GQ0ZUpZypfIRfXFecnAKAa/T39Z+5oJidgxbuI3GTfVOsgIX9+OO
         G+8uM+cQ4HpDhshEZHgpNha8RW5SbKFKofyc9FH0AAnruG5MhfesrQoPuWWsPmPdDWAr
         QAUk9c8n2J7Tj1vbQk4gIEWirGnDZjJ7I1pCv2SoNvuTf9wV0ZhkTQylCtm/o4oHM7AQ
         lNWQ==
X-Gm-Message-State: AOAM531xoshTI/sikqfVQsYC6gu4F1NMD8NKO4TnBJlCrCfB8Eaqz2wu
        9ll9gi9uHXHVxTGTDcb54+s8jqDPws4rUw==
X-Google-Smtp-Source: ABdhPJy7P3WdvsvqeZwBL5NV2+pMr3Mu3OOYFOf7B0Y09A0IhkFH7dpFXHb4K0xB4BuX4RkKV3eWzQ==
X-Received: by 2002:a05:6830:1f27:: with SMTP id e7mr14087376oth.234.1635170100452;
        Mon, 25 Oct 2021 06:55:00 -0700 (PDT)
Received: from [127.0.1.1] ([2600:380:6060:12a6:721f:26e:6f8:a9aa])
        by smtp.gmail.com with ESMTPSA id bo38sm3619200oib.13.2021.10.25.06.54.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Oct 2021 06:55:00 -0700 (PDT)
From:   Jens Axboe <axboe@kernel.dk>
To:     geert@linux-m68k.org, linux-m68k@vger.kernel.org,
        Michael Schmitz <schmitzmic@gmail.com>
Cc:     linux-block@vger.kernel.org
In-Reply-To: <20211024002013.9332-1-schmitzmic@gmail.com>
References: <20211024002013.9332-1-schmitzmic@gmail.com>
Subject: Re: [PATCH v1] block: ataflop: more blk-mq refactoring fixes
Message-Id: <163517009650.161993.17887883073883343140.b4-ty@kernel.dk>
Date:   Mon, 25 Oct 2021 07:54:56 -0600
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Sun, 24 Oct 2021 13:20:13 +1300, Michael Schmitz wrote:
> As it turns out, my earlier patch in commit 86d46fdaa12a (block:
> ataflop: fix breakage introduced at blk-mq refactoring) was
> incomplete. This patch fixes any remaining issues found during
> more testing and code review.
> 
> Requests exceeding 4 k are handled in 4k segments but
> __blk_mq_end_request() is never called on these (still
> sectors outstanding on the request). With redo_fd_request()
> removed, there is no provision to kick off processing of the
> next segment, causing requests exceeding 4k to hang. (By
> setting /sys/block/fd0/queue/max_sectors_k <= 4 as workaround,
> this behaviour can be avoided).
> 
> [...]

Applied, thanks!

[1/1] block: ataflop: more blk-mq refactoring fixes
      commit: d28e4dff085c5a87025c9a0a85fb798bd8e9ca17

Best regards,
-- 
Jens Axboe


