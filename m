Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F8DB366DCC
	for <linux-m68k@lists.linux-m68k.org>; Tue, 16 Dec 2025 15:27:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=172.234.252.31
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765898847; cv=none; b=SrA7chrb/h5QfdJkczieHuDr+0e63KYCcaxKiEkxxAqMLa7gJ+ISPBIqA9UPKmYQnSRCslkUWLM9pBPxf+0XvQZjMO8LgTRbO6uctdxZI72wPldpk6w5ovloFdi77bIDgbNw+9JWxzdX8lDdJwGzQipxG/yM9o/Wg1p2D6XHrO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765898847; c=relaxed/simple;
	bh=ZO7fqcvZVyODTEdC+tJcpyKZa6djq99DAaxYwAB3bGo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P5LmIbVTEpFBsiRykZhQxAEpwixqFOGORpFrVpmfnx/ecISIeczYdrF1+tNG+0uBjSjyyWanhVBD59ld8720PmdIPFR3aDrLiZX8B+nAw5Vld+ppgxVmdb1sL0j3PXDx1SU/10Q59jt7U+O2HtDGeeJNO5ycjMexVbgWSxsP+tI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NV0cGPPU; arc=none smtp.client-ip=172.234.252.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NV0cGPPU"
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 990FD4382A;
	Tue, 16 Dec 2025 15:27:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 007ECC4CEF1;
	Tue, 16 Dec 2025 15:27:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765898845;
	bh=ZO7fqcvZVyODTEdC+tJcpyKZa6djq99DAaxYwAB3bGo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NV0cGPPUGQRuJTHxD1VOAM1/pQWrv4P7s+RJb+3sM8t+P6mMhviANJJu9RNowrkV2
	 bWa2w4lxBUqCVikYWc77nhEVqtyqrd5KxzaaEJ6jbGgQoN2WmS0ax7I4xRg/Cf/VBG
	 gMbg1RB6ycOZyk7VFpOjm17aJmkemkbmF5NH/PFxUj1YACFEuyte6BCsE6+G8EYJeK
	 gJLAvdSQdj7uhgRnpaBziAWSNvTMeyjwFwkQpt+WMAuGfhwFIjnRMPdZoonoFwlL0x
	 yuHiby5JhJxD9Vf456N7R2gpKbuCiX+4B1c+j6EEmXNOIiKrrz7nXa4Svs3HdrkQ8D
	 y8k1LiXisNjSA==
Date: Tue, 16 Dec 2025 20:57:22 +0530
From: Vinod Koul <vkoul@kernel.org>
To: jeanmichel.hautbois@yoseli.org
Cc: Frank Li <Frank.Li@nxp.com>, Angelo Dureghello <angelo@sysam.it>,
	Greg Ungerer <gerg@linux-m68k.org>, imx@lists.linux.dev,
	dmaengine@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/5] dma: fsl/mcf-edma: Bug fixes and enhancements for
 ColdFire support
Message-ID: <aUF6WiKxOGQqwDvw@vaman>
References: <20251126-dma-coldfire-v2-0-5b1e4544d609@yoseli.org>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251126-dma-coldfire-v2-0-5b1e4544d609@yoseli.org>

On 26-11-25, 09:36, Jean-Michel Hautbois via B4 Relay wrote:
> This series addresses several bugs in the fsl-edma and mcf-edma drivers
> affecting MCF54418 ColdFire processors.
> 
> Patch 1 adds the FSL_EDMA_DRV_MCF flag to fix byte-lane addressing for
> MCF54418.
> 
> Patch 2 adds per-channel IRQ naming for easier debugging.
> 
> Patches 3-5 fix the interrupt and error handlers for all 64 DMA
> channels:
> - Patch 3 fixes the interrupt handler to process all 64 channels
> - Patch 4 moves the error handler out of the header file for clarity
> - Patch 5 fixes the error handler for all 64 channels with proper types
> 
> Tested on a custom MCF54418-based platform with slave DMA transfers.

The subsystem is dmaengine, please fix it in the patchseries

> 
> Signed-off-by: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
> ---
> Changes in v2:
> - Check devm_kasprintf() return value
> - Keep request_irq on one line in naming patch
> - Remove non needed memory barrier
> - Remove the interleave patch for now
> - Link to v1: https://lore.kernel.org/r/20251124-dma-coldfire-v1-0-dc8f93185464@yoseli.org
> 
> ---
> Jean-Michel Hautbois (5):
>       dma: fsl-edma: Add FSL_EDMA_DRV_MCF flag for ColdFire eDMA
>       dma: mcf-edma: Add per-channel IRQ naming for debugging
>       dma: mcf-edma: Fix interrupt handler for 64 DMA channels
>       dma: fsl-edma: Move error handler out of header file
>       dma: mcf-edma: Fix error handler for all 64 DMA channels
> 
>  drivers/dma/fsl-edma-common.c |  5 +++
>  drivers/dma/fsl-edma-common.h | 11 +++----
>  drivers/dma/mcf-edma-main.c   | 72 +++++++++++++++++++++++++------------------
>  3 files changed, 52 insertions(+), 36 deletions(-)
> ---
> base-commit: ac3fd01e4c1efce8f2c054cdeb2ddd2fc0fb150d
> change-id: 20251123-dma-coldfire-5f36aee143b3
> 
> Best regards,
> --  
> Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
> 

-- 
~Vinod
