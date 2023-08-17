Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F612EB64DD
	for <linux-m68k@archiver.kernel.org>; Thu, 17 Aug 2023 09:21:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233836AbjHQJU2 (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Thu, 17 Aug 2023 05:20:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39666 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349526AbjHQJUU (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Thu, 17 Aug 2023 05:20:20 -0400
Received: from mail.sowerbutts.com (mail.sowerbutts.com [IPv6:2001:8b0:3b1:dead::100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE5051FE2
        for <linux-m68k@vger.kernel.org>; Thu, 17 Aug 2023 02:20:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=sowerbutts.com; s=igor; h=In-Reply-To:Content-Type:MIME-Version:References:
        Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=Q9l44Mni0RiRlg2EbOiuMY2XnDoXPvAsQTqdw4ujBIU=; b=dQ/Kc48iDN2MCMpIg9VWfwqPXw
        Ini0Prq7p6wZJwj95/FN8SN9C4O0E29FNpLyLdKbc1WFObBdur/XvCnnd/BJngP+uVWo5SChHAMOC
        aSUAHUTnbfZjQ5mHQ/Rk5T0ZcOlRzybYxsoX0jYyFF/+1hm4esl0rmc2emU1yyv4jeLRoy13KV/B6
        YiS7yDf3qcT929vGBXv8dlFoc9NAlUT/1xmdt9ZEdV6QBm5Fl1jxka79Bn54U3UuukX9h3MHiO+GU
        VwYe1N/ZvbY0dme6+eDZe/G37JSNsO5zthVc6XKPbrdWTFB8ZvXQsV2NmUEP4vbnkiDRSSQWF2EIU
        3mhbQoKQ==;
Received: from badhorse.sowerbutts.com ([2001:8b0:3b1:beef::bad] helo=sowerbutts.com)
        by mail.sowerbutts.com with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.96)
        (envelope-from <will@sowerbutts.com>)
        id 1qWZAt-000d09-0L;
        Thu, 17 Aug 2023 10:20:15 +0100
Date:   Thu, 17 Aug 2023 10:20:15 +0100
From:   William R Sowerbutts <will@sowerbutts.com>
To:     Michael Schmitz <schmitzmic@gmail.com>
Cc:     linux-m68k@vger.kernel.org, rz@linux-m68k.org, geert@linux-m68k.org
Subject: Re: [PATCH RFC v3 0/2] Q40 IDE fixes
Message-ID: <ZN3mT14FzfbhKYt5@sowerbutts.com>
References: <20230817035001.8400-1-schmitzmic@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230817035001.8400-1-schmitzmic@gmail.com>
X-URL:  http://sowerbutts.com/
X-Hatstand: Voltron
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

I'll test this evening and report back.

With a working pata_legacy possible, I would be happy to live without 
byte-swapping in pata_falcon.

Thanks

Will

On Thu, Aug 17, 2023 at 03:49:59PM +1200, Michael Schmitz wrote:
>v4 of the Q40 IDE patch, split into two parts. First patch just fixes the
>bug introduced when converting Q40 to use pata_falcon, second patch adds the
>byte-swapping option requested by William.
>
>Please review this again, just to make sure I haven't messed up anything
>when applying the review comments to the split patches.
>
>Cheers,
>
>   Michael
>

_________________________________________________________________________
William R Sowerbutts                                  will@sowerbutts.com
"Carpe post meridiem"                               http://sowerbutts.com
         main(){char*s=">#=0> ^#X@#@^7=",c=0,m;for(;c<15;c++)for
         (m=-1;m<7;putchar(m++/6&c%3/2?10:s[c]-31&1<<m?42:32));}  

