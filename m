Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBAD22EC097
	for <linux-m68k@lists.linux-m68k.org>; Tue, 13 Jan 2026 16:25:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768321559; cv=none; b=ZyxccFCJV7FVsF2YIrVBnjfSq1nRVQkLBO46nhiiEeioCgv/AQx9ijF32qvCP7g91HLwv4v7UQMOA9bEDxhKeRX1iZQDlhUppHKs+xvZogwIR4B1RcwoOKXtrn4yr9Iv1/FVK5F4zvanryZNT5bc712P9JnOq2JBsSNdtbHQov0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768321559; c=relaxed/simple;
	bh=tEU15hlDUcTJJO53/6hArpv/PNu5aaHiWIXc6QqAK0Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LMLTVu/4ACUq95fYtFOxXwGtbMIeL0faIE/NoRQ60y3zp1HQlBB2gZjfUFkUJ8Is43cuafQGMDP00CB8ap5mi9Ypwzp1NaJRGE072+6aoj8rDwLkTh32hTIC/I5rMASFc38r+7DqhYiOE9W7vttZzVx1Q3XhqYuzkK3HXjg0+eE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=GUXanUB6; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="GUXanUB6"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-477a2ab455fso71146205e9.3
        for <linux-m68k@lists.linux-m68k.org>; Tue, 13 Jan 2026 08:25:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1768321556; x=1768926356; darn=lists.linux-m68k.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=y9kSWtn88k+QkPqpOG7NN6Fxk/gRH5gvJVVHZoYjlVA=;
        b=GUXanUB6V/yJyHZnPQJuMrtvy7M5FsD3rQQlcGsEnzF+OzNGmXwyTFv1aS0gcmz9+P
         CEIZv5n9oVf++xQu+a8ki8w9UU72UT0NAg+8SORSJAOCboG3E/kdEdL7eZ98ednYyCYg
         7X9S5Apx8R2sz6ktfogoPMj10xaxihQ3pjvb5EwLNym1z0xxPAZhRl8a2EzZSUdfEI40
         51yfqsY57papop7kZGKxAAClRzW62iPq18XKDnkgJSrlnBkyCmvfRSWhy8ezMEkTZVPJ
         xsV56WlGRU7eQfZi9DoZ9vhHqRjALXIg71L5fkrphhbYR8bDdvaZ9bHpqbIBGpR+AJaT
         mXXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768321556; x=1768926356;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y9kSWtn88k+QkPqpOG7NN6Fxk/gRH5gvJVVHZoYjlVA=;
        b=jqv/HJjBB6UdCkb90UxjpPtIgI0bGM0Sfutf6sniCPPYXEi91U6al7Bsa3aDlf1X5n
         pWUAiK+5G9d1vfvKJvceSWaW8cQjdaKn2G69PCHf3dS+PneW8H7qWfP9rCWPfs+s4N1/
         DLki+7rTnbWuR58ZJaHSxEiOHAC8Li+zqLXTiuk9xgNzHavwLdPApIWwjk7NokweVuPD
         7aPnmXqvkxWuAKciCgJVA2e9uwkQO3ICNGf7oU74Q8vDje2A3Vw9cQo57ptDsqtcseks
         LQ7oe8KJTGP6Atec6Qvu2lGmaHd1NDQFqyY5zCcWG98HdumzDSGPbxWBLYIzm5/GAyT0
         WfGw==
X-Forwarded-Encrypted: i=1; AJvYcCXFdE2KQc+VwZoGw7K4uPzKtYajsHwdsoGRWFAP6C2YvfsQ1TKk2lW05zNCeeb5/09Fyv6xtzk9Gw1a@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YzZTlrJ3gYubz480+HTTMyL0BVtdMext1BxlfSYDuhFGi5kOn5E
	i+OZZGToBVCdLmfIcJSqrJcga0SShp0KJ+eUyHJFa6oQinUShWuVhWkODG0ib5riChE=
X-Gm-Gg: AY/fxX4UXzQmsM/SlriqEpw5WL+Arc6YBvI3SUBw/oxpW8rKjfSAvwhFIbWSGyuFiB7
	x+cqdldb5S1LeYHf8fIHsU4iGK8PUEhKD3cyLueAnBqq2a0F+rWtdogqRMaGcAr5NFzbIsRyDpC
	HErQDz3tuRijYtd8nTWlxKt9tF0tTv35Q1K+hSyT3UO8yAXU90ghTmw21IgTARL0mujJtVNtTsE
	fMIokFE5hfTpQ4YsIyDjkafjVLisosjgJ9Y4f3LMxwO808k+Vu1UyAW2cKXEtjAm8vl/s3H/nry
	w9HRrTVneBC7NdUgmPkoxvNKUk0rV3Cn4T/K6aGca3ubkwyUvsAYqaa4MGHBQdm3oiOfoZVm9fv
	0/tPriEDMsGcB4v3FdVH377OXb6VZcfYdPKQPy50v/ofDZwL5/84xBnnaNgbNztZscFuFodgEdD
	LfXWdwfwGukgqoiJpeOfN1/blF
X-Google-Smtp-Source: AGHT+IG4o2sMRbjal/wNqE1AyBhrQEhgOmuQP9i1Wb50Y85ZgDNaJvwCCbv/cl0e10bMkrsnwOfPLQ==
X-Received: by 2002:a05:600c:1e1c:b0:477:58af:a91d with SMTP id 5b1f17b1804b1-47d84b0aa4bmr229523325e9.5.1768321556267;
        Tue, 13 Jan 2026 08:25:56 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd0dad8bsm45637605f8f.8.2026.01.13.08.25.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 08:25:55 -0800 (PST)
Date: Tue, 13 Jan 2026 17:25:52 +0100
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
	Shan-Chun Hung <schung@nuvoton.com>,
	Laurentiu Tudor <laurentiu.tudor@nxp.com>,
	linux-um@lists.infradead.org, linux-kernel@vger.kernel.org,
	kgdb-bugreport@lists.sourceforge.net, linux-serial@vger.kernel.org,
	netdev@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
	linux-hardening@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	sparclinux@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-fsdevel@vger.kernel.org
Subject: Re: [PATCH 01/19] printk/nbcon: Use an enum to specify the required
 callback in console_is_usable()
Message-ID: <aWZyEHsOJFLRLRKT@pathway.suse.cz>
References: <20251227-printk-cleanup-part3-v1-0-21a291bcf197@suse.com>
 <20251227-printk-cleanup-part3-v1-1-21a291bcf197@suse.com>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251227-printk-cleanup-part3-v1-1-21a291bcf197@suse.com>

On Sat 2025-12-27 09:16:08, Marcos Paulo de Souza wrote:
> The current usage of console_is_usable() is clumsy. The parameter
> @use_atomic is boolean and thus not self-explanatory. The function is
> called twice in situations when there are no-strict requirements.
> 
> Replace it with enum nbcon_write_cb which provides a more descriptive
> values for all 3 situations: atomic, thread or any.
> 
> Note that console_is_usable() checks only NBCON_USE_ATOMIC because
> .write_thread() callback is mandatory. But the other two values still
> make sense because they describe the intention of the caller.
> 
> --- a/include/linux/console.h
> +++ b/include/linux/console.h
> @@ -202,6 +202,19 @@ enum cons_flags {
>  	CON_NBCON_ATOMIC_UNSAFE	= BIT(9),
>  };
>  
> +/**
> + * enum nbcon_write_cb - Defines which nbcon write() callback must be used based
> + *                       on the caller context.
> + * @NBCON_USE_ATOMIC: Use con->write_atomic().
> + * @NBCON_USE_THREAD: Use con->write_thread().
> + * @NBCON_USE_ANY:    The caller does not have any strict requirements.
> + */
> +enum nbcon_write_cb {
> +	NBCON_USE_ATOMIC,
> +	NBCON_USE_THREAD,
> +	NBCON_USE_ANY,

AFAIK, this would define NBCON_USE_ATOMIC as zero. See below.

> +};
> +
>  /**
>   * struct nbcon_state - console state for nbcon consoles
>   * @atom:	Compound of the state fields for atomic operations
> @@ -622,7 +635,8 @@ extern void nbcon_kdb_release(struct nbcon_write_context *wctxt);
>   * which can also play a role in deciding if @con can be used to print
>   * records.
>   */
> -static inline bool console_is_usable(struct console *con, short flags, bool use_atomic)
> +static inline bool console_is_usable(struct console *con, short flags,
> +				     enum nbcon_write_cb nwc)
>  {
>  	if (!(flags & CON_ENABLED))
>  		return false;
> @@ -631,7 +645,7 @@ static inline bool console_is_usable(struct console *con, short flags, bool use_
>  		return false;
>  
>  	if (flags & CON_NBCON) {
> -		if (use_atomic) {
> +		if (nwc & NBCON_USE_ATOMIC) {

This will always be false because NBCON_USE_ATOMIC is zero.
I think that it was defined as "0x1" in the original proposal.

Let's keep it defined by as zero and use here:

		if (nwc == NBCON_USE_ATOMIC) {

Note that we do _not_ want to return "false" for "NBCON_USE_ANY"
when con->write_atomic does not exist.

>  			/* The write_atomic() callback is optional. */
>  			if (!con->write_atomic)
>  				return false;


Otherwise, it looks good to me.

Best Regards,
Petr
