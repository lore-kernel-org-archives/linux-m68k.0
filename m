Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69FC14908B3
	for <linux-m68k@lists.linux-m68k.org>; Wed, 23 Sep 2026 12:08:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=172.234.252.31
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790165289; cv=none; b=j/he/IMTYrpKKpyZXF/wApKrz3PTDwWm9LVXnQhpUIiyAZBuKvNEb+kBqHiWee+nSwASDfJ+qnH1VNkw1uQ1009YyJ2dxjchffKSp6DtR3+r7yeKGzZ/pN0Pa+6B3MlegVcwCgsrARtm+pOEOXzTau41ZZwtKNJU/JWM2tJzJRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790165289; c=relaxed/simple;
	bh=j/pbjEEC+OxP910G3nTkBK9F+J82AG/EAEqPzgrrZmQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Za5tcNLYo/OX126UF/mhFRF6qilyHw5nKLXykAL4udSl3Te4YI+SAlcjoJHU+xtVUEyg79v8otJb0aMuysg/AxlcwesFINsFUS1QjV/QmaAJ77K1Dv+lsqgGpnHwi9NdDycT8Yp2it6IGXfqsFWTsQxkL2dYcUU5mwt4nRgM6kg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=kernel.org; arc=none smtp.client-ip=172.234.252.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C1DB643AEE;
	Wed, 23 Sep 2026 12:08:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AAEDC1F000FF;
	Wed, 23 Sep 2026 12:08:03 +0000 (UTC)
Message-ID: <a0dfd7f0-2949-4be1-bf1b-5a891256e5eb@linux-m68k.org>
Date: Wed, 23 Sep 2026 22:08:05 +1000
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/2] m68k: defconfig: update stmark2 defconfig
To: Angelo Dureghello <adureghello@baylibre.com>,
 Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>,
 =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, Geert Uytterhoeven
 <geert@linux-m68k.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
References: <20260701-wip-stmark2-dac-v7-0-ff8fdcc8010a@baylibre.com>
 <20260701-wip-stmark2-dac-v7-2-ff8fdcc8010a@baylibre.com>
Content-Language: en-US
From: Greg Ungerer <gerg@linux-m68k.org>
In-Reply-To: <20260701-wip-stmark2-dac-v7-2-ff8fdcc8010a@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Angelo,

On 2/7/26 00:17, Angelo Dureghello wrote:
> From: Angelo Dureghello <adureghello@baylibre.com>
> 
> Update stmark2 defconfig enabling MCF5441X DACs.
> 
> Signed-off-by: Angelo Dureghello <adureghello@baylibre.com>

Thanks, I have applied this to the m68knommu git tree, for-next branch.

Regards
Greg



> ---
> Changes for v5:
> - move this patch after new Kconfig symbols are added
> ---
>  arch/m68k/configs/stmark2_defconfig | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/m68k/configs/stmark2_defconfig b/arch/m68k/configs/stmark2_defconfig
> index b3fb95f73a95..3941113bc60b 100644
> --- a/arch/m68k/configs/stmark2_defconfig
> +++ b/arch/m68k/configs/stmark2_defconfig
> @@ -76,6 +76,8 @@ CONFIG_DMADEVICES=y
>  CONFIG_MCF_EDMA=y
>  # CONFIG_VIRTIO_MENU is not set
>  # CONFIG_VHOST_MENU is not set
> +CONFIG_IIO=y
> +CONFIG_MCF54415_DAC=y
>  CONFIG_EXT2_FS=y
>  CONFIG_EXT2_FS_XATTR=y
>  CONFIG_EXT2_FS_POSIX_ACL=y
> 

