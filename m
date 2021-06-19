Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 663C0C2B9F4
	for <linux-m68k@archiver.kernel.org>; Sat, 19 Jun 2021 23:24:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 38FFF60FEA
	for <linux-m68k@archiver.kernel.org>; Sat, 19 Jun 2021 23:24:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230047AbhFSX04 (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Sat, 19 Jun 2021 19:26:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229591AbhFSX0x (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Sat, 19 Jun 2021 19:26:53 -0400
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com [IPv6:2607:f8b0:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF2BDC061574
        for <linux-m68k@vger.kernel.org>; Sat, 19 Jun 2021 16:24:40 -0700 (PDT)
Received: by mail-pg1-x534.google.com with SMTP id u190so7132824pgd.8
        for <linux-m68k@vger.kernel.org>; Sat, 19 Jun 2021 16:24:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=U9QzV6uamNQuCapEV7AChyrLmdUewXmjuKNxDkaSc14=;
        b=njrlMBpPgV93efkzjocy7H0eE7LegEnbjs48fwBGLCfsOB8Hq6wsf5qFoCRHnIRoWg
         JaPlFawTpGtlz8IAfr3FggBI5W1aK0JK58jmKTDZ/O2KP4ZYuh/oFrSmL4rkcxxd6ROq
         K1SeJVkULA1bSUfshgDr8S8AGV/Pz1De5vQpAJof+yEoCpalgmWQ2+G3JX4dJEQpmKi1
         5ecAyyUnP2TLmmCYn9NXkumTiYs+0nF3OlNAnGoyqQyMwJ8Yhg/28GERaA7KSPL8ORkk
         rfuMDX5mEWuP1SQvqIjdXmMbcMr9XkcdgXVw0fVa1lA/HxCq6SMervG0Xx+sChoujYqe
         lFJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=U9QzV6uamNQuCapEV7AChyrLmdUewXmjuKNxDkaSc14=;
        b=fQiA+PyHH43vSwgowe9yo8oQ2H+O0bgYu9DtfrgX9Id/aUPWFZJAVWRcdv0qp6sr8y
         E2SG1LcgpOdjTzGuEX0ZVIdVW6YXdV9MewsDxBot1+r8Y7H7o0jKUbs/frtPlCcE9i5O
         zkYA+24rTM/cQ4Ko3voRi7Nb6S4jqdD+6a4VEIYEYjmzoRzOQkVGcpQ4okFSYFOrvgYL
         WY3ZViFoimUKBAN2/T8vZ2VTrnsRKrxvJot/pmjob2Zjf4AgZDMLYCG5RA9LpLtgA5Y8
         Z+7F6LxvQaZDCx6mruQTt/kBn4iHJtsMl2QOQ667uzvrlyUdBpmthlXs26bWFYkhDfM6
         Z3Kw==
X-Gm-Message-State: AOAM53345USNRFIcYrBL+B2FjmOPa/KFOfWPbbMb3w5jvNHgrB0a3qN1
        KN44ilWGORs0HDDE8eLdZUVcqLb/6tI=
X-Google-Smtp-Source: ABdhPJxWfRDZW3EkOdrn9JvciWalBlh763y6YB8/DwgEL9KXzTSoo0EOH8wIBa90NbBX4yCQtJGGpg==
X-Received: by 2002:a63:5b0e:: with SMTP id p14mr16598307pgb.110.1624145080205;
        Sat, 19 Jun 2021 16:24:40 -0700 (PDT)
Received: from xplor.waratah.dyndns.org (222-152-189-137-fibre.sparkbb.co.nz. [222.152.189.137])
        by smtp.gmail.com with ESMTPSA id w2sm11303519pjq.5.2021.06.19.16.24.38
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 19 Jun 2021 16:24:39 -0700 (PDT)
Received: by xplor.waratah.dyndns.org (Postfix, from userid 1000)
        id 807463603D8; Sun, 20 Jun 2021 11:24:35 +1200 (NZST)
From:   Michael Schmitz <schmitzmic@gmail.com>
To:     linux-m68k@vger.kernel.org, geert@linux-m68k.org
Cc:     alex@kazik.de
Subject: [PATCH v6 0/3] Add APNE PCMCIA 100 Mbit support
Date:   Sun, 20 Jun 2021 11:24:30 +1200
Message-Id: <1624145073-12674-1-git-send-email-schmitzmic@gmail.com>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Now that we've sanitzed m68k io_mm.h, revisit support for the 100 Mbit
APNE PCMCIA card variants that didn't find favour with the netdev folks
three years ago.

Add another ISA type for these cards, and switch to that type from the
APNE probe code in response to a module parameter or kernel option.
Support for the 16 bit 10/100 Mbit cards is now included by default.

Try to autoprobe for 16 bit mode (patch 3; experimental!).

Note that only patch 2 and 3 have been sent to netdev. These patches
depend on patch 1, and must not be applied to the netdev tree before
Geert has applied patch 1! A note to that effect has been added to
the commit logs. 

Cheers,

   Michael


