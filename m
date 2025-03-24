Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 450681F12EF
	for <linux-m68k@lists.linux-m68k.org>; Mon, 24 Mar 2025 08:11:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742803894; cv=none; b=Nea1RhPetqz2CLRoZXxJxQ8poWGxkWl15GhbdEaCLjZl5dvxFuXIwbJOc2ajjvyPoFJuv2w37vLzGoWeTmgIjeSJuWpVX1wkeZpwTB5zUbgALamUTnXP+p4LhYrwqC3QLh1AitnNKwYj3WvBpfNSXdxy9dRHy0/qUsczmDpoNTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742803894; c=relaxed/simple;
	bh=IxT+vnE728CV5DHvuNNW1O3OF5i90akxyMV2yXZf7s4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bmBhoB0XYhImpOpKabFULoY2jMLWXe8PbQEZxp1vHW0+yATgCr4cxmg3vpf/OiGfAB1qe+zFD1OnyD18cH8zjzUEYuGKt/AIWGyEUPOkS28zdHOhRi8M5bc9hpu+KaHFK8v91Lyjnw2deZH2PJDcmuuKFdlq6D1G3rfhmFi7AqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M4F8cms3; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M4F8cms3"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43ce71582e9so26245455e9.1
        for <linux-m68k@lists.linux-m68k.org>; Mon, 24 Mar 2025 01:11:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742803891; x=1743408691; darn=lists.linux-m68k.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dzHF6D7iEA/JanPswrG1EB47Dn35bVeJXhoVH+eoHo8=;
        b=M4F8cms3ktJ/F2O9PZ0xs1WfP2ot9gGmbo83aCqfLZc4hzZfCTai5qYx/AlzXp1fQS
         pnRGtj/B/4bx3XgRPq/vOlJam8rMLdeGBP/rRNC1ErSomCe4Fu30NTjspKngNTTAgWZK
         CltzHGvKKgps9VAJZhFbhpwll11qOy37W5PudvsZkXFdNAx9zVaTOEP8GX5O3tcYdUmB
         fFMTlT0vIRjrCWy6UCNZ/aRw4htMHj0+Fy3iKEeK7Q2CQfymMoMc0nBfE6GBpsCjl//1
         i9UtUa7myal8OWCPA7+xb27VvpQyTqKH3epFl4u61pW3tF3TRV+rLGJCNA989rwZfmSV
         6/7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742803891; x=1743408691;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dzHF6D7iEA/JanPswrG1EB47Dn35bVeJXhoVH+eoHo8=;
        b=Lr5VI4pPntQOU0djPjUaHVKqmjpb3wxX6iLItBlrmgOQ8PixBsbEGkeDLuI07EI8gE
         ozG9dHNCMn3yKa3Ln+jXfyBGGl+b7HLsyawq/z6ORwB+QV/syiIkNJESl89nNnanDixC
         MhsexD6AzKGGzO0NNnb0hUkzHaxlq9hGiQTW/+jZeohdOFNDnvG/TyDlOJSQu659RXnT
         04kdzfyi75Pbj2IMf2kCRrMJ/Gz3n891aFHbZxo57ZGIYNdsI9JlVIWyhwvPzPb8NnPk
         auNhDEb7XGl5UnLz0CMk+MwP8x+MGtzIjtJRigj/ifZHvd28mJhfBnceiF0vhgOzZqoo
         WJxA==
X-Forwarded-Encrypted: i=1; AJvYcCWxhfe3BE2Is39B/pscZuozTHuuEVDvT8w38fZb+MNoYMlU1GS6IxCFlUwBztkkgk6hJkm/SQA8xxZb@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YwXFuPrsk1epURwnHI6R/721y+MbM6gmwpZMCzy6sBquT7+lJiL
	qLJyGqC2jRMNq8dzAr7HMWKrxQqk4vGsCVeASiOcZMgO1OVjohs7
X-Gm-Gg: ASbGncuxKxdveRJQn1N7qcoSno66MoXzPnZbkn2l9x1DtxypSSsyh9b3PSVlJS8XoTE
	EkWaYdhsdPYjdE6XBe5OFQ7xOMViVb65jqIFe56Y61gym5iqBpNh7Kt3Q550Cm6HcpuUzSkx1i+
	12tSYjmWkeWckIuw0SpubtBMiz14+0IjhcirQ3iJvgWVYIo9kkFpvJBjvPUID+jCyGIiEhMujFF
	2+49LZjb/HphYNpSYCiizfdDDgXmjG7qLlKQ+hXVElEn+i+xX1cPD3mMppUUlvXET2JHrMfxF48
	XSfnT9OyRYytasIE5wzQ1SzKCGokP9UsIPK4PbjU4i8=
X-Google-Smtp-Source: AGHT+IHMm4bghHq3CX0SoXYQssrzigezFeP7OiGhOEIpFdTBFcFh+JTUiUTlb3TSVua32tVywh5MfQ==
X-Received: by 2002:a5d:59ad:0:b0:391:3cb7:d441 with SMTP id ffacd0b85a97d-3997f90d30fmr10440915f8f.25.1742803891214;
        Mon, 24 Mar 2025 01:11:31 -0700 (PDT)
Received: from gmail.com ([2a01:e11:1403:8620:fd58:9303:2c1b:4279])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d42b8fcd4sm99565335e9.1.2025.03.24.01.11.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Mar 2025 01:11:30 -0700 (PDT)
Date: Mon, 24 Mar 2025 09:11:29 +0100
From: Paolo Pisati <p.pisati@gmail.com>
To: Damien Le Moal <dlemoal@kernel.org>
Cc: Paolo Pisati <p.pisati@gmail.com>, Niklas Cassel <cassel@kernel.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	linux-ide@vger.kernel.org, linux-m68k@lists.linux-m68k.org
Subject: Re: [PATCH 2/3] amiga: cslab ata support
Message-ID: <Z+ETsTZviQP9y9Ff@amaterasu.local>
References: <20250321151416.338756-1-p.pisati@gmail.com>
 <20250321151416.338756-3-p.pisati@gmail.com>
 <f9d2da13-1179-483f-a685-fa67d7abd367@kernel.org>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f9d2da13-1179-483f-a685-fa67d7abd367@kernel.org>

On Sat, Mar 22, 2025 at 09:41:44AM -0400, Damien Le Moal wrote:
> > +	ap->ioaddr.data_addr		= base;
> > +	ap->ioaddr.error_addr		= base + 1 * 4;
> > +	ap->ioaddr.feature_addr		= base + 1 * 4;
> > +	ap->ioaddr.nsect_addr		= base + 2 * 4;
> > +	ap->ioaddr.lbal_addr		= base + 3 * 4;
> > +	ap->ioaddr.lbam_addr		= base + 4 * 4;
> > +	ap->ioaddr.lbah_addr		= base + 5 * 4;
> > +	ap->ioaddr.device_addr		= base + 6 * 4;
> > +	ap->ioaddr.status_addr		= base + 7 * 4;
> > +	ap->ioaddr.command_addr		= base + 7 * 4;
> > +
> > +	ap->ioaddr.altstatus_addr	= base + (0x1000 | (6UL << 2));
> > +	ap->ioaddr.ctl_addr			= base + (0x1000 | (6UL << 2));
> 
> It would be nice to have macro definitions for all the magic numbers you use for
> offsets into base, to document these values.

Thanks for the review Damien, unfortunately the original firmware this driver is
based off doesn't define any macro for these regs/bits meaning.

Other than that, i'll fix the rest and send a v2.
-- 
bye,
p.
