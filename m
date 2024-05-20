Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E1D51E878
	for <linux-m68k@lists.linux-m68k.org>; Mon, 20 May 2024 17:17:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716225458; cv=none; b=D0q76iw4Zy6J+5yGY3fa5RYdmxny9MMPaaPtzQ5IW/mK91OHVG9A+RtJcPdBEYedK0+0qaUMAD0wu1Fm4JTBiwqSRxGfqPKlPiIsQJFlvJ9cLiFyetMjeVaHWuoW/j20qP4ox6LQ31kTHMpQGf0/ppiOQTn79b/U38yeeG2JeKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716225458; c=relaxed/simple;
	bh=XGQ7QSGPqhiqOu5y4KPzEhU+YQCVGCG1RWrztPofQEQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V44QdpjlVwFTud3RRuRSOSxjXiG7r/xu0NEk7d/BBStiiTvt3/Kx98MJe2LpYTmGfUWBSqkIGDjm+LmuLBt3iOM/mD3soRo35QfBrf9kQbKZmeX1I6KFOi+MZIH1axQxkQMmhsAj6Rj0ge1OuCP/j2ZCBNll7Owj/t4GEObmGW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kpkZK3wi; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kpkZK3wi"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-51f3a49ff7dso6030825e87.2
        for <linux-m68k@lists.linux-m68k.org>; Mon, 20 May 2024 10:17:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716225455; x=1716830255; darn=lists.linux-m68k.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1WK071uvBRlDVqAv6sCjUteg/dWOo151j6GOoIj1a0Y=;
        b=kpkZK3wimA0rDsmh/zuNhtjSlx1SDTGp93sOheHSuw0U+D9fDB7QJjpgyhCOKYPmHn
         f4LtqbxFh1tiMLH7QPOc/5tmvfXKeQeqKOrt26JiFvzwnmqTxlyVB+9q/oaMJRhncYak
         OZld05OrPbFNhbuLGtDSm2voaGIqUQqdfwCQu0ABm/ulTN8mJfrrypNSPd0V90jZ1/5G
         2oFGc+1YHhsAbXL7IM28N/R2ED3D4hGWMkhb/D9zMamaK/cucK0/pbjNSJuEUU7q2vcv
         vJpCHNcMhEDRiUmF7oKrulX39xJIVDFsTZJmldWklHGBs02LiN4eL6rQb2AJenP2f15F
         aEFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716225455; x=1716830255;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1WK071uvBRlDVqAv6sCjUteg/dWOo151j6GOoIj1a0Y=;
        b=OhwAzXh3NAlMEx1Za3rV6+JiFLQplPQ0pVJSeldbyGRnO83qaYf4VAfPhqeFPqeqTu
         wOd3D971DiAbbOkR8m6LRInubL+wIT/f3gBrjv7bIa0A4fXaqwPeCZ9zBMTbVuB3dVS0
         7/DjaUq9itotBwe5Q7KF8P+33HPPMdzS8mXIF5khpI0uNCJFTG6SNP8qD3je8JxWsK5T
         yG10M1+4y3pZHhcTYNAjMaVx1ZBcE5bw5ars7S1OB+QgNXEu9g8InPtMOz/14NE+SDQc
         xj2LpnxkCTUpTp4Z5pHE44aHgypObB4VGxGDrS7ovFE3V7UyUIc3ob5JIB7kLQh/rAxh
         oLwA==
X-Forwarded-Encrypted: i=1; AJvYcCWNZtUo0J5KG3hnSeWlIolBy/Vxq1CmYD0VAcUQFVFaD2EiLZBOE2RayzDsqrjra9+vEUq5vjrqQSCGVAfQ1821zZuo2tqkXCUXs7HX/XV6
X-Gm-Message-State: AOJu0YxnqHmRp7K2LWs1FP+lQsaiy1o5pV9bkje+LzKof6UXWgqEuI2W
	2+qZzqRKJ7a/CpTKY83NgNGGXT5a7KQS001FUch6bIT4CeWNmG73
X-Google-Smtp-Source: AGHT+IGPcjpuhZOAp2RxIheoPNVE7C1CyYBjly5x1vJhp7gEWBObfCRTHWjPjRpvz1Si8t3esF6pLA==
X-Received: by 2002:a05:6512:2086:b0:51c:d6c9:e9a3 with SMTP id 2adb3069b0e04-5220fc7d776mr15688714e87.17.1716225455120;
        Mon, 20 May 2024 10:17:35 -0700 (PDT)
Received: from gmail.com ([2a01:e11:1403:8620:7b2d:4f3c:32d9:92a8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a5a17b01968sm1485172166b.166.2024.05.20.10.17.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 May 2024 10:17:34 -0700 (PDT)
Date: Mon, 20 May 2024 19:17:33 +0200
From: Paolo Pisati <p.pisati@gmail.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Paolo Pisati <p.pisati@gmail.com>,
	linux-m68k <linux-m68k@lists.linux-m68k.org>
Subject: Re: Amiga, serial and SYSRQ
Message-ID: <ZkuFrTQDw6iM9Z7K@amaterasu.local>
References: <ZkjwzVwYeQtyAPrL@amaterasu.local>
 <CAMuHMdXnsXk+MuGUCnPcQVbOdSGJAHiK6TBZE2r5_h15qs_azg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdXnsXk+MuGUCnPcQVbOdSGJAHiK6TBZE2r5_h15qs_azg@mail.gmail.com>

On Sun, May 19, 2024 at 04:58:17PM +0200, Geert Uytterhoeven wrote:

> Probably some of the Warp 1260 on-board hardware has its interrupt line
> asserted, causing an interrupt storm when Linux enables interrupts.
> Amiboot knows how to reset several boards to prevent this, but it
> doesn't support Warp 1260 yet.
> 
> https://github.com/geertu/m68kboot/blob/master/common/amiga/linuxboot.c#L195

Doesn't the kernel print out something like "too many spurious interrupts etcetc" in
this case?

Anyhow, any debug option i could turn on? I've tried everything IRQ related, but
that didn't change a bit. I understand it requires a new fw from the board
manufacturer or a quirk in the bootloader, but i would like to get something more
verbose before i ping them.
-- 
bye,
p.
