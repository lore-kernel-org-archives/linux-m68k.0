Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28DE5CDB482
	for <linux-m68k@archiver.kernel.org>; Mon, 16 Oct 2023 12:56:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233677AbjJPM4e (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 16 Oct 2023 08:56:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60030 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233683AbjJPM41 (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 16 Oct 2023 08:56:27 -0400
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 288EE102
        for <linux-m68k@lists.linux-m68k.org>; Mon, 16 Oct 2023 05:56:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1697460985; x=1728996985;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=owu+iKqUzWkQLtSBTtxj1zT2rwGvuD6S/GZDMO70pg0=;
  b=Q+aYGouQD3XH/yPe1iOYzZpRrfmGA9xjV9Buydp62qcd41WARIE6c8ls
   +wnlEYXp9mU7I2aQZV7kOdbEM17sL6dQKlP77D7FQN8ibcOkJAGw2g/XL
   tiBHD4dTKGO4Cb8nQ2urRHS4W8t+4hVDIF9odTm8qEheo9bc25yDqVV9X
   kj99s6bv+E6zhQ6Qoz6FYby/jHUynSUuSVXPlqXsMwanOdRReXeWsTKLX
   g6k2moNvGPsld9RX+fGb3tWTApsUwev/amgRJFrbYx+NYVqvdvp6K1DCk
   H5wHmLs8zR7bfaWYwy2ky3kpkBEmjNtweboUvfWltFwwDSXV8G3A1YpPV
   w==;
X-CSE-ConnectionGUID: MUYjPoOnQe+6O7A6bgCR6A==
X-CSE-MsgGUID: HFcEOj/NRFqcOiHhwh4vUQ==
X-ThreatScanner-Verdict: Negative
X-IronPort-AV: E=Sophos;i="6.03,229,1694761200"; 
   d="asc'?scan'208";a="177204000"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 16 Oct 2023 05:56:23 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 16 Oct 2023 05:56:06 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex01.mchp-main.com (10.10.85.143)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Mon, 16 Oct 2023 05:56:02 -0700
Date:   Mon, 16 Oct 2023 13:55:40 +0100
From:   Conor Dooley <conor.dooley@microchip.com>
To:     Christoph Hellwig <hch@lst.de>
CC:     Greg Ungerer <gerg@linux-m68k.org>, <iommu@lists.linux.dev>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Conor Dooley <conor@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Wei Fang <wei.fang@nxp.com>,
        Shenwei Wang <shenwei.wang@nxp.com>,
        Clark Wang <xiaoning.wang@nxp.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        <linux-m68k@lists.linux-m68k.org>, <netdev@vger.kernel.org>,
        <linux-riscv@lists.infradead.org>,
        <linux-renesas-soc@vger.kernel.org>,
        Jim Quinlan <james.quinlan@broadcom.com>
Subject: Re: [PATCH 02/12] riscv: only select DMA_DIRECT_REMAP from
 RISCV_ISA_ZICBOM
Message-ID: <20231016-chomp-vitally-b6c004be7809@wendy>
References: <20231016054755.915155-1-hch@lst.de>
 <20231016054755.915155-3-hch@lst.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="Ihs0Gu2JVloYpIJM"
Content-Disposition: inline
In-Reply-To: <20231016054755.915155-3-hch@lst.de>
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

--Ihs0Gu2JVloYpIJM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 16, 2023 at 07:47:44AM +0200, Christoph Hellwig wrote:
> RISCV_DMA_NONCOHERENT is also used for whacky non-standard
> non-coherent ops that use different hooks in dma-direct.
>=20
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

> ---
>  arch/riscv/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index 0ac0b538379718..9c48fecc671918 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -273,7 +273,6 @@ config RISCV_DMA_NONCOHERENT
>  	select ARCH_HAS_SYNC_DMA_FOR_CPU
>  	select ARCH_HAS_SYNC_DMA_FOR_DEVICE
>  	select DMA_BOUNCE_UNALIGNED_KMALLOC if SWIOTLB
> -	select DMA_DIRECT_REMAP if MMU
> =20
>  config RISCV_NONSTANDARD_CACHE_OPS
>  	bool
> @@ -549,6 +548,7 @@ config RISCV_ISA_ZICBOM
>  	depends on RISCV_ALTERNATIVE
>  	default y
>  	select RISCV_DMA_NONCOHERENT
> +	select DMA_DIRECT_REMAP
>  	help
>  	   Adds support to dynamically detect the presence of the ZICBOM
>  	   extension (Cache Block Management Operations) and enable its
> --=20
> 2.39.2
>=20

--Ihs0Gu2JVloYpIJM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZS0yzAAKCRB4tDGHoIJi
0hjvAQCuU+lkdZEJGHqzkwUX3I/m5Rjm/NNqvKylHzOsHPnU9wD+O+V5jY/UGcxC
5Y5HrOaAn3eYO5OnNXk29wyRBjksoAU=
=pzeO
-----END PGP SIGNATURE-----

--Ihs0Gu2JVloYpIJM--
