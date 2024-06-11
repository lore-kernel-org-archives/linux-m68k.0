Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F94242A93
	for <linux-m68k@lists.linux-m68k.org>; Tue, 11 Jun 2024 08:25:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=145.40.73.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718094348; cv=none; b=nGivhI4V/RW+Tbi8RSskMzRw7j1rNVhzxmAhBJiEKKwNwZxAljpGF1Og4hEyLC8FU9kr7UUMVRQpBmZ0QiryQ0FEu6UVqRPxPf5iHzyI30IbusIiHnY11jS9jplGIVQgdWXCWU1nJG5iZbms+oRZ/Jf6G6njJ2WP0O5PlVMChPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718094348; c=relaxed/simple;
	bh=SsjtIxdZTv9alxTM6s+eXXe/b4WXYQcjMfNg5CfEKdc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UXwmRGrFpU6abwCKcY4uw7oCSNFs9QVMkPACvT8wy/qPR4uiHcvcnuXVoMU7F1ZSxCmC5QRG0V8CUoDsoTyfJzLxj9nYzFej2iAdo7e9CMG+mA9vXwtwdJBR4XROakMFszZidYsaFs+icqthXVRQQ7BWBGyWb/ggNkb1lWoS39M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZQZg1j5Y; arc=none smtp.client-ip=145.40.73.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZQZg1j5Y"
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 142C8CE1A1B;
	Tue, 11 Jun 2024 08:25:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 617E6C2BD10;
	Tue, 11 Jun 2024 08:25:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718094344;
	bh=SsjtIxdZTv9alxTM6s+eXXe/b4WXYQcjMfNg5CfEKdc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ZQZg1j5YVztWgVvkxKyPKd72qqKRNzGYuDroL0hLwlP4ltRHp2mvUzylgapCjo/QX
	 /9JUYHtH9lVcV7U8Irn9NtQ6Tf4T6BlUFQm06rRyckQkTNr9Kms7oXAKJzeYMkpiMK
	 Ybljnp8uYPvlerlZvfIK+8/5AdyU/rT7kIsgR7AlzPHmM2fE435z6Gjn2Vvlo55KVu
	 JYmLy8lPunL3Cs67SCKuZOcNFm3ArkP7Bsy0nS3RPixSC4k7DYJ0IbBTowTxu4OiQO
	 q7okcClLynGKcjyF6P0660uu2Ke9bJiS/94AvjFYJ69OKCMBI3EL8IsbNDCkR/OILW
	 7cbHkjEZuN7bA==
Message-ID: <f4497895-93ce-4d96-bcaa-6ad77be83c83@kernel.org>
Date: Tue, 11 Jun 2024 17:25:39 +0900
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 25/26] block: move the skip_tagset_quiesce flag to
 queue_limits
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
 <20240611051929.513387-26-hch@lst.de>
Content-Language: en-US
From: Damien Le Moal <dlemoal@kernel.org>
Organization: Western Digital Research
In-Reply-To: <20240611051929.513387-26-hch@lst.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/11/24 2:19 PM, Christoph Hellwig wrote:
> Move the skip_tagset_quiesce flag into the queue_limits feature field so
> that it can be set atomically and all I/O is frozen when changing the
> flag.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Reviewed-by: Damien Le Moal <dlemoal@kernel.org>

-- 
Damien Le Moal
Western Digital Research

