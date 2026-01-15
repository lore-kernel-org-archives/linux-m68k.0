Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5406C361DD8
	for <linux-m68k@lists.linux-m68k.org>; Thu, 15 Jan 2026 10:16:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768472199; cv=none; b=oV/5WkatArVDmDt53LNKP8W9uQhMvinJdIgWrU+WRwsx/DE5Uq4OpMbtlIubUVYK2wM7GTJEFwVWaBaW3ubERYHkkmTj92yGb92dP5wmQ6q+BCH3L9va0DwVbOYsBi8YgYpsnGlOKWfiCNKCREpFvxES5xNupzUxMQxaHOx4mqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768472199; c=relaxed/simple;
	bh=zwLrvsF0GMvPSCBeAjAWQZcmbWMJVYh05GZu4CqMmyk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CMhv5+QntyXBXCxUqPs7/LkivwGsU88DPtceyyu5MXjawqTXU+ZOLwOcTOPblTit+UOXIeeJoySuEhwEmHpW+R+O01hA6Y+rqyDclNvkEblrgXK5w4yEEQwDuXL75zSecboWnGUp2YCzDdFzrmdEWNCekBtnmGj0S9LaBidyvkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=AP7sUYTh; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="AP7sUYTh"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4801c1ad878so2005185e9.1
        for <linux-m68k@lists.linux-m68k.org>; Thu, 15 Jan 2026 02:16:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1768472195; x=1769076995; darn=lists.linux-m68k.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zwLrvsF0GMvPSCBeAjAWQZcmbWMJVYh05GZu4CqMmyk=;
        b=AP7sUYThOfAR/cQuPmioUzcwWLc2jr8ETv6BWjzmjWWz27gZOezsq8xXfZ4hHLwYLQ
         7kvEthhLbRbjht/wWTwMLgyPW7Esj9J6C1c0yX3aWbF0s/r+igPJ9kRuwjuzk59jSiaU
         o+ZgS+ZFNWUzsTvkKW9pwjalSAjLyN4JTNupuIC+b0jE+c8t1AJKvlz7CKPv905PfAaT
         VRuCgDoK79CAb5znba0Nx0evaCFx3j9D9aIRLhaB9KyoOC1eN2cTEOm2hEkYsMlZjM51
         j9/r0RWhimym5T4qtUYBdMoecgZxjNKjbDtkwQgycJ0rYCXoTcNv50bvAgynZRdvlWSn
         S44g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768472195; x=1769076995;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zwLrvsF0GMvPSCBeAjAWQZcmbWMJVYh05GZu4CqMmyk=;
        b=BRGfllrIytazzNw6WgI53CeWj8qVDdNG1b2kBemyXJViw1d+9NF5f7mAaa4l1nZ/z9
         E7LseWOKjOr3p3R2igZvxipExPwaV1Bwr/Njcw5ngTOYG5TVDHuGJGGxUykKMVIPL4C5
         RKpeIP03j1nEfxQmCJTdDbOLJc11wbjXmOf/tw0QAc9GE5yeq9STjm8dB5EfSQZ7m/Ca
         qqNMlvb2JfI4WH1MP1C0pr0Q1o0vvwVQXBNjdU+RwkpjT9TOwhVwgWPGM1/ChLwufdEQ
         Wt9Cg5VTMP7RiRV1SQeaAkoFN4/NdUFrDzCudynCOxxowZWE9y5FI4E0jkrXqGd/wANH
         qNtA==
X-Forwarded-Encrypted: i=1; AJvYcCU4LTMZiDtD8wNI2WhayouE9n/iE3+gRksWw/BMC2+K1YfF++wvEbu2FNxwJOp23yekMuNRx9a2ayZz@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YyPJT8YdE5Uv6w5weLf4HuWFtNmhDcdXIAKSiQO4ddSGFCM05dM
	oTNXdPncUPiUEh1dJSAlSRZd4fz1Agj5WRuDukcmqRSK6NvuJz3YL5V9OAf3LybDD0E=
X-Gm-Gg: AY/fxX72uFKyMVf2Q28BfAght9fzeP3PmKXPfpTMId2V5teMjf1mKAhb26wmBMHSlN3
	fwckB2Bn7ClKnNhxkfgKEoHaAzdwrQQS+mjI+Md2F0VTiR5MgvOV/C/QFXawsPUAL6eghs3IhDt
	3kNzUnhfCnkr0Dz3ZQMhfugV3ruTdyZ9CQfB++5Yf3AwbDDE/PuZ2w3goZMBHoGNhrx1gasyKJK
	guerImtnjrxs1yHWXJH61cfJu5lkkBV4zkvaaKF8DNFgeJvwaHKU4r/kpnRGi7GesqylzYGRN/I
	1KZLds+DBcM3IdieowPrrnbUsWKPlbsY2An09zsL7Ny9e7N9MHo0Xm0C01fFIHSlXaXs3DYiRiC
	rfYKhrlUGHRQ67scd5lKILB6kdx0Nsbs8N0iXrijhxJ4Tpa1cB+9bo9uRJ1bsEr7toVIDO/jegH
	DW4elvOUdG1uVZxcbq73vMknyZ
X-Received: by 2002:a05:600c:608c:b0:477:a246:8398 with SMTP id 5b1f17b1804b1-47ee32e0829mr58296485e9.2.1768472195426;
        Thu, 15 Jan 2026 02:16:35 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47ee28144aasm39739585e9.11.2026.01.15.02.16.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 02:16:34 -0800 (PST)
Date: Thu, 15 Jan 2026 11:16:31 +0100
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
Subject: Re: [PATCH 07/19] drivers: netconsole: Migrate to
 register_console_force helper
Message-ID: <aWi-f9LBJtxGWgWs@pathway.suse.cz>
References: <20251227-printk-cleanup-part3-v1-0-21a291bcf197@suse.com>
 <20251227-printk-cleanup-part3-v1-7-21a291bcf197@suse.com>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251227-printk-cleanup-part3-v1-7-21a291bcf197@suse.com>

On Sat 2025-12-27 09:16:14, Marcos Paulo de Souza wrote:
> The register_console_force function was introduced to register consoles
> even on the presence of default consoles, replacing the CON_ENABLE flag
> that was forcing the same behavior.

I would add "No functional changes." like you did in the other
similar patches ;-)

> Signed-off-by: Marcos Paulo de Souza <mpdesouza@suse.com>

Nice clean up!

Reviewed-by: Petr Mladek <pmladek@suse.com>

Best Regards,
Petr
