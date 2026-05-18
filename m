Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30F78352C4E
	for <linux-m68k@lists.linux-m68k.org>; Mon, 18 May 2026 17:07:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779124042; cv=none; b=cvG/G1eataG07KriZKp8Sc92f0tNdhzD5vjsZTyUqt69/G6zA2qx9+Wk9h4He6GGjy7WTk/KJ2N81+G216NT2NazCoRtcyeSkjPaFB2tzcSZEVcW1Qx7K/L/ngKbr5R+ChMAlfsh5ULQFhpOI0zy+JuWs0cSF9opwG/f/1+1z0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779124042; c=relaxed/simple;
	bh=0d92nKsILldaG5KcgGwmxuWMoDm+8edMkHW2YKbN2Og=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Scw3zziPLQshZMUHMATJOFE0+tUkTR0kDn1vAzjaA/wt948tG+IUcYav30BAqIT9wQDq5iNf5OFi+VCRSYKeYN7xe5DD/ESWktiM0pnLgWKnYXHhfV1E3SyhLitnqYdmOjnXpM4Tg2dFoGTIR4he+EaYyBO5zdUjy1rrS89+WP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=niE2NcJc; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="niE2NcJc"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-c80291e6237so1937389a12.0
        for <linux-m68k@lists.linux-m68k.org>; Mon, 18 May 2026 10:07:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779124040; x=1779728840; darn=lists.linux-m68k.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pQBD1pOu6yZoCHpJ70rmlGRDmngML/+8uAz5xw0+M0Q=;
        b=niE2NcJcCMUC/wypC2mRv1fY1QmowshHXRn6j4loUdlFRgvnIV+pn/v098VL9EZnVU
         KiCpTWXizzEXSVu5qzSKuB44ro64WTQ6QmLlmV4cwk7pd1BlDTp1XDnMtwG1VnAWvFET
         5b0KYwd5TTsD4VYhaSsFwa7+d0w/p3f37yhAZ7lqc4OnO+43nW5flq1fU3pffuWQStoQ
         Xs92f2G0m3jG9YAewXHm33xHEkbdRG3iEEuTH55mcOLUIgCwY9MxAFsYjtDmBi5tL99b
         e/Gqghbw80DEp7vAjqdfcaqVCLAqyvJww9Cv+ix/N0r7zpTEpyuiMgzk3i+4TQk1vzgU
         ZIuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779124040; x=1779728840;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pQBD1pOu6yZoCHpJ70rmlGRDmngML/+8uAz5xw0+M0Q=;
        b=Kbwi6+NTmXHpUzBjqz88vGOj+JPpI6BSZ5s9/ErIyZDVJN2PCbWYQEgaGuuUeKgtmW
         2ILOJaX4esNrl5VBDnfO6cXRtr4FbR3kqQFQPsr4RhGet0/uWpFNuPjWWiU+Non1MMi5
         taj5oyTMrDQzQd3XEkBLI0G1uqEuQ50ZS8AIeXoF0GmiR81UT1TGgVRPYC9OdBHdF9YN
         W2tfVpWRuIfqEt8GBlBmayg2V7yDzeiG75mpmslduzEVQ+uF8szc6t3n7/1icfX4jK4C
         +bvZJwClZB63bynyRYTP/+A3dHz11r0yVPQcmvFqs1CeUEYIM2SuamIRCysmlmxncSyu
         BktQ==
X-Forwarded-Encrypted: i=1; AFNElJ8T7ha+t9rkeZGn0O9km5TrzDMpYzzLgHVWQ9wvEDN/Agz4iBoTpcDU63JjNymspJrVv/0OxJVbHklK@lists.linux-m68k.org
X-Gm-Message-State: AOJu0Yw8v/kAzeYyqVvU2GFqIrKpGcqSjpAPB1CPFP4iozXeOK4UvZ07
	XkQ5a6EX1H8neXnm5gNpLjeP628GBYRbG80w0J592cLFKGzIvxx8TaVH
X-Gm-Gg: Acq92OEe7Y6MUzssg/h9tflnkiCBhlhfzS5Zea1Ki98awI2KUfnsNQlH9uG85WdQDD7
	/cNIGK8MeZ13utrub6iMfAaYM4NwFsMT5dmU6d2q6Jtd1GcA+XOI6SH5Jyccz+jc4OzqBIoe6cI
	Q2OSZ6B/77wHhItzL3cHSZJBwk7PhqKcxVf4ZRvQ9zb2km4yUf0Ntt4Om6aCiBgmQlY8Sm+K0zj
	o5VyOPojRxvscrTlXvblSI2uewucIxN1G5Pf0xkDk6Ce00WAIZIp298qyBAJLI9RWB2E0hNJWHV
	4QPTYfUzhJAPGFKRojslk5nG6QYY39FFvzXEU89q4LccBTjFfP8Pl0zlCGmORal0a/seouKrDjj
	lxTmKVetlxUn2K7+3L3gC4W5x758C5FFHSoGZ91dswyGrVjUFaugze7KdT0A5Ka111kHFdVOgcl
	3g3Ut0ATGYIbHuCknDIcPRvOPIrHDWmuXahA==
X-Received: by 2002:a05:6a20:748d:b0:3a3:1164:c7a6 with SMTP id adf61e73a8af0-3b22e81f7a7mr17501052637.14.1779124040350;
        Mon, 18 May 2026 10:07:20 -0700 (PDT)
Received: from google.com ([118.150.148.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c82bb0fef5esm13229899a12.15.2026.05.18.10.07.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 10:07:20 -0700 (PDT)
Date: Tue, 19 May 2026 01:07:09 +0800
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: Greg Ungerer <gerg@kernel.org>
Cc: geert@linux-m68k.org, ast@kernel.org, daniel@iogearbox.net,
	andrii@kernel.org, eddyz87@gmail.com, memxor@gmail.com,
	martin.lau@linux.dev, song@kernel.org, yonghong.song@linux.dev,
	jolsa@kernel.org, jserv@ccns.ncku.edu.tw, eleanor15x@gmail.com,
	marscheng@google.com, linux-kernel@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org, bpf@vger.kernel.org,
	Daniel Palmer <daniel@thingy.jp>
Subject: Re: [PATCH bpf-next v3] m68k, bpf: Add initial BPF JIT compiler
 support
Message-ID: <agtHPT7Oo4MZ6CBc@google.com>
References: <20260511212756.3163955-1-visitorckw@gmail.com>
 <f30f7e98-4749-4925-b999-2653941b42ee@kernel.org>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f30f7e98-4749-4925-b999-2653941b42ee@kernel.org>

Hi greg,

On Tue, May 12, 2026 at 09:57:11PM +1000, Greg Ungerer wrote:
> Hi Kuan-Wei,
> 
> On 12/5/26 07:27, Kuan-Wei Chiu wrote:
> > Add a BPF JIT compiler for the m68k architecture.
> > 
> > The JIT generates m68k machine code targeting m68020+ processors. It
> > currently excludes 68000/68010 and coldfire processors, as it relies on
> > 32 bit branch displacements (b<cc>.l) to handle large bpf programs.
> 
> FWIW the ColdFire ISA_B and newer instruction set extensions do support
> the 32 bit branch displacement instruction forms. So that would mean that
> at least the MMU based version 4 cores may be able to be supported
> without too much extra effort.
> 
Sorry for getting back to you so late, and thanks for the info!

I haven't thoroughly checked what else the current implementation might
lack for coldfire support, but I suspect it won't be as simple as just
modifying the kconfig. For instance, at least the exg instruction I'm
currently using is not supported on coldfire.

Since the current patch is already quite large, I'm inclined to focus
on getting everything running correctly on classic m68k first. Once
this initial support is merged in-tree, we can revisit it and figure
out the necessary adjustments for coldfire.

That being said, getting coldfire supported would definitely be cool!

Regards,
Kuan-Wei
