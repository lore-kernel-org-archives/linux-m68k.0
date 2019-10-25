Return-Path: <SRS0=vCbO=YS=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 871A7CA9EBD
	for <linux-m68k@archiver.kernel.org>; Fri, 25 Oct 2019 20:33:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5A7B321872
	for <linux-m68k@archiver.kernel.org>; Fri, 25 Oct 2019 20:33:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20150623.gappssmtp.com header.i=@kernel-dk.20150623.gappssmtp.com header.b="SSm31oGv"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726032AbfJYUdZ (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Fri, 25 Oct 2019 16:33:25 -0400
Received: from mail-io1-f68.google.com ([209.85.166.68]:44766 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728514AbfJYUdY (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Fri, 25 Oct 2019 16:33:24 -0400
Received: by mail-io1-f68.google.com with SMTP id w12so3836593iol.11
        for <linux-m68k@vger.kernel.org>; Fri, 25 Oct 2019 13:33:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=PP+PlfZ4dT+9sk7iuXzO4Uyb+ZqNRDXomKw0WBHExLc=;
        b=SSm31oGv5i/zxtkLnyGI4XSLhh5I2k4gJRgCdQWG16+3AX/19ppIPgjk0ktfF8nOla
         nhwpAGy0VTKsHSocofC4K6xSrnhtfYEIDVmQf5QV57XIgJ57pV5kHNC9svdQjWu4iTa5
         naCvJYn690uEz86lrgVfvM0BE7nHMyvz4SrK30eeJfHSA0uJc/Sm/If6tWxinPtzOy4x
         gKDnCpazugG1papmJuLK1QByHANCRydqUPSUJbtVLwXZ7tBUBDOoFfL+G/IyjM8+r7l2
         MHL2XFb/HAAdkLavz4GarwNtpydgEFroSRb8makBZAe7DazJl1UflZSyK3BnZdeTKoxm
         SwoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=PP+PlfZ4dT+9sk7iuXzO4Uyb+ZqNRDXomKw0WBHExLc=;
        b=JJ0VTAgYOUL8Sy1lXx+LSw2vVerRsMEQKXfFcxmS3ps580ESI7PntTRFyZvDPfPB+W
         aJvGRDwg0nqZyGLt684JggegE56v1ZHkdzbNNnQ0D60494I491H8gsg5ztoBruzwx9mu
         X3A4uN7inc9w70fenX21rNWUFJLep6WFa24/LSzRWrN2kdnKVHnGDhGH73/kBtSO0/tw
         Z6EPXNEtS2T7ipvJi5ztwNjnc+mbcJPngOGbOxm89/neuIW90TCzqQYWAnYbsbv948lk
         pDxMxQOeyOa2VjGF3/7vjqOSxwIs+YQVdoY67ZA0/cxY4ZTmCTFmxsXNSzuPMNzGMOTY
         JVnw==
X-Gm-Message-State: APjAAAV/ySBs46FhJMLzqp++wlfNbw4FFqPQbaN9Yv7XiTd0Ov1FOhAl
        thLRSv9iH4rsiH+r8gwiQzNQJQ==
X-Google-Smtp-Source: APXvYqyq8H++eBr6G2Hfm2x7KlaOZIBtGQejm0N2txoL+90BlqRsGQMCaxCORp7wVSvo1YZIrZL0QA==
X-Received: by 2002:a02:920f:: with SMTP id x15mr5769616jag.57.1572035602496;
        Fri, 25 Oct 2019 13:33:22 -0700 (PDT)
Received: from [192.168.1.159] ([65.144.74.34])
        by smtp.gmail.com with ESMTPSA id z22sm362079iol.75.2019.10.25.13.33.21
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 25 Oct 2019 13:33:21 -0700 (PDT)
Subject: Re: [PATCH RESEND v2 0/2] Convert Atari Falcon IDE driver to platform
 device
To:     Michael Schmitz <schmitzmic@gmail.com>, linux-m68k@vger.kernel.org,
        linux-ide@vger.kernel.org
Cc:     geert@linux-m68k.org, b.zolnierkie@samsung.com
References: <1569470064-3977-1-git-send-email-schmitzmic@gmail.com>
From:   Jens Axboe <axboe@kernel.dk>
Message-ID: <7bd80760-0d46-3b3d-16e7-41cbc9169822@kernel.dk>
Date:   Fri, 25 Oct 2019 14:33:20 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <1569470064-3977-1-git-send-email-schmitzmic@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-m68k-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On 9/25/19 9:54 PM, Michael Schmitz wrote:
> [Resend because linux-m68k was dropped from the recipient list ...]
> 
> As suggested by Geert, at least one of the drivers available for the Falcon
> IDE interface should be converted to a platform device driver (to enable
> module autoloading by the Debian installer).
> 
> Add platform device for Falcon IDE (patch 1), and rewrite the present
> libata driver to make use of that device (patch 2).
> 
> Changes from v1:
> 
> Incorporated review comments by Geert; corrected silly mismatch between
> platform device name and platform driver name that caused loading driver
> to fail locating the related resource; check return code of platform device
> register call.
> 
> Tested on ARAnyM with only the pata_falcon driver builtin.

Who's going to pick this one up? I can do it, but it'd be nice to have
m68k on patch 1 first.

-- 
Jens Axboe

