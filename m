Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E03EE3933EF
	for <linux-m68k@lists.linux-m68k.org>; Thu, 15 Jan 2026 12:13:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768479189; cv=none; b=i1PZ4Kc2Nx3wSoD6nurg323aVsZz+Y5FwsAIEyu9wL71AYCqGWT+acNPaZlPPMNcGohohKIwS/T4qSZ72Y8eFCsXvZXnqmqdzEyAeYCu8VDxMFhty8c86dQDZ4+jkOOQzYZRi6c6nVSJXlgNPjTfpslxdyzU+szwUzgUjRPX0Gk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768479189; c=relaxed/simple;
	bh=WgWNQzN1HCbfxhvYic4vy3EiJadotNmJsmSAKb79EIQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XZ0WUOvhTMjavNvsc6eVXjQFS54x6o1Ngv0hbCRx2vMRX6EvtOIy4JAusgo/1Wo9HDKf6H4bRG5AOOYy4FLajFq0wRennxpsqBGnUAK7p8xum0oqkUgWis9/+91R/jFIlLyj0jo/mxbHCdV/N88fhj+Atm1+QamrWq8Mb+Mk0NU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=BAT6rSGP; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="BAT6rSGP"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-47ee76e8656so10476945e9.0
        for <linux-m68k@lists.linux-m68k.org>; Thu, 15 Jan 2026 04:13:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1768479186; x=1769083986; darn=lists.linux-m68k.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tARhp8b6WpUCQdTEvi4pG8l7ncFl190/VBWtO1OWxSE=;
        b=BAT6rSGPQnnEVHijwiWU6Xdxhh666K3ElMK62VfWgnJqlE9JISf0rHvUvN8dPpOxif
         uLgucDAgopH+L6uyantCewXdwUczA7OMfnRPzK70Jz3snbEuMbDH6Pz9MTWswpOvXjBW
         8jOWgIhW65BcxuphXgQF8xDHvFcBerF+4hRXzxhtFDrW8El+0ZneRewyoW0YYZip9W49
         vxgplGSYHEgMBAqxl/uppc9Sqc7HRWJw6wT02n6rFASwWyZyO4V73ByF8QgzjkXjqVrR
         jyG0/eygsAaAJiKrErOABRq4t6CCIwPn5LnX3zxbLZhkFx0elZRATIZC4nkQOTsC9zNx
         aR5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768479186; x=1769083986;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tARhp8b6WpUCQdTEvi4pG8l7ncFl190/VBWtO1OWxSE=;
        b=Zsfc5NNLckrVmSk1+9BCPGNiaUxUs/6RUTNDjY9h2THJu0hN6UGPzsVCAwfGyRSPUu
         e+1HbRwlDLvgWOTmYT8EWG08SBPxp+ir3wio76oXmfGS7POFFtN9gbKOvHyjQp77ULJH
         BLO5sTJkxfff1bcj+Gr7eqLNHTXNs4cybuAITGRVy9mkrSmiVo+RYRJTv8FY9Oew2KjK
         uhpx/ytPJLEWkzYJvArQcqcRVjSchSsYRkKw6rPwFTEf0VEvxIa71w3rkHZGZS6bbtm6
         MTks8pPpEqqDBDHqtv/gSgXdD6tHz+C0P4y41BLkDhEPKwehnvvTa2H6nLYvCf7LCDr1
         7/ig==
X-Forwarded-Encrypted: i=1; AJvYcCVIyoXtVV9t0k3Cf+T+jEMfM0o0HTN5VqaZlrRNJtRuD8uda/GW+xOJ6/m7OzCs62ROzxnP73OuVwLq@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YxBJsesrrlj6Z6GqV6W9+9F77HSRRZB8bOIrNi5jMafwC2WeVSl
	vWllWOjb6B8sLBUJoIHuPZjO6h9lj0KTXF8vyf74QLohYDeLAfVQmckHT/5lQjdHZWg=
X-Gm-Gg: AY/fxX5En/J+TgsrquiXrZtf2QQdPSHWM8xTKOzCsxId73+vlO48E2+4/hYljU9YXJM
	48qNBPxVcRJmMlnpZPeP2jADHcwd3CuBPzJc59ryAla+1jzf1qqABSJbMUjNIb8iXpRRtJvKjpz
	VPeM0ogeBwSwZuKpGimNTq8+vRvdofm/9903ugzs/IfHdY8VUIXuuWNYIW5CVUB5bDT81/zzS4e
	urdCYDjTW/iecvYb22dk/sFySM3SDvRtGgFiJfqe46cF0PtU2cpYLdV7ubwve/rpWifPsAPegjk
	tgGr+T13zbbKy7pHTExSahR3aOA1B8SiuksCiT+Ps7P/2EGMfGBiRJSh0uAPG3JmcjoArF27F6R
	RsEmNdRGrGFAQpvtZhozGOYhhOrtGHF8AQqk3wlFGCNq2yH/ob9ggZVwoqUysf2aHWxZcttCC6+
	Ytdzo1v2yWL6qi0A==
X-Received: by 2002:a05:600c:1c20:b0:47e:e712:aa88 with SMTP id 5b1f17b1804b1-47ee712ac96mr42613125e9.31.1768479186231;
        Thu, 15 Jan 2026 04:13:06 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4801bc3e57fsm22590935e9.5.2026.01.15.04.13.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 04:13:05 -0800 (PST)
Date: Thu, 15 Jan 2026 13:13:02 +0100
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
Subject: Re: [PATCH 11/19] powerpc: kernel: udbg: Migrate to
 register_console_force helper
Message-ID: <aWjZzuY31bg95jiy@pathway.suse.cz>
References: <20251227-printk-cleanup-part3-v1-0-21a291bcf197@suse.com>
 <20251227-printk-cleanup-part3-v1-11-21a291bcf197@suse.com>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251227-printk-cleanup-part3-v1-11-21a291bcf197@suse.com>

On Sat 2025-12-27 09:16:18, Marcos Paulo de Souza wrote:
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
