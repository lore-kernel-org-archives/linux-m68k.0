Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC976C48BC2
	for <linux-m68k@archiver.kernel.org>; Thu, 24 Jun 2021 00:46:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BD5EA6135A
	for <linux-m68k@archiver.kernel.org>; Thu, 24 Jun 2021 00:46:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229726AbhFXAs1 (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 23 Jun 2021 20:48:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56804 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229774AbhFXAs1 (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Wed, 23 Jun 2021 20:48:27 -0400
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 825FFC061574
        for <linux-m68k@vger.kernel.org>; Wed, 23 Jun 2021 17:46:07 -0700 (PDT)
Received: by mail-pj1-x1033.google.com with SMTP id pf4-20020a17090b1d84b029016f6699c3f2so4851089pjb.0
        for <linux-m68k@vger.kernel.org>; Wed, 23 Jun 2021 17:46:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=CLHia9oswNQBy60BPFNT5axjl6jZJ6EocVShHiLlV5U=;
        b=kQPrzd707EomJ7Omg9XQ3++M8qg8861I1vxohKgI285gENICFWtdciBsg1p6/aBtmu
         KoCY9bKy8lfDwnS1TTLyRgHG3AmfmyMXkb/1VvcOAF9nM71bl/Nvly5EniLCAVu+fKec
         IiNCG4/GQSDU6gram9dfU0r8yXwkPeR3iFm7OR9SDv+D6GI6KgJsUixd+r9J1owVPufH
         I83fi6+VZm45e/aoF8rXkvDRgN5mFmfwRhtsZEGj1cb2Me2E7CP7yUyhX0MM6KfGyH2z
         hWsazPxgcGg1yTdl6rvuy2F8LEmNZMQE4Vm6wVHkBFxQCDvCYrDiMrxGC+1B+9fkCS/z
         ebPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=CLHia9oswNQBy60BPFNT5axjl6jZJ6EocVShHiLlV5U=;
        b=ulImte4o7VLY24m5lx139YFjo2W5hGPEtZec+DikFxcepWWnD7giJm6T/sBvmXamt0
         hpSNjkDF/bBu8Xls24p53jqQv3OtAcXa19EA7iUlZ9Yq1F5S3cjC9tHnj/p74FwvY2qU
         9yJNa4CyVWBLVLRzRI5K1Pzyx4Nq6QsrY8TeDhVsC282NTLRHTbBhmAbPt8Whxn2uzt1
         VZO3LfABazJL7v8qkVgJgY6jsdlw3UB7Db6rKSxjnik3jSMCVx9WqZIxI3NlbhGjhOPX
         cS5zVSK9O6Wz3pEGCdbch2bKH0mhgFDbveT/aNXS8aqL2j//dKP0ZTOIXfThOa1gYIYJ
         lIwg==
X-Gm-Message-State: AOAM531V1Nu6RxjeyR7yq/G3ENG0NE2J7qDQTa9FepAV8uxCidbF9dHG
        zYNAiimyaXrDUp/M5pqOJWgpxcsxV+jVOA==
X-Google-Smtp-Source: ABdhPJxxYpFOyCek+EyFE4eVISUrfKUPqA+C+3g0D6LalnX7hz+UtiVZpQ6Z7uyLgFl3IFBxeV+4ow==
X-Received: by 2002:a17:90a:d141:: with SMTP id t1mr4788063pjw.131.1624495567112;
        Wed, 23 Jun 2021 17:46:07 -0700 (PDT)
Received: from xplor.waratah.dyndns.org (222-152-189-137-fibre.sparkbb.co.nz. [222.152.189.137])
        by smtp.gmail.com with ESMTPSA id j2sm869246pfj.168.2021.06.23.17.46.05
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 23 Jun 2021 17:46:06 -0700 (PDT)
Received: by xplor.waratah.dyndns.org (Postfix, from userid 1000)
        id 509E33603D8; Thu, 24 Jun 2021 12:46:02 +1200 (NZST)
From:   Michael Schmitz <schmitzmic@gmail.com>
To:     linux-m68k@vger.kernel.org, geert@linux-m68k.org
Cc:     glaubitz@physik.fu-berlin.de, schwab@linux-m68k.org
Subject: [PATCH v6 0/2] Add kernel seccomp support for m68k
Date:   Thu, 24 Jun 2021 12:45:58 +1200
Message-Id: <1624495560-6351-1-git-send-email-schmitzmic@gmail.com>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Respin of m68k kernel seccomp support. The number of syscall
arguments copied off the stack in syscall_get_arguments() is 
limited to 5. Need to figure out where to pull the last from,
for the few six-argument syscalls.

Cheers,

	Michael

