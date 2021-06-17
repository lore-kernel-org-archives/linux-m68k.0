Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97B71C2B9F4
	for <linux-m68k@archiver.kernel.org>; Thu, 17 Jun 2021 22:38:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 79688613CA
	for <linux-m68k@archiver.kernel.org>; Thu, 17 Jun 2021 22:38:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231691AbhFQWkP (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Thu, 17 Jun 2021 18:40:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60250 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231295AbhFQWkO (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Thu, 17 Jun 2021 18:40:14 -0400
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F457C061574
        for <linux-m68k@vger.kernel.org>; Thu, 17 Jun 2021 15:38:06 -0700 (PDT)
Received: by mail-pf1-x42b.google.com with SMTP id x73so6148068pfc.8
        for <linux-m68k@vger.kernel.org>; Thu, 17 Jun 2021 15:38:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=T9CakggphnsGnc2QyV4L5tY5oZBt8JRHWy2G8+S2q9E=;
        b=shQDfRZOTF38xEm6bZm79Dzfq7sScLcsdAOSr0b2z0LGa01K9cIPDRzAncHHqqddYb
         HX6pnGTgyAz+LS3dlk7mKKr1Xrosq0fQPoZNPFXS+poHzrNwZDSngbtggDbe0CI7uCfr
         0Y/FZWXPkxX349ZoK54qu40SM6jcFUUjmEXMPv8w/3F3LROWlZwsmTSjrJ7gksCEI4e2
         vbpzAsIg/xaq+v0ZJtPPXCBON901gWKGHMDWcdel/frZDWvXIRQ+o2hwvBM5gw+6yiKC
         UVNEdNVsD3+080ZVIxXpiNA3tcNRFLgfpMaNNjtYvcWKM584wT3xaLuNYUh6xazl7CKw
         +k9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=T9CakggphnsGnc2QyV4L5tY5oZBt8JRHWy2G8+S2q9E=;
        b=MbTjhKjdL45rW+bsTay4bUYxDf2q22dIzpKOoz/w0HBqTQcZZy3zZU2XtcFmZqdIwO
         dWjOlVphIg3Pq15r3J7hNyXQKaHluS8mdz4zTK+ME1SUD0j0tlSlnCEYYerZFVXqzpV+
         3B4wm4KZiLXtLefl4rsLtYAGQOw6SGa+ASiihZMWCd637AZVRVJpPf6QAsA9M2K+hT9J
         PG7yIW1IVUyObD21mF9MJcAdaul8ar/V9aZ91XFdrc4u/2tCHbGjfVch02ESLCdTVn/f
         Mo/bpjODUddR8FumBOIew0A1hCKOx66Mz4VG6UflNlWDBhh/+aapNXRHGO+FTYyFuJMJ
         NzGw==
X-Gm-Message-State: AOAM531LOcrEuz/OxdurgUrT0T5XaXmJps2sOD5V2k17awEUdgRIccF8
        vdyncys68e74uoD1W9CK1o0=
X-Google-Smtp-Source: ABdhPJzntAh7DtJtnML7R/Z9Pbfag68fb+pjxTthv0xxaBOmBVg3uuxbp24cHRDZVv6uM4025CGw+w==
X-Received: by 2002:aa7:9988:0:b029:2fa:c8cd:eb66 with SMTP id k8-20020aa799880000b02902fac8cdeb66mr2149818pfh.62.1623969485869;
        Thu, 17 Jun 2021 15:38:05 -0700 (PDT)
Received: from xplor.waratah.dyndns.org (222-152-189-137-fibre.sparkbb.co.nz. [222.152.189.137])
        by smtp.gmail.com with ESMTPSA id e24sm6518020pgi.17.2021.06.17.15.38.04
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 17 Jun 2021 15:38:05 -0700 (PDT)
Received: by xplor.waratah.dyndns.org (Postfix, from userid 1000)
        id 0C0B83603D8; Fri, 18 Jun 2021 10:38:00 +1200 (NZST)
From:   Michael Schmitz <schmitzmic@gmail.com>
To:     linux-m68k@vger.kernel.org, geert@linux-m68k.org
Cc:     alex@kazik.de
Subject: [PATCH v4 0/2] Add APNE PCMCIA 100 Mbit support
Date:   Fri, 18 Jun 2021 10:37:57 +1200
Message-Id: <1623969479-29657-1-git-send-email-schmitzmic@gmail.com>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Add another ISA type for these cards, and switch to that type from the
APNE probe code in response to a module parameter. 

v4 addresses errors I introduced in v3, and review comments by Alex and
Finn. 

v3 was the first version of this patch series sent to net-next (apne.c part
only).

Tested by Alex on his Amiga 1200.

Cheers,

   Michael

