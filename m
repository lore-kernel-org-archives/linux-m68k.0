Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9484B172BB2
	for <linux-m68k@lists.linux-m68k.org>; Tue, 11 Jun 2024 07:33:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=139.178.84.217
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718091221; cv=none; b=ddC7RoEyTwhnwWm5G0oA0MHVLn7s+y2uOkDCPxPCR5RAXOSFNXB3ijk0noS6Dx5Yj0CJlsiE2YbkuPAC7t+k8k+K7wkE5zkgK6ZwwILR1P6ikrZT2vNoOVfhclFK15xS7743kRpT0v6XnHNq3NcjSlvm6ywKftL7b0Hx2XLFTsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718091221; c=relaxed/simple;
	bh=oHlrsHMGSP+TFKBHBiaHuNGPDyXYV0yztvtK1Y/4xoA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mOU1CqxRr2b7RkZ1/hGPWOqs6CdK4UgXRm+qcKr8mSFZx0OBHDHyG2Lbi+zugPUHDjmjSwyauzF/asqF7+EF/+QZSs2nP7zGGSQjVBcF7hCXN8Vhw04hg7zL8LIZLVLVnE6KPj86ELQdq3yOFC6wz/eOc/MoPzOmZ3wO8Opmngg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NK69Ca5T; arc=none smtp.client-ip=139.178.84.217
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NK69Ca5T"
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D4C1760C25;
	Tue, 11 Jun 2024 07:33:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD458C2BD10;
	Tue, 11 Jun 2024 07:33:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718091219;
	bh=oHlrsHMGSP+TFKBHBiaHuNGPDyXYV0yztvtK1Y/4xoA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=NK69Ca5T+un738Cht9WHCgDsDCtG+gx8LYD6gWuaN5n85S7Yoy0xxNUkFXn4cHxHv
	 Wlv+wGcdYIf+EVH9ZUhb5I5VG8NRhQniAqY8z0Q49SoQKDz4xicGpKlJi87Afp005I
	 EtH89giKv6HAFkHTX4qfxqAZNfqbbdEoL02qUnKFAY7p5J0TI+KJ8srSwUMmzd4BcU
	 hfvqIdBP7X08PHZVdAv1hTm1A4VlEuGPTd2au2zULBAaTxZxCjrUn/VKKe7PVNMklX
	 962B+4yOZjBDU8ZEfAUGNkCr9yE5Pg/u5zYNHenczAAetVmyH+GxTRZJ9JSnWhGfdr
	 S8dGvnoNweUXw==
Message-ID: <57a98863-e1ca-4ef8-aa7c-5012daa22808@kernel.org>
Date: Tue, 11 Jun 2024 16:33:32 +0900
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/26] block: remove blk_flush_policy
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
 <20240611051929.513387-13-hch@lst.de>
Content-Language: en-US
From: Damien Le Moal <dlemoal@kernel.org>
Organization: Western Digital Research
In-Reply-To: <20240611051929.513387-13-hch@lst.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/11/24 2:19 PM, Christoph Hellwig wrote:
> Fold blk_flush_policy into the only caller to prepare for pending changes
> to it.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Reviewed-by: Damien Le Moal <dlemoal@kernel.org>

-- 
Damien Le Moal
Western Digital Research

