Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 353D532C94B
	for <linux-m68k@lists.linux-m68k.org>; Tue, 21 Apr 2026 06:49:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776754156; cv=none; b=G3iHYPCc9XsABpteP706qzz3et3e7K66t/qpz/Iu/5Gp6DqUPfOQV0KTRR+B6asozUmlZdjdUM1fup3rxZbwb/0vc1fAgMfoDJs9FYovxb8rc6PeMlAK7diCXwdobt4omwfpSSsU06khzrSIAfJwpff2SkiZDos6PC5ETAJv908=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776754156; c=relaxed/simple;
	bh=am3smhs96M1Iz0Y0JDciE1ZjrAK1dDbEC7UccjVq/eg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fM1ODxoP6B9w3OWRJofvwsB6JAxmetUtBF6t/Kgwg5mOFDmzrcyLHj+C9qcberyJ84qvogcqKVU4bNpf+B2YRvPMOQafyU9TD7PniTUsqG1NVyx9a9Ja5KFQ94QD1/b3ly9RMf9Y/ZTs6wDQaYG/8pvFm1f+U2zh8QjAKjVIqaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HkFrg18y; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HkFrg18y"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-35fc0d7c310so2678094a91.1
        for <linux-m68k@lists.linux-m68k.org>; Mon, 20 Apr 2026 23:49:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776754153; x=1777358953; darn=lists.linux-m68k.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VdNywBu7apdyTFV9cnt3GZxXLndr1pBULjY0WptzCm8=;
        b=HkFrg18yJTc3X1B4jylb4e0yLpj72DIbvNKWWyXfWrsqWgBHAs2iQBO+jwhVBCpizo
         ROXM+4lQ9U9AreWSps2hh3uY9y9gl68fw1cck8xsgunzVdY7XFsfFuoKCIcOveJOUpJz
         moBBBxFeTowVHEPJyCdyAMJwnmFjdaybAd5aLeUK2wKtQS8trKiGNluWCJTBTeRfVRQT
         AggPLVKQ8uKHy2HIJ5k6c7lfDBeueVOPcEfU5YOv8etTTtnm1Okr7MSlogUlHXsC6INk
         yBEw8+sxfzZ8lAcR3haS36vLo+e8Z+bntLQ450QW41SEnlisu2YM5Sl9St2X5WvVHC/7
         uxsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776754153; x=1777358953;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VdNywBu7apdyTFV9cnt3GZxXLndr1pBULjY0WptzCm8=;
        b=Bn5eP+W8rEzH+X5SXEuz9I0fnOwQDuyXAeRWGeUqb4ZuntDf1f+Vpsx5wWen9p5I1F
         Ogw7Of1NDaiC7YEvh4iCWlf/lPHCa9szkna0RI/pGOTpNL4qTK8OfHbgaAWdYU9U57LO
         6mBuvRNlNgPTiM0EPki3Jhkd8uJH3bu3Js9lc2ykJnbQqxkoGOnNBvoYVVXFcxSUEknq
         dr2sVd1i213IRaRvcBakjpaj8DYcZZD6P7XR6wk5+D480B06+CklfvYEB7YVbGqj9Fha
         I5lEE+HSVJ10jquAXMNFa3V6WcXNicTf46ujMFt22QeNU1XwPubPQKffL5JhzSFQWF+6
         1ZZQ==
X-Forwarded-Encrypted: i=1; AFNElJ/doLE07cLUC6uWRp1PmtC8o4EgXbU6KbFXaLUSSPdE4X+LlVNgKs+O1gd5KhWxkMCl7goApeRxlZPk@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YyvdqABdCkVbmAdc5l6I6Wul0UfSTCSiNEZE+zCO+S0PcZ8fYMz
	1pAqiR2gkjX1Of8My5tde46M94Rq92Vg9JN9PwdeymDQh3XNKKW/zSTh
X-Gm-Gg: AeBDieukzsCWIRABQxgfb0G2M/P+zZvYsJnV+J9gI7OY2fYh1cAEtX8pM0/GkEhZd92
	qDUvdSdYsoNrSL1T33FN78PEx7RoyVWjeY7Va1rw/jHdWW8ysXc0UG44ntCCjdHTv6pscTqA+N5
	khXStphbdwaVJsNTS4hEMG5M1A6DmDspdq6VZgh8GUF1mhPXsCF3IuGJXoWnlmAFerDRnfWuqnS
	xKEtaCeborl7moB0XC9D6ZuWv0wMJ6zRIoFE+kwA/vF8yRrnkBUrFlnuujKv2cZ8MBOOuvj5lW9
	lwk2weNaVcf9lgBZ45qGTcAnfw0F9CqaBv+yFtO9fXpLqc+tPbeEAEMvoP/IpgodYGoTkc+30Nx
	Hp2z2y6kwzyIcAYDmvvB9E2ADVcgY0beSPr0aoKg7xQChkdZ/5Kp55vsLRlsXxX62Em6i0WhaFt
	3jxzHTfYQmMFbHXEW3dhxylz0HJMu4fKmKKZxL+RdNhVGFvKBMK81QqIJSbOO5KWM2NcD31//q3
	Ez8/S7GVH0fDIRJ
X-Received: by 2002:a17:90a:dfd0:b0:35e:30bc:96ed with SMTP id 98e67ed59e1d1-36140402361mr16891174a91.10.1776754153374;
        Mon, 20 Apr 2026 23:49:13 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com ([129.41.58.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3614195a8f0sm12278674a91.12.2026.04.20.23.48.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 23:49:13 -0700 (PDT)
Date: Tue, 21 Apr 2026 12:18:55 +0530
From: Mukesh Kumar Chaurasiya <mkchauras@gmail.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, 
	Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org, Arnd Bergmann <arnd@arndb.de>, 
	x86@kernel.org, Lu Baolu <baolu.lu@linux.intel.com>, iommu@lists.linux.dev, 
	Michael Grzeschik <m.grzeschik@pengutronix.de>, netdev@vger.kernel.org, linux-wireless@vger.kernel.org, 
	Herbert Xu <herbert@gondor.apana.org.au>, linux-crypto@vger.kernel.org, 
	Vlastimil Babka <vbabka@kernel.org>, linux-mm@kvack.org, David Woodhouse <dwmw2@infradead.org>, 
	Bernie Thompson <bernie@plugable.com>, linux-fbdev@vger.kernel.org, Theodore Tso <tytso@mit.edu>, 
	linux-ext4@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, 
	Uladzislau Rezki <urezki@gmail.com>, Marco Elver <elver@google.com>, 
	Dmitry Vyukov <dvyukov@google.com>, kasan-dev@googlegroups.com, 
	Andrey Ryabinin <ryabinin.a.a@gmail.com>, Thomas Sailer <t.sailer@alumni.ethz.ch>, 
	linux-hams@vger.kernel.org, "Jason A. Donenfeld" <Jason@zx2c4.com>, 
	Richard Henderson <richard.henderson@linaro.org>, linux-alpha@vger.kernel.org, 
	Russell King <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org, 
	Catalin Marinas <catalin.marinas@arm.com>, Huacai Chen <chenhuacai@kernel.org>, loongarch@lists.linux.dev, 
	Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k@lists.linux-m68k.org, 
	Dinh Nguyen <dinguyen@kernel.org>, Jonas Bonn <jonas@southpole.se>, linux-openrisc@vger.kernel.org, 
	Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org, Paul Walmsley <pjw@kernel.org>, 
	linux-riscv@lists.infradead.org, Heiko Carstens <hca@linux.ibm.com>, linux-s390@vger.kernel.org, 
	"David S. Miller" <davem@davemloft.net>, sparclinux@vger.kernel.org
Subject: Re: [patch 32/38] powerpc/spufs: Use mftb() directly
Message-ID: <aecdpyvTLJOjCdFp@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
References: <20260410120044.031381086@kernel.org>
 <20260410120319.723429844@kernel.org>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260410120319.723429844@kernel.org>

On Fri, Apr 10, 2026 at 02:21:04PM +0200, Thomas Gleixner wrote:
> There is no reason to indirect via get_cycles(), which is about to be
> removed.
> 
> Use mftb() directly.
> 
> Signed-off-by: Thomas Gleixner <tglx@kernel.org>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: linuxppc-dev@lists.ozlabs.org
> ---
>  arch/powerpc/platforms/cell/spufs/switch.c |    5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> --- a/arch/powerpc/platforms/cell/spufs/switch.c
> +++ b/arch/powerpc/platforms/cell/spufs/switch.c
> @@ -34,6 +34,7 @@
>  #include <asm/spu_priv1.h>
>  #include <asm/spu_csa.h>
>  #include <asm/mmu_context.h>
> +#include <asm/time.h>
>  
>  #include "spufs.h"
>  
> @@ -279,7 +280,7 @@ static inline void save_timebase(struct
>  	 *    Read PPE Timebase High and Timebase low registers
>  	 *    and save in CSA.  TBD.
>  	 */
> -	csa->suspend_time = get_cycles();
> +	csa->suspend_time = mftb();
>  }
>  
>  static inline void remove_other_spu_access(struct spu_state *csa,
> @@ -1261,7 +1262,7 @@ static inline void setup_decr(struct spu
>  	 *     in LSCSA.
>  	 */
>  	if (csa->priv2.mfc_control_RW & MFC_CNTL_DECREMENTER_RUNNING) {
> -		cycles_t resume_time = get_cycles();
> +		cycles_t resume_time = mftb();
>  		cycles_t delta_time = resume_time - csa->suspend_time;
>  
>  		csa->lscsa->decr_status.slot[0] = SPU_DECR_STATUS_RUNNING;
> 
Reviewed-by: Mukesh Kumar Chaurasiya (IBM) <mkchauras@gmail.com>
