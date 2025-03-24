Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B0BE2C80
	for <linux-m68k@lists.linux-m68k.org>; Mon, 24 Mar 2025 11:00:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=172.105.4.254
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742814051; cv=none; b=NUQYIxrUUG4Z+fCxQlLULTIFWkzBRcIz3ng7mMFXk08x1on5iONAMHcWAIqPMGjn+TALyj3HbJEIiOYKPYwXUjfVsuNh5PsV/w71U1AWpBLJG27hh35cKrLYKSzAR9stPgwj4n409oPD85lVSdtGnyJGdLuI/89QQSe9c5135Os=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742814051; c=relaxed/simple;
	bh=6YPKgdTbamjogK55gjYKj3KkZNIVl0oV0cDaa4otfDE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WIzaEWaFVkCoUSi8yyzgRNPF21bP6ZbVBRGq6u8FSmgHmOOe+JSMN4YEWePrZM44oGFxc0FbpYVS+QC8fdn2yXRTCd/tc/2v66G3Wq4hpAGjACT7eWO5mZBnK7SICNqUV9Ix/tET1Bt9Gin1OMjSpBYkofzRHF98MsYt/b1E/b4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E1M3KP2Q; arc=none smtp.client-ip=172.105.4.254
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E1M3KP2Q"
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6160D61146;
	Mon, 24 Mar 2025 11:00:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72B31C4CEDD;
	Mon, 24 Mar 2025 11:00:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742814048;
	bh=6YPKgdTbamjogK55gjYKj3KkZNIVl0oV0cDaa4otfDE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=E1M3KP2Qzx0CEtmrvxOmsAjjAq0y2iGnFEzz3nKoO5tT+bUbLdkJwvNrKSQ7EXQYT
	 /EfCbrwNH07YduQf0lVp+xcMCbYzbL8dpWM3wnVljj781/qmE7gDQkxa+6AC3A4DnE
	 iWk++BLg9qv3qjNx1i1FPc8gNZcvfyT8apphzIR+1WemNw2m3mZBcPIYTLpwq4m1ea
	 dWB9HbOkXPeXWnpn0HFZBV7tKmvYte1C6jQBtwOcUoheAFAF1WuOgBrrH8KGLiOu7g
	 DmE7W70xSFn0lajy5MsShxxaWn/j/Ez/MLO2svz5vCP4+JfcYkJjRYeGI8xEeRYo4f
	 nGK6vko5IeucQ==
Message-ID: <60c4bdf5-9c6f-40d9-b7b9-2fbfde6fdfd1@kernel.org>
Date: Mon, 24 Mar 2025 07:00:47 -0400
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] ata: pata_cswarp: Add Amiga cslab ata support
To: Paolo Pisati <p.pisati@gmail.com>, Niklas Cassel <cassel@kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-ide@vger.kernel.org, linux-m68k@lists.linux-m68k.org
References: <20250324092409.99430-1-p.pisati@gmail.com>
 <20250324092409.99430-3-p.pisati@gmail.com>
Content-Language: en-US
From: Damien Le Moal <dlemoal@kernel.org>
Organization: Western Digital Research
In-Reply-To: <20250324092409.99430-3-p.pisati@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2025/03/24 5:24, Paolo Pisati wrote:
> Driver for the on-board IDE interface on CS-Lab Warp Expansion Card
> (NOTE that idemode=native has to be set in Warp Configuration)
> 
> Signed-off-by: Paolo Pisati <p.pisati@gmail.com>

2 nits below.

[...]

> +static int pata_cswarp_probe(struct zorro_dev *z,
> +			     const struct zorro_device_id *ent)
> +{
> +	static const char board_name[] = "csWarp";
> +	struct ata_host *host;
> +	struct ata_port *ap;
> +	void __iomem *cswarp_ctrl_board, *base;
> +	unsigned long board = z->resource.start;
> +
> +	dev_info(&z->dev, "%s IDE controller (board: 0x%lx)\n", board_name,
> +		 board);
> +
> +	if (!devm_request_mem_region(&z->dev, board + WARP_OFFSET_ATA, 0x1800,
> +				     DRV_NAME))
> +		return -ENXIO;
> +
> +	/* allocate host */

Not a very useful comment :)
You can drop this as the function name is obvious.

> +	host = ata_host_alloc(&z->dev, 1);
> +	if (!host)
> +		return -ENXIO;
> +
> +	cswarp_ctrl_board = (void *)board;
> +
> +	ap = host->ports[0];
> +	base = cswarp_ctrl_board + WARP_OFFSET_ATA;
> +
> +	ap->ops = &pata_cswarp_ops;
> +
> +	ap->pio_mask = ATA_PIO4;
> +	ap->flags |= ATA_FLAG_SLAVE_POSS | ATA_FLAG_NO_IORDY |
> +		ATA_FLAG_PIO_POLLING;
> +
> +	ap->ioaddr.data_addr		= base;
> +	ap->ioaddr.error_addr		= base + 1 * 4;
> +	ap->ioaddr.feature_addr		= base + 1 * 4;
> +	ap->ioaddr.nsect_addr		= base + 2 * 4;
> +	ap->ioaddr.lbal_addr		= base + 3 * 4;
> +	ap->ioaddr.lbam_addr		= base + 4 * 4;
> +	ap->ioaddr.lbah_addr		= base + 5 * 4;
> +	ap->ioaddr.device_addr		= base + 6 * 4;
> +	ap->ioaddr.status_addr		= base + 7 * 4;
> +	ap->ioaddr.command_addr		= base + 7 * 4;
> +
> +	ap->ioaddr.altstatus_addr	= base + (0x1000 | (6UL << 2));
> +	ap->ioaddr.ctl_addr		= base + (0x1000 | (6UL << 2));
> +
> +	ata_port_desc(ap, "  cmd 0x%lx ctl 0x%lx", (unsigned long)base,
> +		      (unsigned long)ap->ioaddr.ctl_addr);
> +
> +	ata_host_activate(host, 0, NULL,
> +			  IRQF_SHARED, &pata_cswarp_sht);

	return ata_host_activate(host, 0, NULL,
				 IRQF_SHARED, &pata_cswarp_sht);

so that errors are properly reported.

> +
> +	return 0;
> +}
> +


-- 
Damien Le Moal
Western Digital Research
