Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C33DC433F5
	for <linux-m68k@archiver.kernel.org>; Wed,  5 Oct 2022 10:09:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229797AbiJEKJ1 (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 5 Oct 2022 06:09:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37138 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229678AbiJEKJ0 (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 5 Oct 2022 06:09:26 -0400
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4BA26C130
        for <linux-m68k@lists.linux-m68k.org>; Wed,  5 Oct 2022 03:09:24 -0700 (PDT)
Received: by mail-ej1-x635.google.com with SMTP id b2so34411013eja.6
        for <linux-m68k@lists.linux-m68k.org>; Wed, 05 Oct 2022 03:09:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linbit-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=oM5lINkSOhqEPn7T1LnWzFRQ0r/zY9T13e9BP04fEyI=;
        b=14U7AJwniruZFzbiY4kC6nsZlRvuSqb1QwTnO87x+fRvRhg52kqE3PLwic1cv6UI+b
         wxtaRyO+WZozOGf88hqNDIS0d8kGRHu94b0rcdjOrBTtNpMPKnxQUp9fyDFQVv1p4lwT
         9oAVJcqYseFceKxqgBWeZoSLo0DTN9Gz10LmFz2RpAA6luRa1gTkoumLHyuNtsjb23R3
         66037Fgcf54ctnyPbt6chWKdOLNMSKtWOPcxoIwbnX5WXyAom4hZa4oyF9nXf24bWT0P
         K9lw1zG3qgaRtbZiESDdnst2UoGyEh+WJg9WXPuCoOF4o8xgJN6xITBbcoTm7hcV1syU
         KUJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=oM5lINkSOhqEPn7T1LnWzFRQ0r/zY9T13e9BP04fEyI=;
        b=TSVYIoGigimXXiu5jtJk7arYEaJUgogQI6zLjiNVDeH/bU33AosVFvRnk5FQ6Z6q3d
         9zCyojMRHecKL2B7BQJ1t4xkWz4lHE2xWbTPQexdifzwffO1meRHWuWVnWCp/bWSsp0t
         fnA7wgpQE0x/j5dbMC4UXL1b9BlByz9dObGU/yGLh6SgFo+BHTwbsTeqEGogP75Sg93h
         Bh9FTeck7smj7+/tVRLR6P64+PYFQYSzen0pzvIOOQdx95eD4S5xR4ZPBojHdgso9hJi
         Y4oRJ94GdaX93JT63YjqEIvCmcUpXsP2TfN80GoplEWrCQ0Hcj7d9X5GaJ7qt6BqUR6i
         aW2Q==
X-Gm-Message-State: ACrzQf1UPQWLc0tyRSCqnCc3wRp0vWsUsg/8UTMfVRpezbe2RtmznY8E
        t2OmMPRgNZdSpTApu7IIRA12kg==
X-Google-Smtp-Source: AMsMyM6XbFaI9HeMTnZcx9bHunTFZSA7fhJuT5NL+agaUKW54kA1JC5km35OuPCP5GklKV/YoQTu8A==
X-Received: by 2002:a17:907:1c08:b0:782:a340:56d7 with SMTP id nc8-20020a1709071c0800b00782a34056d7mr22357872ejc.98.1664964563179;
        Wed, 05 Oct 2022 03:09:23 -0700 (PDT)
Received: from [192.168.178.55] (h082218028181.host.wavenet.at. [82.218.28.181])
        by smtp.gmail.com with ESMTPSA id r10-20020a1709061baa00b00782539a02absm8398012ejg.194.2022.10.05.03.09.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Oct 2022 03:09:22 -0700 (PDT)
Message-ID: <e23e94f8-13ad-4a10-62de-33e63a62831f@linbit.com>
Date:   Wed, 5 Oct 2022 12:09:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [RFC PATCH 05/18] drbd: use init disk helper
Content-Language: en-US
To:     Chaitanya Kulkarni <kch@nvidia.com>
Cc:     ogeert@linux-m68k.org, linux-block@vger.kernel.org,
        linux-m68k@lists.linux-m68k.org, drbd-dev@lists.linbit.com,
        nbd@other.debian.org, linux-mtd@lists.infradead.org,
        linux-kernel@vger.kernel.org, axboe@kernel.dk,
        philipp.reisner@linbit.com, lars.ellenberg@linbit.com,
        efremov@linux.com, josef@toxicpanda.com, tim@cyberelk.net,
        haris.iqbal@ionos.com, jinpu.wang@ionos.com, richard@nod.at,
        miquel.raynal@bootlin.com, vigneshr@ti.com, mcgrof@kernel.org,
        hare@suse.de, damien.lemoal@opensource.wdc.com,
        johannes.thumshirn@wdc.com, bvanassche@acm.org,
        ming.lei@redhat.com, vincent.fu@samsung.com,
        shinichiro.kawasaki@wdc.com
References: <20221005050027.39591-1-kch@nvidia.com>
 <20221005050027.39591-6-kch@nvidia.com>
From:   =?UTF-8?Q?Christoph_B=c3=b6hmwalder?= 
        <christoph.boehmwalder@linbit.com>
In-Reply-To: <20221005050027.39591-6-kch@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Am 05.10.22 um 07:00 schrieb Chaitanya Kulkarni:
> Add and use the helper to initialize the common fields of struct gendisk
> such as major, first_minor, minors, disk_name, private_data, and ops.
> This initialization is spread all over the block drivers. This avoids
> code repetation of inialization code of gendisk in current block drivers
> and any future ones.
> 
> Signed-off-by: Chaitanya Kulkarni <kch@nvidia.com>
> ---
>  drivers/block/drbd/drbd_main.c | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
> 
> diff --git a/drivers/block/drbd/drbd_main.c b/drivers/block/drbd/drbd_main.c
> index f3e4db16fd07..58fae122de16 100644
> --- a/drivers/block/drbd/drbd_main.c
> +++ b/drivers/block/drbd/drbd_main.c
> @@ -2706,13 +2706,9 @@ enum drbd_ret_code drbd_create_device(struct drbd_config_context *adm_ctx, unsig
>  
>  	set_disk_ro(disk, true);
>  
> -	disk->major = DRBD_MAJOR;
> -	disk->first_minor = minor;
> -	disk->minors = 1;
> -	disk->fops = &drbd_ops;
>  	disk->flags |= GENHD_FL_NO_PART;
>  	sprintf(disk->disk_name, "drbd%d", minor);
> -	disk->private_data = device;
> +	init_disk(disk, DRBD_MAJOR, minor, 1, 0, device, &drbd_ops);
>  
>  	blk_queue_flag_set(QUEUE_FLAG_STABLE_WRITES, disk->queue);
>  	blk_queue_write_cache(disk->queue, true, true);

This now does a set_capacity(..., 0), which it did not do before.
I'm guessing this does not have any side effects as the capacity should
already be initialized to 0? Do you know this for sure?

-- 
Christoph Böhmwalder
LINBIT | Keeping the Digital World Running
DRBD HA —  Disaster Recovery — Software defined Storage
