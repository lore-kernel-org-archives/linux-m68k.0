Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31959188CA1
	for <linux-m68k@lists.linux-m68k.org>; Mon, 17 Jun 2024 06:13:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=145.40.73.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718604820; cv=none; b=Mxbt1sMjftDht2WfMfCOt7mi1rFAvjIxLbx+oHhqmj93p0fT7pj2sDdr4X/sfOcmY6E4/SoBLgdMZNmf2PEuZGV+13tZesY/78tYH2tEDas0asFMwUuODOebjC/uC73yDD0k6q3isNF02hpxRxsGQX1EvP25hSHoAn+mEzQp6Fg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718604820; c=relaxed/simple;
	bh=i+c+RpVRjeaE7WIb31u0YOButoWpoMUXbmMH2ED9KM8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=c/2qc0tHwIPUx5LzPig0qIJk5esr3ttUlgSFvAJ26pQHSv3OtYYNCAMXxNysHlutEuEDGIWVf1HiOHdJ9oa39cWyO9IxVtfCOntZHmTkzJsFcuQ87FdO+YvHZEvJjfjZmMWpC/zNj59zP+sGhj92INDYpqMTAKXrh7WutOJJ120=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NGDwf0zX; arc=none smtp.client-ip=145.40.73.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NGDwf0zX"
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 79463CE0FD1;
	Mon, 17 Jun 2024 06:13:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E26F1C2BD10;
	Mon, 17 Jun 2024 06:13:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718604815;
	bh=i+c+RpVRjeaE7WIb31u0YOButoWpoMUXbmMH2ED9KM8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=NGDwf0zXEmzo9+7Yx4d9cGXV793JqUi91piwr9DLQr9gvYLzjssulS3nd0FDXod4o
	 1NiEaNf9DKv91oATngwE6MlpuTxufePFFAUPAiGTMSZ8Iyqb43pbMY/AWpT0yfgG9x
	 h7tK/rGWoSYR5lk30x+/zxQfjGaL8mJv2SH7mMjlqBwSC3JpHWjWgqv3xYEnVpUZ3T
	 GLm2uelJLLxYyxbZLJP4lmiyxvgd2hfNI8V/LV1wIStwKjwJDXjuh7JmDm0LI0dTdZ
	 pEsb3rbnrZU0AByYnkj2ZCWuHVBzn8LtTQfnCUTAC98K23Vza+t2P0C82aHVfqiJXZ
	 7lE9UMorz5Ztg==
Message-ID: <72e2cebc-a748-4e39-8783-440a82cd40c1@kernel.org>
Date: Mon, 17 Jun 2024 15:13:29 +0900
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/26] loop: regularize upgrading the block size for
 direct I/O
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
 Hannes Reinecke <hare@suse.de>, Bart Van Assche <bvanassche@acm.org>
References: <20240617060532.127975-1-hch@lst.de>
 <20240617060532.127975-7-hch@lst.de>
From: Damien Le Moal <dlemoal@kernel.org>
Content-Language: en-US
Organization: Western Digital Research
In-Reply-To: <20240617060532.127975-7-hch@lst.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/17/24 15:04, Christoph Hellwig wrote:
> The LOOP_CONFIGURE path automatically upgrades the block size to that
> of the underlying file for O_DIRECT file descriptors, but the
> LOOP_SET_BLOCK_SIZE path does not.  Fix this by lifting the code to
> pick the block size into common code.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> Reviewed-by: Hannes Reinecke <hare@suse.de>
> Reviewed-by: Bart Van Assche <bvanassche@acm.org>

Looks good to me.

Reviewed-by: Damien Le Moal <dlemoal@kernel.org>

-- 
Damien Le Moal
Western Digital Research

