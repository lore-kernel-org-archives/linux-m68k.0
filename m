Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 803E5172BCE
	for <linux-m68k@lists.linux-m68k.org>; Tue, 11 Jun 2024 08:24:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=145.40.73.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718094286; cv=none; b=qkqXzX0T9vJFGLpwYx9Ubt1gXJgKMoMzjRv1BeC1M8c03xhrk4WWCJlFYEh5Jmvh0k8XaAYzMScN23ZQrwunLsMkUUr94yUixkomc2j/X21YF05gpya/VEN6IUKKBdR6ouNxrfKY9zFJ357oDttWhL3/M/dyv7U3OpgEsP7cm9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718094286; c=relaxed/simple;
	bh=aa39oj6grsQuWCvXe8Xg/GJ/V11Jvezu/rMLECj5P4s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=prKQ3P3aGk0+fmmOiq/cyJGywoHgE0S2tiy7WUYtkFYf8PwW2x1VMJXjRtDsICQo7TdBz4q4MFvv9Q0fIoXeZskUFIz8INEQmVZPSqXrRcooG12h6APzF7Wyo+2fj6C3MzlhIxinFGfZ1ZGzayT8Xvp6QhwjcrFgsBM1XOP6qCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aV9kUDMW; arc=none smtp.client-ip=145.40.73.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aV9kUDMW"
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 8C529CE1986;
	Tue, 11 Jun 2024 08:24:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22FE3C2BD10;
	Tue, 11 Jun 2024 08:24:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718094282;
	bh=aa39oj6grsQuWCvXe8Xg/GJ/V11Jvezu/rMLECj5P4s=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=aV9kUDMWPWfXNXmeOO+XWzXEhkoXq7ADFSgqT6UOp6QmIpyBhYF9XRI2luZ1jDGrm
	 fjnG6eWakSd1CNbsGjF5O5LrabvpJGoxEOU9IkGiZiHR46HxhFdMHk0kIvmZI9wx0L
	 JOsygBPd1TdA6IDc/8xDg7nKHyfJ/2D590dnIGGMTWnavCtGtya+9Az2pKzwaIFhFJ
	 j4onYH3Luprc5hdFhkVV5RWd7C4hgmyLZChJZgAFOBU129M9EEZQ0rLACWD8TZ/l9S
	 OXq+G88IRiQo0zQ3DlC2WKDuqnhjQLUQDaVvY8Aat/yU/aTyp6lpmYzMIDEOv1I7i1
	 CT8Dtiuz6hADg==
Message-ID: <d457fc95-9231-4bc8-a2dd-2991aa8732ec@kernel.org>
Date: Tue, 11 Jun 2024 17:24:38 +0900
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 24/26] block: move the pci_p2pdma flag to queue_limits
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
 <20240611051929.513387-25-hch@lst.de>
Content-Language: en-US
From: Damien Le Moal <dlemoal@kernel.org>
Organization: Western Digital Research
In-Reply-To: <20240611051929.513387-25-hch@lst.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/11/24 2:19 PM, Christoph Hellwig wrote:
> Move the pci_p2pdma flag into the queue_limits feature field so that it
> can be set atomically and all I/O is frozen when changing the flag.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Reviewed-by: Damien Le Moal <dlemoal@kernel.org>

-- 
Damien Le Moal
Western Digital Research

