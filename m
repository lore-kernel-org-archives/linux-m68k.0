Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B50B725E46D
	for <linux-m68k@lists.linux-m68k.org>; Mon, 24 Mar 2025 12:02:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742817779; cv=none; b=uuOIIBpL5SvwNf6ezHQ3/cH5vw6549R+pYYIsmFRrgASWgeOGsjlcCLxvEUlvn18blb2a09m09sLA6DPwROK4ZnxcmGBzW3vS5cImVID3niIVK8ZmlXmVNCULUDcZToYo7dSAS2VAlVmiCOvyakuVIX208kw1sMA2uIyNdppEzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742817779; c=relaxed/simple;
	bh=FEELsc+xwThvLoMBMuRuxxISfKrU7ZgpIA5jdXNoaG8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pWBlLfoedWD4oH7lx8GLi/La3USfE5vgi5PMTSfYvrtd57K6Ce5Z6YRX8XSoOFaTOOwd5P3x2y/gBaANviuqkeWCu+Owjx+Tk07TysCtJEBbs59FHU2gt5bioFSZB+pxeuYZAZaxUQkyiXzNHisudY66qVL4Xgelv46OI3/fT+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K5VxEdXk; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K5VxEdXk"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4394345e4d5so25999055e9.0
        for <linux-m68k@lists.linux-m68k.org>; Mon, 24 Mar 2025 05:02:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742817776; x=1743422576; darn=lists.linux-m68k.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Z4akC+OE/V18+0Ds7y+PLOH+odBGH6DeU4C0bDZQdAs=;
        b=K5VxEdXkvrmtCdtDpUvd5TJIasPZ1Xxy3YWi6ejMWoEXXuPBlSosfLJK+NlxyhZWSs
         JVhd+0fUXhRSYl4kWN62EQBEEhN+Y3hL3KsDDJSGpwW+TwMC0SU3n3MeHbulu4kK/df6
         tPk1FqIHVbsAKszUwKqMbg64Laaq3HQgWKXHZRsRN91lRrOpaBK0H7dYuw/MBTeEmMxe
         ld1+HE9bljQ4dCyvvc18Yy6+qR+j25dPrdw5JhksoMmX+HIPhDp8WMyS7aRkjSzx/4mN
         tsOS+AjKAx7Kn0L0zGjr+TsvHcV3D2C8NL6lKnGdk4C9H4YCJcp54wj8LxWqV/YXHMKO
         o7vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742817776; x=1743422576;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z4akC+OE/V18+0Ds7y+PLOH+odBGH6DeU4C0bDZQdAs=;
        b=vPsOGnQvwADgtzzOshctRTSBqdxEwPwLouVVGHC6ea4lRGX+D3dR3XRiCXcgb+OZu7
         KnQKYWQJKiweNI23Ht49DPFe1hiBoVH/18u/6BeDjjy+eL7TX0hxISQLFZqBS33i/k8+
         gIkXm6Igi8yoIXenK6vTyWXkxWK/c5+mIOYtRbw102jeAVMdqAgiz+klHf6Svd6gIQif
         ON5Ns9Ryym547RNW4aYy97SwbunXMKc6jw0UZ6IIGnhS8thJg8Zt0jq5dGQwtt0cmY/8
         8mrYF/SAYD5eu9JAuDK72Zi45xyo25d3h08HxsIe+V49w0V+0ZtSpRwKNosMMkcGWkGf
         sd5Q==
X-Forwarded-Encrypted: i=1; AJvYcCUTPaymhzHb6Eq6HtCbbpL9v7h2458yFtuDPDuWtBb5KN0Yaeg8Yv6Jb0u/IHtiBqlw1CKK9gCGhn2P@lists.linux-m68k.org
X-Gm-Message-State: AOJu0Yxn/0D+S8coulUPLuNQgTG/ku4MapLWAhBdzGl5XKS4JxkpJSnF
	6KxbLrbTYvfYmAj76Np5dEXph0cUPOPY6zBKxSuIsCFmq2BbbpAB
X-Gm-Gg: ASbGncvJmxMSNjbp/S0MjoZAIMQ3kpt5zWm2/kmdzR6jgZfy0JOjiabunU5U5Hm/H/h
	U9WvE7fxepJpcHkGCv4RjulWZfUco/T9mx6aoolALgFVIBkP/76CB/NY4io+/2DNy3BbWlB7bj/
	JMCT2GzGjS4QBwt/zQD57ur9nSgOY2io5X0BvUAYzTW/BVKoNJJj7Y/J7+OBLwSZHO20DYEMj/B
	GVkpjjjRZgCs98dwc++TJlpD4NDa3+APbxfYybZa41L8+kGlxaoI0lrEzoSv3bj1Hvf18ieeRxL
	sH2s9eEoxfuzO3besVDHiQ5x3/UT2gf716Zj4wJdayYRtrwwuiGblw==
X-Google-Smtp-Source: AGHT+IEy5hkQSrWaXlMErAFYM7j9pi0vrafE9+qzG+rQptrMzz86XaBSW22qUN0n6ekkJhhoPp0fcQ==
X-Received: by 2002:a05:600c:b94:b0:43c:ec4c:25b1 with SMTP id 5b1f17b1804b1-43d50a21273mr109713525e9.23.1742817775591;
        Mon, 24 Mar 2025 05:02:55 -0700 (PDT)
Received: from gmail.com ([2a01:e11:1403:8620:fd58:9303:2c1b:4279])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d4fd277c9sm121085865e9.22.2025.03.24.05.02.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Mar 2025 05:02:54 -0700 (PDT)
Date: Mon, 24 Mar 2025 13:02:54 +0100
From: Paolo Pisati <p.pisati@gmail.com>
To: Damien Le Moal <dlemoal@kernel.org>
Cc: Paolo Pisati <p.pisati@gmail.com>, Niklas Cassel <cassel@kernel.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	linux-ide@vger.kernel.org, linux-m68k@lists.linux-m68k.org
Subject: Re: [PATCH v2 2/2] ata: pata_cswarp: Add Amiga cslab ata support
Message-ID: <Z+FJ7pB8uWFqNBW+@amaterasu.local>
References: <20250324092409.99430-1-p.pisati@gmail.com>
 <20250324092409.99430-3-p.pisati@gmail.com>
 <60c4bdf5-9c6f-40d9-b7b9-2fbfde6fdfd1@kernel.org>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <60c4bdf5-9c6f-40d9-b7b9-2fbfde6fdfd1@kernel.org>

On Mon, Mar 24, 2025 at 07:00:47AM -0400, Damien Le Moal wrote:
> > +	ata_port_desc(ap, "  cmd 0x%lx ctl 0x%lx", (unsigned long)base,
> > +		      (unsigned long)ap->ioaddr.ctl_addr);
> > +
> > +	ata_host_activate(host, 0, NULL,
> > +			  IRQF_SHARED, &pata_cswarp_sht);
> 
> 	return ata_host_activate(host, 0, NULL,
> 				 IRQF_SHARED, &pata_cswarp_sht);
> 
> so that errors are properly reported.

Ack, will send a v3 and reorder the patches.
-- 
bye,
p.
