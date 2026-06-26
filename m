Received: from out-179.mta0.migadu.com (out-179.mta0.migadu.com [91.218.175.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C47A3BB118
	for <linux-m68k@lists.linux-m68k.org>; Fri, 26 Jun 2026 13:57:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782482266; cv=none; b=GNCEgKSMwNttkK1qibLuPmBWkqfehk7i7X4+puQJ7C0p7GAuVxcdUGYpznnhO/3H+xFE4/+kK26PWCFEgzMh5i6S6VcWWZhsr6bbXHFFmjMmJ9WAgmU6as06xn36HJt6pVxlf8AV0SzUPyeKgaSndHApJb9XZmTNEVLZmKXdxrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782482266; c=relaxed/simple;
	bh=1VKnUyniMVKcXs/4ut82ZjvjieqxPWqbwQrUSPcK3JI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d4fwSWH0HgwjOhv4gtXjXmYTC/SqgpetmOITrY7gQ70HQ7dvJ5u0HhHH4ZxV/oC+I7xybVgJI2f9Hq+0S2naKtLZX/tJqlSDFLK/IRF/kxIU4ZI79c5a7Ls1Vcomk17MJtnvGLP8pyVCp0MBBe7Kyg5G7dP/uYyr3whoftiZkXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=ERCegwEz; arc=none smtp.client-ip=91.218.175.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="ERCegwEz"
Date: Fri, 26 Jun 2026 15:57:34 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1782482262;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3XgJt/IJ/jkqlrwNP1jMZ6sD3E1khT+DtdmeSi74vhQ=;
	b=ERCegwEzuc5g22Tl4JbBlAd1a07idmFQy68p8AvYsFNZj4dAsCADLUxWb3aDzyNlZ7Mmzh
	rz/8WUVqtqEOO2fjSFDhOw/Je26JosWf6w4wRwCO4/5MGxCJ9wXVIPMBMJhD+FjhC3XSOk
	mdapCteVqWySfExmfOKEM1iESV9Vobk=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Daniel Palmer <daniel@0x0f.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
	linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] m68k: amiga: Mark amiga_reset() as __noreturn
Message-ID: <aj6FTgJ6mL36WrKV@linux.dev>
References: <20260626104142.3782-2-thorsten.blum@linux.dev>
 <CAFr9PX=gTnsBi4X+cFzMM3vfWE2mXO2ARPOEYe+ZWVJ4JWzPvg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAFr9PX=gTnsBi4X+cFzMM3vfWE2mXO2ARPOEYe+ZWVJ4JWzPvg@mail.gmail.com>
X-Migadu-Flow: FLOW_OUT

Hi Daniel,

On Fri, Jun 26, 2026 at 10:49:59PM +0900, Daniel Palmer wrote:
> Hi Thorsten,
> 
> On Fri, 26 Jun 2026 at 19:43, Thorsten Blum <thorsten.blum@linux.dev> wrote:
> >
> > Mark both the forward declaration and the function definition as
> > __noreturn, and remove the redundant redeclaration.
> >
> <snip>
> 
> I tried to build and boot test this on my Amiga 4000 but the build is borken:
> 
>   UPD     include/config/kernel.release
>  UPD     include/generated/utsrelease.h
>  CC      init/version.o
>  AR      init/built-in.a
>  CC      arch/m68k/amiga/config.o
> arch/m68k/amiga/config.c:546:1: error: attributes should be specified
> before the declarator in a function definition
>  546 | static void amiga_reset(void) __noreturn
>      | ^~~~~~
> arch/m68k/amiga/config.c:99:13: warning: ‘amiga_reset’ used but never defined
>   99 | static void amiga_reset(void) __noreturn;
>      |             ^~~~~~~~~~~
> 
> GCC version is:  m68k-linux-gnu-gcc (Debian 15.2.0-17) 15.2.0

I also compiled it, but then moved the __noreturn to the end which is
apparently not allowed. Feel free to try:

	static void __noreturn amiga_reset(void);

That should work. I'll send a v2 later.

Thanks,
Thorsten
