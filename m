Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A9B91A00D1
	for <linux-m68k@lists.linux-m68k.org>; Mon, 30 Dec 2024 09:35:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735551359; cv=none; b=StT20nv3qE8yscpaLSXs8Ezjn44nB3JtW/WI4+ODd9MHo8gWgMw0YyCMvYhVjS0szY2Jspoil7964xGUSLxsXOT57rYxnAJC9derfhEYiFD24LptI4imN7ZAWLifoq5bCdZStDotMCKoNPc0xlJ1SP1S3IMjI4UpNCQDMyC2OqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735551359; c=relaxed/simple;
	bh=HK07lib9IrjfXhXr31u/Uy9AoaqWsgQbDPVcxxUfTOM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=K5VIRVNEK8RTruoPNoQduZClhoA5XHHXYAh2rbrSgZHDGk/VL8bD5sV0bS85pSM81fhG4sJGXecTUenvXNmT6cZBBO83hE+IRj9uusVHWIFoH3+v4VZ5gWGFNUhhmhxQ3e02CwYKFdroFj2zF9GAJYXpRsEIxead1XGqwQRRrag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=et8JEbEj; arc=none smtp.client-ip=217.70.183.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="et8JEbEj"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 750F3E0006;
	Mon, 30 Dec 2024 09:35:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1735551354;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kDDwSEWRuTnnEKDijAYbBy7b9BN7WlcLeOk/mbixFS0=;
	b=et8JEbEj0lVsb7PBDd6I5uBsEtmCq2/Ns23AfVNKEcLlnZ9TpNHidd99R54CdOAqtZRdbW
	mCkwWBoXoSejoPrUwOGz4Qn/pt+ZgXc8EDsBNMYmcYnKAbyEUXgwcXNLBR+7m8EbG0NeaF
	FzOP+cHtVubw5GgiiW/vMi/wMJDSl01td6dd/j+XjWtMUuzr1qJO6Rn5o2Ice0s1K/smzH
	s3pPW3qhgolwZsq7+t/hGjf5IVfIvY2I35DoL+Ripask7pMVXVdkSeVZVGEaVHWxHK9PGA
	euh5gdGC21u2bbHcwrMNJz9CQys1beJZHdvEmLh03JtaJEIJpOZxP1Mh0NcChw==
Date: Mon, 30 Dec 2024 10:35:52 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Finn Thain <fthain@linux-m68k.org>, linux-m68k@lists.linux-m68k.org
Subject: Re: Build issue "Error: operands mismatch -- statement `movec
 %d2,%caar' ignored" on m68k
Message-ID: <20241230103552.61b67498@windsurf>
In-Reply-To: <CAMuHMdWmYc4=-ZbFoNrD=2CjucxdUSqhfufJZ_UkL+wvun_jcg@mail.gmail.com>
References: <20241229134848.0a1d9719@windsurf>
	<CAMuHMdU-DB1kOymg3-E4nRN_8R8N_R3wVZq7MNYUGsQWLa3hrg@mail.gmail.com>
	<e30ab951-bdb6-09f1-0d3b-9a09220babe7@linux-m68k.org>
	<CAMuHMdWmYc4=-ZbFoNrD=2CjucxdUSqhfufJZ_UkL+wvun_jcg@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-Sasl: thomas.petazzoni@bootlin.com

Hello Geert,

On Mon, 30 Dec 2024 09:53:29 +0100
Geert Uytterhoeven <geert@linux-m68k.org> wrote:

> > /usr/libexec/gcc/m68k-unknown-linux-musl/as -v -mcpu=68020 --pcrel -o a.o a.s  
> 
> Thanks, so it fails when -mcpu=68040 is passed to the assembler.
> 
> Oh, I misread "caar" as "cacr". The latter exists on MC68040, the
> former does not. However, that doesn't explain the failures for pflusha,
> which is supported on 68040.
> 
> After disabling CONFIG_680[236]0 in the kernel config, I can build
> it fine using the buildroot toolchain.
> 
> Conclusion: make sure your toolchain supports (a superset of) the
> CPUs supported by your kernel config.

Thanks for the investigation. How should the toolchain be configured to
s upport multiple m68k CPUs? My understanding was that when you
configure gcc with --with-cpu=<something>, it means gcc will by default
emit code for <something>, but it can always be overridden when running
gcc using -mcpu=<somethingelse>.

How can one build this kernel/sys_m68k.c file if it uses instructions
that are mutually incompatible on different m68k cores?

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
