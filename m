Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68FF013F451
	for <linux-m68k@lists.linux-m68k.org>; Mon, 24 Jun 2024 13:46:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=139.178.84.217
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719236768; cv=none; b=E+EScliOawtGi/wxobPsd9sAYjsBllhu7XGaQ0/6DErgxbcYHFzQtYc+0Vgia8cv470ZppfLMFR2t651J8ZXgVRP4JSdItehYKXKYEAzIXG82U9qWYhrwmIRsKpHdx7Ilst1gGXAijEs2g2y9x63T8yJKvWQiifPRTLEY8cQxTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719236768; c=relaxed/simple;
	bh=nEbRkmLliGbrhN7a0dFrrROolzsUWf2ymgDG1frRQgc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HnLi++4r/bUnPC9Y4BiBIf/zt6LAnNkJcpPtfFaoO80r+oHoeaMBfBrRhK0Ru5RVO/jEA26L6C28f0h9yAqjODaSatrQC7evvvmT0k6HlDWn5o47uI3WOMAXRTNZ29EZnuneDYqkyhNrXo1h7HUqsTDgKLrnDBGHpf3t4TgZhoc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HPvBUv03; arc=none smtp.client-ip=139.178.84.217
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HPvBUv03"
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 511A060346;
	Mon, 24 Jun 2024 13:46:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C6A4C32782;
	Mon, 24 Jun 2024 13:45:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719236766;
	bh=nEbRkmLliGbrhN7a0dFrrROolzsUWf2ymgDG1frRQgc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HPvBUv03t5fHmHl5Vdhl5NNvWh/1rmgJmDIUT78BrhNjkekMyiHBemsXBtITKK+pk
	 Ph9y6SGv/k+x5Jl2xhlIMX2sddEfv5ScOkESPGjMaDvg1ZXM5kaST/YeMPDuDVXpgg
	 iH6h0sucNAo73sjXdAnuoapZ6RfRXTSWnSxyRGyPeNDve4kUinDBuUenLUefA9rCqX
	 54StG+jluCv5aLHX9mMsHCk5XhZuGMG20N2tbjRRxE9agT2YFzShKRFvN/weyUUZ99
	 p5MaDhc41zpO0i44wkIP3EtvIWnOiXRYHg0365/uFE0+rIV0Jq+m7pwvM4OmoBjW+O
	 CdaoXjn9E8fNg==
Date: Mon, 24 Jun 2024 15:45:57 +0200
From: Niklas Cassel <cassel@kernel.org>
To: Christoph Hellwig <hch@lst.de>
Cc: kernel test robot <oliver.sang@intel.com>, oe-lkp@lists.linux.dev,
	lkp@intel.com, Jens Axboe <axboe@kernel.dk>,
	Damien Le Moal <dlemoal@kernel.org>, Hannes Reinecke <hare@suse.de>,
	linux-m68k@lists.linux-m68k.org, linux-um@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
	drbd-dev@lists.linbit.com, nbd@other.debian.org,
	linuxppc-dev@lists.ozlabs.org, ceph-devel@vger.kernel.org,
	virtualization@lists.linux.dev, xen-devel@lists.xenproject.org,
	linux-bcache@vger.kernel.org, dm-devel@lists.linux.dev,
	linux-raid@vger.kernel.org, linux-mmc@vger.kernel.org,
	linux-mtd@lists.infradead.org, nvdimm@lists.linux.dev,
	linux-nvme@lists.infradead.org, linux-s390@vger.kernel.org,
	linux-scsi@vger.kernel.org, ying.huang@intel.com,
	feng.tang@intel.com, fengwei.yin@intel.com
Subject: Re: [axboe-block:for-next] [block]  bd4a633b6f: fsmark.files_per_sec
 -64.5% regression
Message-ID: <Znl4lXRmK2ukDB7r@ryzen.lan>
References: <202406241546.6bbd44a7-oliver.sang@intel.com>
 <20240624083537.GA19941@lst.de>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240624083537.GA19941@lst.de>

On Mon, Jun 24, 2024 at 10:35:37AM +0200, Christoph Hellwig wrote:
> This is odd to say at least.  Any chance you can check the value
> of /sys/block/$DEVICE/queue/rotational for the relevant device before
> and after this commit?  And is this an ATA or NVMe SSD?
> 

Seems to be ATA SSD:
https://download.01.org/0day-ci/archive/20240624/202406241546.6bbd44a7-oliver.sang@intel.com/job.yaml

ssd_partitions: "/dev/disk/by-id/ata-INTEL_SSDSC2BG012T4_BTHC428201ZX1P2OGN-part1"

Most likely btrfs does something different depending on the nonrot flag
being set or not. (And like you are suggesting, most likely the value of
the nonrot flag is somehow different after commit bd4a633b6f)


Kind regards,
Niklas
