Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6D03C5320E
	for <linux-m68k@archiver.kernel.org>; Thu, 17 Aug 2023 20:26:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347477AbjHQU0F (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Thu, 17 Aug 2023 16:26:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36320 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354900AbjHQUZ5 (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Thu, 17 Aug 2023 16:25:57 -0400
Received: from mail.sowerbutts.com (mail.sowerbutts.com [IPv6:2001:8b0:3b1:dead::100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 498DE35A5
        for <linux-m68k@vger.kernel.org>; Thu, 17 Aug 2023 13:25:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=sowerbutts.com; s=igor; h=In-Reply-To:Content-Type:MIME-Version:References:
        Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=cnrUPYuce+FdYGEayfY4aHSvVh1WoqoFK9Ys3xJVG/s=; b=bS3jspv/CKdpxNpUNo9cXd04zQ
        qXNuY5fM3dpynqzGxi2KtsH1ExLC/RPEH89n3w1fB0pkadlmMuHOGR3qJB3n+n7mHoqHZMiiRlGD0
        CeIl1LC4iXlQPdEtIq029o2EnzmPNGX94H4UIloMy5B6eqy7gOIV25is7tGWYA9JJdfaVNPHBnfeU
        1JNSN2qvildc5kJQeDx6TRndDj/TtvgH8x2y2kojVz3dV1Zt3P6ZxDqHlxNx00jQZOtj8DxRTkKM2
        CxSyDzknINUtppPyoX3UPWqjCDI+rgZfHF2ZFySKJddQtVsmqXUAgIO2dfjnrpHZGEMYf/KhPJUlc
        n+U6GsIQ==;
Received: from [2001:8b0:3b1:cafe:2292:e7dd:dea3:4ff6] (helo=sowerbutts.com)
        by mail.sowerbutts.com with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.96)
        (envelope-from <will@sowerbutts.com>)
        id 1qWjYa-000gLf-1o;
        Thu, 17 Aug 2023 21:25:24 +0100
Date:   Thu, 17 Aug 2023 21:25:24 +0100
From:   William R Sowerbutts <will@sowerbutts.com>
To:     Michael Schmitz <schmitzmic@gmail.com>
Cc:     linux-m68k@vger.kernel.org, rz@linux-m68k.org, geert@linux-m68k.org
Subject: Re: [PATCH RFC v3 0/2] Q40 IDE fixes
Message-ID: <ZN6CNBBSCvFwc9Z9@sowerbutts.com>
References: <20230817035001.8400-1-schmitzmic@gmail.com>
 <ZN3mT14FzfbhKYt5@sowerbutts.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZN3mT14FzfbhKYt5@sowerbutts.com>
X-URL:  http://sowerbutts.com/
X-Hatstand: Voltron
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Thu, Aug 17, 2023 at 10:20:15AM +0100, William R Sowerbutts wrote:
>I'll test this evening and report back.

The patches work.

Thanks

Will

_________________________________________________________________________
William R Sowerbutts                                  will@sowerbutts.com
"Carpe post meridiem"                               http://sowerbutts.com
         main(){char*s=">#=0> ^#X@#@^7=",c=0,m;for(;c<15;c++)for
         (m=-1;m<7;putchar(m++/6&c%3/2?10:s[c]-31&1<<m?42:32));}  

