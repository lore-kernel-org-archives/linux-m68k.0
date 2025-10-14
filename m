Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CB192F7AC3
	for <linux-m68k@vger.kernel.org>; Tue, 14 Oct 2025 10:24:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760437445; cv=none; b=P794gVKlXyzty8jPqduC60KaunIw0sfRmkp8M2JaQ38Oa6zyPvlWsQeau+PTF+Zdlc14NVVBeuYV74qpMJvlyP7VS6tK9Z3QTAPbG8wMk0UvovFiEXYTlBnfHzlKuJz4QyBESKvF01+GHEzDoiyTxS2iDvAnDQBa6+47uOwABzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760437445; c=relaxed/simple;
	bh=NvHrsqobRMlVNo+tAxu9F71BW5DWp04J4+78E6v6/2I=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SeaxzHO9LkCpyWAdD15zVAjnbSEUY1kPMw6uLbrDFtQ+vuBaPhvo3OWgJ4Jzs3RN5cLs7qSn8cNkaywB7XwxTKB0/3brRCr6ir09KQoDxwRlClFNQu4eWIA8TQm66BpNjuba9nntyoIZq9x3CHR8WUqLbqSwf03eEfBp2ndhY5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nJGus4q+; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nJGus4q+"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-46e47cca387so51277955e9.3
        for <linux-m68k@vger.kernel.org>; Tue, 14 Oct 2025 03:24:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760437441; x=1761042241; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2B27CnCtnwt2IGtR8SnAOo/nO7i1YaXCeSpoBrMXO7I=;
        b=nJGus4q+SYUIGvndAARIM3qO3Lktr1Z0SOm1vq1+sjfRbXZeH6sLkfSF0S7jXNKoAY
         Dy8fFkrCnXxwbaUC7wSzd3cnb/ANQpABHu0Zsjs2E93SgctEem8y0v783q8iifANnFGI
         DYTnlBoEV+cf+AZAn4fh513Qxvx416dxglUYMCBIm60Tixd2wluyqzYRLmRKShx1ir7z
         bA4iRcINkApQgVwOtfchyWghh3EB91tY1ab7RGV1lNX3D9o35dlYF/FwyBynpK0Vbcte
         +bdCCamUp1Jv/MqnUqCwEIy/ojaOTqskhisZzL45ct46yDBU7IHiU4H+rkzzuVD3qS7T
         /k3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760437441; x=1761042241;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2B27CnCtnwt2IGtR8SnAOo/nO7i1YaXCeSpoBrMXO7I=;
        b=O9yMIfHZdczJ80AY776vrK5YQL9XfuHIkGtOlMQSXXjauAjHvdi6/lo1/ppCrLbx0E
         rGck47eVFJ8H0szcAcooir0wIXwp2qExD3QR4e8LK7wig334uFyUW1bH5RmNy/RZBFJm
         OwGuUy9JGs0oHyE9mveeG5VkMFdhCU+LmIhephdei0/03wBDO4nKX3sk4/V+rxjNMePY
         vBKRieX1nHc2+5T0afC5zN9UmBEupIPfsw17H1kr6VjYSU0NdGLKsJhC68UOxfMOcn5X
         M8Drt9tED6IXF3iCNSMn632MsxEUMuAyMOCeH0slkopZIw8+rkhQZAiZqwSiopE+djk/
         PdlQ==
X-Forwarded-Encrypted: i=1; AJvYcCVQvrYxeo+OUYPYZoBhtHyXXWaVBk4AxTFjnj7aBXJZM1GD28gONS0Cv0Gz3CHzKdVZeXHdpxgBdJ7/@vger.kernel.org
X-Gm-Message-State: AOJu0Yyu4X4Vf2NiOZF8mfQ5M0zIQN0jLyny6pVmKV6Q/n8iS7RJmLrf
	ugKX8zX7w9Ujbm7W1jH76xHnytq13NG4QunAfTVbc4vLPXHqc845N0kR
X-Gm-Gg: ASbGncvDIlI0BALsJYGMTHhnCogC2hBgAe8REsAGBcnwIzHiUCNKgpf/SkypkI9Vccz
	BYBVgeenSojLIeKhtsLM38qfPIw7USAUx6GMeVFbnN4xsMEmsWRXwYfveCJAUxHILOeZP4qPGCZ
	GqZU6nSIp7cOATEoFw2732Ckq7OPLg46g9e+5i/AzQRlw96/WQmikXGvkvdtEe9EJZXHFQW3jWt
	GMj+QyMfQrp+sQKtqcEpTE+1L3pRd7+uGKLoyhKubM5QC0lnrVbck4cbk/Iw9/53BCu0UtHAXM6
	ia+iZAr/MSpMj+zFa6G5srFMS4dx+y6D7lGlqhDmsvIY9eGB+X9v61ZdHQmZrJ/xdjsuUzDNR4V
	pMAILIvnytvh8ouYgsjLxk+JjgbrawkM3mbc+gxMx+gn2ZsLx+IpWHt9032flYcE4DuG21QIAzz
	/GhvsBfWJFzVD1qhqJuQ==
X-Google-Smtp-Source: AGHT+IFJLN+ZyNIVUulNgloN7eKBRUWfhH8DTaEyEj2PWqBPSZ2eXtCGpbEULmWHbXarmuQpgFVGnQ==
X-Received: by 2002:a05:600c:4688:b0:46e:4372:5395 with SMTP id 5b1f17b1804b1-46fa9b01ff5mr167772905e9.25.1760437441227;
        Tue, 14 Oct 2025 03:24:01 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-426ce5cf70fsm22150016f8f.27.2025.10.14.03.24.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 03:24:00 -0700 (PDT)
Date: Tue, 14 Oct 2025 11:23:59 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Finn Thain <fthain@linux-m68k.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Will Deacon <will@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, Boqun Feng
 <boqun.feng@gmail.com>, Jonathan Corbet <corbet@lwn.net>, Mark Rutland
 <mark.rutland@arm.com>, Arnd Bergmann <arnd@arndb.de>,
 linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org, Geert
 Uytterhoeven <geert@linux-m68k.org>, linux-m68k@vger.kernel.org,
 linux-doc@vger.kernel.org
Subject: Re: [RFC v3 1/5] documentation: Discourage alignment assumptions
Message-ID: <20251014112359.451d8058@pumpkin>
In-Reply-To: <76571a0e5ed7716701650ec80b7a0cd1cf07fde6.1759875560.git.fthain@linux-m68k.org>
References: <cover.1759875560.git.fthain@linux-m68k.org>
	<76571a0e5ed7716701650ec80b7a0cd1cf07fde6.1759875560.git.fthain@linux-m68k.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 08 Oct 2025 09:19:20 +1100
Finn Thain <fthain@linux-m68k.org> wrote:

> Discourage assumptions that simply don't hold for all Linux ABIs.
> Exceptions to the natural alignment rule for scalar types include
> long long on i386 and sh.
> ---
>  Documentation/core-api/unaligned-memory-access.rst | 7 -------
>  1 file changed, 7 deletions(-)
> 
> diff --git a/Documentation/core-api/unaligned-memory-access.rst b/Documentation/core-api/unaligned-memory-access.rst
> index 5ceeb80eb539..1390ce2b7291 100644
> --- a/Documentation/core-api/unaligned-memory-access.rst
> +++ b/Documentation/core-api/unaligned-memory-access.rst
> @@ -40,9 +40,6 @@ The rule mentioned above forms what we refer to as natural alignment:
>  When accessing N bytes of memory, the base memory address must be evenly
>  divisible by N, i.e. addr % N == 0.
>  
> -When writing code, assume the target architecture has natural alignment
> -requirements.

I think I'd be more explicit, perhaps:
Note that not all architectures align 64bit items on 8 byte boundaries or
even 32bit items on 4 byte boundaries.

	David

> -
>  In reality, only a few architectures require natural alignment on all sizes
>  of memory access. However, we must consider ALL supported architectures;
>  writing code that satisfies natural alignment requirements is the easiest way
> @@ -103,10 +100,6 @@ Therefore, for standard structure types you can always rely on the compiler
>  to pad structures so that accesses to fields are suitably aligned (assuming
>  you do not cast the field to a type of different length).
>  
> -Similarly, you can also rely on the compiler to align variables and function
> -parameters to a naturally aligned scheme, based on the size of the type of
> -the variable.
> -
>  At this point, it should be clear that accessing a single byte (u8 or char)
>  will never cause an unaligned access, because all memory addresses are evenly
>  divisible by one.

