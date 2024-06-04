Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1E5214BF86
	for <linux-m68k@lists.linux-m68k.org>; Tue,  4 Jun 2024 20:29:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=145.40.73.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717532949; cv=none; b=jPhWM9gNTKLAST+tesAML4sjkwvHNsVxHR6oeJ1GrPKutv6rcH3d9Qa3KDn4ih/Nng0MKJP5ZTEL+lZinctjeDUg51v80nDBCTq/UXRpT/uznbAAKPwXntidCtJ8lEiKNDaZcrVACUHfWvgU2VcomSg8S7fluJ14fELuOygkiV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717532949; c=relaxed/simple;
	bh=lhhzCuh045uFrmvUr+7+l46i0pGW+nKv3TQDnUD0NZQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cLhyDqvU75+Rr1xR76JUOu5n8nx4sHAizroM0sRVmJELHEe9AuecOX8O0RldyEaF8dpygvcqoNovSAE9/M89HC/kiICNTzePySQZ1DFY7MSXTGBuICYCcmOEq/2RAChkaH7zZ2xV/41UFOOP+SvJY1e6GKNYdUe8B0z1pscEGxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bNCSuNyI; arc=none smtp.client-ip=145.40.73.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bNCSuNyI"
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id B91BFCE1310;
	Tue,  4 Jun 2024 20:29:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 962DCC2BBFC;
	Tue,  4 Jun 2024 20:29:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717532945;
	bh=lhhzCuh045uFrmvUr+7+l46i0pGW+nKv3TQDnUD0NZQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bNCSuNyInGPc5/R0ntK4PB+NakI6DiIUGkpZjkqVstYio0MjaDr8M2FTGdEbTsG9m
	 QMnFPPxjClBBtDJ+roEp1tqjC/V8n+Om6AFGjmVt/X8P5Dd2mZsoAXOm9F3WDVqWh0
	 6Youq3h1BpQw6voiH8lkP/yJbqiy5gS/nzDKjSEdH0HXPj28iodTZvJ3szBRkKKbYE
	 +jm5m275LVgeCxhdLCsuIljDZlx3HmWifxhVe32vznvSueKBqwoyD6vYOx81mil0IG
	 yaZjGRRKvv1F3Yd47ASuLSkPfirOiX4OIviiiwljv1TdxmwKDwLKBFFwHWt9xUsjbk
	 6ondAQaV2uSrQ==
Date: Tue, 4 Jun 2024 22:29:00 +0200
From: Niklas Cassel <cassel@kernel.org>
To: Paolo Pisati <p.pisati@gmail.com>
Cc: Sergey Shtylyov <s.shtylyov@omp.ru>,
	Damien Le Moal <dlemoal@kernel.org>,
	linux-m68k@lists.linux-m68k.org, linux-ide@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ata: pata_buddha: pata_gayle: consolidate .sff_data_xfer
 around libata::ata_sff_data_xfer()
Message-ID: <Zl95DPtsOXlhaVDF@ryzen.lan>
References: <20240604162217.484789-1-p.pisati@gmail.com>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240604162217.484789-1-p.pisati@gmail.com>

Hello Paolo,

On Tue, Jun 04, 2024 at 06:22:17PM +0200, Paolo Pisati wrote:
> pata_buddha_data_xfer(), pata_gayle_data_xfer() and ata_sff_data_xfer() are the
> same function, consolidate around libata::ata_sff_data_xfer().

Please avoid the C++ namespace operator,
just drop "libata::" here and in the subject.

Also please just split this into two patches, one per driver.


> 
> Signed-off-by: Paolo Pisati <p.pisati@gmail.com>
> ---
>  drivers/ata/pata_buddha.c | 40 ++-------------------------------------
>  drivers/ata/pata_gayle.c  | 40 ++-------------------------------------
>  2 files changed, 4 insertions(+), 76 deletions(-)
> 
> diff --git a/drivers/ata/pata_buddha.c b/drivers/ata/pata_buddha.c
> index c36ee991d5e5..234278eb26e1 100644
> --- a/drivers/ata/pata_buddha.c
> +++ b/drivers/ata/pata_buddha.c
> @@ -60,42 +60,6 @@ static const struct scsi_host_template pata_buddha_sht = {
>  	ATA_PIO_SHT(DRV_NAME),
>  };
>  
> -/* FIXME: is this needed? */
> -static unsigned int pata_buddha_data_xfer(struct ata_queued_cmd *qc,
> -					 unsigned char *buf,
> -					 unsigned int buflen, int rw)
> -{
> -	struct ata_device *dev = qc->dev;
> -	struct ata_port *ap = dev->link->ap;
> -	void __iomem *data_addr = ap->ioaddr.data_addr;
> -	unsigned int words = buflen >> 1;
> -
> -	/* Transfer multiple of 2 bytes */
> -	if (rw == READ)
> -		raw_insw((u16 *)data_addr, (u16 *)buf, words);
> -	else
> -		raw_outsw((u16 *)data_addr, (u16 *)buf, words);
> -
> -	/* Transfer trailing byte, if any. */
> -	if (unlikely(buflen & 0x01)) {
> -		unsigned char pad[2] = { };
> -
> -		/* Point buf to the tail of buffer */
> -		buf += buflen - 1;
> -
> -		if (rw == READ) {
> -			raw_insw((u16 *)data_addr, (u16 *)pad, 1);
> -			*buf = pad[0];
> -		} else {
> -			pad[0] = *buf;
> -			raw_outsw((u16 *)data_addr, (u16 *)pad, 1);
> -		}
> -		words++;
> -	}
> -
> -	return words << 1;
> -}
> -
>  /*
>   * Provide our own set_mode() as we don't want to change anything that has
>   * already been configured..
> @@ -131,7 +95,7 @@ static void pata_xsurf_irq_clear(struct ata_port *ap)
>  
>  static struct ata_port_operations pata_buddha_ops = {
>  	.inherits	= &ata_sff_port_ops,
> -	.sff_data_xfer	= pata_buddha_data_xfer,
> +	.sff_data_xfer	= ata_sff_data_xfer,

Since this driver inherits ata_sff_port_ops,
which sets .sff_data_xfer to ata_sff_data_xfer:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/ata/libata-sff.c?h=v6.10-rc2#n46

this line should not be needed.


>  	.sff_irq_check	= pata_buddha_irq_check,
>  	.cable_detect	= ata_cable_unknown,
>  	.set_mode	= pata_buddha_set_mode,
> @@ -139,7 +103,7 @@ static struct ata_port_operations pata_buddha_ops = {
>  
>  static struct ata_port_operations pata_xsurf_ops = {
>  	.inherits	= &ata_sff_port_ops,
> -	.sff_data_xfer	= pata_buddha_data_xfer,
> +	.sff_data_xfer	= ata_sff_data_xfer,
>  	.sff_irq_check	= pata_buddha_irq_check,
>  	.sff_irq_clear	= pata_xsurf_irq_clear,
>  	.cable_detect	= ata_cable_unknown,
> diff --git a/drivers/ata/pata_gayle.c b/drivers/ata/pata_gayle.c
> index 3bdbe2b65a2b..febffc36a18f 100644
> --- a/drivers/ata/pata_gayle.c
> +++ b/drivers/ata/pata_gayle.c
> @@ -38,42 +38,6 @@ static const struct scsi_host_template pata_gayle_sht = {
>  	ATA_PIO_SHT(DRV_NAME),
>  };
>  
> -/* FIXME: is this needed? */
> -static unsigned int pata_gayle_data_xfer(struct ata_queued_cmd *qc,
> -					 unsigned char *buf,
> -					 unsigned int buflen, int rw)
> -{
> -	struct ata_device *dev = qc->dev;
> -	struct ata_port *ap = dev->link->ap;
> -	void __iomem *data_addr = ap->ioaddr.data_addr;
> -	unsigned int words = buflen >> 1;
> -
> -	/* Transfer multiple of 2 bytes */
> -	if (rw == READ)
> -		raw_insw((u16 *)data_addr, (u16 *)buf, words);
> -	else
> -		raw_outsw((u16 *)data_addr, (u16 *)buf, words);
> -
> -	/* Transfer trailing byte, if any. */
> -	if (unlikely(buflen & 0x01)) {
> -		unsigned char pad[2] = { };
> -
> -		/* Point buf to the tail of buffer */
> -		buf += buflen - 1;
> -
> -		if (rw == READ) {
> -			raw_insw((u16 *)data_addr, (u16 *)pad, 1);
> -			*buf = pad[0];
> -		} else {
> -			pad[0] = *buf;
> -			raw_outsw((u16 *)data_addr, (u16 *)pad, 1);
> -		}
> -		words++;
> -	}
> -
> -	return words << 1;
> -}
> -
>  /*
>   * Provide our own set_mode() as we don't want to change anything that has
>   * already been configured..
> @@ -110,7 +74,7 @@ static void pata_gayle_irq_clear(struct ata_port *ap)
>  
>  static struct ata_port_operations pata_gayle_a1200_ops = {
>  	.inherits	= &ata_sff_port_ops,
> -	.sff_data_xfer	= pata_gayle_data_xfer,
> +	.sff_data_xfer	= ata_sff_data_xfer,

Same comment as for the other driver.


Kind regards,
Niklas
