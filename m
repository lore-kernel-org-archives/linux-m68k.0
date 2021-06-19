Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45FD1C48BDF
	for <linux-m68k@archiver.kernel.org>; Sat, 19 Jun 2021 00:35:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 29F8A61205
	for <linux-m68k@archiver.kernel.org>; Sat, 19 Jun 2021 00:35:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232415AbhFSAhJ (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Fri, 18 Jun 2021 20:37:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40582 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233796AbhFSAhJ (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Fri, 18 Jun 2021 20:37:09 -0400
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F4CAC061574
        for <linux-m68k@vger.kernel.org>; Fri, 18 Jun 2021 17:34:58 -0700 (PDT)
Received: by mail-pl1-x631.google.com with SMTP id o21so5534640pll.6
        for <linux-m68k@vger.kernel.org>; Fri, 18 Jun 2021 17:34:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=VAomzo6DJ7NU6hK8fpQfCFwLNtqVuqUzwbtSjFfHCdA=;
        b=FbfNhZAGPKoCLII5vbj8fHzz2VabEO1MjVxAMf96w0SI522/47ILJmUl4z9jZGKaKE
         PVzS0tJSUe7bwYpGZrhftDcPxBblgW5VKSEeCa/7MkoYIlmq8vuj+rI3lFviIAC61eFz
         wobc8ijPFNDQw/UbCtEEA/kdh8t9W8vtRuJ7f6bzAph9Nkei5SNmmuSUmaC/nchh5DMS
         jIJC7t7XMMKHr6jcn8LFScYGacXxoAamYPFaVRh037/7JonQG+ZfFh37n1MoYrw025AM
         CSgnUMGKvVol7ugPuJEN4MhB7XEQQRAwNt4DkdiLrE83Dmt/PrUKB1NJQ8nYH/Xnqvf/
         54Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=VAomzo6DJ7NU6hK8fpQfCFwLNtqVuqUzwbtSjFfHCdA=;
        b=mI++4XHbirD6/7YzaqxSEMHW08BSowt6Zfd2chmBAO0x1UHdU8Cfn3RwAax1EyKbXF
         uR50r4jNLaDur06VSJnt84LAIxTLpuhhXZoKL97WRL7TgvTk9a7bRNk64+kYnRLUS2lc
         nRqV+hqSap7St91W1ifdE37lRuiGQMOQkwUUkTYzgt0SGSlGdo6lnrV1ds8o0lYxzS3A
         L46D/6ceHcp1p5N1KDdQ8fI7E+7g5YeL2WTh2yysAn89pYSAmdB/iHywLkHcTly7sht+
         nzstbV7WqMNFMT/WYUWU2SNe3OOcXYxYfN8Xbsz9YrtD3VLSF/KDH2h3KGT0gO7kOw4G
         YhYQ==
X-Gm-Message-State: AOAM531CNZjONrrzNIUVmFWytxiY+ziq9COJyoFQgAnQS9lW9KrnCLNW
        9Q3b4RjCLdujZX0PH2Mui33V4cp3W+U=
X-Google-Smtp-Source: ABdhPJxUcdRw3TNs55zS7bsA6eWx7bRUAXNHzo2Y5JzqcVgSqtzwahrjnU+eSQY7RKnnwT55WsPzqw==
X-Received: by 2002:a17:90a:69e2:: with SMTP id s89mr123769pjj.154.1624062897898;
        Fri, 18 Jun 2021 17:34:57 -0700 (PDT)
Received: from xplor.waratah.dyndns.org (222-152-189-137-fibre.sparkbb.co.nz. [222.152.189.137])
        by smtp.gmail.com with ESMTPSA id r4sm8954604pja.41.2021.06.18.17.34.56
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 18 Jun 2021 17:34:57 -0700 (PDT)
Received: by xplor.waratah.dyndns.org (Postfix, from userid 1000)
        id 2C7313603D8; Sat, 19 Jun 2021 12:34:53 +1200 (NZST)
From:   Michael Schmitz <schmitzmic@gmail.com>
To:     linux-m68k@vger.kernel.org, geert@linux-m68k.org
Cc:     alex@kazik.de
Subject: [PATCH v5 0/2] Add APNE PCMCIA 100 Mbit support
Date:   Sat, 19 Jun 2021 12:34:49 +1200
Message-Id: <1624062891-22762-1-git-send-email-schmitzmic@gmail.com>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Add another ISA type for these cards, and try to autoprobe for that type
early in the device probe. As a fallback, it is possible to switch to
the new type through a module parameter. 

Support for the 16 bit 10/100 Mbit cards is now included by default.

Compile tested only - I hope Alex can test the autoprobe bit now that
we know mode selection by module parameter works.

Cheers,

   Michael

