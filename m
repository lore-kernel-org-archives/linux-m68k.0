Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05BFB17109E
	for <linux-m68k@lists.linux-m68k.org>; Tue, 11 Jun 2024 06:01:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=139.178.84.217
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718085667; cv=none; b=XP3E1JTnxa5PivxEogbBjI9qnzOIGv8IOrkZj9OqdPfqJ8qs1/Xm/lD4bnsoqPFJ4sYZDPnaK4okoYtsIE2JJwx+cVh7aHa+080j63m7qXjqlqM1YgC9SzP/Vh2H1lg0n0GnTdOsbkW9KfqLkO+unsR/wP4Mwh0IpPFMjrIyYP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718085667; c=relaxed/simple;
	bh=SwdezD+VbbCE5IbMCIb8XIlsQn00OdtPFM8sRr4ztZk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KSLempCOxnbH+y7n35AvMvkm6fEjVZ8gdKgRzQnFmO4pgCv47erXkQfV0dIFBEy6SXLaAFJV5xDd5i28ap3J3vGmz37A+2sxQWOpPYOjrNTz6+bE5M4oaYYTWSbzmv4Zf9gIsbWUJXoCfLMJ9NBlowjoqeOo+I5tvFHjKS4P0T0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Zr2vvzA/; arc=none smtp.client-ip=139.178.84.217
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Zr2vvzA/"
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4355B60C78;
	Tue, 11 Jun 2024 06:01:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61916C2BD10;
	Tue, 11 Jun 2024 06:01:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718085665;
	bh=SwdezD+VbbCE5IbMCIb8XIlsQn00OdtPFM8sRr4ztZk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Zr2vvzA/p7vYbT1k0uSBle8fVBLgAMu7Z8G2rZTtwcHwZJBLkdKFIjTMoJNCzigg7
	 HTTeNcLNiD8mOl1bIMJSt8wupoDF5SVZaTY0NG2Ov76mIgZZigWXzzY7XVXH2QtfH1
	 x8KGc2pS1U1PRUpHUWYyhzSKqD5PI1im3Hi8m7vBLaJJJ9qEpljyUtR6RhIgyapNwR
	 oXmNiibgRDzuOY4ziojjhBQyINExkUL4KDOxUOXHRojL4EJXnDtsoUuvYOOl28n8tz
	 mMTtS5NPXLxyTGNL4ivwnqnaNnzfQN6jrGtKZFwmi4ccqOatSNqZrVoj3XSteIqnUe
	 tMfkIjYNQxDVw==
Message-ID: <89258309-c77a-4b82-a5a1-a4f08f4e119e@kernel.org>
Date: Tue, 11 Jun 2024 15:00:59 +0900
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/26] loop: fold loop_update_rotational into
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
 <20240611051929.513387-8-hch@lst.de>
Content-Language: en-US
From: Damien Le Moal <dlemoal@kernel.org>
Organization: Western Digital Research
In-Reply-To: <20240611051929.513387-8-hch@lst.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/11/24 2:19 PM, Christoph Hellwig wrote:
> This prepares for moving the rotational flag into the queue_limits and
> also fixes it for the case where the loop device is backed by a block
> device.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Looks good to me.

Reviewed-by: Damien Le Moal <dlemoal@kernel.org>

-- 
Damien Le Moal
Western Digital Research

