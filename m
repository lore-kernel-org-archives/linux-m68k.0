Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A242E3E5596
	for <linux-m68k@lists.linux-m68k.org>; Tue, 14 Apr 2026 12:55:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776171355; cv=pass; b=psCiiNONnSCXjRY/Wf/TnFo8z8OvOVaXAs01viUCfObCqR2jU0YM0J5s4OBmBVczuQxLvGmHaHH+HgeAVnNP0FMzNRHhGDM90vez+qwbsmRb/X86lhcQYi8GaMR+rdqFvdNZEeZ5lu2KoVyZObbBcQHhbDszvxtN44BOnNJRu+I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776171355; c=relaxed/simple;
	bh=ZnJ++Fe0qwvDRTxVDzLcadQUyABq9XTiwCDKmvKMrAo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JCMk3MihnbzgPkTKI63KnQ/CnCWL6upwfwPwP1Qs1hvgBS4wdeQh2+taf6xhvnARCMx6YSF0x7qiILxCQePDaWkxgD8qPKhA3boZFryhwLz10JVIARjBfUlnsHXf6kz1rCKWrDjnlhOs/vYZzyoLIoOmkvWrhbGecgngS8kdVGw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com; spf=pass smtp.mailfrom=0x0f.com; dkim=pass (1024-bit key) header.d=0x0f.com header.i=@0x0f.com header.b=J+vMn3SE; arc=pass smtp.client-ip=74.125.82.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0x0f.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=0x0f.com header.i=@0x0f.com header.b="J+vMn3SE"
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-12c42a23c8eso3559185c88.1
        for <linux-m68k@lists.linux-m68k.org>; Tue, 14 Apr 2026 05:55:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776171354; cv=none;
        d=google.com; s=arc-20240605;
        b=SQU2lYH4qYhgrMpTKq59Q0lDRCLy2w9HN3x4A8EIw6jih1zORrVElA4aDKC40SJPsb
         s692RpUrC0Jd+4Chl5+DZDNlSiaWmaL9dgOKJFEYKV7gQF/L7kojei0dF8ZxBddkeFlD
         pzbFHHmo+x5bf+pTzzX+kt0CU0O3fXgp+vpgZBhmSUI+9dlR6lJSoPr33tQ79FUNwt9t
         2ZYHzgsRrs1IYVNzzsjQd1ym2BE4FBqmnmocFq+dFZ5LfgvuOIyRL4G2XC0LGSUk7XbH
         JJZiRQ4cpzFxjUTxYE+4um0p0zjyXCh1QVW0+Q8CLoDUUk7B970PzcXA6TRCOo4DaJQ2
         R4ZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ZnJ++Fe0qwvDRTxVDzLcadQUyABq9XTiwCDKmvKMrAo=;
        fh=Gh7njkRcqG3/eSkXsi3H/9LtqMbCM8EylAX4gMSwEYg=;
        b=TLh3TPwhDheEPWZ7xNiUsPbPjlnArDS8z/Mh1/EmFPbwhIUl0ZlMKk2nE1OTiEchpd
         jslEZa7zAH8vRHBxcnuZDTIhfeSKyBzwuebSIaN2s3QOPuAQ41hRyWY+6bM11KBWrulj
         gu6b0z9YIITpEXxXM1BGTpi+ocXsfHF33X47N/ygUcPxBfyFv6zIB94cAsc8KZUoFyvo
         AdVFOJzONgtS6HBj7QNEpVp9yhNL4yyt2RN8OGWFkI8kiJm2UTzKW5yLLWmvgSw8uQ8Q
         /SlSXxAYH0qNHTI+ZIuzladcG6nOFDfUHBc14LoQTmsl05PrqfHZ96hV83UsUevJbc0V
         to9g==;
        darn=lists.linux-m68k.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google; t=1776171354; x=1776776154; darn=lists.linux-m68k.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ZnJ++Fe0qwvDRTxVDzLcadQUyABq9XTiwCDKmvKMrAo=;
        b=J+vMn3SEtRS3Es3uABG1O2j2a4Z+rUkL3TkI0cajhc7CKVFMfCYGtXdYUYSuRit7Ln
         gDsDXnI/NgPiDNmPaxijeKtX/dkgzugxE50YtUVQl+tBp0fo2zaBsJDX5aiK+/PC9QKN
         0xWRUYOglhKJFLbRcH/f3Az2uDX9Y50zdA8L8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776171354; x=1776776154;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZnJ++Fe0qwvDRTxVDzLcadQUyABq9XTiwCDKmvKMrAo=;
        b=DMtuBxqQa/MdQTwCcPQCEZo/TvPRBuoL3gC0ACJHgu8QfxXl1vnSYoOcFlwu5VEtRb
         dHbx7gNz+M3DlCG5Ui47u7jcjrfCn4j039GOEMWFv+SkrXNSWv+QMEqoE+ylD71Fx/+T
         R/DP96qrWGdAEckvS44Cq+xVkAylHYVb/7Vq7WGwlbesTqeStBhPJuwzJfKP3pz1WUAZ
         TtIQktxofVutPJWHVYdiMRTfUdbFhi4H7CPR4US/ePtiBpqaQ68jplhbDXE1dy12L5FV
         n5xNC3o/XGHQcjhAcHJpi4p6Yu+hlS+Dms5btKRSGIzGVGmvtIA1tCebiooMffUkXGbM
         G+0Q==
X-Forwarded-Encrypted: i=1; AFNElJ9oV+Yn86KWJImVgfcVlecu4Pswya/f17TRjIvb5PIP5UnBIpQfpmCH2na+emCyEw9NiunZZ9Ohk+Yu@lists.linux-m68k.org
X-Gm-Message-State: AOJu0Yye5Vqu93Xu8dLGkyLHTvxiZDl3ThZYteT8zpjmUdr6LZU8xaT7
	pbknci9VEsan5qu6+w+6I5hZ0lURzFNMroUBD3D9vAPQuqhliftVS3kqku0Xt2jcmOBiezdT/nG
	oOyM8zcy4odn/qCnz8wV8nbawm7WQDeJEekeEOsDN8A==
X-Gm-Gg: AeBDietGn1igsdlWRWL6uueOrlVOCsyz0Q1PGOh8bLyld8GBTeBMj6j4m5sXHp2sZwG
	Q4NPPhNCm8oZF+/IvsHUPsYy/fjjeH9rRUwMX46MzFQSY2GCHczQS5xz4cNDkQVC3q3UmhrX3jh
	PPACB+pKhYnp88a1Q54mpo+N6Di4yNcqKP/bLxOvPqLxO+/zS1UUCj4GFQjFn/VD6ZkRDEy7Im+
	UtD/+ImoEVu3oF++X9aHtAs/0rLKN11W8+6QhQZQLoQfqbNuJBouxnq3xbk4zifFzC9DkKEQxzx
	4AJylNvwuLGvH5rUqw==
X-Received: by 2002:a05:7022:6899:b0:128:d29a:3d45 with SMTP id
 a92af1059eb24-12c34ef2584mr8227470c88.22.1776171352976; Tue, 14 Apr 2026
 05:55:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260404024658.2496519-1-daniel@0x0f.com> <ec4945ec-84fd-4462-b35d-79a04673107d@linux-m68k.org>
In-Reply-To: <ec4945ec-84fd-4462-b35d-79a04673107d@linux-m68k.org>
From: Daniel Palmer <daniel@0x0f.com>
Date: Tue, 14 Apr 2026 21:55:40 +0900
X-Gm-Features: AQROBzDQtAswyrnw3qyiRWMe07xuXMtG0Ci3gNwE8OcUnLkCypM96bCGBgSDVKY
Message-ID: <CAFr9PXnfh6p_ajGSGX-MnKgToEdAW-3rPgOLKgaDXziKXNGfFQ@mail.gmail.com>
Subject: Re: [RFC PATCH] m68k: nommu: Fix behaviour of io macros on non-CF
To: Greg Ungerer <gerg@linux-m68k.org>
Cc: geert@linux-m68k.org, christoph.plattner@gmx.at, 
	linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org, 
	arnd@kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Greg,

On Tue, 14 Apr 2026 at 21:18, Greg Ungerer <gerg@linux-m68k.org> wrote:
> This change, in this form at least, breaks most of the non-MMU ColdFire targets.
> Try compiling any of m5208evb, m5249evb, m5272c3, m5275evb, m5307c3 or
> m5407c3 defconfigs and you get build failures. Targets that do not have
> a PCI bus and so do not define IOMEMBASE will fail, which is most of them.

Oof, that's the second time I broke coldfire this week (I broke it
trying to make virtio work for m68k in u-boot too).
Your patch works for my mc68000 virt and dragonball builds. I will
build/boot test nommu CF in QEMU.

Thanks,

Daniel
