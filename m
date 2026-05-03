Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04C4D221FB6
	for <linux-m68k@lists.linux-m68k.org>; Sun,  3 May 2026 17:57:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777831032; cv=none; b=qssnSlZwNtstYTXkstn+51DYOnBKz02tsSSsc/geoyh3PRtmSKoKLDLqSLF8NmFa65TVM3o1MzhQZHaCBhqb3HBx5C6sW9Z79Yb6Rq5lMSSdbPI5jOBzFK5HbcXwXLqM276fSClPF/PoblUnCOrk2g2fg3GVMt+ePhdJUm1Ar0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777831032; c=relaxed/simple;
	bh=1XE2vYB14dioBFRhAgV5y7WwaOpoCWCjDjwrjYCgAk4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B3yLJlHFuBPkVz715y09fjyPBQSGnomvVnnjxgR3YbCvBMQJ57Ws1vNopVjUf79MQyMkLLuQMkqnlfA8R35ZSaCnxO7LiS/r11BAgcIy1s3fD0mQdF3LQxfx9vOl/V+PpxyFxOBNwaHlKQAwdI5Lm2pd69SXYrUVpbjjDexRp+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UsAtmNpl; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UsAtmNpl"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2ba1e9d3687so1489475ad.3
        for <linux-m68k@lists.linux-m68k.org>; Sun, 03 May 2026 10:57:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777831030; x=1778435830; darn=lists.linux-m68k.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=e1I20Yc1jyO4cAtDXypF5oj/hHWjCxlXQ+fPgE0FtSo=;
        b=UsAtmNplRhz58uotZ/9hKsK79ZcCjeJYVMultfyI4wYzzj3XDiK6z7pxyu+VSpOrMQ
         rk7FlQtGI2sJ0x05VUB8YTXnuGKrgZfOBSN4kH9l/P32jwcD3BCSyg2ffbmOWBDHgFR4
         c6zCgg/WarFp9a/lHOTccUXDnSs/SYx4ZZ+QzW/lC7JEcNzzb51LZEdJ9HZqAi/l/7i0
         P1LAmjg+iPyFLuZwc/KSKxxADcn4tlliWFZf6WmEYt09aTfnZbZH2d3cMNlUG8TbhsbB
         i//jb+kNLhqpQhf7QOKV8VPI3UTOixTesmr9//Je2juPFO8qZcNStEgl6Pu4NnupPQAr
         nzvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777831030; x=1778435830;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e1I20Yc1jyO4cAtDXypF5oj/hHWjCxlXQ+fPgE0FtSo=;
        b=bJRfqCo8HWzOUY7hhkZBU1zW/WINZzNu3zd4XRA0WMg/gdJtVoLj0bQhEPr1MBzH6/
         zy1WSkl05NjQPa+zSidpKU7SkvNNNK8Is6A+VvRDXoqtLjB853b+C4BZedD2XY2+czpS
         tfmVd8p5oBGWRsK7zMDcdwbSjB3EsAT0sOpccMNao4R4x14fh++6PM1tgo5CjqFLZZEM
         khDr/LdOvHQU+qGYmiEZeahfBB1mk+jCoibvt2/u8YMYDn1oILPNdIJkMhbQwwhWunga
         0ZlshbNqV9XwA7vXUNhhNEUxIwhVN4rWjjjcqGvj8Uhzvopq7CVXMxB8y654YqUqEHqp
         uFug==
X-Forwarded-Encrypted: i=1; AFNElJ9KMO3lsJrHzcYMG8ExlrBTOt+qVOdrL3AantlecjF0Y83FzlDeuVIVn5sfat9Huhk4DSBVTtSzVQ+s@lists.linux-m68k.org
X-Gm-Message-State: AOJu0Yz5y1G2uOKXBj3p8zu6NTdMcMasT0KH+0+S2yHzN05Vrx+Njzi5
	K0GWWZ4l3/tijJkOFUxBHal9xNIg/1PHvbEDkGx7yAV0Knyfrm68Kryh
X-Gm-Gg: AeBDieszze/dJFQi+ZUK2lNGOLfRN0VXytf/4Ge2JyIK0UK9xntsy0D5HXTAbonIbqQ
	7Fc+UyWRZmImNY33ZZZ7WMqmcBcAIU106vjgSZEfKlqKsr1oQbXsMmcI8ampoJ1PYon9/O0mTn9
	yJydUnAgD+expHeeCN08wS8wLFTVbMk81mJO1MwJvEpz9oP3i3+s2KOBWxb7eewsKzfgFsdZJU9
	ck5uc29FYdTjaNGIr2J0LO8QFYCpIwD3tFGNdQIMX4SPtQOHtzaJ4JO4HcSXY4RgbgtuPVxYBTp
	Caidkuk6a6FFgBMkJ6cI248IrMiMGml4pH/4IBrpPa5KW5keCjZ6/k5CPhoA0FF+SFAccaAiEA1
	/gp/AE+Wo7ZzmzRdLzPRXjLMWOuhjI3jG3acF5F9w5sOaV8GC4r1kce6CID0l7eX21Pqk7J2a6c
	SIaWu6oTRjGh6WZSUa36CO4jJveDf/6WswL6JC/1++HNH2t2EvpO7f127gDcOBvzOUtmf10yOV3
	5qMat5O
X-Received: by 2002:a05:6a20:7f96:b0:39c:126c:93b5 with SMTP id adf61e73a8af0-3a7f1ca3049mr6620214637.21.1777831030416;
        Sun, 03 May 2026 10:57:10 -0700 (PDT)
Received: from google.com (61-230-38-200.dynamic-ip.hinet.net. [61.230.38.200])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-835158bc863sm8450886b3a.26.2026.05.03.10.57.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 May 2026 10:57:10 -0700 (PDT)
Date: Mon, 4 May 2026 01:57:05 +0800
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc: geert@linux-m68k.org, ast@kernel.org, daniel@iogearbox.net,
	andrii@kernel.org, eddyz87@gmail.com, memxor@gmail.com,
	martin.lau@linux.dev, song@kernel.org, yonghong.song@linux.dev,
	jolsa@kernel.org, jserv@ccns.ncku.edu.tw, eleanor15x@gmail.com,
	linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
	bpf@vger.kernel.org
Subject: Re: [PATCH bpf-next] m68k, bpf: Add initial BPF JIT compiler support
Message-ID: <afeMcXsismO_ft_d@google.com>
References: <20260429124046.3480827-1-visitorckw@gmail.com>
 <98dfc3ebe6bf519aec70bf629acae897903d8146.camel@physik.fu-berlin.de>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <98dfc3ebe6bf519aec70bf629acae897903d8146.camel@physik.fu-berlin.de>

On Wed, Apr 29, 2026 at 03:59:44PM +0200, John Paul Adrian Glaubitz wrote:
> Hi Kuan-Wei,
> 
> On Wed, 2026-04-29 at 12:40 +0000, Kuan-Wei Chiu wrote:
> > Add a BPF JIT compiler for the m68k architecture.
> > 
> > The JIT generates m68k machine code targeting m68020+ processors. It
> > currently excludes 68000/68010 and coldfire processors, as it relies on
> > 32 bit branch displacements (b<cc>.l) to handle large bpf programs.
> 
> First of all, this is extremely cool! Thanks a lot for the work!

Thanks. :)

> 
> Secondly, since you seem to be well-versed in compiler-related stuff on
> m68k, may I ask you whether you would be interested in helping to fix a
> stopper bug in the LLVM M68k backend?
> 
> I have outlined the problem in [1], maybe you could help getting this fixed
> as this would fully enable LLVM on M68k which means we could finally use
> Rust on the architecture and maybe also build the Linux kernel on m68k
> with clang.
> 
I'm not very familiar with the llvm codebase, but I'll definitely take
a look at it and see how much I can help out. :)

Regards,
Kuan-Wei
