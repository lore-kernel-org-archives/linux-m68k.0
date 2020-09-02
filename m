Return-Path: <SRS0=cZRO=CL=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E701EC433E7
	for <linux-m68k@archiver.kernel.org>; Wed,  2 Sep 2020 16:15:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C12D720639
	for <linux-m68k@archiver.kernel.org>; Wed,  2 Sep 2020 16:15:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ILZaHQFY"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728120AbgIBQPg (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 2 Sep 2020 12:15:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57052 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727897AbgIBQP3 (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 2 Sep 2020 12:15:29 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27E21C061244
        for <linux-m68k@lists.linux-m68k.org>; Wed,  2 Sep 2020 09:15:24 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id k25so6594905ljg.9
        for <linux-m68k@lists.linux-m68k.org>; Wed, 02 Sep 2020 09:15:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=oSoo64G5hqYEcive3ArcdyG7UB+PlyeDXjvjpnqBKaM=;
        b=ILZaHQFY0vCR6OfnekcdU650PGVAhhQKOY3NZeb4hb959Nnl7c4NCS70UaFQglHtg0
         tmw8YQf7MSCpoNWKWXYyVbxXx9HEbddIZHaKYUV9Pzx4wU1LrUWxGrd51edl2xYBvMT/
         jV86uJPe75MGE/bhTy838ASYBEy5+j5Wg8P4CflJrvO3zRqw4jTLUJG1wfuqZPtdqnZt
         NfNvkNB0iKgTx14KotvME+b5EMO7YOPW0D31V87qwpP72GntFnRqcSSHyQXGMm+olhLS
         zomK00J95pH7SXJEszpp2JCMRXLHU/8LeQ03Z317zOc43yNJHfFczmNAEWiEkbvO964m
         zbTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=oSoo64G5hqYEcive3ArcdyG7UB+PlyeDXjvjpnqBKaM=;
        b=EGAMi/VIPgxoz8yE/qzJpDv5AHRAF20wIIpvGvQbVptJ+uyWDblSNTknz0CP4y7Tzm
         XoL4hZ++sfo53bDGM67kUVVdZUSiDHFsd5b8M2jNioQsdqdY4v9K8O7T3i6j9XVTYUAZ
         1wrch1GPhrfAgpfYPSt7uVvGT/29KIOSph04H3M1LTOVQi7LzXdDas3PujTV8eybpypH
         WePYILSJZqEdSJSpJiMHSVUMR2NZ2EaVPQKbTihyiLFCHAqJqt5nCqH2mZVhTeAPUinx
         zvKfWYjEJh0HMBDdbOACXBCpt0tZ6ZlMpjjvQE21KbtrxEDdP77fh6fA1PVuYsdGwaVK
         Ho0g==
X-Gm-Message-State: AOAM5310pa2RqZZ5IYjwuXocBCWsQ/qRl5ZM0w7gUYnTKOuvd9xEUfXA
        F2s6w5N6NB0E5nGazHNNL9g=
X-Google-Smtp-Source: ABdhPJxX1B1/iONuwBe8+9sI0WLVxdf/t3sGvls9Y/bh7JuyIHkc7shlyvSDR+KPPKhzMu2+2jeY+Q==
X-Received: by 2002:a2e:4942:: with SMTP id b2mr3604841ljd.382.1599063322504;
        Wed, 02 Sep 2020 09:15:22 -0700 (PDT)
Received: from wasted.omprussia.ru ([2a00:1fa0:44ba:bd37:6990:9f35:8864:71b0])
        by smtp.gmail.com with ESMTPSA id u14sm15245ljg.55.2020.09.02.09.15.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Sep 2020 09:15:21 -0700 (PDT)
Subject: Re: [PATCH 15/19] md: use bdev_check_media_change
To:     Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>
Cc:     Denis Efremov <efremov@linux.com>, Tim Waugh <tim@cyberelk.net>,
        Michal Simek <michal.simek@xilinx.com>,
        Borislav Petkov <bp@alien8.de>,
        "David S. Miller" <davem@davemloft.net>,
        Song Liu <song@kernel.org>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Finn Thain <fthain@telegraphics.com.au>,
        Michael Schmitz <schmitzmic@gmail.com>,
        linux-m68k@lists.linux-m68k.org, linux-block@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-ide@vger.kernel.org,
        linux-raid@vger.kernel.org, linux-scsi@vger.kernel.org,
        linux-fsdevel@vger.kernel.org
References: <20200902141218.212614-1-hch@lst.de>
 <20200902141218.212614-16-hch@lst.de>
From:   Sergei Shtylyov <sergei.shtylyov@gmail.com>
Message-ID: <566f5ca3-ec7b-b659-daff-f68699346010@gmail.com>
Date:   Wed, 2 Sep 2020 19:15:20 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200902141218.212614-16-hch@lst.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-m68k-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hello!

On 9/2/20 5:12 PM, Christoph Hellwig wrote:

> The pcd driver does not have a ->revalidate_disk method, so it can just

   s/pcd/md/?

> use bdev_check_media_change without any additional changes.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  drivers/md/md.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
[...]

MBR, Sergei
