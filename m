Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38288C48BCF
	for <linux-m68k@archiver.kernel.org>; Wed,  9 Jun 2021 15:25:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1F3DE60E0B
	for <linux-m68k@archiver.kernel.org>; Wed,  9 Jun 2021 15:25:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234841AbhFIP0y (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 9 Jun 2021 11:26:54 -0400
Received: from mail-pg1-f181.google.com ([209.85.215.181]:42909 "EHLO
        mail-pg1-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234688AbhFIP0y (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 9 Jun 2021 11:26:54 -0400
Received: by mail-pg1-f181.google.com with SMTP id i34so13317905pgl.9
        for <linux-m68k@lists.linux-m68k.org>; Wed, 09 Jun 2021 08:24:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Cr+10Kcfl8befxhqRoI8l0gcA3LyZMDypV8e112mfEc=;
        b=AH3D/1geZxNQ9z7YrsuVfHmFRcc4zb4CpT+zCT2VTLWK7G9ov5dEiDrmCxGSG8WNEI
         CPKRyZAnTx5UhqiHuh9oP61Lf2HYLn1vfm7NAqmkXes4zrBEooiVkMIT7VCxU+tBdrvp
         472ChJEtwnijTmR8BIU2Yqnlb+yIvnzCH5gU2ECzmgNPbuxMeMj0agfTrNQIktqBoh5g
         SU+2uO640bMJwQ31gultXLG2asZrqrBzEoxRuE5a/swDwHss9x3BfPTGaSnItw4Taz+P
         TslHN48bkywfy31FZUQY9o18326L4QmCwCFfwOjgDdPmU7zA9qKvwg2uTR5kEIw9RdmL
         szkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Cr+10Kcfl8befxhqRoI8l0gcA3LyZMDypV8e112mfEc=;
        b=NwPLVPcqz58HXVcAw/qCFVe1Ya8sC1EDp0wMRiKEZy+eRYL8mxMp+rs6+NuDi9w/8U
         2cI9gEl84PXfZAVPQga6WIHPbZF3VTGvkCLUe9I4IPoplAj9Wj9P7D+1kMip/+VfdWkx
         Kza2Q5gnKPnbiaqjNDf+0gRmixMnYywAGYLot6wbdzT0SaoNQm4Z7YuFS1SwiVl07ZOM
         PYsyEeH8kuqBHGXpaiJuTcNK0mB1HN31LxZVNTuk8GZWMByAMWsNhnwMj+gc4tNJzQhi
         Es/EzMt6R0T5OVEw4pYTca71Mut6d7NA7jfVMDDaJ1fuE43ewJikBxiTs9okIA7J6k8N
         bIbw==
X-Gm-Message-State: AOAM530EE0SWPOfK73cdw+CERCBHfvbnJPzoYesvfBmYkJ+/njyiTB33
        W5GCaNPTuOI5oW0EKBB/wE7WDQ==
X-Google-Smtp-Source: ABdhPJz4JFxHF5HT/Sf/16gK3QpUtzsWvDwelmezplwVTNeYf4CgjXeF5D6OGEv3bKFwzB3+WtKvdA==
X-Received: by 2002:a05:6a00:b8a:b029:2ec:761e:33e3 with SMTP id g10-20020a056a000b8ab02902ec761e33e3mr375293pfj.35.1623252239567;
        Wed, 09 Jun 2021 08:23:59 -0700 (PDT)
Received: from [192.168.4.41] (cpe-72-132-29-68.dc.res.rr.com. [72.132.29.68])
        by smtp.gmail.com with ESMTPSA id k7sm5424258pjj.46.2021.06.09.08.23.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Jun 2021 08:23:59 -0700 (PDT)
Subject: Re: [PATCH v2 0/2] Use libata platform drivers to replace deprecated
 m68k IDE drivers
To:     Michael Schmitz <schmitzmic@gmail.com>,
        Christoph Hellwig <hch@infradead.org>,
        Finn Thain <fthain@linux-m68k.org>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        "David S. Miller" <davem@davemloft.net>,
        Joshua Thompson <funaho@jurai.org>, linux-ide@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
        Richard Zidlicky <rz@linux-m68k.org>
References: <cover.1623131194.git.fthain@linux-m68k.org>
 <YL+AqIEPjMgG519L@infradead.org>
 <d3c70f7a-368a-ad9a-6575-8289234b0ce0@kernel.dk>
 <36f7519d-698f-1284-551a-0dbd82e2a0d8@gmail.com>
From:   Jens Axboe <axboe@kernel.dk>
Message-ID: <aca5ed6b-f54d-1a3e-b905-920be85d51d8@kernel.dk>
Date:   Wed, 9 Jun 2021 09:23:56 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <36f7519d-698f-1284-551a-0dbd82e2a0d8@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On 6/8/21 3:50 PM, Michael Schmitz wrote:
> Hi Jens,
> 
> please note that Finn's patch depends on one of mine currently under 
> review. Without that one, Q40 support may break in certain cases.

Can you point me at it?

-- 
Jens Axboe

