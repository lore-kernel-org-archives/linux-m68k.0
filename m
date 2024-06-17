Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9082D18306C
	for <linux-m68k@lists.linux-m68k.org>; Mon, 17 Jun 2024 06:23:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=145.40.73.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718605417; cv=none; b=WolndEFiZNhp4LWregsQgA3gkaguuFKjFA/rkU2bbz49a90QokQtxKyS06iuOO32JWY8A9/9XqFo9HuzbQnpx9i2VpfGJ+4YjtxOFkvDGFQCXrzOGCFKb5To7JiiZYt7NuWFbstYcb7Nj/lDxYvtbLkx7dD+KkFQK2P9vNX/PLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718605417; c=relaxed/simple;
	bh=uMvSBiMCv5pxii/WRMe23vNNUZcfAqUN7YYlV2bv5Ko=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nY4ucikuB2hLC4QC8bFRumz7umcqgo2qyndfkVD0ewXEgKOTZBBJO15lKxojATEca+WMYt8tSfnS1MvWmOvbLw39hdxX7qYR2rBm1ZLcUQhiilYOEqLWzX6ZEM2SgRT4KnwX3Dgi/Rpo0jnT2DUx4dOfEIxvXRd/bJ3MKib0lZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BLJEJwmM; arc=none smtp.client-ip=145.40.73.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BLJEJwmM"
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 93B9FCE0FF0;
	Mon, 17 Jun 2024 06:23:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B0EEC4AF1D;
	Mon, 17 Jun 2024 06:23:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718605412;
	bh=uMvSBiMCv5pxii/WRMe23vNNUZcfAqUN7YYlV2bv5Ko=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=BLJEJwmMsCdQfpgeuSDFFhnTeYFrqXQ3GLsKdxLZUdhrqVCdlccETSs3reVgf76Rb
	 4NtHvzGyiVxgePozGjF6t5kslEhri7LHZl0DvN4BR4smuIdi3fWqPb/I1vVcfCYeYi
	 fiVbKgy6qBR19yAJJ+QQiLpd0oScLx6sTzGkD0QZlko71H6Yz0ku2d3RgXA7QaUtXr
	 GCCeiq+Ax8cIg0E+JxaozXjwtykL41yfJ3EoBVzh7JOK3qIJv+ADxMbH5/c2pw1ot4
	 Uz1JoQGCWSohEy6+TWZP70VoRi8sStV1FCojepppq975Nhv9oB4B67NtvIDhRuNUUc
	 t0DawHP78ZCMQ==
Message-ID: <3247433c-b356-425c-a888-8f7904351a2f@kernel.org>
Date: Mon, 17 Jun 2024 15:23:27 +0900
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 13/26] block: move cache control settings out of
 queue->flags
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
 linux-scsi@vger.kernel.org, linux-block@vger.kernel.org,
 Ulf Hansson <ulf.hansson@linaro.org>
References: <20240617060532.127975-1-hch@lst.de>
 <20240617060532.127975-14-hch@lst.de>
From: Damien Le Moal <dlemoal@kernel.org>
Content-Language: en-US
Organization: Western Digital Research
In-Reply-To: <20240617060532.127975-14-hch@lst.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/17/24 15:04, Christoph Hellwig wrote:
> Move the cache control settings into the queue_limits so that the flags
> can be set atomically with the device queue frozen.
> 
> Add new features and flags field for the driver set flags, and internal
> (usually sysfs-controlled) flags in the block layer.  Note that we'll
> eventually remove enough field from queue_limits to bring it back to the
> previous size.
> 
> The disable flag is inverted compared to the previous meaning, which
> means it now survives a rescan, similar to the max_sectors and
> max_discard_sectors user limits.
> 
> The FLUSH and FUA flags are now inherited by blk_stack_limits, which
> simplified the code in dm a lot, but also causes a slight behavior
> change in that dm-switch and dm-unstripe now advertise a write cache
> despite setting num_flush_bios to 0.  The I/O path will handle this
> gracefully, but as far as I can tell the lack of num_flush_bios
> and thus flush support is a pre-existing data integrity bug in those
> targets that really needs fixing, after which a non-zero num_flush_bios
> should be required in dm for targets that map to underlying devices.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> Acked-by: Ulf Hansson <ulf.hansson@linaro.org> [mmc]

A few nits below. With these fixed,

Reviewed-by: Damien Le Moal <dlemoal@kernel.org>

> +Implementation details for bio based block drivers
> +--------------------------------------------------
> +
> +For bio based drivers the REQ_PREFLUSH and REQ_FUA bit are simplify passed on

...bit are simplify... -> ...bits are simply...

> +to the driver if the drivers sets the BLK_FEAT_WRITE_CACHE flag and the drivers
> +needs to handle them.

s/drivers/driver (2 times)

> -and the driver must handle write requests that have the REQ_FUA bit set
> -in prep_fn/request_fn.  If the FUA bit is not natively supported the block
> -layer turns it into an empty REQ_OP_FLUSH request after the actual write.
> +When the BLK_FEAT_FUA flags is set, the REQ_FUA bit simplify passed on for the

s/bit simplify/bit is simply


-- 
Damien Le Moal
Western Digital Research

