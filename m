Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C55FE3F20E5;
	Thu,  4 Jun 2026 08:40:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780562471; cv=none; b=PSgAqVzSCOKZVxBfKks4GIwIJbdwCcbSdvHZCQRGbvmx4hCs2iwwVWP3E9iItkNOyUkGLaaOTK2krB30m1cJzREDR91xrJ4lHqPbLMPUOY8isuTwo5MPTWFsphLbWgKkJqJw0b94mq/9jx3rkbrJco/kHPOgTN4GKkrXREYpyDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780562471; c=relaxed/simple;
	bh=nxmDOcj7DnuptxOR3z+WovvNUJ1TDjhuZhKD1EB2EC4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BBlBbmwviuOtYYXN06dahUVMN6jolqcrToi5Q5UTh2/XyprWqx1tvM7Dyl39vvlujxyYkde1GVWGbc1t+rMhKFw0ebnfNpm5hEQPqreNHo6Mr/kuhnMT9zynV+5xIUxhhj+Mp36JDSy3oDMMS1yF0cs9oim1ReMJxwCxItk2ODc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=QN2ajM3e; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="QN2ajM3e"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=mQoQQDfH6elbW+WU4LM1NqmrHffHzgVyX+zgp73Suqw=; b=QN2ajM3e9ttP3vHMbSh1NPRklm
	qLYK12h507GC7iIb6ItsDuXXU8Ygfcgd6Y2DwCL+/ijkxsCfoT16yLq+yuWT7xZ8ctXQyjoJ0VsgX
	UKY73a1vM6rzPU+4GNXvAav48vbpKT02WjLPxwXA+q4hMfs36sz3DtwTz6mw2P5LG4tXKe8KT1Dpj
	ep6L/2ZfnqUmXJ8bnPj05jwVrz2gaUiLkgEWto1R/HCPv7D5lxrSS+7LNDaw+e0Kdg/LDHtxEDCrQ
	anrKNxxBO5T+zT+Hezb/GVguA9wQ2HSQ0EtgldtxhiArAO9uZZEL+rQWE4YqFpFBtbOqnugtme2je
	t+SGYweg==;
From: Heiko Stuebner <heiko@sntech.de>
To: Greg Ungerer <gerg@linux-m68k.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org,
 Geert Uytterhoeven <geert@linux-m68k.org>, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] m68k: hash: Use lower_16_bits() helper
Date: Thu, 04 Jun 2026 10:40:56 +0200
Message-ID: <5564912.0YcMNavOfZ@phil>
In-Reply-To:
 <b55e9bd0532c0cad519809c86e0a8400060d75a1.1780559561.git.geert@linux-m68k.org>
References:
 <b55e9bd0532c0cad519809c86e0a8400060d75a1.1780559561.git.geert@linux-m68k.org>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Am Donnerstag, 4. Juni 2026, 09:54:23 Mitteleurop=C3=A4ische Sommerzeit sch=
rieb Geert Uytterhoeven:
> When building for m68k with CONFIG_M68000=3Dy and C=3D1:
>=20
>     drivers/clk/rockchip/clk-rk3528.c: note: in included file (through in=
clude/linux/hash.h, include/linux/slab.h):
>     arch/m68k/include/asm/hash.h:57:24: warning: cast truncates bits from=
 constant value (18720 becomes 8720)
>     arch/m68k/include/asm/hash.h:57:24: warning: cast truncates bits from=
 constant value (1e8e8 becomes e8e8)
>=20
> Sparse does not realize the truncation is intentional.
> Make this explicit by using the lower_16_bits() helper instead, which
> also masks the unwanted bits.
>=20
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202605191434.PQkj2Rki-lkp@i=
ntel.com/
> Reported-by: Heiko Stuebner <heiko@sntech.de>
> Closes: https://lore.kernel.org/20260603213726.1025094-1-heiko@sntech.de/
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>

While I have no clue about m68k, lower_16_bits() does the correct thing
it seems, so

Reviewed-by: Heiko Stuebner <heiko@sntech.de>

and thanks for providing the correct fix for the core issue, so
other compile-test cases also won't create those warning.


Heiko


> ---
> No change in generated code.
>=20
>  arch/m68k/include/asm/hash.h | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/arch/m68k/include/asm/hash.h b/arch/m68k/include/asm/hash.h
> index 6d0d0c893f16dd49..6dadf493706632f5 100644
> --- a/arch/m68k/include/asm/hash.h
> +++ b/arch/m68k/include/asm/hash.h
> @@ -2,6 +2,8 @@
>  #ifndef _ASM_HASH_H
>  #define _ASM_HASH_H
> =20
> +#include <linux/wordpart.h>
> +
>  /*
>   * If CONFIG_M68000=3Dy (original mc68000/010), this file is #included
>   * to work around the lack of a MULU.L instruction.
> @@ -54,7 +56,7 @@ static inline u32 __attribute_const__ __hash_32(u32 x)
>  	: "=3D&d,d" (a), "=3D&r,r" (b)
>  	: "r,roi?" (x));	/* a+b =3D x*0x8647 */
> =20
> -	return ((u16)(x*0x61c8) << 16) + a + b;
> +	return (lower_16_bits(x * 0x61c8) << 16) + a + b;
>  }
> =20
>  #endif	/* _ASM_HASH_H */
>=20




