Received: from mail-dy1-f202.google.com (mail-dy1-f202.google.com [74.125.82.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A3263D3337
	for <linux-m68k@lists.linux-m68k.org>; Tue, 26 May 2026 23:40:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779838844; cv=none; b=ZO8DunCadmht1j6nxnoc/mh94CQnq1L0uH/M+r8BImeVaE7vnmhvo+fX7AWN/vFljH+QJwtcTkH6T+crNyvuP8lFPwZ4gjdl8uXk7cFChxpxHR3FIE0lA7LXLBMLjnIEIr0DnZSfKPizv0KsKv9aDk3YTJMn5MNZCTAHw1dLIyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779838844; c=relaxed/simple;
	bh=8ddzaQpPIU1lk7nO3NywObbzd/d9fgjAwKKOFsq7vE0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=nWU7Yssbyarwz9HleHL1T9l56okSefI7bCnJvd1yjx8lf/0pOHdAT+NmDqhGDPYIDDaN+wZLkfsxYOgGZaYeZ2beFDeev/Aqn6qH2emT9u1SOknzvXEBkxfQ8NDCkjNCCZHbyB5NQNrYDuI/6Sj5z88qNd1FzShowF1qLSF2fUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=TWRDNRKa; arc=none smtp.client-ip=74.125.82.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="TWRDNRKa"
Received: by mail-dy1-f202.google.com with SMTP id 5a478bee46e88-30457ff05b8so4051573eec.0
        for <linux-m68k@lists.linux-m68k.org>; Tue, 26 May 2026 16:40:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779838839; x=1780443639; darn=lists.linux-m68k.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=K1GQjZOhKRA0cpDt8l/K+2WDzgefBcTkUmqo1xyKi8I=;
        b=TWRDNRKaqzXp/UOXO9ElHBGA+z8iWrz7q8T+AMTUFumstqHqQFOk/eAkdQti4ITsSH
         3aQyHxpB61o9gBzIjJXXnZM9gnFM3JVRcDTUKcGsIaT5bnfRaHdP71XNbKztwTUC3MhT
         1OJV//PAz87AcedJv3UdklbXAQ7xZ8GEHKw6OSBO0vy3ew1DyqPPrU+DMvUcB/7rMtjs
         falyd15m6ctn/QjcU5al2/dicCJBzKif5EiGk3w5+Yl52NqK4Bai30vLwtKXR30uQRNz
         3m8jq1gxyo2w0t04jamOxFDJfy69RuRBERG/EWJ7V6/0svS3vwcVozM1Ey4zi/Jvi7If
         8Syg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779838839; x=1780443639;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=K1GQjZOhKRA0cpDt8l/K+2WDzgefBcTkUmqo1xyKi8I=;
        b=YFn4QtqOl0kCOvnAWHzwtKDFsp9GdFFMWRWp/39sNkHDS5gAGvFHAJg/sbs3iEvBSc
         KNjjREzFuYDAVe0yjHG6LEb4Km/K7EWklsm1jMvTL8SZ5dNzDtS/JTaElfaBoBBb0PtL
         dX8NzBhFcC62RfBrJqP6IH1iTJyD5or5rJR4r84fh4KDHLwekGFZPoVGYTboAMLERh76
         qbmIUCHUArLzvl/uG/mCLZngkcsj0ojaI0pFh0rUJIWo0i1jgZJi644wtoxfBnw2j3Gn
         hIBRMf0Wj14K1YxL/8mr4xuqsnjJHe68o82dzpsD4ZFgHoc2Jyh3YDEoqG1ouBSUE9gI
         NtEA==
X-Forwarded-Encrypted: i=1; AFNElJ8WieEJcwHIIfVl5IMy0G35tC9B8D8BQhyCmFyFlYzB59ZUfxCePZ4l+pX/bcbY8RouoP/hpYHlfJP5@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YxwwQcSkYT9x+9ES+Fg86q+3lnDErXlKQiL+pjhyejNGAiJEa9B
	dzGiPvGgbhJkd8l/WO5Vtas4WRzqrvpZy/rpbalypTT3OJC5/AvcNIWZiKDzacxj6nUc8Irolh2
	hxdqPN4ZXAeoG/y8M1yMV5eF9DbQMvg==
X-Received: from dycrm18.prod.google.com ([2002:a05:693c:2a12:b0:2f9:af7:5053])
 (user=samitolvanen job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:7301:a84:b0:303:f2fc:c483 with SMTP id 5a478bee46e88-30448f30872mr9330662eec.1.1779838838965;
 Tue, 26 May 2026 16:40:38 -0700 (PDT)
Date: Tue, 26 May 2026 23:40:38 +0000
In-Reply-To: <20260327080023.861105-1-petr.pavlu@suse.com>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260327080023.861105-1-petr.pavlu@suse.com>
X-Mailer: b4 0.14.3
Message-ID: <177983883822.35274.16490796584446355825.b4-ty@google.com>
Subject: Re: [PATCH 0/4] module: force sh_addr=0 for arch-specific sections
From: Sami Tolvanen <samitolvanen@google.com>
To: Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Petr Pavlu <petr.pavlu@suse.com>
Cc: Alexandre Ghiti <alex@ghiti.fr>, Luis Chamberlain <mcgrof@kernel.org>, Daniel Gomez <da.gomez@kernel.org>, 
	Aaron Tomlin <atomlin@atomlin.com>, Joe Lawrence <joe.lawrence@redhat.com>, 
	linux-arm-kernel@lists.infradead.org, linux-m68k@lists.linux-m68k.org, 
	linux-riscv@lists.infradead.org, linux-modules@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Fri, 27 Mar 2026 08:58:59 +0100, Petr Pavlu wrote:
> When linking modules with 'ld.bfd -r', sections defined without an address
> inherit the location counter, resulting in non-zero sh_addr values in the
> resulting .ko files. Relocatable objects are expected to have sh_addr=0 for
> all sections. Non-zero addresses are confusing in this context, typically
> worse compressible, and may cause tools to misbehave [1].
> 
> Joe Lawrence previously addressed the same issue in the main
> scripts/module.lds.S file [2] and we discussed that the same fix should be
> also applied to architecture-specific module sections. This series
> implements these changes.
> 
> [...]

Applied to modules-next, thanks!

[1/4] module, arm: force sh_addr=0 for arch-specific sections
      commit: ffe1545ce8a0a7bb698d5f68cbbdef8f93d1fce6
[2/4] module, arm64: force sh_addr=0 for arch-specific sections
      commit: c5553deb577fe433f770e270fd9582b8325f12d9
[3/4] module, m68k: force sh_addr=0 for arch-specific sections
      commit: 9cb4d4dc82272538de1b7edb6e8cf91597ed00b0
[4/4] module, riscv: force sh_addr=0 for arch-specific sections
      commit: 04e17ca3f77e1722a5db068fbcd7b93c51656013

Best regards,

	Sami


