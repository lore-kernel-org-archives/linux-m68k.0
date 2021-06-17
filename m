Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96332C2B9F4
	for <linux-m68k@archiver.kernel.org>; Thu, 17 Jun 2021 05:28:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6309B61241
	for <linux-m68k@archiver.kernel.org>; Thu, 17 Jun 2021 05:28:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229515AbhFQFat (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Thu, 17 Jun 2021 01:30:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55366 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229580AbhFQFat (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Thu, 17 Jun 2021 01:30:49 -0400
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A09E4C061574
        for <linux-m68k@vger.kernel.org>; Wed, 16 Jun 2021 22:28:42 -0700 (PDT)
Received: by mail-pl1-x62b.google.com with SMTP id e7so2310935plj.7
        for <linux-m68k@vger.kernel.org>; Wed, 16 Jun 2021 22:28:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=IFywHEcVNePkUFCp4ND1o9fM3/6/OfmM6q2uBS+rX1k=;
        b=rA3PUDOyaiORM437Wt7y6kPmgDHJIIkaxho6YxfteQPraksQPbiedloQyNn5t1t971
         qJsIGaljdz8FWIDy/x6sjnkGp4hzvUhYkElyrcQli1/0+7PAugbRcQV7zJ511cNAUOT0
         09rO67aN8Y0QHwtZDEkt6Oerdl0NkVJiLaRzjAg6fz+svl9MZHAKiM1iYhbi5eRIM2M+
         uNsKupX+o7Ok/6UAdOtO+uYrKLRVd3urKOMsza3dMyox+lWq0Fa/ne1D09Z4QRmNsvRX
         CUInc5bo6PotbRHNVipZDD2Wwtf3yT6BUdtM8MJQIdK6bLaXcv7By+xJkRzHmZERGd6/
         T6Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=IFywHEcVNePkUFCp4ND1o9fM3/6/OfmM6q2uBS+rX1k=;
        b=jYKeUAxNlHE0eLSwr/HyHEwc5mYEAST1kpex9SVJ7EZruoR8VXw9N4vToLShkNS1sC
         Zcqt5nxGzkc/cnyJ8NBUfwpE7Q+UUuffYrWiaJj7Dzj7sWb22fa9UyMuixyAgx1S7vjx
         IAnpL0OI74dQD/KsePCV6ckLJPGKZtsO84xFCt8zUBImKoQO39+Mm97uxCmO+U9sK7eC
         NbgYJ6cth/6rQH79emNiGBqT/Iyr1AkER81sudRJZeDhtT+3YAHzejJ+SfaZ8dlTKTlX
         cNMT1BTO/jljpoddiXlfR9R4HJ7WtnxhCvaNrrt8Y5D47f6anSI4UQKBMwwSn0qSrynB
         e5Gg==
X-Gm-Message-State: AOAM533kUsV1lMHisUGFkPnAk9e1MHHJcgwU57JaapXakr0tZDCMSYl2
        4El5BTTKnikPI3SavyRpO0pR5lrVynXXOw==
X-Google-Smtp-Source: ABdhPJxFVIRXFrngFrLf0nISXyVV58rYkjurSwm5+QF5WDMkRgb+XoxOJUPP+rVm9ttGOnJowJHHEg==
X-Received: by 2002:a17:90a:5b13:: with SMTP id o19mr3782579pji.33.1623907722099;
        Wed, 16 Jun 2021 22:28:42 -0700 (PDT)
Received: from xplor.waratah.dyndns.org (222-152-189-137-fibre.sparkbb.co.nz. [222.152.189.137])
        by smtp.gmail.com with ESMTPSA id 21sm3554994pfh.103.2021.06.16.22.28.41
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 16 Jun 2021 22:28:41 -0700 (PDT)
Received: by xplor.waratah.dyndns.org (Postfix, from userid 1000)
        id DFCCD36040F; Thu, 17 Jun 2021 17:28:37 +1200 (NZST)
From:   Michael Schmitz <schmitzmic@gmail.com>
To:     linux-m68k@vger.kernel.org, geert@linux-m68k.org
Cc:     alex@kazik.de
Subject: [PATCH v3 0/2] Add APNE PCMCIA 100 Mbit support
Date:   Thu, 17 Jun 2021 17:28:30 +1200
Message-Id: <1623907712-29366-1-git-send-email-schmitzmic@gmail.com>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Add another ISA type for these cards, and switch to that type from the
APNE probe code in response to a module parameter. 

I've addressed review comments received so far, to the best of my ability.
Patch 1 not changed in v3, only fixes to patch 2 by Alex Kazik included.

v3 is the first version of this patch series sent to net-next (apne.c part
only).

Tested by Alex on his Amiga 1200.

Cheers,

   Michael
   
