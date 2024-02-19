Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2BD62D046
	for <linux-m68k@lists.linux-m68k.org>; Mon, 19 Feb 2024 12:04:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708344289; cv=none; b=LCKawo0izu/T4rU1rlwc9HGPry/IvAoGEd5om6TxXGkNLfv1TjQIUBOC7SAjYK2Dkd9jSsGgRsUGpQvk3Tj1rpOItkSqEXuNy3ZKHikpoGxskJqGhzqvPUyBVUOD9D/3R2S7LAC2f4LyHc8oLUUR7vozUIGZc1TDbMAEDS2C3YU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708344289; c=relaxed/simple;
	bh=zDbj09vXhQ9a99MHLCKO+w+Rwn+2vxV620SpE5+aZl8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HIq0sE7oETGJyIbroriKB06Mdpy+Bxa9lVFz4D77pWtp2djKSssCzbWi4X5nInoq4qR4GT5qrR158yJqV9XacGitlsZsurpam5c1ON7o17XFx/SJXb3flEe3hSM8P7ezuMuXxorVcdwoVLSAl/UQdPFgDDEuHxuPUvvyJ3Z+Ico=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=m9YjWd3i; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="m9YjWd3i"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-5cddfe0cb64so3288140a12.0
        for <linux-m68k@lists.linux-m68k.org>; Mon, 19 Feb 2024 04:04:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1708344286; x=1708949086; darn=lists.linux-m68k.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UD0Q+YuM0aYncw1zT/Ixj8YCSgfiS1s5vMLj9q2v0Ag=;
        b=m9YjWd3itImTI1cdPVV9eAPiRZriou88tJeK/RbSKx8mzzDpcon8U13a3L6xODNa8T
         2+uBrtwYFgKa2AVxfTqWTVP0HVHOyLmhUj4Jljcwdyg7kYLmK7TqEWYCdlahX48SO1sz
         jPz6fkOKfMq8lfmPQXLKZ7SpBhk9Q+mZHzFhA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708344286; x=1708949086;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UD0Q+YuM0aYncw1zT/Ixj8YCSgfiS1s5vMLj9q2v0Ag=;
        b=VrTuPKwRjCRHVxhgHX6MGFE+cPdcS8KLKlERgAsI2jpAQbeZ83iWI9GQs45MgSFALa
         QLiMJlPRYwxlbdCoNucPZi/T3w+FTivhSi1COF+ytLK7HV6tFCmiVT1P/WPTG8IVLJ+G
         f/fJYjaElZ38aEbpoabUK+h6IK5dE8hS8bHxsbuNQ7KrwOgYNPOdr6xWFqiyHJSt3jyY
         l8l21I+e4bBy2vX4yQynhKNQF5hfQGs0gGXRl9Klm2KBd3TKs910w07TbrzR2DjrPWrL
         fHzB1qrZ04TI85hw5Kh/7mhLkiDoMvhvq9C2qnMdh2w9TEB8hPuz5gXzjdZYnaQGIous
         jQbg==
X-Forwarded-Encrypted: i=1; AJvYcCW32ZYWTo1TSSjhUglZ3wrl0mhFzMIbNLyoXu3MpB4iBONphr2taPfa4W3Lk2c+jzvuGvaoGawwjkm4Ln7x9n2po7+qnq078ToF3e38O1EP
X-Gm-Message-State: AOJu0YxkCwBorw9mYHKiiEmrYjxsu3OmjYxyAXAVPPjJLV8Lu0lyaDWP
	Jf32pw6rzCr82o4cUMb3D5ABVca9kbfXKAw879fbePat7Aaq75h6Oyo/uRBTfg==
X-Google-Smtp-Source: AGHT+IGI3q8seWzsit4w49RmDdpR7qXA23sSQ+6AKRh25Sx/UF2Jg2gSUuWiILezaNCe3BsJyRg1Qg==
X-Received: by 2002:a17:90b:607:b0:299:69c9:da3b with SMTP id gb7-20020a17090b060700b0029969c9da3bmr2641050pjb.38.1708344286161;
        Mon, 19 Feb 2024 04:04:46 -0800 (PST)
Received: from google.com ([2401:fa00:8f:203:8998:e92c:64ca:f09f])
        by smtp.gmail.com with ESMTPSA id sl14-20020a17090b2e0e00b00296d9c4d5f0sm5125314pjb.10.2024.02.19.04.04.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Feb 2024 04:04:45 -0800 (PST)
Date: Mon, 19 Feb 2024 21:04:40 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Christoph Hellwig <hch@lst.de>
Cc: Jens Axboe <axboe@kernel.dk>, Geert Uytterhoeven <geert@linux-m68k.org>,
	Minchan Kim <minchan@kernel.org>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Coly Li <colyli@suse.de>, Vishal Verma <vishal.l.verma@intel.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Dave Jiang <dave.jiang@intel.com>, Ira Weiny <ira.weiny@intel.com>,
	linux-m68k@lists.linux-m68k.org, linux-bcache@vger.kernel.org,
	nvdimm@lists.linux.dev, linux-block@vger.kernel.org
Subject: Re: [PATCH 5/9] zram: pass queue_limits to blk_mq_alloc_disk
Message-ID: <20240219120440.GA11472@google.com>
References: <20240215071055.2201424-1-hch@lst.de>
 <20240215071055.2201424-6-hch@lst.de>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240215071055.2201424-6-hch@lst.de>

On (24/02/15 08:10), Christoph Hellwig wrote:
> 
> Pass the queue limits directly to blk_alloc_disk instead of setting them
> one at a time.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Reviewed-by: Sergey Senozhatsky <senozhatsky@chromium.org>
