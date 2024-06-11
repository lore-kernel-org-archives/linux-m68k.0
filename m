Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03AFF17085D
	for <linux-m68k@lists.linux-m68k.org>; Tue, 11 Jun 2024 05:54:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=145.40.73.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718085260; cv=none; b=LlvpLVd3RuyVfSxg3EWC1Es/EFuh4fcHOIHQ90nBJd+x2e7Rz/Vcdbfte75ANvmuW6kGw1GYYLGxL7rJ0MjvTPjj4DQkUm9+QKV3yCftq5Gm6CsViM4WDS1Zk3az+oqfEWG3xqAGefnQ9fx4PpmmqGMuIMQn7kWEH8mORxAPYcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718085260; c=relaxed/simple;
	bh=ImOyYBG3xCcX0n3tLvSbs6xw/kdWptb6Do6trOqK4QA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cUvjiI5yW6rpWH+l9VeeCtkHvL/w0xEm1TnVUr5bih1rFbgX6nhSfJ470HF1CE8DxoT8WGKrobJ8Hipl+Po1dq2OScJq1brPIrMNEoBZKits+dEqwOtN2MDHSGfTQYwxka+EE1Nj/lthLy/Yw1mSG+WL30+gG6bSSQ9M76AmRd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qHFHpGL8; arc=none smtp.client-ip=145.40.73.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qHFHpGL8"
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 91F99CE19A1;
	Tue, 11 Jun 2024 05:54:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12FF9C2BD10;
	Tue, 11 Jun 2024 05:54:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718085255;
	bh=ImOyYBG3xCcX0n3tLvSbs6xw/kdWptb6Do6trOqK4QA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=qHFHpGL8aUbN9wv5klAImzJ5jjK0oiGT8U4BTD8xfsG5jiCOpGSUv7Km3WvNqtPCD
	 6j1nrDjh7PhyALjuNQNHYkKLmYYq6Y1xffYfB0MxJDe2yW8SOyNDdlvw/znXF9eZc8
	 KT4CX+clUIQtduOC06IcHkCGn74lBXgof4aV9GT8PsAx4EZCRJSboZ+IHz3mWN+raN
	 KotqG4Gp62inAvWnPIr4JchEXO3PbNevMpTBNuCyAHk0M6HQGrIQYLuf6JcDaVG6mV
	 fVlgaG9YnpTo4YxUBgRoQVMO/dLvogh2Z6hk8kGRTiZh4LaBEnh8YlC7x62pw9weqZ
	 kWW9/78SoGctQ==
Message-ID: <c5524425-b2bd-40c4-bdc2-5b7e51ce6d67@kernel.org>
Date: Tue, 11 Jun 2024 14:54:11 +0900
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/26] loop: always update discard settings in
 loop_reconfigure_limits
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
 <20240611051929.513387-5-hch@lst.de>
Content-Language: en-US
From: Damien Le Moal <dlemoal@kernel.org>
Organization: Western Digital Research
In-Reply-To: <20240611051929.513387-5-hch@lst.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/11/24 2:19 PM, Christoph Hellwig wrote:
> Simplify loop_reconfigure_limits by always updating the discard limits.
> This adds a little more work to loop_set_block_size, but doesn't change
> the outcome as the discard flag won't change.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Looks OK to me.

Reviewed-by: Damien Le Moal <dlemoal@kernel.org>

-- 
Damien Le Moal
Western Digital Research

