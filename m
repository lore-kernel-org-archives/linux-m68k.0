Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C876E17554
	for <linux-m68k@lists.linux-m68k.org>; Tue, 11 Jun 2024 07:26:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=145.40.73.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718090816; cv=none; b=mmx5MOtpJgkGlTrv94igQqZRyQZSH3ToDEKJvKGB811I2906qTCtjcfEBEMglvn2RFfax77A5dVr/HWcE0mFYgOaFL44/S9IlZ09yqBJwmB8UfUrSx3UjDBh9PW1LLpEVU2UsiRuQbkwspQHAH6tcY6QtNUeEFMJoEP0V2hnK5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718090816; c=relaxed/simple;
	bh=HG5UcXVYc2pVMu2PGi4iUFqByljMapi6PfR/6ZqBwfo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DVNyfbEJdx/m2Gtt/9A6V3LpvPyLJjDfbHbOodfliD9vau8z+m/jPt4AwEdRwHxJBPHg1uJQ62J2T3SfW6On2v5htsuH1EtuxPn73/dW+EoizApN+/IRyfcFepJf5toHHwrHr3Jp7Gw5v8gdC6kZXulhhQjjIMWVl9aHULOEZKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lhYNStRM; arc=none smtp.client-ip=145.40.73.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lhYNStRM"
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 9B23CCE19AB;
	Tue, 11 Jun 2024 07:26:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2CA5C2BD10;
	Tue, 11 Jun 2024 07:26:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718090811;
	bh=HG5UcXVYc2pVMu2PGi4iUFqByljMapi6PfR/6ZqBwfo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=lhYNStRMJNPVo8fichD7Z0COMh5KCSazuVjE6/0APdy+3x8aX6d+I4Uw+ap69ZwAp
	 3u5aa7mjFdEVQyfJG5WY+eMXxSD+64OfuIlIsHMpLDbrxnp9UPUkR/yayj5dU13RXh
	 23qGW6mbrSQ4iFRccSriB2Li9Cf3c2qv3X/apL7b2mQFQrd0/fuwpUhAaRGZ1yOusP
	 n79nDvyWzKvLB0HpWl65/GKtJMfxc7ZpotjxL9zrrr1dQ3UsAtGXJa69S+Dlnhewkx
	 FHwdj5ZYnFJw9FRojR+8wLW1FYdzAyPRpPQ7jZN/hjLct6+Y9JYli0WJbtrwanSHKq
	 GWPNeceTmkiMQ==
Message-ID: <b3a0692c-05f2-459d-9bed-33b7aa3d79c0@kernel.org>
Date: Tue, 11 Jun 2024 16:26:45 +0900
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/26] virtio_blk: remove virtblk_update_cache_mode
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
 <20240611051929.513387-9-hch@lst.de>
Content-Language: en-US
From: Damien Le Moal <dlemoal@kernel.org>
Organization: Western Digital Research
In-Reply-To: <20240611051929.513387-9-hch@lst.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/11/24 2:19 PM, Christoph Hellwig wrote:
> virtblk_update_cache_mode boils down to a single call to
> blk_queue_write_cache.  Remove it in preparation for moving the cache
> control flags into the queue_limits.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Reviewed-by: Damien Le Moal <dlemoal@kernel.org>

-- 
Damien Le Moal
Western Digital Research

