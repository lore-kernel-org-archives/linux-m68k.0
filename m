Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8BBD1DED6F
	for <linux-m68k@lists.linux-m68k.org>; Sat, 26 Apr 2025 16:01:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745683323; cv=none; b=a2W6RX8IEWPMkKBjwoOtOPE1JOkl0/z4MQB5EQUUxwaBuft17+tJXkvp77HPkNu97u2ztcLX1FdH56GqTh+UPSMCyHg5Hsdf2aH+4vL4h4WeyXQpRiBxgrzShSvwk0UC5K/x9LGvZsW/f3dbSKwP/CNjJYVRCwNo+QunC+LKkdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745683323; c=relaxed/simple;
	bh=9UVuevIK4pN01S5JNfR8C86Tbh//DF7vt8izgjeOOpk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Vl95ZNavCDxsJkBDYt3XG+PQO/3/2FusgmCvvwt5+K+0UiYUtej7le/fCEi8uMo9ziCmcGUzyqrm2mUtFYiDuKyvrOztz/+7ot9LgBjqK6rW+LR0kzjGwoJmJLnLLfTX9eBBdshLJ3zcpxbSXl8mitg7c4XJMvj1KWxrZ8y+yKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=CMi8wIgT; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="CMi8wIgT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1745683309;
	bh=9UVuevIK4pN01S5JNfR8C86Tbh//DF7vt8izgjeOOpk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CMi8wIgT5HftdrjNJK5N6pcvA3Y6O5YNMYust/Rah6icPDCqnNNwB7Vo1sjtzEiRC
	 3UxaUVn+1/7nj4CSvqQr8HTLpYsZYHNnX4sEWINR/TV4EISIHsp5f8BptROhkT0i+m
	 l61q6YNh1bVXygUwXqXb8+TYjaCAIDFBWUbWL+WI=
Date: Sat, 26 Apr 2025 18:01:49 +0200
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: Daniel Palmer <daniel@0x0f.com>
Cc: w@1wt.eu, linux-m68k@lists.linux-m68k.org, geert@linux-m68k.org, 
	linux-kernel@vger.kernel.org, Daniel Palmer <daniel@thingy.jp>
Subject: Re: [PATCH v2] tools/nolibc: Add m68k support
Message-ID: <dcbd27d0-eb72-447c-8bfd-810a6939b0dd@t-8ch.de>
References: <20250426065323.259267-1-daniel@0x0f.com>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250426065323.259267-1-daniel@0x0f.com>

Hi!

On 2025-04-26 15:53:23+0900, Daniel Palmer wrote:
> From: Daniel Palmer <daniel@thingy.jp>
> 
> Add nolibc support for m68k. Should be helpful for nommu where
> linking libc can bloat even hello world to the point where you get
> an OOM just trying to load it.

Thanks for the patch, it does look good in general.
Could you rebase it onto the nolibc next branch [0] for easier application?
Also normal clang does not support m68k yet, so it should be skipped in
run-tests.sh in the llvm case.
As for mmu vs nommu, this choice has no impact on the userspace
application itself, right? If so, having only one configuration in the
nolibc testsuite should be enough.

[0] https://git.kernel.org/pub/scm/linux/kernel/git/nolibc/linux-nolibc.git/log/?h=next

> 
> Signed-off-by: Daniel Palmer <daniel@thingy.jp>
> ---
>  tools/include/nolibc/arch-m68k.h            | 141 ++++++++++++++++++++
>  tools/include/nolibc/arch.h                 |   2 +
>  tools/testing/selftests/nolibc/Makefile     |   5 +
>  tools/testing/selftests/nolibc/run-tests.sh |   1 +
>  4 files changed, 149 insertions(+)
>  create mode 100644 tools/include/nolibc/arch-m68k.h

<snip>
