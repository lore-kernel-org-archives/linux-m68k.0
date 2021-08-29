Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4DE3C432BE
	for <linux-m68k@archiver.kernel.org>; Sun, 29 Aug 2021 03:12:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 892B260E97
	for <linux-m68k@archiver.kernel.org>; Sun, 29 Aug 2021 03:12:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232718AbhH2DNA (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Sat, 28 Aug 2021 23:13:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56162 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231558AbhH2DNA (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Sat, 28 Aug 2021 23:13:00 -0400
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DEE75C061756
        for <linux-m68k@vger.kernel.org>; Sat, 28 Aug 2021 20:12:08 -0700 (PDT)
Received: by mail-pj1-x102b.google.com with SMTP id fz10so7258283pjb.0
        for <linux-m68k@vger.kernel.org>; Sat, 28 Aug 2021 20:12:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=SpcOd2MIvcOldUpxUHBYqiU8SOG2Sst2j14VLXb1EY0=;
        b=kd9eScxZYvHRjnBaWHNpzwAIq6VlqPacYLcnKgJ3IsHaYEtW3sI3nVepFX5Be4+gb1
         eocupLZJK1urHmfBVl+VtwF8H4qktYtzUowfb4spmvCAvA/Sqysd3aeC8g2DEfIsL/zp
         DcAv/tWpbp+Puq1Abt+2gQbJUFtBASiUxVdcb2W/xvN0o0IcfNsJwLX2cZWemPe0/JOK
         BHRqwBdErujj+rBBjCcL4UvM6at3z0NahGSKAzZlDxCrkTCGCrtBSvYWkT8e12RNOD+B
         qzunLT596+hbj9PDSvQsWP1DIZ9xASnVVP1duC1PZs5/G/l9BGXgHwNPDp914cGS/rtY
         C5wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=SpcOd2MIvcOldUpxUHBYqiU8SOG2Sst2j14VLXb1EY0=;
        b=G43EbWBZwqCvxzBLvbj9P786KxiW2M5+iAJHpZVmIrBmiTDxYimf06vk8BW6Qj1uNU
         I4Vc9VA/wr1bng2Q+DXrMZVwFTiP02v/idSAYHm/5M4qizNnvUKWQ4UCSrfqkt5J3bJW
         j9sKEsfNr2J4tQRtEb0WZsZwPW4mjJOGcKvv/EsLi55M2dm7zhB6+273ybTr76kerkVS
         5Dbx6B3E8RSX4hctGegm9NFSkUQzQBcGJ7Yq0geyhfCERgN5Yh0YBnoASnjUlI3w2IjA
         parxAvtZMRL9umJEle0vXH0FGclsmLodsMVDBb4QFYzHcOhEmmtur7ymkqdsdkaKsSt/
         A+vw==
X-Gm-Message-State: AOAM530qxKtT4wKLMJzum1Me6dWdTGNUUMKzioY5/ZLeElOF7EB/zPNX
        CUn9q3O+cB/CpAjWUVxa3+lHa3rMsno=
X-Google-Smtp-Source: ABdhPJycKEE6mT8BRfzgzSr8n9C3+IhwwK9pQroYYIN7btRI1J9kkYyaVZUpBFce8euTucS7JvasZw==
X-Received: by 2002:a17:902:9a03:b029:12d:72e2:f7a1 with SMTP id v3-20020a1709029a03b029012d72e2f7a1mr15642811plp.49.1630206728168;
        Sat, 28 Aug 2021 20:12:08 -0700 (PDT)
Received: from xplor.waratah.dyndns.org (222-155-6-212-adsl.sparkbb.co.nz. [222.155.6.212])
        by smtp.gmail.com with ESMTPSA id a7sm11769953pga.34.2021.08.28.20.12.06
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 28 Aug 2021 20:12:07 -0700 (PDT)
Received: by xplor.waratah.dyndns.org (Postfix, from userid 1000)
        id 5CAA03603E5; Sun, 29 Aug 2021 15:12:03 +1200 (NZST)
From:   Michael Schmitz <schmitzmic@gmail.com>
To:     linux-m68k@vger.kernel.org, geert@linux-m68k.org
Cc:     alex@kazik.de
Subject: [PATCH v7 0/4] Add APNE PCMCIA 100 Mbit support
Date:   Sun, 29 Aug 2021 15:11:46 +1200
Message-Id: <1630206710-5954-1-git-send-email-schmitzmic@gmail.com>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Revisit support for the 100 Mbit APNE PCMCIA card variants, again.

Add a new ISA type for these cards, and switch to that type
from the APNE probe code in case 16 bit IO support is noted
the PCMCIA config table data. A module parameter or kernel
can be used to enable 16 bit IO as a fallback option.
Support for the 16 bit 10/100 Mbit cards is now included by
default.

The first two patches enable the use of core PCMCIA code to
parse config table entries. The remaining two patches add 16
bit IO support to the m68k low-level IO access code, and switch
the APNE driver to use 16 bit IO on cards that support it (the
100 Mbit cards).

I'm in two minds about enabling CONFIG_PCMCIA - the alternative
is to duplicate the cftable parser in amiga/pcmcia.c (which
has been tested and works just as well). Feedback welcome.

Tested by Alex on a 100 Mbit card. Not yet tested on 10 Mbit
cards - if any of those also have the 16 bit IO feature set
in their config table, this patch series would break on those
cards. 

Note that only patch 4 has been sent to netdev. Please CC
linux-m68k when providing comments.

Cheers,

   Michael
