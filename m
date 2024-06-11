Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B8F9172799
	for <linux-m68k@lists.linux-m68k.org>; Tue, 11 Jun 2024 07:25:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=145.40.73.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718090728; cv=none; b=HTdXcTOAZSPOXrXvXQfQC3+nRuYI7FIx+RXa0KtYfjt26CZ4/DVvo96BP43HsyfxwNYTUvexmpMVybw6iBH1OCXbdNDrJvTlQYbZKfOpxvC2Ji376sR6A2RPqtZH08YLMdA8/LVnmqLHD5R35560lNBPr3HpHdAtEDihXsWoESA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718090728; c=relaxed/simple;
	bh=SKDzpdZjTAHkWp+zsEQwH6Ky8PVIUSEQggaioawXXkU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=q3Gwzj7uojhFTaSoBaV+7cONP4ygqdbvjmzZU18qyAgeS65mCtOUzOlcthyzykoHaosBYRad11yao7948DfVjStuCwijszDrw7dJ30e7Up6FNu0V1iJ209yBuNwc2DNR7wu1+gUpjpk0S8QOBIgabfSDmeG7Nzi2DJcBij013Ns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UCtiHiiw; arc=none smtp.client-ip=145.40.73.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UCtiHiiw"
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id B2D1CCE19E4;
	Tue, 11 Jun 2024 07:25:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80F46C2BD10;
	Tue, 11 Jun 2024 07:25:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718090724;
	bh=SKDzpdZjTAHkWp+zsEQwH6Ky8PVIUSEQggaioawXXkU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=UCtiHiiw5QvJYmElyhHUIvI9qZN2kq7wHApTDMzEobrX5tFMllUF7QgwTYv0VDSQe
	 4AvJZ9Xc1WQTZynkZ5eqZVN35p41xaFCgmlC7UMaLIvvCM36uO+T8E3D8B2kWkrwrw
	 CxnQ5rfAOwcQk9F3stXF5NyYVqFnlDWOGrsxEQrWt2LCiqL+fvPkUXoNp9aPDrZKK/
	 Jf1WpJR5Tfo8C4kN4+IDjAFgA3wv+/TYcPyqih/c85wJGX2v2SpjxCABdfzaKWUWw8
	 mwFNFCAMG5oIrZT1WMKm7NaX1XpI2tHzzzRuvurRNs7Kd2xxeNWyHz9cxkpcbZ5fhc
	 X7SraO1QML8XQ==
Message-ID: <92df5033-5df7-4b2a-98ad-a27f8443ee6a@kernel.org>
Date: Tue, 11 Jun 2024 16:25:18 +0900
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/26] sd: move zone limits setup out of
 sd_read_block_characteristics
To: Christoph Hellwig <hch@lst.de>
Cc: Jens Axboe <axboe@kernel.dk>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Richard Weinberger <richard@nod.at>,
 Philipp Reisner <philipp.reisner@linbit.com>,
 Lars Ellenberg <lars.ellenberg@linbit.com>,
 Christoph B??hmwalder <christoph.boehmwalder@linbit.com>,
 Josef Bacik <josef@toxicpanda.com>, Ming Lei <ming.lei@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Roger Pau Monn?? <roger.pau@citrix.com>, Alasdair Kergon <agk@redhat.com>,
 Mike Snitzer <snitzer@kernel.org>, Mikulas Patocka <mpatocka@redhat.com>,
 Song Liu <song@kernel.org>, Yu Kuai <yukuai3@huawei.com>,
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
References: <20240611051929.513387-1-hch@lst.de>
 <20240611051929.513387-3-hch@lst.de>
 <40ca8052-6ac1-4c1b-8c39-b0a7948839f8@kernel.org>
 <20240611055239.GA3141@lst.de> <20240611055405.GA3256@lst.de>
Content-Language: en-US
From: Damien Le Moal <dlemoal@kernel.org>
Organization: Western Digital Research
In-Reply-To: <20240611055405.GA3256@lst.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/11/24 2:54 PM, Christoph Hellwig wrote:
> On Tue, Jun 11, 2024 at 07:52:39AM +0200, Christoph Hellwig wrote:
>>> Maybe we should clear the other zone related limits here ? If the drive is
>>> reformatted/converted from SMR to CMR (FORMAT WITH PRESET), the other zone
>>> limits may be set already, no ?
>>
>> blk_validate_zoned_limits already takes care of that.
> 
> Sorry, brainfart.  The integrity code does that, but not the zoned
> code.  I suspect the core code might be a better place for it,
> though.

Yes. Just replied to your previous email before seeing this one.
I think that:

static int blk_validate_zoned_limits(struct queue_limits *lim)
{
        if (!lim->zoned) {
                if (WARN_ON_ONCE(lim->max_open_zones) ||
                    WARN_ON_ONCE(lim->max_active_zones) ||
                    WARN_ON_ONCE(lim->zone_write_granularity) ||
                    WARN_ON_ONCE(lim->max_zone_append_sectors))
                        return -EINVAL;
                return 0;
        }
	...

could be changed into:

static int blk_validate_zoned_limits(struct queue_limits *lim)
{
	if (!lim->zoned) {
                lim->max_open_zones = 0;
		lim->max_active_zones = 0;
		lim->zone_write_granularity = 0;
		lim->max_zone_append_sectors = 0
		return 0;
	}

But then we would not see "bad" drivers. Could have a small

blk_clear_zoned_limits(struct queue_limits *lim)

helper too.

-- 
Damien Le Moal
Western Digital Research

