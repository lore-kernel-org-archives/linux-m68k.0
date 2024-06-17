Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CD15DDAD
	for <linux-m68k@lists.linux-m68k.org>; Mon, 17 Jun 2024 06:26:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=145.40.73.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718605593; cv=none; b=V2fsSTwK/1df0F38rvAB1JpynG08zmAWbZVihMN5PALiRgZcCF3PABjOZrMPsXpyvo6y0wZiQt4s6GQiOW2n8WlF2Cd6B5lVsmygm9d7qcmVabmlrQNCA8Tu4DsgUTZtX9dxpdQFADZyaneu/kYwtEh6AwCHB2Z32Qq77PcxaC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718605593; c=relaxed/simple;
	bh=5ukl1My1jMqhSyTqZEFqdGlI+72qAecy5V2ti5Kc46U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bXzMJ5tpesdeGB8rRKup8iG7S7hRvGQwYC27QySz+y43/FxemUlOXdsVD/KRQyfXgHJq64lp4xA5eUvCYCLjUlZv3PQ0DpoGELZU59x9fJebYBexaJm0u0hJRnupXSPeZuPcSrzLTNIL3YC+odndLaI3MXjBPJhRsbcv+rb7Gjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OVa4VXa4; arc=none smtp.client-ip=145.40.73.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OVa4VXa4"
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id D5232CE0E70;
	Mon, 17 Jun 2024 06:26:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 897D7C2BD10;
	Mon, 17 Jun 2024 06:26:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718605589;
	bh=5ukl1My1jMqhSyTqZEFqdGlI+72qAecy5V2ti5Kc46U=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=OVa4VXa4gPyN4KTWboLud3pwf0TJbbk/rQ5BM4+Ufc5q6edplugfrWWUEhonGkfMR
	 QHtsT5neG8mJ3vHyVK4COzgFtMwuBSA3Ltr1Kmgg0P9h/SDaPK/4D4vixnSs7AOdoo
	 HP6agM24471d/vJb4Hh8SFe0zewqIqWCGc3aXNawn13hq27CQJOtkzwEi0TWYKBp4l
	 c0TLeE0D0RKiKV3rNJyqOIzjVOG/87Bt7edT59MQLl5UfWjsDRSx6vZMzrYnvW4QJA
	 /RoDuAqhbb/WQma0tOFHLAJHwURkZ+Z0rxy3rGxoovWXWM4rnyYIVDHULrocVjTDvQ
	 k66Zct4kG1uEw==
Message-ID: <c9871979-de72-49ca-879b-5f2bd773d517@kernel.org>
Date: Mon, 17 Jun 2024 15:26:23 +0900
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 19/26] block: move the nowait flag to queue_limits
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
References: <20240617060532.127975-1-hch@lst.de>
 <20240617060532.127975-20-hch@lst.de>
From: Damien Le Moal <dlemoal@kernel.org>
Content-Language: en-US
Organization: Western Digital Research
In-Reply-To: <20240617060532.127975-20-hch@lst.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/17/24 15:04, Christoph Hellwig wrote:
> Move the nowait flag into the queue_limits feature field so that it can
> be set atomically with the queue frozen.
> 
> Stacking drivers are simplified in that they now can simply set the
> flag, and blk_stack_limits will clear it when the features is not
> supported by any of the underlying devices.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Reviewed-by: Damien Le Moal <dlemoal@kernel.org>

-- 
Damien Le Moal
Western Digital Research

