Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EAE52BEFF5
	for <linux-m68k@lists.linux-m68k.org>; Wed, 14 Jan 2026 08:44:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768380266; cv=none; b=KRIX8qv8FGXLVm7IYiaMtFgGAyygbDwijb2ft4cKGY/ANEtaeXozeHMnlaMUnnKOHChaR+s+xrrfrYZlGZ9eLsfzkl5gVNuXMsSvBx2pTKJbLniOJIuXEIDJTcy9RHeJwM5+8mcv6EPE5ne7QLSFGDHlH4al23IoBOpvB7jWaMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768380266; c=relaxed/simple;
	bh=ysd4WYTvCh9+HsQ1AtbOfW5FzL4/iKQHwd6lm5bPF7A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ay+2CmjlNmX7GnY8Sl+MEuzodgg3gsyk9Cu1qKBdjew9muHr+rhG70QTI90Eu8MXEGMNDBkl0rFOrh7gH7XFOQ/ZuBwRJ/25+s9pJQ5kzB+UB8kgyOOdEWzIChu10i819NicXw9ITBjxj9SXvV6v03ocMGbbqIvEaXMNvwuMZMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=CX9aWhaV; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="CX9aWhaV"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-42fbc305914so5911925f8f.0
        for <linux-m68k@lists.linux-m68k.org>; Wed, 14 Jan 2026 00:44:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1768380255; x=1768985055; darn=lists.linux-m68k.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/Nn9M/VPDoeuifL+P7no8o5FApQZk7zNKYvSR+p2CRU=;
        b=CX9aWhaVPFm1Yk28jUg+Z+VqsIUYBTAG1jXmnG5Tit5tpBfMTXQJHTKJDsAvZK4dvh
         KoP7Q9mKBGOh5Pww0X4TMlkhYbZ0XfO/uXVA7CwRlOE706IUnh1E7I421Uzvjjm0BGQ/
         8EHcnHPExQr09nHsyBCelNIBfNhKNADq9B958/cSgdez3baB/E8qeESbCloBe1CefLEh
         zJWx2JJdmhtkX6LAFa52Jx4ms9SkuAg3JzBZHm0Z1JWoIcx0SckBpl+rFmhRrAdiNwgR
         4zs1PLDbmm/abqDgvkzeqfwNRAAVCFNXekUpPa6a0ZZQvAOlTv1Tz1w+2rsK6qRR6IX2
         1LDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768380255; x=1768985055;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/Nn9M/VPDoeuifL+P7no8o5FApQZk7zNKYvSR+p2CRU=;
        b=d4ESQofHdJ9+/S3MAdnGjLTrRGXHR6c1o5n7YlQwwTYLQG2IrB3NkUNMbr1vUQS4Xp
         IUzXqNZPdgnCWrGdsKkgrWRSS4Aphw59vcJypzGd5fOplhM7/J31/zw6h/jR+LtmZZ5i
         1GNwPUjUWiaiZj1OpLtiRjsEaiDqymxgnChXqgPNsF5yGv6g3ydOfnwquTJMQtJGXt+D
         1vmzbgoNKxa0FqPedaCnRqgan8yXgv1stJTsZaWFoBGSeCz6P8ArU9o1bEEP1bDGGKr6
         pt/NeKHLhzd9e7Q+ZO6vQ1p/T+IqGPoF7a8knQT1lAs0rneyPFQDO2l/10egq7tRPr8O
         s9VQ==
X-Forwarded-Encrypted: i=1; AJvYcCXtvQDjxLzfiwBmb2OQ9fkOe4/2y2M8vB1EiYBzWA/IfSu7+NGu+hMCdOvRe8whloH4kptNu+ly67uc@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YxZQmQEAKBj2CqBwKvbKXLTIAEyGKY8nX1eqkzvYlSpv+DUnVPL
	c2PnoD2C24UROIdJCBezDiexjZx2kkw8CREitVpGYnIsa9cOeaXClFCYq2ofsnvOSEA=
X-Gm-Gg: AY/fxX6O7btXhpqKul1DtmPe/FUB+UP4ZD/KSFKcBLivzp0FU5Pj2Jbe7K9K8Xy2PxO
	ui54mOs18NEQ4Aj7C+2eF8U3UFHMrukThrUelh5kzD1dy0ejlpPRYpQ/YWj64kFsbzJaQZI4k8a
	EsjIXTqvGYnngTFbHShPmsTuukcaIxnCo5v3Hy1Mc/nVRvFfJ+Kx+U+tuaejl7nM6uB9LYglXvQ
	PsDoszrWK+f+8O9goIxoMX9o+L86SXHt4kJOytD1piiWFDQ9gwnUCAvqkbWwEt00ctzCiYy9Flw
	yiH5z+WfD3X9eRzHqMb+E5IIeYL46qXH3rcIu5BkkbKDFzvoHkn7Tyqt45o2fCe6vDOPquvXeEI
	yqLXzQacpXX2vOiEp08U+Mx4MawsSkhvcGvHJ54bFWVW5vyOywIHEcIDG9K37EE/MPoRcXsj501
	znxoIlqTKEfsQk4w==
X-Received: by 2002:a05:6000:61e:b0:431:a38:c2f7 with SMTP id ffacd0b85a97d-4342c574bedmr1500621f8f.59.1768380254886;
        Wed, 14 Jan 2026 00:44:14 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd5ee5e3sm48685590f8f.35.2026.01.14.00.44.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 00:44:14 -0800 (PST)
Date: Wed, 14 Jan 2026 09:44:11 +0100
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
Subject: Re: [PATCH 03/19] printk: Drop flags argument from console_is_usable
Message-ID: <aWdXW6ohfQ7_z2B_@pathway.suse.cz>
References: <20251227-printk-cleanup-part3-v1-0-21a291bcf197@suse.com>
 <20251227-printk-cleanup-part3-v1-3-21a291bcf197@suse.com>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251227-printk-cleanup-part3-v1-3-21a291bcf197@suse.com>

On Sat 2025-12-27 09:16:10, Marcos Paulo de Souza wrote:
> The flags argument was also used to check if CON_NBCON was set, but their
> usage was fixed in the last commit. All current users are reading the
> variable just to call console_is_usable.
> 
> By calling console_srcu_read_flags inside console_is_usable makes the
> code cleaner and removes one argument from the function.
> 
> Along with it, create a variant called __console_is_usable that can be
> used under console_list_lock(), like unregister_console_locked.
> 
> --- a/include/linux/console.h
> +++ b/include/linux/console.h
> @@ -656,13 +656,8 @@ extern bool nbcon_kdb_try_acquire(struct console *con,
>  				  struct nbcon_write_context *wctxt);
>  extern void nbcon_kdb_release(struct nbcon_write_context *wctxt);
>  
> -/*
> - * Check if the given console is currently capable and allowed to print
> - * records. Note that this function does not consider the current context,
> - * which can also play a role in deciding if @con can be used to print
> - * records.
> - */
> -static inline bool console_is_usable(struct console *con, short flags,
> +/* Variant of console_is_usable() when the console_list_lock is held. */

Nit: The comment is a bit misleading because this function is called
     also from console_is_usable() under console_srcu_read_lock().

     I would say something like:

/*
 * The caller must ensure that @con can't disappear either by taking
 * console_list_lock() or console_srcu_read_lock(). See also
 * console_is_usable().
 */
> +static inline bool __console_is_usable(struct console *con, short flags,
>  				     enum nbcon_write_cb nwc)
>  {
>  	if (!(flags & CON_ENABLED))
> @@ -707,6 +702,18 @@ static inline bool console_is_usable(struct console *con, short flags,
>  	return true;
>  }
>  
> +/*
> + * Check if the given console is currently capable and allowed to print
> + * records. Note that this function does not consider the current context,
> + * which can also play a role in deciding if @con can be used to print
> + * records.

And I would add here something like:

 *
 * Context: Must be called under console_srcu_read_lock().

> + */
> +static inline bool console_is_usable(struct console *con,
> +				     enum nbcon_write_cb nwc)
> +{
> +	return __console_is_usable(con, console_srcu_read_flags(con), nwc);
> +}
> +
>  #else
>  static inline void nbcon_cpu_emergency_enter(void) { }
>  static inline void nbcon_cpu_emergency_exit(void) { }

Otherwise, it looks good. It is a nice clean up.

Best Regards,
Petr
