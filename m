Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 010E8223DF1
	for <linux-m68k@lists.linux-m68k.org>; Sat,  9 Aug 2025 07:56:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754726187; cv=none; b=K+1G89SqWTxRhzctPx5oBz1F6sugETqr7gndg1kNU3iY6ovtvA+lnJC5JYUmw6406tx4r3MuvyhACISRcMOgI9Voed7/2JuSZ/cfNK0kY/C3U4bGoBLcDNDhxBcwlTVJOVPmuYdUEJWpc6HePXm5BMalaPmx54QWJ6HwJYMJJIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754726187; c=relaxed/simple;
	bh=iH2N9wqbHzEMj8RmmQatvqHszvO9Gt7XtO95bu8L8vk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Pj+V+rIFlpYIRV5xa7uhDeT9KzmTCX9BNsH/PmFQawNDhdg4YjQ+wd6rqW6S1pSQ8bEoyStSLojfhAG29OykxrmC7RrIntaqdu1zbYLgolHZ/7tpCdyk2XbTBaZWwv+r9mqVERnUgMZ4/B8N5LrfGTMybBMZVUWTYKKpTMD/gC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=c2+OKLoI; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="c2+OKLoI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1754725831;
	bh=iH2N9wqbHzEMj8RmmQatvqHszvO9Gt7XtO95bu8L8vk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=c2+OKLoIHhDpovJtVTPR7h0usvsbmNEWfhosuIYK8ufwoD/ahhv5djIlEFwVshyn3
	 zH8m479T/tUwH6nZYlkK1Gm4fvg5tukqZMYq7p5l5V3fMr2XbWvS0it7KysGtA0YtR
	 WJdXxK7D6AwhHBugvPZP8DraxURJcH2ILICi7CUc=
Date: Sat, 9 Aug 2025 09:50:31 +0200
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: Daniel Palmer <daniel@0x0f.com>
Cc: geert@linux-m68k.org, linux-m68k@lists.linux-m68k.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] m68k: Add target for lz4 compressed vmlinux
Message-ID: <5dd0a031-dd7b-4078-b1a8-6b760248390b@t-8ch.de>
References: <20250809015529.373693-1-daniel@0x0f.com>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250809015529.373693-1-daniel@0x0f.com>

On 2025-08-09 10:55:29+0900, Daniel Palmer wrote:
> Traditionally gzip (/bzip?) has been the compressed image format
> but its a pain to decompress because its very hard to load and
> decompress it in chunks which you need to do if you don't
> have enough memory to load the whole kernel image and decompress
> it somewhere else.
> 
> With lz4 you can set a block size, read it from the header,
> and then you only need memory for a single block and the
> decompressed kernel.
> 
> I use lz4 compressed images on 68000 with 8MB of ram
> and MVME147 with 16MB. I want to use lz4 in my fork of EMILE
> to boot m68k macs because streaming decompress of gzip is painful.
> 
> Signed-off-by: Daniel Palmer <daniel@0x0f.com>
> ---
>  arch/m68k/Makefile | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/arch/m68k/Makefile b/arch/m68k/Makefile
> index 0abcf994ce55..a56e853037c0 100644
> --- a/arch/m68k/Makefile
> +++ b/arch/m68k/Makefile
> @@ -124,6 +124,17 @@ else
>  	$(KBZIP2) -1c vmlinux >vmlinux.bz2
>  endif
>  
> +vmlinux.lz4: vmlinux
> +
> +ifndef CONFIG_KGDB
> +	cp vmlinux vmlinux.tmp
> +	$(STRIP) vmlinux.tmp
> +	$(LZ4) -z9f vmlinux.tmp vmlinux.lz4
> +	rm vmlinux.tmp
> +else
> +	$(LZ4) -z9f vmlinux vmlinux.lz4
> +endif

Splitting the vmlinux.tmp creation into a dedicated target would make
all the compressor targets simpler. It will need a bit more disk space,
but there are a bunch of vmlinux copies already in any case.

> +
>  CLEAN_FILES += vmlinux.gz vmlinux.bz2

CLEAN_FILES also needs to be updated.

>  archheaders:
> -- 
> 2.50.0
> 
