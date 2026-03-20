Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2693934AAEF
	for <linux-m68k@lists.linux-m68k.org>; Fri, 20 Mar 2026 19:16:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=172.105.4.254
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774034176; cv=none; b=PC+Vk6eSeeNQn5toiN6nYrUBjQ4RTrlxivXvliiCZOQKqDT2XMF3EkbQA+nDOKtlOd5SZ1b7VjqInkYiUddXdz5mZ4+DiItfeOi1/gLg+jnYLNmWwdHnjGQe14ZABeRtcmLGixwK6610Gk8OK2QYT4g0nEmRbtoCLGwXtksWQEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774034176; c=relaxed/simple;
	bh=Zj553TV02Z656Sw3FW5PIxLQtatsTyyTh3FJwakpKPI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZQ9LV0zoT2UfdumsbIYcwawkfYaUMQ0q40DdOd/RXeyI4jXcyOt1n3UqH8mgYHewBpm8TbU9+zlokuPivFtLAXvXl7UAyq+RGXsU01jKQF+NnsyZANBRvj6d4wjnmCcyUgINF60uYfZjm5KTmEe5M0kaowTrOysQYmX5lVO50ww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fGwhupAc; arc=none smtp.client-ip=172.105.4.254
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fGwhupAc"
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 13ACB60126;
	Fri, 20 Mar 2026 19:16:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB9FDC4CEF7;
	Fri, 20 Mar 2026 19:16:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774034173;
	bh=Zj553TV02Z656Sw3FW5PIxLQtatsTyyTh3FJwakpKPI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fGwhupAcMX9J+i2iRalZtgcGMzp4YU/flV3XhOkwmO88VtPuW3Evm672CzEqQIwza
	 4u4/N8kLZhA4vOBuKMueNMFgU98jsv6YwJXQT3BoyKrRBEPS7Mk/XxaBFy7jIeltQ/
	 TeEIgDPpq3LKJiq3w0L6Dz4yERGkoliDw0N7XZfgR2uub3uxwbxXquiniFrQz75l8i
	 6O/u9GzUa6ZCY9ZR7Wj5M7LClIPgGe2uuTHH+v1zMPEQPy2J+5ejpsh3NmiZabOQDB
	 OgC02EtznJZvTUBpinIphkltdZLsm6MEO8jwwtVW/MlWsyeixyK+jCMqHwNnIxpU/M
	 r694nP8Ea3gww==
Date: Fri, 20 Mar 2026 12:16:13 -0700
From: Kees Cook <kees@kernel.org>
To: Thorsten Blum <thorsten.blum@linux.dev>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Jens Axboe <axboe@kernel.dk>,
	Al Viro <viro@zeniv.linux.org.uk>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND] m68k: emu: Replace unbounded sprintf in
 nfhd_init_one
Message-ID: <202603201211.FB9DC5222C@keescook>
References: <20260318001632.2974-3-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260318001632.2974-3-thorsten.blum@linux.dev>

On Wed, Mar 18, 2026 at 01:16:33AM +0100, Thorsten Blum wrote:
> Replace unbounded sprintf() with the safer snprintf().
> 
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
> ---
>  arch/m68k/emu/nfblock.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/m68k/emu/nfblock.c b/arch/m68k/emu/nfblock.c
> index 93536cf2a38e..fa6256c5af22 100644
> --- a/arch/m68k/emu/nfblock.c
> +++ b/arch/m68k/emu/nfblock.c
> @@ -132,7 +132,8 @@ static int __init nfhd_init_one(int id, u32 blocks, u32 bsize)
>  	dev->disk->minors = 16;
>  	dev->disk->fops = &nfhd_ops;
>  	dev->disk->private_data = dev;
> -	sprintf(dev->disk->disk_name, "nfhd%u", dev_id);
> +	snprintf(dev->disk->disk_name, sizeof(dev->disk->disk_name), "nfhd%u",
> +		 dev_id);
>  	set_capacity(dev->disk, (sector_t)blocks * (bsize / 512));
>  	err = add_disk(dev->disk);
>  	if (err)

This one falls into a "currently impossible" category:

        for (i = NFHD_DEV_OFFSET; i < 24; i++) {
                if (nfhd_get_capacity(i, 0, &blocks, &bsize))
                        continue;
                nfhd_init_one(i, blocks, bsize);

static int __init nfhd_init_one(int id, u32 blocks, u32 bsize)
{
	...
        int dev_id = id - NFHD_DEV_OFFSET;
	...
        sprintf(dev->disk->disk_name, "nfhd%u", dev_id);

I'd almost prefer to see "id" bounds checked prior to the dev_id
calculation (in some unlikely future where "id" isn't
NFHD_DEV_OFFSET-based).

#define DISK_NAME_LEN                   32
...
        char disk_name[DISK_NAME_LEN];  /* name of major driver */

The largest the %u could get would be 10 digits, so it'll always be in
bounds.

But there's no harm in the change:

Reviewed-by: Kees Cook <kees@kernel.org>


-- 
Kees Cook
