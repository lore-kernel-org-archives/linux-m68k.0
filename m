Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E153312821
	for <linux-m68k@lists.linux-m68k.org>; Thu, 15 Jan 2026 10:26:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768472790; cv=none; b=b0FxxCtMWyIHt+2ijlNZv88iiU4llVxfZ/YugVTUjUJrMd5DLes0LSAt5CK+irQQP6ppbt+xw93mgReBEpXro8AFcob1WIUivVR2jOwfGiOXRFqyx6EHJf8FTIt2miA6jFPfpIxxT18ot2nUS3IqoOEQbFDMzmg0mVIwPMM9aJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768472790; c=relaxed/simple;
	bh=cTvHKPGvKDvdv3CW2phXagRp3ofYcYf6SwlYtKmyZc4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FJ1piay7tCNnmWMrQb3qMmQlY5uTMn2I0dHa17Jf0962748in5Pm/gW0lWodli2ohqE7mwQivAsFj0AvZBxxvY0Pq2Zpmq9FzugjHsQtOzOIiSZcwhrN+EeJDqJgMHiYnxPORQL2aWlc+gD89U/+8k/WMj9ktWXTcYrQv4w5EyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=HNiHkL8s; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="HNiHkL8s"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-480142406b3so2386375e9.1
        for <linux-m68k@lists.linux-m68k.org>; Thu, 15 Jan 2026 02:26:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1768472787; x=1769077587; darn=lists.linux-m68k.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JLly7CGERK95lIS5prsdJ95HAbwiiwFAFGJDvTd/YQs=;
        b=HNiHkL8sZFIDE+mPvItLzof07SYSxOqD7I6ffEc8ij4yviqKc8ENTiE24G8pWpzZF3
         Np/zgHdM5lT4fbh/H8jcZdy4J9uB9wTxVwXegAHZt3zO9t5/1zY+wBPVc0PGrWBii3yv
         wwYgCKuzSmpvd3AsKG3ZpSJau6nYie6ySs0LfdQ4809j6o5+6yxE4TuLxRGTAqv7uDD5
         lyimYNVEjjNn5Z3Tj4MoTk/a+CgbUt4xUwDHZc+3W+QMJYwhX/jIMC6dlsr1S0IDMcsR
         fPFQtqQYKBTcVN7I4IsM44L+gXh6zgvZSvrAscX6TYHpfmVK6J60S07hZ288TmObReAS
         p8OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768472787; x=1769077587;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JLly7CGERK95lIS5prsdJ95HAbwiiwFAFGJDvTd/YQs=;
        b=IfboBpT6Xcfy5kYFHpDhG4VBvH5lW4QI6RFuLdqzBtinrXhbMbb84zAUyogAdcWBFR
         s499dF1pALPb1FtrurQl8zDP0RmIOBYP8/o2uTVeCQEGNoBRP19brYMxGKo7xMCWSnAX
         paEHgXoGVDCnFnM+C7mX+FhogwvtChilG+Dqon8nqiX/lJOIqpp/ppYsMQ40caxxrmol
         gNN1zQXiKzpeUpu8QrRuLK6wRD6UZqhxFcFrWhysR1rwhYEsFnTaZ7V1UZg7na0XP9uI
         KGBmbT9s6kkoj94cx5YBsW5BuGfkVMSt5MUIU+m1fQIxkR7bcr/Faj9dzuoqgNzAWpoJ
         UMFg==
X-Forwarded-Encrypted: i=1; AJvYcCX1IRul0vpNkuk76U163zYhiaFL7nr3EMRRkqaSfTjDgxYlva5iWk7LP68k+3O4ISxCnH5Ii//8zLwt@lists.linux-m68k.org
X-Gm-Message-State: AOJu0Yw+IoGL8lU5v8vGhlLB7WF4timtF+LqUWG4OZ4eAaTWdgYVM86G
	d28onDbkXLt9unlrLXVguIAU6aHjPWaAhNZyT/Y8iXBrzw033m69hRvA1Qy8ThcOgF8=
X-Gm-Gg: AY/fxX7Fu2U4tL+aNP6Z4+wz2NNmK9SdXbV2Tbl+ReAI2S6ewMEqTFtvwNoXylWDl3I
	iibcEZV0nBJxTsL3emlJOtnz7OnTTCDtkR5t1ctNUktZvNhgUUP2r4323qq0z192p5l8yZcA2cD
	F7f0cBqPjZ15BPN6knbwY3b7cciajWr5FSk+9dqG/kVUszQComlOwcNh9mscyF60qLRtQV8F0yR
	CDoVFgB+dcONOYAKEIpdTjQVbhvHycABB9+6eYpMFOnlwI6uoKb3+KYdshKCMuqMAUOEXyvbUUT
	olvR3XkneTANg4sFW8wuzmGCi9wjiZ6lZGnmC2xVAy+bLJWU7KSQd3CqBQYgYxIzhNgoDreef2M
	5adaDo0wdxhtWmZc0aIxDQge8nhOm0/5U1FTrsxKEt+YL7G88AYVXGJdtssHJk3hQ+gArcfhNz5
	z7LY6dfsIPA81uPg==
X-Received: by 2002:a05:600c:8b77:b0:477:afc5:fb02 with SMTP id 5b1f17b1804b1-47ee4819d6emr64067955e9.21.1768472787399;
        Thu, 15 Jan 2026 02:26:27 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-434af6d90aasm4935338f8f.29.2026.01.15.02.26.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 02:26:26 -0800 (PST)
Date: Thu, 15 Jan 2026 11:26:18 +0100
From: Petr Mladek <pmladek@suse.com>
To: Marcos Paulo de Souza <mpdesouza@suse.com>
Cc: Richard Weinberger <richard@nod.at>,
	Anton Ivanov <anton.ivanov@cambridgegreys.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jason Wessel <jason.wessel@windriver.com>,
	Daniel Thompson <danielt@kernel.org>,
	Douglas Anderson <dianders@chromium.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	John Ogness <john.ogness@linutronix.de>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Jiri Slaby <jirislaby@kernel.org>, Breno Leitao <leitao@debian.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>,
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Andreas Larsson <andreas@gaisler.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jacky Huang <ychuang3@nuvoton.com>,
	Shan-Chun Hung <schung@nuvoton.com>, linux-um@lists.infradead.org,
	linux-kernel@vger.kernel.org, kgdb-bugreport@lists.sourceforge.net,
	linux-serial@vger.kernel.org, netdev@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org, linux-hardening@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, sparclinux@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-fsdevel@vger.kernel.org
Subject: Re: [PATCH 09/19] m68k: emu: nfcon.c: Migrate to
 register_console_force helper
Message-ID: <aWjAysWXHUOHSisl@pathway.suse.cz>
References: <20251227-printk-cleanup-part3-v1-0-21a291bcf197@suse.com>
 <20251227-printk-cleanup-part3-v1-9-21a291bcf197@suse.com>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251227-printk-cleanup-part3-v1-9-21a291bcf197@suse.com>

On Sat 2025-12-27 09:16:16, Marcos Paulo de Souza wrote:
> The register_console_force function was introduced to register consoles
> even on the presence of default consoles, replacing the CON_ENABLE flag
> that was forcing the same behavior.
> 
> No functional changes.
> 
> Signed-off-by: Marcos Paulo de Souza <mpdesouza@suse.com>

LGTM, nice cleanup!

Reviewed-by: Petr Mladek <pmladek@suse.com>

Best Regards,
Petr
