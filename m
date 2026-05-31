Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4510B390CAA
	for <linux-m68k@lists.linux-m68k.org>; Sun, 31 May 2026 15:52:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=172.234.252.31
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780242730; cv=none; b=k0eunlh9zdQ9MBOuePSsvWCd3PGJ5yAnSvQzXS3CKCfd4RE6gEZmLSkgtK8Tp/XlFbFAtvqgT0jvh2pneoARkM/kv+bVtRk8ad4KQQCwgSLy+eQ4JWRmZZxJWWjv87GeGes83/PJtGaOhAo3ge7J3vqMsR4vO8tyM8AzIGyk5D4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780242730; c=relaxed/simple;
	bh=wd5lujVut/YCkbcDDiWX4MK9YgNsKxj7MV+435Ept4U=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JjeTjx1fGrtepKUD1646nzXOhOvEs4fJ4N60NUW/Rjwj1STAxaPZtGE0QwUqRIgORPo8EOntdsbGPXWzJfshE7BogPWLE0iyAt86uDzneXdirkSFBL9MAhGEVMtPpt/pfQR46SctiolqAeGmNgaZDmUDK+agabnqXwztA6/95Tg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h7RlG9KI; arc=none smtp.client-ip=172.234.252.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h7RlG9KI"
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C3E0940BC1;
	Sun, 31 May 2026 15:52:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D94DD1F00893;
	Sun, 31 May 2026 15:52:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780242727;
	bh=eR7tTyyqGKiLll6lxmnF9fbyjgtiuG6PiIQ2to9I1lg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=h7RlG9KI/qfwxt2MsBovFn4HsnPdEBEKVBXKizu1orQVjrTKARHZbjpD8kKgxlssj
	 wltUyYNcOlBeaT/p8R8eNPrfW3FzOTjAyA5ZW44rJqOoSqVtI9A2EmPSgW39EnhzlC
	 oewlM5ij6RXj4miHavwwDBWMRmyMVQe21ko0yV8+8Sr4D2OFrSBh0Z61g9ifiThWze
	 7Hdl2u6trUHg3TZXxiubT2kew7hUo5d49LGShYYVkLrwcFikOBYmBnDPwHcoQ+enVg
	 VM5gGJ0TodGV5zk8t3B2uBzIFVoCeHTX7FQIdxG/qf3uqK8FVoCfOsh2dg9hsZQXWk
	 Nd4CAFthuAUzw==
Date: Sun, 31 May 2026 16:51:55 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Angelo Dureghello <adureghello@baylibre.com>
Cc: Greg Ungerer <gerg@linux-m68k.org>, Geert Uytterhoeven
 <geert@linux-m68k.org>, Steven King <sfking@fdwdc.com>, Arnd Bergmann
 <arnd@arndb.de>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre
 Torgue <alexandre.torgue@foss.st.com>, David Lechner
 <dlechner@baylibre.com>, Nuno =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>, Andy
 Shevchenko <andy@kernel.org>, Greg Ungerer <gerg@uclinux.org>,
 linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-iio@vger.kernel.org
Subject: Re: [PATCH v4 04/11] m68k: defconfig: update stmark2 defconfig
Message-ID: <20260531165155.13e586cd@jic23-huawei>
In-Reply-To: <20260531-wip-stmark2-dac-v4-4-7e65ab4215dd@baylibre.com>
References: <20260531-wip-stmark2-dac-v4-0-7e65ab4215dd@baylibre.com>
	<20260531-wip-stmark2-dac-v4-4-7e65ab4215dd@baylibre.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sun, 31 May 2026 17:25:57 +0200
Angelo Dureghello <adureghello@baylibre.com> wrote:

> From: Angelo Dureghello <adureghello@baylibre.com>
> 
> Update stmark2 defconfig enabling MCF5441X DACs.
> 
> Signed-off-by: Angelo Dureghello <adureghello@baylibre.com>
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

Sashiko makes the reasonable point that this symbol doesn't exist yet.
We don't care that much as they make different paths anyway but generally
I'd make sure defconfig updates are after the symbols are added.

https://sashiko.dev/#/patchset/20260531-wip-stmark2-dac-v4-0-7e65ab4215dd%40baylibre.com
>  CONFIG_EXT2_FS=y
>  CONFIG_EXT2_FS_XATTR=y
>  CONFIG_EXT2_FS_POSIX_ACL=y
> 

