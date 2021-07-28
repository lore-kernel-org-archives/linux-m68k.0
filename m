Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B063C43214
	for <linux-m68k@archiver.kernel.org>; Wed, 28 Jul 2021 19:59:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 56BC561040
	for <linux-m68k@archiver.kernel.org>; Wed, 28 Jul 2021 19:59:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231309AbhG1T7q (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 28 Jul 2021 15:59:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59166 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231236AbhG1T7q (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 28 Jul 2021 15:59:46 -0400
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com [IPv6:2607:f8b0:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC6ECC061798
        for <linux-m68k@lists.linux-m68k.org>; Wed, 28 Jul 2021 12:59:43 -0700 (PDT)
Received: by mail-oi1-x22e.google.com with SMTP id o185so5149216oih.13
        for <linux-m68k@lists.linux-m68k.org>; Wed, 28 Jul 2021 12:59:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=V7tascY0zmK6SjDjUbPmzAhZw2O0kxWfALnB7KaYVDw=;
        b=x1PbINT2LA8ujUSzo+vCRr5s+0JZmw7NFBFrQYgGx/C4kpgs2YeX7IsEYz/FcY1rL0
         ImEFKIDk3JagkWbG/Vtzb7zzV8rwCHYzTdib44faAi3enJ8EuACO3en9Jpo1syIZlYyl
         rSSCPvZY2nlPK5qKzi/y6Zyo6hXSV4ZV2sWg1DQ36svbQIxkuFpzurMDXfbC8GaZ1TcM
         /tSxF9uRX14bbRGgf5reR1EuaMDATMzCD2xk9P1gWInjEkYvc+YCaoJJaCu985EjBsKR
         sT/IIQYJUvLO0EDSOwx5hFe6qJWseidOzWDoTOmAWs06xO4+fMqJUl+5SiV9Pt5YxmMC
         tS6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=V7tascY0zmK6SjDjUbPmzAhZw2O0kxWfALnB7KaYVDw=;
        b=OLMW/CQA31zZ9gl/oGJwdtlhsICdLSkVJFTp/l5i5xxsN3ePciz0V//wNtUkY3lxJ1
         w3vSCU0sDTK5SEh+0WK2m3gPJp7vA9bmN2vZJC52El6krMX3B0vVvEGw+/3FUte8jhmf
         FOTnFvbpSS9qpQc30FVYAFsGtJyn0g84Vh3FM/xIyyIgeD05krZgCE441VXAwW7Zvw1p
         h8ffhKRYnhzvcrYDN/gNNmBaKQMWnbeJSaOpvE2GECpy71u8bntHMTZDdvJ3QA37Ck34
         wcGZiuQHw0PimnHqiT0TmEaLS3IxeKEqmpsFDh1CxBm1fF4IEFPIXsFcsotaCg9obDk+
         FFkQ==
X-Gm-Message-State: AOAM532/l+VtJgg+Vw7P5Ts8N4yXW3qTjSLLD1YUm3Fa/o/4xxWedBnq
        vyJ+SjqRFLz3yA1H2E+AybJ/xg==
X-Google-Smtp-Source: ABdhPJyplh3DLaKY33JdHi5ZA/1Zz4gKIUC/ZHaC/vCpjWr2Bk0IU/obgcKjx2u5SMeB4jcc5cywyw==
X-Received: by 2002:aca:5802:: with SMTP id m2mr7738994oib.23.1627502383125;
        Wed, 28 Jul 2021 12:59:43 -0700 (PDT)
Received: from [192.168.1.30] ([207.135.234.126])
        by smtp.gmail.com with ESMTPSA id d20sm174553otq.67.2021.07.28.12.59.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Jul 2021 12:59:42 -0700 (PDT)
Subject: Re: [PATCH] arch: Kconfig: clean up obsolete use of HAVE_IDE
To:     Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        Christoph Hellwig <hch@lst.de>,
        Randy Dunlap <rdunlap@infradead.org>
Cc:     x86@kernel.org, linux-alpha@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        uclinux-h8-devel@lists.sourceforge.jp, linux-ia64@vger.kernel.org,
        linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
        linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
        linux-xtensa@linux-xtensa.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org
References: <20210728182115.4401-1-lukas.bulwahn@gmail.com>
From:   Jens Axboe <axboe@kernel.dk>
Message-ID: <3c09d6d8-7f83-4f6f-d496-20f5b1b4a7d8@kernel.dk>
Date:   Wed, 28 Jul 2021 13:59:41 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210728182115.4401-1-lukas.bulwahn@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On 7/28/21 12:21 PM, Lukas Bulwahn wrote:
> The arch-specific Kconfig files use HAVE_IDE to indicate if IDE is
> supported.
> 
> As IDE support and the HAVE_IDE config vanishes with commit b7fb14d3ac63
> ("ide: remove the legacy ide driver"), there is no need to mention
> HAVE_IDE in all those arch-specific Kconfig files.
> 
> The issue was identified with ./scripts/checkkconfigsymbols.py.

Thanks, let's queue this for 5.14 to avoid any future conflicts with
it.

-- 
Jens Axboe

