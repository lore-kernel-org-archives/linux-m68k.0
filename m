Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97B3A2FEE31
	for <linux-m68k@lists.linux-m68k.org>; Wed, 18 Jun 2025 16:56:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750265794; cv=none; b=NVBcGeI14Z8SukObJldM1x8LKwuDOrikArpAE/sni+hDbZUmQXw5QaOo+6pQHzt98/SyGM74VnWj2Rg8rQSJ+ygkX7vRjkHaUDWBBuVMLrPetHIDkzt23GjAQxhfPtOwb5IEvSf0Sb99X7yooPSnXrrPxnoveEgF6N+nELf5BKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750265794; c=relaxed/simple;
	bh=edKXmParjhRu0BhM9r3sRCPgV6sjq8X4X6plBTPVfNE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AOq/pa/4JKMLktqvfVikXGUjghHRBJKCswaNOtB0LyIGoXybHsucUQEgwm7NTqWfuZM7J9nmzlEezwMNo9139WvbqmuhLf+ORvcy/KD0jYq9+OerT9rJr5q+IqLR221xjj2frc6RDcw7hGygRW5enPWdik83byoj5spjJWW/cQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O6B4wjG1; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O6B4wjG1"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3139027b825so5209343a91.0
        for <linux-m68k@lists.linux-m68k.org>; Wed, 18 Jun 2025 09:56:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750265792; x=1750870592; darn=lists.linux-m68k.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MLNHDlj/zAzYGC80eowNg066XecWuUgwFQMmbVio33Q=;
        b=O6B4wjG18c6o8dOGQaBun7ALs1sfNcaSnFWZihwyHBRhVplwc7XycP5puG4K0R4vJX
         sLqKTckSgjeWFsD98JnJzONoh89ejoZw7EtvZMN0yV/G78gvR1fzqavTrJKxMqtwLA3H
         jlGbxl+hhI6zfvXafCy7YqA/bfEl1fNOsfbRsx+pzvfxNDp1e1P9FP+7kIpsqSrifAS0
         50fyMEUbegp5GInQVKFkbS/I1IhWzrCBCWnK1RJc/OWebe+i/V34Kg3TosZbcUZqLRDP
         8P+eNGn7sPxyfpGo15/q9Vvm82dZV88dK/uapUaeUMiE3dJuLo6NQQW5Ng4/hWW7Ovao
         lXfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750265792; x=1750870592;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MLNHDlj/zAzYGC80eowNg066XecWuUgwFQMmbVio33Q=;
        b=GF/TjLkK8pDOM41WfCqckWqtEps3aCZQxLLyAM7LQWo5ODP45Y6276bM2xhzw83Hta
         RGQ/IB8fPu5YgzK2OgLEfUqDO4CfdMqm15JUJut1J99zMddiOvWWKRgKdVgB0xaqlSvV
         m4l2k32i0azkpWlvejlJJBxlGQiKxsMGeMXRaBK8RqMDOpJn/AAGC4DWPQNFZSFGvwq6
         wkYfg4W1PomxBwnTor+l3YybJYGC4ZASjCrNPwzJ7RSIO7Nz/N48UKxqmb+rgyl/8hSI
         kEwV2tu2WihUQlRHE1dEmJrv9UJ0D0VuD6RKprCGsJsI/M3JAKmlAsaHNF5uyQNeH1wh
         oi2A==
X-Gm-Message-State: AOJu0Yxc3aFIVMWcdvCm7OZlalveMd7TQgEf3l+Ce0sr8qYhuYDlW/Dp
	q3hJTOmj21bNEItESlEYxPkqd2Zgo92Ctk4taffQLvS+MgbE7dM+AMfQ
X-Gm-Gg: ASbGncsq5MHjg5fXxvujF82iZDk9unocxtpcl20kFnFpJlRtJ0y1AmxOUr7OmU6171y
	S8h5tslRGl2g6Px5TIar6l5I0fq6YvN+l9Ze1BK6XA+z+z/DAWMNzIYE3VfYCCcW/mS3dM1IPD6
	4EDe2BCCfndtHuAgUXLOwNXtmLUzEvad3UELSHMAR278y/81Ya9zsjfCeuDQfCmrZ81rFKCumt3
	cl1+TWGdTCSkHjyAZ6qCgBFc7+ceuiz/v/oZnWz8VzaHMcGpfznnjvNA9Svs0UiCaY7KsBhbrj6
	kiLWWDJhIjcLf16X7vyd/31YLfRuwlu72/NapHGSyuOGaiphbjwT/1dlD3hr+0P8Ndxjzgksepg
	oHiBe/Pn9wDxOZm2Y+Q==
X-Google-Smtp-Source: AGHT+IGbG5+rTgIf20wLcHyLzd/2R2UT4T7M+n2ZkFgbdZx4r8t5wgYFo1GhEYLYd0AZgdFs9EwxoQ==
X-Received: by 2002:a17:90b:3dd0:b0:311:ff02:3fcb with SMTP id 98e67ed59e1d1-313f1dee9c6mr27723365a91.28.1750265791565;
        Wed, 18 Jun 2025 09:56:31 -0700 (PDT)
Received: from fedora (c-67-164-59-41.hsd1.ca.comcast.net. [67.164.59.41])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3158a23d5e3sm182153a91.16.2025.06.18.09.56.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 09:56:30 -0700 (PDT)
Date: Wed, 18 Jun 2025 09:56:28 -0700
From: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH 0/4] Convert motorola to use ptdescs
Message-ID: <aFLvvBuz8gpdJdEE@fedora>
References: <20250611001255.527952-1-vishal.moola@gmail.com>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250611001255.527952-1-vishal.moola@gmail.com>

On Tue, Jun 10, 2025 at 05:12:51PM -0700, Vishal Moola (Oracle) wrote:
> m68k's Motorola still uses struct page (it's pointer tables) to track
> page tables. This patchset converts it to use ptdescs, to help prepare
> for allocating memory descriptors independently of struct page.
> 
> It also includes some minor cleanups to make the code more readable. 
> 
> ----
> 
> Based on mm-new. This has only been compile tested, but there are
> no expected runtime changes.

Just a friendly ping requesting someone takes a look at this series..
It should be simple, just make sure I didn't miss anything :)
