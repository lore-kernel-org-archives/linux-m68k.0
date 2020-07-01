Return-Path: <SRS0=9ylB=AM=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55D44C433DF
	for <linux-m68k@archiver.kernel.org>; Wed,  1 Jul 2020 16:08:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 37799207FB
	for <linux-m68k@archiver.kernel.org>; Wed,  1 Jul 2020 16:08:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=intel-com.20150623.gappssmtp.com header.i=@intel-com.20150623.gappssmtp.com header.b="sgyWg0od"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732288AbgGAQIa (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 1 Jul 2020 12:08:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38244 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732188AbgGAQI3 (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 1 Jul 2020 12:08:29 -0400
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com [IPv6:2a00:1450:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38CE5C08C5DD
        for <linux-m68k@lists.linux-m68k.org>; Wed,  1 Jul 2020 09:08:29 -0700 (PDT)
Received: by mail-ed1-x543.google.com with SMTP id g20so20247963edm.4
        for <linux-m68k@lists.linux-m68k.org>; Wed, 01 Jul 2020 09:08:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=intel-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=NgtGRFNzMUt8UwQnpVLH6Q0lK3Q/pmzbcISwUTSvZp4=;
        b=sgyWg0odMXUUNA+ymUvc43LaYs2s/aJwbFyXWRoPjxwdAxwM/8NDCnpUaFI4p3liR0
         gB3SPFv0A/WozVPJacrsy3TT9HIOMMCESTpphsqE92coNdoMTDE/jB5/k99TrA7k0WXT
         HwfvYQsx393r8hZTsu6RX5RUEhIafmeLpfC5Xxvgan8YQB6lIclWByvvZYmq9DcmZLWN
         JlL5WK7hHhUXeDny6LC8Ts2exiDWCHCRjEx+DVoYVUZMCGpeUSrXG6yeqYlDTXCkU+hk
         g1qHbmn4FwKHi5mTo+XYno4GD6wFdoeaM1etI9G0XSOMB6JxPVUPvp1yv+DnjQn7iHAQ
         vT8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NgtGRFNzMUt8UwQnpVLH6Q0lK3Q/pmzbcISwUTSvZp4=;
        b=GxjdPcnP7KxdHBo3/KHIm7Q/Dev+0vLKbUk7bKFMUw1x5Ut0yS7MCAv4uPIC/alXpp
         8qIfHqEdINFDS/nFah187Gbk2H0Oi2R8cbPLgj8dKpBhR678UkSceOAzdMPKw8HlPrHY
         WyfhcYn9TBQvTm7Xg8jdC115g44u76WkOM3oxlOLSAE1mJiU9A+mmeVsaVbosPR8ueqd
         SOqOiNTB9TezK/Au970qPrTCbMR1dJkN16FdD7cR31L3MM0Ddidzxi81+BE1dHeEDk2W
         wge5fzzlpOWBoBHg9x7iQCtZhz/XhZUg6leGzKj8qdNa/cI6krxz7rWtJIdBNe/pIoz7
         3Y4A==
X-Gm-Message-State: AOAM531r6uwAZIQ9RiW3U6tHN8CsKrc2nguRd2Gna9ldhbIVc0J0bzAw
        4aSbOO4v7KCS0pOmm9kHPwnQCK31ixtD8aiv/B9OfA==
X-Google-Smtp-Source: ABdhPJwTtEaJeqUJmjVrnga0zb3T87bQXg/qHVHNHjeT7uurwTRSLAeKnsyE6dqNxhAJ1jQ5OrZ9KB+p0GzE9WKAsFg=
X-Received: by 2002:a05:6402:21c2:: with SMTP id bi2mr29609575edb.296.1593619707927;
 Wed, 01 Jul 2020 09:08:27 -0700 (PDT)
MIME-Version: 1.0
References: <20200701085947.3354405-1-hch@lst.de> <20200701085947.3354405-17-hch@lst.de>
In-Reply-To: <20200701085947.3354405-17-hch@lst.de>
From:   Dan Williams <dan.j.williams@intel.com>
Date:   Wed, 1 Jul 2020 09:08:17 -0700
Message-ID: <CAPcyv4hELsX=dnqppbL72Tg2k8xMm-5ZaEsxM98eQ7XPoG5NGg@mail.gmail.com>
Subject: Re: [PATCH 16/20] block: move ->make_request_fn to struct block_device_operations
To:     Christoph Hellwig <hch@lst.de>
Cc:     Jens Axboe <axboe@kernel.dk>,
        device-mapper development <dm-devel@redhat.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-m68k@lists.linux-m68k.org, linux-xtensa@linux-xtensa.org,
        drbd-dev@lists.linbit.com,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        linux-bcache@vger.kernel.org,
        linux-raid <linux-raid@vger.kernel.org>,
        linux-nvdimm <linux-nvdimm@lists.01.org>,
        linux-nvme@lists.infradead.org,
        linux-s390 <linux-s390@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-m68k-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Wed, Jul 1, 2020 at 2:01 AM Christoph Hellwig <hch@lst.de> wrote:
>
> The make_request_fn is a little weird in that it sits directly in
> struct request_queue instead of an operation vector.  Replace it with
> a block_device_operations method called submit_bio (which describes much
> better what it does).  Also remove the request_queue argument to it, as
> the queue can be derived pretty trivially from the bio.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
[..]
>  drivers/nvdimm/blk.c                          |  5 +-
>  drivers/nvdimm/btt.c                          |  5 +-
>  drivers/nvdimm/pmem.c                         |  5 +-

For drivers/nvdimm

Acked-by: Dan Williams <dan.j.williams@intel.com>
