Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53D71C433EF
	for <linux-m68k@archiver.kernel.org>; Tue, 19 Oct 2021 12:12:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3BF0861260
	for <linux-m68k@archiver.kernel.org>; Tue, 19 Oct 2021 12:12:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231236AbhJSMO6 (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 19 Oct 2021 08:14:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33086 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230097AbhJSMO5 (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Tue, 19 Oct 2021 08:14:57 -0400
Received: from mail-il1-x12f.google.com (mail-il1-x12f.google.com [IPv6:2607:f8b0:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 52F01C061745
        for <linux-m68k@vger.kernel.org>; Tue, 19 Oct 2021 05:12:45 -0700 (PDT)
Received: by mail-il1-x12f.google.com with SMTP id a8so18088795ilj.10
        for <linux-m68k@vger.kernel.org>; Tue, 19 Oct 2021 05:12:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=S2+IEK3kg0Zk0fJ8fVzfsJ8iQZtRFkLoIjiPyMP+4TQ=;
        b=rYMR3/ayUdq6BOHApXcp3WB8LgaM+NV4OChBFajBEypzKlP5oEtHPhP6l29DHWi+u5
         Z4xECFjipr206uH0Av8SQzdEUxp53elYQFNswRVJtpzNj+vbY5dFRLjr3pmM6OVvOv6N
         ywdmDr8bE2+0vQrEtFDAgrabxwfygbSMXEz37Gv7mAhjZcCgQqPGNJJsMOz0nKZ14Ayc
         7FQzr6r/MS4h+V8vkqoHZ3dOGEyTlU2jxGfk11mZIq9RsH0oKRiCveZTA8UcnQfmozUK
         qqpMa3wOVr/XLwqkIeiV+f4+YgS8Dzreo6cUzr/U1HUy1PgXtoo/ZJM8BDdc4tGvPv9S
         LRkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=S2+IEK3kg0Zk0fJ8fVzfsJ8iQZtRFkLoIjiPyMP+4TQ=;
        b=XLRDhpY76tIgOSJndTbzWz8L7FoHYh2T+/tFg2LEAy6jBSB8eXYJaI+BatwOkXrl7S
         wmV98/cuAtG4SQay1TbparzPqPtYjhrcsVSJVPHPAf19K6Mq7FeMdOHSqi7txAqe21KQ
         CWkGSLcriUb6Ied/ETTrusjghS9rnY3ZeIpaOeKj4ObTuqPT2WxYxcuAXZNATl3A5Gab
         MuuGr0YQKFyDR1+bsruClE0JlQ2CrT/zEhvZWnUyk7laa+ilHZf24rp1OS1LrCnYtTvY
         Z2eQ9TFhCiOEPzUj0B8P8hYHwPI6Z2T+IAdSNhBw+eVcGu87FOgQ3wj7k1hgCZIeehPC
         EnXw==
X-Gm-Message-State: AOAM533ofeGxaCXiCAAU/L26vYObyLAjik1QvPel/YZMy3xa+737+g0O
        4NoMCXa3gA9PD2JZZXFpq5FnIg==
X-Google-Smtp-Source: ABdhPJy1dAgRBhEuurIgLxhtm5eJT2y+bdnaMO2DXmtd55Pm4T/CUs9a59T40/rDSJV07Qx3iTn0cA==
X-Received: by 2002:a05:6e02:160e:: with SMTP id t14mr18857041ilu.107.1634645564723;
        Tue, 19 Oct 2021 05:12:44 -0700 (PDT)
Received: from localhost.localdomain ([66.219.217.159])
        by smtp.gmail.com with ESMTPSA id y6sm8587580ilv.57.2021.10.19.05.12.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Oct 2021 05:12:44 -0700 (PDT)
From:   Jens Axboe <axboe@kernel.dk>
To:     geert@linux-m68k.org, Michael Schmitz <schmitzmic@gmail.com>,
        linux-m68k@vger.kernel.org
Cc:     Jens Axboe <axboe@kernel.dk>,
        Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
        linux-block@vger.kernel.org
Subject: Re: [PATCH v2] block - ataflop.c: fix breakage introduced at blk-mq refactoring
Date:   Tue, 19 Oct 2021 06:12:41 -0600
Message-Id: <163464555754.595860.5260761740824485566.b4-ty@kernel.dk>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211019061321.26425-1-schmitzmic@gmail.com>
References: <20211019061321.26425-1-schmitzmic@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Tue, 19 Oct 2021 19:13:21 +1300, Michael Schmitz wrote:
> Refactoring of the Atari floppy driver when converting to blk-mq
> has broken the state machine in not-so-subtle ways:
> 
> finish_fdc() must be called when operations on the floppy device
> have completed. This is crucial in order to relase the ST-DMA
> lock, which protects against concurrent access to the ST-DMA
> controller by other drivers (some DMA related, most just related
> to device register access - broken beyond compare, I know).
> 
> [...]

Applied, thanks!

[1/1] block - ataflop.c: fix breakage introduced at blk-mq refactoring
      commit: 86d46fdaa12ae5befc16b8d73fc85a3ca0399ea6

Best regards,
-- 
Jens Axboe


