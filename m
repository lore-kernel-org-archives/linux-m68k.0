Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FAF1173321
	for <linux-m68k@lists.linux-m68k.org>; Tue, 11 Jun 2024 08:12:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=145.40.73.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718093569; cv=none; b=WzC6t1ssJO5LCViOfC6oVR2ifz90P12poUFmfKTK+9OtgQcyJDwzJ3x5Ygu1ZoTyoJeojJpBmT3n0+mwbJ0dBYy4i+X6bdBLFXiXLdxPmNB540LsOhSLurJGNhF3AECcHMbtFpXJ/G6hk5WT8vOCALd+JU+KX6WH0f4OvglEdnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718093569; c=relaxed/simple;
	bh=zMBbLHWiI0o4/6MjscYA2/ULza201WjvhSMdL22ilmQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=s64TF3kDH77soJ/GAZsChQv3VgGKkswdU1MsSIhoP+ecALci13SPggJeiGTLiSJiMTgxZO8tyN6ohRMDw8gNK0nYr+q9x3tzk0apUpet2jqx9R8hLdiKZI/ncm21DdnLm9PiZpXrIkORQij6w3AKSEZjAnkIODC3UwSQpKTiS/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=efMUQjqz; arc=none smtp.client-ip=145.40.73.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="efMUQjqz"
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 3E604CE0988;
	Tue, 11 Jun 2024 08:12:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85352C2BD10;
	Tue, 11 Jun 2024 08:12:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718093565;
	bh=zMBbLHWiI0o4/6MjscYA2/ULza201WjvhSMdL22ilmQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=efMUQjqzDR6/6LZgdCczIkMTU67PAqpDM0RBu6vBwxbRTCrqV/SLQPjysAgXVIH+u
	 Gs7FwJjGTrCL01zQP92DMiL3AF1rQHaJ0EqlTORyNynpUYXTzsuY6sJ9mfoqPT1Tvg
	 BSo7cvDW+fM7fvH1aN5LdfHWfYWXWuQSJiOAXVL+z2KUCiOWthz8XV9sMCo6FSpXv+
	 2SHsDignO7grM22XDSxgAJ0znadsNiLDmWusigAzWpriOV5Y9jvSmQhMPwNSEb8Bvj
	 SvInHsx54FSttIPvfIwG30ulL5P3X40mKZipSzOnWLUzNb0kOcJMR/irZgSdTd0fnE
	 LJc4doaBwGC7g==
Message-ID: <a10087ad-8b2c-4a6c-accb-fb1e8015e704@kernel.org>
Date: Tue, 11 Jun 2024 17:12:40 +0900
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 17/26] block: move the stable_write flag to queue_limits
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
 <20240611051929.513387-18-hch@lst.de>
Content-Language: en-US
From: Damien Le Moal <dlemoal@kernel.org>
Organization: Western Digital Research
In-Reply-To: <20240611051929.513387-18-hch@lst.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/11/24 2:19 PM, Christoph Hellwig wrote:
> Move the io_stat flag into the queue_limits feature field so that it can

s/io_stat/stable_write

> be set atomically and all I/O is frozen when changing the flag.
> 
> The flag is now inherited by blk_stack_limits, which greatly simplifies
> the code in dm, and fixed md which previously did not pass on the flag
> set on lower devices.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Other than the nit above, looks OK to me.

Reviewed-by: Damien Le Moal <dlemoal@kernel.org>

-- 
Damien Le Moal
Western Digital Research

