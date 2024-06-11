Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1464D17164D
	for <linux-m68k@lists.linux-m68k.org>; Tue, 11 Jun 2024 05:51:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=139.178.84.217
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718085093; cv=none; b=eV4dBXuGBk2qTjFkWgQEWfNQF3qaXq6v+MiUCSPZVeH2x8M2eqsJpQWyBgMIHngRmJHs6tVrtf99PXAJdgK4fK38isLUiSvo5TdTXUL4rLqHBQr+B42M7ucDLuqbXbQ5JOjtqA6ur4SwOfDJbzcfrbEjszfo1dXG66MDAymK7f0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718085093; c=relaxed/simple;
	bh=n/truQQNALnyrE4ZbwFnrA1tq2cozaH91kaKcSN3ADo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kdLP+rjAmTfz2xChilTZN8ik1WhJLqygqcx85Xk4b+lWaU5L1aecdIVkJV8auWjZqDsP38FFWs8pNiSqtKRWqVDiqsYn/OV+cyIC6UGoAyc+0ql6x0YjH+I9cfNsgVdAzIaL32eeTjNkqvdXtVbTGFsj84i6yK++NVm7v2VyjT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ANn0WrF5; arc=none smtp.client-ip=139.178.84.217
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ANn0WrF5"
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1ABDF60C8C;
	Tue, 11 Jun 2024 05:51:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F8B3C2BD10;
	Tue, 11 Jun 2024 05:51:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718085090;
	bh=n/truQQNALnyrE4ZbwFnrA1tq2cozaH91kaKcSN3ADo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ANn0WrF5kOQJZxWO+lYlEGkU5hVzQiFb2dNu1fRL0d2IWY3RReTj+asObSRTOVsDn
	 nik3p07qhEGu9jO0A5uH0hbRiLwLOJ3d6qy5Lpfrdzdf1JpR8Qb6Y+TeigefvpTdHC
	 PaMP9CtOKbfsr2fBnfzUYFtnczoPg5lf2QS4Trvu+DMNLb/UDOZQCC9uHBx6LdmPM8
	 /dgqDFvO1q4KPpY9GF6hhisUoWhTc6hasUEAygvr3guCne7aOz50r92/yOBM880RPV
	 /mezANfcSB8zUh/+nThd+2qNqFJrJ+m45Wswa5U72/uWVWbOFnW/S5hmwY1Gx82O5w
	 +K3mqL1+sk3wQ==
Message-ID: <40ca8052-6ac1-4c1b-8c39-b0a7948839f8@kernel.org>
Date: Tue, 11 Jun 2024 14:51:24 +0900
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/26] sd: move zone limits setup out of
 sd_read_block_characteristics
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
 Richard Weinberger <richard@nod.at>,
 Philipp Reisner <philipp.reisner@linbit.com>,
 Lars Ellenberg <lars.ellenberg@linbit.com>,
 =?UTF-8?Q?Christoph_B=C3=B6hmwalder?= <christoph.boehmwalder@linbit.com>,
 Josef Bacik <josef@toxicpanda.com>, Ming Lei <ming.lei@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Alasdair Kergon <agk@redhat.com>, Mike Snitzer <snitzer@kernel.org>,
 Mikulas Patocka <mpatocka@redhat.com>, Song Liu <song@kernel.org>,
 Yu Kuai <yukuai3@huawei.com>, Vineeth Vijayan <vneethv@linux.ibm.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 linux-m68k@lists.linux-m68k.org, linux-um@lists.infradead.org,
 drbd-dev@lists.linbit.com, nbd@other.debian.org,
 linuxppc-dev@lists.ozlabs.org, ceph-devel@vger.kernel.org,
 virtualization@lists.linux.dev, xen-devel@lists.xenproject.org,
 linux-bcache@vger.kernel.org, dm-devel@lists.linux.dev,
 linux-raid@vger.kernel.org, linux-mmc@vger.kernel.org,
 linux-mtd@lists.infradead.org, nvdimm@lists.linux.dev,
 linux-nvme@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-scsi@vger.kernel.org, linux-block@vger.kernel.org
References: <20240611051929.513387-1-hch@lst.de>
 <20240611051929.513387-3-hch@lst.de>
Content-Language: en-US
From: Damien Le Moal <dlemoal@kernel.org>
Organization: Western Digital Research
In-Reply-To: <20240611051929.513387-3-hch@lst.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/11/24 2:19 PM, Christoph Hellwig wrote:
> Move a bit of code that sets up the zone flag and the write granularity
> into sd_zbc_read_zones to be with the rest of the zoned limits.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  drivers/scsi/sd.c     | 21 +--------------------
>  drivers/scsi/sd_zbc.c | 13 ++++++++++++-
>  2 files changed, 13 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/scsi/sd.c b/drivers/scsi/sd.c
> index 85b45345a27739..5bfed61c70db8f 100644
> --- a/drivers/scsi/sd.c
> +++ b/drivers/scsi/sd.c
> @@ -3308,29 +3308,10 @@ static void sd_read_block_characteristics(struct scsi_disk *sdkp,
>  		blk_queue_flag_clear(QUEUE_FLAG_ADD_RANDOM, q);
>  	}
>  
> -
> -#ifdef CONFIG_BLK_DEV_ZONED /* sd_probe rejects ZBD devices early otherwise */
> -	if (sdkp->device->type == TYPE_ZBC) {
> -		lim->zoned = true;
> -
> -		/*
> -		 * Per ZBC and ZAC specifications, writes in sequential write
> -		 * required zones of host-managed devices must be aligned to
> -		 * the device physical block size.
> -		 */
> -		lim->zone_write_granularity = sdkp->physical_block_size;
> -	} else {
> -		/*
> -		 * Host-aware devices are treated as conventional.
> -		 */
> -		lim->zoned = false;
> -	}
> -#endif /* CONFIG_BLK_DEV_ZONED */
> -
>  	if (!sdkp->first_scan)
>  		return;
>  
> -	if (lim->zoned)
> +	if (sdkp->device->type == TYPE_ZBC)

Nit: use sd_is_zoned() here ?

>  		sd_printk(KERN_NOTICE, sdkp, "Host-managed zoned block device\n");
>  	else if (sdkp->zoned == 1)
>  		sd_printk(KERN_NOTICE, sdkp, "Host-aware SMR disk used as regular disk\n");
> diff --git a/drivers/scsi/sd_zbc.c b/drivers/scsi/sd_zbc.c
> index 422eaed8457227..e9501db0450be3 100644
> --- a/drivers/scsi/sd_zbc.c
> +++ b/drivers/scsi/sd_zbc.c
> @@ -598,8 +598,19 @@ int sd_zbc_read_zones(struct scsi_disk *sdkp, struct queue_limits *lim,
>  	u32 zone_blocks = 0;
>  	int ret;
>  
> -	if (!sd_is_zoned(sdkp))
> +	if (!sd_is_zoned(sdkp)) {
> +		lim->zoned = false;

Maybe we should clear the other zone related limits here ? If the drive is
reformatted/converted from SMR to CMR (FORMAT WITH PRESET), the other zone
limits may be set already, no ?

>  		return 0;
> +	}
> +
> +	lim->zoned = true;
> +
> +	/*
> +	 * Per ZBC and ZAC specifications, writes in sequential write required
> +	 * zones of host-managed devices must be aligned to the device physical
> +	 * block size.
> +	 */
> +	lim->zone_write_granularity = sdkp->physical_block_size;
>  
>  	/* READ16/WRITE16/SYNC16 is mandatory for ZBC devices */
>  	sdkp->device->use_16_for_rw = 1;

-- 
Damien Le Moal
Western Digital Research

