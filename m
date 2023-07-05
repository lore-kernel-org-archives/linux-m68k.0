Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F9AFEB64DA
	for <linux-m68k@archiver.kernel.org>; Wed,  5 Jul 2023 20:42:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233442AbjGEUm3 (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 5 Jul 2023 16:42:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232185AbjGEUm2 (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Wed, 5 Jul 2023 16:42:28 -0400
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 917BC19AB
        for <linux-m68k@vger.kernel.org>; Wed,  5 Jul 2023 13:42:24 -0700 (PDT)
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-25e847bb482so15446a91.1
        for <linux-m68k@vger.kernel.org>; Wed, 05 Jul 2023 13:42:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20221208.gappssmtp.com; s=20221208; t=1688589744; x=1691181744;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fLNNRviS0cL91wYNTcVk+663OWJgUCZl4QNBR2GtHpo=;
        b=cQmHAQ2JQzfENhIxE9yKCdhoQpOS58Y6+fPw/OZAw1jW+kvHuA8xUEUv7zbPhx4njL
         DnA7b+Hel0tIJXubUKR96AOW/D071H7cL2zvxCNxkTZEEwGVnTlXSyKWRSVah2WhPsjn
         Azbhz4tCGiJ9pRLbeH+enFWs8jVFjdCyTls3W82SzWHxn/0FT8ZdnfrmEoDpiJJMEwPp
         Ly2wfQtDdcudfI5nfvxbnFAPY6vspgWkuA2Lr6AqHflTdRwiQ5lpSxjVyPr8KJu/9kx/
         K0/vW4okG/77w5KxgwhqexdsixMDnrlSd8wh1jxEpHD7asWI87zxnn0p9ZV2vMMhIvX+
         XgcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688589744; x=1691181744;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fLNNRviS0cL91wYNTcVk+663OWJgUCZl4QNBR2GtHpo=;
        b=ZBfnCs8FtubpmFAwOTVXF1dPkPnMRiECtAmk1YpEUbD7aaJ/ZpiXXM1Kc8XEAshB6u
         HUJ8P+XaPWa0GFDdRl7SWNir4OLEfbVZtEEXbSBYfpjhkgKVtfWluF8+pmyI9bq2+aGs
         LWtA0iA0mrPGXENwqQU2VTj5Ep1LQ/IXv2oal3CJ3k3mLY5FgSKZpnVhb/bEgkvWz2JO
         DsTw6DPuAzyMCfb1uztpFFyFucWe4fructnau6QovpwBwl3WpZo/Kajejgozfs2aIMBK
         D/hgTA83p9GCgPy4csJoaSZtgftcXg1kqRIGANCdpV6ALuULYmivS19BNMNdmaOgY1dW
         +0FA==
X-Gm-Message-State: AC+VfDyM/C11KF6TavHDxZo81nl2QMtxuX8ZwgGY3QgYSK2XHRZVNj2J
        QsIUOoLjfPW97i5/1FKMKhNNAA==
X-Google-Smtp-Source: ACHHUZ5vOLQk6KXvjSSP6ZSf5rvBqa6M8rZLZZHZpW5FExTa2SRzNw6QlP+VRWLyCAhFh8w+Fmg7EA==
X-Received: by 2002:a05:6a20:1446:b0:111:ee3b:59a7 with SMTP id a6-20020a056a20144600b00111ee3b59a7mr23129409pzi.5.1688589744043;
        Wed, 05 Jul 2023 13:42:24 -0700 (PDT)
Received: from [192.168.1.136] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id g6-20020aa78746000000b006749c22d079sm16259715pfo.167.2023.07.05.13.42.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Jul 2023 13:42:23 -0700 (PDT)
Message-ID: <a84267a2-e353-4401-87d0-e9fdcf4c81a0@kernel.dk>
Date:   Wed, 5 Jul 2023 14:42:22 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v4 1/1] block: bugfix for Amiga partition overflow check
 patch
Content-Language: en-US
To:     Michael Schmitz <schmitzmic@gmail.com>, linux-block@vger.kernel.org
Cc:     linux-m68k@vger.kernel.org, chzigotzky@xenosoft.de,
        geert@linux-m68k.org, hch@lst.de, martin@lichtvoll.de,
        stable@vger.kernel.org
References: <20230620201725.7020-1-schmitzmic@gmail.com>
 <20230704233808.25166-1-schmitzmic@gmail.com>
 <20230704233808.25166-2-schmitzmic@gmail.com>
From:   Jens Axboe <axboe@kernel.dk>
In-Reply-To: <20230704233808.25166-2-schmitzmic@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On 7/4/23 5:38?PM, Michael Schmitz wrote:
> Reported-by: Christian Zigotzky <chzigotzky@xenosoft.de>
> Fixes: b6f3f28f60 ("block: add overflow checks for Amiga partition support")
> Cc: <stable@vger.kernel.org> # 5.2

This is confusing - it's being marked for stable, but also labeled as
fixing a commit that isn't even a release yet?

-- 
Jens Axboe

