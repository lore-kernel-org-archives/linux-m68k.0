Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3517CF4FA
	for <linux-m68k@lists.linux-m68k.org>; Wed, 12 Jun 2024 05:01:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.95.11.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718168477; cv=none; b=Qm6t2Nn7jbUvomo18L+Z8lJda6oGDcgfeLY+LeSNygW28EyXQvNrOE03Fo1dBjGoKPYY9MHtR3XzR5RBi6J774R24GF+zAaaOtp6safsGTKsMCNqP31+P088kiHgSmHQWTGOtoOp4qySYLH9lWeJ5tE52f5xjR6bL2peElbCBIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718168477; c=relaxed/simple;
	bh=v5YwGG3tNj51aq7pb37/1b/0eo0I1cCgUy5HPVaxg3A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RR14H4QF9djbigFV7asAiGmq58jjWpUkly6Z25wV9694MI369ZAkWW6gS8bejeP0+q72AFJurOxFd1B4/ISgtpKWLzX+IDuDH2NVNtvoDzcRl8g5WQreU9V0tZwzTP7zHlfWPILGNlQ1iUxRrAJV37RKf1jyjdm0Cu76dvRvCcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de; spf=pass smtp.mailfrom=lst.de; arc=none smtp.client-ip=213.95.11.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id 775D868C4E; Wed, 12 Jun 2024 07:01:10 +0200 (CEST)
Date: Wed, 12 Jun 2024 07:01:09 +0200
From: Christoph Hellwig <hch@lst.de>
To: Damien Le Moal <dlemoal@kernel.org>
Cc: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Richard Weinberger <richard@nod.at>,
	Philipp Reisner <philipp.reisner@linbit.com>,
	Lars Ellenberg <lars.ellenberg@linbit.com>,
	Christoph =?iso-8859-1?Q?B=F6hmwalder?= <christoph.boehmwalder@linbit.com>,
	Josef Bacik <josef@toxicpanda.com>, Ming Lei <ming.lei@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	Alasdair Kergon <agk@redhat.com>, Mike Snitzer <snitzer@kernel.org>,
	Mikulas Patocka <mpatocka@redhat.com>, Song Liu <song@kernel.org>,
	Yu Kuai <yukuai3@huawei.com>,
	Vineeth Vijayan <vneethv@linux.ibm.com>,
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
Subject: Re: [PATCH 19/26] block: move the nowait flag to queue_limits
Message-ID: <20240612050109.GA26959@lst.de>
References: <20240611051929.513387-1-hch@lst.de> <20240611051929.513387-20-hch@lst.de> <4845aae8-ad03-407e-bf31-f164b8f684d4@kernel.org>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4845aae8-ad03-407e-bf31-f164b8f684d4@kernel.org>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Tue, Jun 11, 2024 at 05:16:37PM +0900, Damien Le Moal wrote:
> > @@ -1825,9 +1815,7 @@ int dm_table_set_restrictions(struct dm_table *t, struct request_queue *q,
> >  	int r;
> >  
> >  	if (dm_table_supports_nowait(t))
> > -		blk_queue_flag_set(QUEUE_FLAG_NOWAIT, q);
> > -	else
> > -		blk_queue_flag_clear(QUEUE_FLAG_NOWAIT, q);
> > +		limits->features &= ~BLK_FEAT_NOWAIT;
> 
> Shouldn't you set the flag here instead of clearing it ?

No, but the dm_table_supports_nowait check needs to be inverted.
 
