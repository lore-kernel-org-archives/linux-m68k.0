Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B68D383995
	for <linux-m68k@lists.linux-m68k.org>; Thu, 21 May 2026 18:03:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779386624; cv=none; b=EshxMbL9+S9+85wMX8jI7GvHnL1q1TBborfHdvMswHVlSv1ShtjsNbcp4oQSSZi70BdxlNupknZ7YAzm1oUrVOp9Ve6JkjhAWY/wRmAWRirJoQXshB0dfzd8hFQ1eNvqRgd4j/Nl69UHNOsX0NqBjEgUJAd/NFbELNaP1o+Bcso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779386624; c=relaxed/simple;
	bh=s2/bOyvIzYHdt3OcnSRDIxo5zaIWk94N2IoLrJFh1hw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MzTRcYL27eUEA2OTSAJd9uNkLg5FWVoU9S+7EfCPOapyyW49bDjb92xSofwWKOU0dQQFJDuKbZxvk6aVIfLb22FwvxjlR1wqGrU7zMaD3pbEYPXAdphCDANjx08672JQdQxbTsQRItPwTsOK5G4NOAOT5eMQJxwbEnKWQ6CI09Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oAaPveBB; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oAaPveBB"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-490388fd0dbso9525485e9.0
        for <linux-m68k@lists.linux-m68k.org>; Thu, 21 May 2026 11:03:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779386619; x=1779991419; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Raw0Erj9572xoaLlPvNiePlzx3P7ii5xBNOQt/S638A=;
        b=oAaPveBBVc49Ol9fXL26EK2z/HPRBlBTGcJAphvwBl3nHxmb4mNGaZXT+ahC0CPEyJ
         TMYGvLC9EarM4BxmmCq01scNUMDFsImuuEw4Ud/I1RLmq/7W5YmOvfRjptf+kxA8llMJ
         DZV+I9VV/qxwi53Tfdy2HmJCGKQkLO+0pYuO9tMBMWWGAyzpPhzak116padPmkHIeVc2
         gOmfj1JVvetp3zR9aLUVTIPjo6NGDK1XR4/g6ir7t6MN5Zj5afJObEX4dF+tgk/QaaaE
         xDvR7fmCN9AI1s+YIXzp+mgFQBQ4C6L/FXcDAZunmlcN4k5YbtZ+LuNVkgtPW8XxgkKV
         hP6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779386619; x=1779991419;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Raw0Erj9572xoaLlPvNiePlzx3P7ii5xBNOQt/S638A=;
        b=n5/mhuA0U7IX7Yl7mAFtRixLHzm7rRwLWcRq55MvLpKu6r0OMGhKnQfyKBssKnq3Ci
         yVoXFeu0QtABnJMCfN9ST7dD+HzQ6y+hFJ56IXMmzOQhgw2yfjKlrTkMn200MmMKv+TS
         PNXKgY9gZs3QMO4pHeE2nWm47zoLHkOMQH5ICr+dN6vVKYZbGqj+zM2WGCIOuDgyhG0/
         Elm+0yfpWXWLZgjo/jjre1gUssz7fV/IyIN0nm83ouF54OFrDn/tUzaJJEkZFkto7VIa
         sAsaWDddmllMoQbef7960pZK0Y0l9JMH0OCeJkARTpcWXaDBJ5o58ic4pokwdMC+wjk6
         6HUQ==
X-Forwarded-Encrypted: i=1; AFNElJ9/PwvPamVJXPDXx+lbCOuz3gLTv3l2MKl3R5CTsDwqJsLJEmldngfB2Kb/H9k3iYVXxvGhVXkPeyW8@lists.linux-m68k.org
X-Gm-Message-State: AOJu0Yy1+tWSfG1jQKr1jGEAmJtsZ44y0QGnIE5Geq3TsaTTVvYPn/f8
	nzBHWzx2rEiUNLhDa4VdBqJTflDitoPGDDisiZsDTOuHm0SWBHLrkWqe
X-Gm-Gg: Acq92OFyqNeIa5j6bf0l8n+WjTmjkMkNZG/8ih2V9bCT+9cHg9eWSXW1KTrYnpJ0RGk
	Rnr1l0Djbz9dvN1Yiezi5P6161Yfjsnd83VFDpfdCibJ8k2w7oyjUyXPJX7e0/dwK3IVzM+xoC3
	fd3N77yl7Kf3bwkBaqUaB01E+D91vTe8FkixxabDwhNCvzxpErsRVK0iZW2uv9eLc0fIXcqO1Yq
	gnnaRNeibD3EUn7XhWnTNHQM5tQnLWweV2LrNeo5T1dDqqo/51mURT4pMUCNqGbEcz706LYkI+k
	Grw1R0v0PYEYTSQ68uQ0ikmW6T95TIL7BqTSjYA1KtbaYwTXOUGE4kizlcIJImIS6H2bKqylWjo
	hCDsC6+bIjgI2TpLpW41SNYibzYz4rP3JHxd0UH+vWecHTJhu060OgHaTM7W10Svl9MoOQ8CuwX
	kd00/W+SWlgqy46qE4NFF1cNvM/e+FkfwCnmmRi6s9yMzEa0yOCy/FF3KxxqYtWkne
X-Received: by 2002:a05:600c:3b26:b0:48a:5574:3a5d with SMTP id 5b1f17b1804b1-49036033344mr58865505e9.7.1779386619103;
        Thu, 21 May 2026 11:03:39 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490417aeaecsm1419675e9.4.2026.05.21.11.03.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 11:03:38 -0700 (PDT)
Date: Thu, 21 May 2026 19:03:36 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Andreas Schwab <schwab@linux-m68k.org>
Cc: Marco Elver <elver@google.com>, Geert Uytterhoeven
 <geert@linux-m68k.org>, linux-m68k@lists.linux-m68k.org,
 linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com
Subject: Re: [PATCH] m68k: Implement _THIS_IP_ using inline asm
Message-ID: <20260521190336.44dc3882@pumpkin>
In-Reply-To: <87h5o0zteu.fsf@igel.home>
References: <20260521123438.147789-1-elver@google.com>
	<87h5o0zteu.fsf@igel.home>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 21 May 2026 17:14:33 +0200
Andreas Schwab <schwab@linux-m68k.org> wrote:

> On Mai 21 2026, Marco Elver wrote:
> 
> > version. Additionally, avoiding taking the address of a label prevents
> > compilers from emitting spurious indirect branch targets (e.g. ENDBR or
> > BTI) under control-flow integrity schemes.  
> 
> Ignoring the fact that m68k will never gain such a feature, dot is still
> a label.

But it wont be one the compiler sees.

I think it is an assembler variable that is automatically updated,
so not actually a label that ends up in the symbol table.
Even the '1b:' in some of the other examples are only second class
labels.

-- David

>  If you want to avoid a label, you need to use %pc(0) (or
> %pc(-2) for an address at insn boundary).
> 

