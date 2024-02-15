Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47FFE13699D
	for <linux-m68k@lists.linux-m68k.org>; Thu, 15 Feb 2024 18:16:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708020971; cv=none; b=etxjxP3JKdjV7FA3wAYxNR7GHw0Nl4nwYcQ0qy9x4XLcSoazsVwjx5j1i179LrxGIo/pkrRhIvrOqcRZfZ08+AGtodGwDvSjw/HIGjFp/q7XhnXbCUML1CN95oG/HoS1YzcTFVrMmvTfRCRRC7UnwpoBwNhyeogOgZY8HbFoZy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708020971; c=relaxed/simple;
	bh=I4dB3GMx6a+9L4e9XCMmtI4/zUU1rGbMjgwANKjHCRY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GZP8SrrIpz5g9mtRjrvbjL4VPokAcXaRx55fW+IH1ODsAMo87f0nYMF90ccyYQigImKkM7pd9TVHt50JP0mLr0m2mpjP/O/p/m+ENSaYEQbE49mwwqJT06DHz2P45wx1cW/NPGsA7nZG57RaztjfEPT3fAzHVvszw0NgstEAT2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mI9j71Zo; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mI9j71Zo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708020969; x=1739556969;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=I4dB3GMx6a+9L4e9XCMmtI4/zUU1rGbMjgwANKjHCRY=;
  b=mI9j71ZoPH71hzDlmMuidb3BmIoVE9tsG9Q60pcbHY/PXJ7kKTSpLrSn
   +oFbuCsdjojwRg9R8jCMSbRLj89Lm9xVdpbyrhrMUCZ3yuXgY+mFJjzY+
   SIzc3W6dU8htwhCHvmNXXgBmaVma47xkjz1KleyG4ehBLVCOIKTPnzg0q
   y1fsIJVNSKbNZN5WuKstr6GRFi9zfKCYWAxegcTmLtxLFxVyhDp5/ncw3
   aI4nU5sNaqhFfOpYgh3e1iq3Lbx8TXKK7J33+CrJf9mAquRUA9HeeBiEy
   aExoL3v09HldE8rL+1Pf6yOGycbTj7GtaYFP3UwL6OFE7QM+4L+amzaFP
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10985"; a="27583110"
X-IronPort-AV: E=Sophos;i="6.06,162,1705392000"; 
   d="scan'208";a="27583110"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Feb 2024 10:15:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,162,1705392000"; 
   d="scan'208";a="8210773"
Received: from djiang5-mobl3.amr.corp.intel.com (HELO [10.246.113.87]) ([10.246.113.87])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Feb 2024 10:15:49 -0800
Message-ID: <b5fab2d6-5cc1-4dd9-b3a3-faf649427ae7@intel.com>
Date: Thu, 15 Feb 2024 11:15:47 -0700
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 8/9] pmem: pass queue_limits to blk_mq_alloc_disk
Content-Language: en-US
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
 Minchan Kim <minchan@kernel.org>,
 Sergey Senozhatsky <senozhatsky@chromium.org>, Coly Li <colyli@suse.de>,
 Vishal Verma <vishal.l.verma@intel.com>,
 Dan Williams <dan.j.williams@intel.com>, Ira Weiny <ira.weiny@intel.com>,
 linux-m68k@lists.linux-m68k.org, linux-bcache@vger.kernel.org,
 nvdimm@lists.linux.dev, linux-block@vger.kernel.org
References: <20240215071055.2201424-1-hch@lst.de>
 <20240215071055.2201424-9-hch@lst.de>
From: Dave Jiang <dave.jiang@intel.com>
In-Reply-To: <20240215071055.2201424-9-hch@lst.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 2/15/24 12:10 AM, Christoph Hellwig wrote:
> Pass the queue limits directly to blk_alloc_disk instead of setting them
> one at a time.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Reviewed-by: Dave Jiang <dave.jiang@intel.com>
> ---
>  drivers/nvdimm/pmem.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/nvdimm/pmem.c b/drivers/nvdimm/pmem.c
> index 3a5df8d467c507..8dcc10b6db5b12 100644
> --- a/drivers/nvdimm/pmem.c
> +++ b/drivers/nvdimm/pmem.c
> @@ -451,6 +451,11 @@ static int pmem_attach_disk(struct device *dev,
>  {
>  	struct nd_namespace_io *nsio = to_nd_namespace_io(&ndns->dev);
>  	struct nd_region *nd_region = to_nd_region(dev->parent);
> +	struct queue_limits lim = {
> +		.logical_block_size	= pmem_sector_size(ndns),
> +		.physical_block_size	= PAGE_SIZE,
> +		.max_hw_sectors		= UINT_MAX,
> +	};
>  	int nid = dev_to_node(dev), fua;
>  	struct resource *res = &nsio->res;
>  	struct range bb_range;
> @@ -497,7 +502,7 @@ static int pmem_attach_disk(struct device *dev,
>  		return -EBUSY;
>  	}
>  
> -	disk = blk_alloc_disk(NULL, nid);
> +	disk = blk_alloc_disk(&lim, nid);
>  	if (IS_ERR(disk))
>  		return PTR_ERR(disk);
>  	q = disk->queue;
> @@ -539,9 +544,6 @@ static int pmem_attach_disk(struct device *dev,
>  	pmem->virt_addr = addr;
>  
>  	blk_queue_write_cache(q, true, fua);
> -	blk_queue_physical_block_size(q, PAGE_SIZE);
> -	blk_queue_logical_block_size(q, pmem_sector_size(ndns));
> -	blk_queue_max_hw_sectors(q, UINT_MAX);
>  	blk_queue_flag_set(QUEUE_FLAG_NONROT, q);
>  	blk_queue_flag_set(QUEUE_FLAG_SYNCHRONOUS, q);
>  	if (pmem->pfn_flags & PFN_MAP)
