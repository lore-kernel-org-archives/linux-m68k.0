Return-Path: <SRS0=9ylB=AM=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E45AC433DF
	for <linux-m68k@archiver.kernel.org>; Wed,  1 Jul 2020 13:43:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3732B206BE
	for <linux-m68k@archiver.kernel.org>; Wed,  1 Jul 2020 13:43:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20150623.gappssmtp.com header.i=@kernel-dk.20150623.gappssmtp.com header.b="dYwQW22j"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731118AbgGANnd (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 1 Jul 2020 09:43:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725927AbgGANnc (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 1 Jul 2020 09:43:32 -0400
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34A63C08C5DB
        for <linux-m68k@lists.linux-m68k.org>; Wed,  1 Jul 2020 06:43:32 -0700 (PDT)
Received: by mail-pl1-x62e.google.com with SMTP id o1so3362428plk.1
        for <linux-m68k@lists.linux-m68k.org>; Wed, 01 Jul 2020 06:43:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=mp3kZB+WljYlToUgRKHu/jMatrXibHPg1FspuaVdS+E=;
        b=dYwQW22jG+1U/8wxe99npchEcHOVVxkAEfKn6EBHer8enDnZPRaJ5nzspLL5jxwR7E
         8c6AvaHExACDpMcSpNKAKYnhHPOqDFAuRaNYxN8Hxrsw/QZbGOrdK0NOggJHl9AxSJgs
         BdPFufpE696CTqP0ZSQJiMeB/Vf1M790yE0S6UfvzUcW/2LK3Cll1WaQxPF72JBBNiAi
         uNmww608IStODIzkXWWB+ivDstxmDBFHqxk0XqSa0PCNUdKh4Ts6OZk4XhvUDLi977z9
         tRq/B+DQOlpjSRZ9yIK6lLqMnhcWWTEtAYB9JXJiCaKrLlWYMNjb0yZxPI5ky8TpWAqd
         O5RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=mp3kZB+WljYlToUgRKHu/jMatrXibHPg1FspuaVdS+E=;
        b=QFjiqmhmID7NGmrsKgZj4qGDckvEUTSs9QtO0DEAiUzEOxykcY8tdzYpOmgGKrY/l6
         ybolYsa8QpSEym+Kr6S8T5zks8npMDN+Q9KtlABniZLMzm83D5T64gjKScAykyhx4He4
         OjmowAi82gi/xQtTDZ7lCp7VdASsTVAo9C40PwmwL8ycHKPtFvuIDLarS3+Roy1WFZZW
         26omZ4AjUX2/mNTd9x1tFIpRFd1+/Dlhe5VkhC8ov2PVhwu4qUMgTyC6fta4pHIlW6bR
         rs/y/ysWqgNf9Vz67H7PsltrqrgkN3lKI4RorK7oIUNjK75PLCi2jPxXso9+nydKXzDn
         ty4A==
X-Gm-Message-State: AOAM531NwN7BNglWgamJIEdVbHufE6YA9IjYQwz+0QVbaB3Fqwl/2Y00
        QqsWPdM9FevU1RZHguibv6UmEw==
X-Google-Smtp-Source: ABdhPJwvetMLus+odkxVKs2TAwFJf3HuNkqQjK/vuqbHNuGPdXyOvoQGErv/SGur7kel3VcwfskpPQ==
X-Received: by 2002:a17:902:690b:: with SMTP id j11mr14712438plk.313.1593611011686;
        Wed, 01 Jul 2020 06:43:31 -0700 (PDT)
Received: from ?IPv6:2605:e000:100e:8c61:64c1:67b1:df51:2fa8? ([2605:e000:100e:8c61:64c1:67b1:df51:2fa8])
        by smtp.gmail.com with ESMTPSA id g4sm5868990pfi.68.2020.07.01.06.43.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Jul 2020 06:43:31 -0700 (PDT)
Subject: Re: rename ->make_request_fn and move it to the
 block_device_operations v2
To:     Christoph Hellwig <hch@lst.de>
Cc:     dm-devel@redhat.com, linux-kernel@vger.kernel.org,
        linux-m68k@lists.linux-m68k.org, linux-xtensa@linux-xtensa.org,
        drbd-dev@lists.linbit.com, linuxppc-dev@lists.ozlabs.org,
        linux-bcache@vger.kernel.org, linux-raid@vger.kernel.org,
        linux-nvdimm@lists.01.org, linux-nvme@lists.infradead.org,
        linux-s390@vger.kernel.org
References: <20200701085947.3354405-1-hch@lst.de>
From:   Jens Axboe <axboe@kernel.dk>
Message-ID: <bffb89d5-b51a-5f5a-15f4-b891f1f053ef@kernel.dk>
Date:   Wed, 1 Jul 2020 07:43:29 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200701085947.3354405-1-hch@lst.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-m68k-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On 7/1/20 2:59 AM, Christoph Hellwig wrote:
> Hi Jens,
> 
> this series moves the make_request_fn method into block_device_operations
> with the much more descriptive ->submit_bio name.  It then also gives
> generic_make_request a more descriptive name, and further optimize the
> path to issue to blk-mq, removing the need for the direct_make_request
> bypass.

Thanks, I'll try this again.

-- 
Jens Axboe

