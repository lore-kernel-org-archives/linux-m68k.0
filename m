Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C092557CAE
	for <linux-m68k@lists.linux-m68k.org>; Tue, 11 Jun 2024 16:50:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718124659; cv=none; b=cBJFIheCccsXUsbcEKoKYc/OCHE/wPDLuibzx9sD4psd9X6937JQYd6fMEs2CRTuB7CiKRsHFwthZFpuQwpT9r4PhTL4cZec492OYO9mf6F5LWeSGXGZw0EQ8jr+hIuXBJ5PN3Dm+CqlYyfmMbVhMz0uwCSp3jTqUyKJv7eJrKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718124659; c=relaxed/simple;
	bh=2FT/emrK48iE3dx07WXN0ST/iq8T21acuyaCQMRLCLQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XzvBwb8DUStzyemn6gx/DpFIK3LRE0cbUoD5ICjA3bt3OrgNzeObmRJ1Sr1C1UX3pPROebC/wM8iN7HAqHJnctxdLyMYrf0xPrvWUPAS06vygwcFE/7e5G0uyRLd2Xi5hItlINFIzpX3E5H/67g/CV/VpC41r/e/cZ6N3G0YE08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com; spf=none smtp.mailfrom=toxicpanda.com; dkim=pass (2048-bit key) header.d=toxicpanda-com.20230601.gappssmtp.com header.i=@toxicpanda-com.20230601.gappssmtp.com header.b=iVg18zlk; arc=none smtp.client-ip=209.85.219.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=toxicpanda-com.20230601.gappssmtp.com header.i=@toxicpanda-com.20230601.gappssmtp.com header.b="iVg18zlk"
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-dfa727cde2dso6227386276.0
        for <linux-m68k@lists.linux-m68k.org>; Tue, 11 Jun 2024 09:50:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda-com.20230601.gappssmtp.com; s=20230601; t=1718124657; x=1718729457; darn=lists.linux-m68k.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=k7qH/Egkqtc5OmSCKcG8suDn1pwScsKWRQ+gioBgKgY=;
        b=iVg18zlkqaA8BYjKdGu5dzfvsn+f6Z9kN0dgr0uo1EW0Ew4U5Q8rwYK/XIzvHbz2ZO
         2Kowko43V9M6MKKvr+PUaiVij4SLHadqGrebAqgU/p6bso00+bUVRkMD5xyoAg08J2+1
         ovB8jm5tulxLeXckwWtNejupgo6rP/DysSHZ2S8TEfgMzkYjwdbgC4d+UOnKWWVJY8h2
         IMAR+U8UVt5VCS5w1JVZMb79YT+6Bf9h4uzv0vUEcNYlUbx6/Qiw8Zc2RBlazmaZlcWg
         8QnEgSLm0FLgLkIOBqAU7Zl/J4s5i8vm8YJ4ZZYLJnXRXknIPy/sGXh9VqAZoY2lo/t4
         HbSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718124657; x=1718729457;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k7qH/Egkqtc5OmSCKcG8suDn1pwScsKWRQ+gioBgKgY=;
        b=VwnsUnpyBoczUKqZXFWB7Eo5GKKrV6LqR8Gc1junGVCVxLkScJUup5VvK7l9XjdBiA
         w8gR9w+VN3IaJYvFjVZPlfgl9EwthWIZINQ8GytTu8el2WZjxIl5ti8dsW4rjtRpXeMR
         r47crVEAb8+v00F+uXVdCXtSd6Xbh44yJmyexn97MYxI0Vtor+lJOt+5/JaLt4AxTkfU
         UySBN6GUTSKkpk3xhbBoBqwXg0SjCDxQp33lNt8Vf13HgtC5N40nAaQ+3CcJE97Ld/QG
         Ubck1WUhWCHnDeBF9UoQWw59Rma/UHUM7TvwFIUfXUcBU1jHoceVWtX6ouIeHvFrkmJa
         Ldpg==
X-Forwarded-Encrypted: i=1; AJvYcCXXxtuOrX7E4AbDS0mX/H/qap7BWSPcvxND+dYSOez1eFVFBPegYjabFJxHeuVFayPqLsHVvxqyNnEQZJn3SCAElL9pdJAX6SJlDMcwdK4z
X-Gm-Message-State: AOJu0Yzjs/4+gVP9G9RS+cwdXyMsqvITCEG3eQPtnScwhIn10ub1ukLK
	0yGnpn9A9qfBEMl0iEYmD0Xkuk3mESCdHUx0EGLD3FuBwmfdmWAR52KRuGAPBbk=
X-Google-Smtp-Source: AGHT+IFLbNcRGoXteJvsvQz9ePKtTqtffGprFSIVvQoC+S7q0aJ0DFFhhqHjAFy+KyUVXYjD8ktBew==
X-Received: by 2002:a0d:d851:0:b0:618:95a3:70b9 with SMTP id 00721157ae682-62cd565129cmr130634777b3.36.1718124656832;
        Tue, 11 Jun 2024 09:50:56 -0700 (PDT)
Received: from localhost (syn-076-182-020-124.res.spectrum.com. [76.182.20.124])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-62ccaef2825sm20935207b3.139.2024.06.11.09.50.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jun 2024 09:50:56 -0700 (PDT)
Date: Tue, 11 Jun 2024 12:50:55 -0400
From: Josef Bacik <josef@toxicpanda.com>
To: Christoph Hellwig <hch@lst.de>
Cc: Jens Axboe <axboe@kernel.dk>, Geert Uytterhoeven <geert@linux-m68k.org>,
	Richard Weinberger <richard@nod.at>,
	Philipp Reisner <philipp.reisner@linbit.com>,
	Lars Ellenberg <lars.ellenberg@linbit.com>,
	Christoph =?iso-8859-1?Q?B=F6hmwalder?= <christoph.boehmwalder@linbit.com>,
	Ming Lei <ming.lei@redhat.com>,
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
Subject: Re: [PATCH 09/26] nbd: move setting the cache control flags to
 __nbd_set_size
Message-ID: <20240611165055.GD247672@perftesting>
References: <20240611051929.513387-1-hch@lst.de>
 <20240611051929.513387-10-hch@lst.de>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240611051929.513387-10-hch@lst.de>

On Tue, Jun 11, 2024 at 07:19:09AM +0200, Christoph Hellwig wrote:
> Move setting the cache control flags in nbd in preparation for moving
> these flags into the queue_limits structure.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Reviewed-by: Josef Bacik <josef@toxicpanda.com>

Thanks,

Josef
