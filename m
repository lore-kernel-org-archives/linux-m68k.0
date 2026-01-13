Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E97AF3816F0
	for <linux-m68k@lists.linux-m68k.org>; Tue, 13 Jan 2026 17:37:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768325845; cv=none; b=dwr3bTgeP+9xzZSBwhPlps63gVNspJXInZtXONczOh6fxN9VxgYOxRg+EWI8S+sJTvXMP33cJOzLtKkpcaU1pr2CH2bXiLTYZe5+P20oz58QL0CDcuM0LQ3BOzFLTdsU2cHILKh/IXtKgE7cwSBojCjGbedcYEMKNb7snAaAOhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768325845; c=relaxed/simple;
	bh=ICK4ui9NDNRZmZPvqUFhVVRYDzu3U7vjvh8uoefFqv4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TE3uPhH7CqUO+0/DTau+AuUSaBAWQvEv8nbZ7fV3YFXuhKoDyRv6COq6+myygocr80iRZbm7vo0MSBRa9M4zUd4pun4AqcWAnRS32xRiUW0abtFpjo3n3yJQmYKnmU0ul2XdafQK7wgPbJbtzX4xs9r1Dt1pgPeTCM3GfdQZEl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=gQMlCSnA; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="gQMlCSnA"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-430f57cd471so3943956f8f.0
        for <linux-m68k@lists.linux-m68k.org>; Tue, 13 Jan 2026 09:37:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1768325840; x=1768930640; darn=lists.linux-m68k.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/CVOy4tPw1zWY0e6rYcKRwtfrfRvUlKFzd8YTNoGp5w=;
        b=gQMlCSnAIL0fp6P50z51xR3vMvICmLhDWN43V6nrtC3xvIPkMdqGZb5P/qo7Dh4L1T
         o1EZdW5fDgA3pw7MKmSopEhmI0ucKBAV8dRzHlEv3PPSgOjBy+0VNwsxe9G9r4y8OThr
         Bs3DSsjRt67jgLoWYzCHAHbdXthfZ9KMmneMVgmr94gdFBjuvDgmCfnZH//RT1PS2QBX
         8TgrUTjA9L4Wn8nfapOYMXoXEr0RMGwF5vxNVQZBHzv+vkYEZf2xibHf6kvU1dE6IkvB
         ZvRWo25xR4WapEnf/HvgOtFkTFG56w1P0FtOM9rYFHaiKUX0YuA782KDJRIBP9SoCxrS
         vVkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768325840; x=1768930640;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/CVOy4tPw1zWY0e6rYcKRwtfrfRvUlKFzd8YTNoGp5w=;
        b=Xhgl7UFJNwr0Y1IA79+9FAomNrHw+7JlD5Ot+Y6Dji9BtbOt/LvViyaWtLXJs+zmEX
         RzD+Vo6WJVcuiOcf94X7uj6BdGyFByBjQjhZ/LpUxGIrlFRvnZnDbrZZzZQ9Udb/kIaC
         /o5E1WsX+5XliaoVWOzZ5AbkiKNnDODEAtfzYl3qw7Ssn33RIiRmeVUn1EIr36OUD4dl
         rZfuJrCSQLhJTo1T3lPOt2Bfy/MlwYVDxX7LwyTX/5GdiyXFNXDEyVfdEr+KPj4BmBUJ
         9NV5UUin6+w0WRoBY6Axp9UXQWRnJy/6ukIxXZ6BoqTDHJTOq04+ZkSQcTot+nVEmC/8
         h2zg==
X-Forwarded-Encrypted: i=1; AJvYcCXKUXMJMcpixTTNSwXR5nWHw5RYhgL1uJeDgqVxK8ZMvi08xWwKaH1X7M3TBS1wqIms+NfQhviGBekf@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YwET05llllFn+ELFOXtfIIFUX6sQ2pLZOdAVSeyVxhT766vBWfy
	ldtaGWigpzP7d+uc1xdI/KKVRuwZlTQyYH3++SPi8CGf2hi8DSP5ei4+mgFc7CwHeko=
X-Gm-Gg: AY/fxX5fBvTwztbQMG7kg4qGp0vC1r/WkkX3Xlmp6SYSIozxHSskpO2L7WKZGonWCT9
	0INPmk8aw/R6ZEC8JvZLrgsqAAPOZbdj6nE6uyxD2zQvFxRblKXkCaqVT1XZWSKhUkpF54gKvXD
	T6QSRMgsR/3WhReMvSSaL6bStgwVkAzv6Z8GQ02T1On54Y/hxXlSqVkIt6QmAROL6HFwh/YLbYy
	ueiGJz7HkmiRy3X8jV6JHBZfY7d9RAJDVtszLX7DcDQxXcgf8kWdxRheNvheaUfPGTiZxRiEfYF
	8iqVsOHogXz/9WYaIXPVEQN8iuOzlaNXg0TUxHHzaFZcyTxIZL+5Q3dlpA2av54H9szpZmFaTqP
	U8brmXnxCJBwCm1wZg8G3g4OBu0FFJIZqlPiUxvtXMPcQsxy4xqRdWuisu+R4coGcAVy9VsMCN4
	2bFDjV+ncjoCJPoA==
X-Google-Smtp-Source: AGHT+IHUReQqvVgC0db5F0/UgqAPwHgCcpq2ZD0lhm0g7XnDeEa3Phlj1/GEitKl8zvqkUFbSZC6XA==
X-Received: by 2002:a05:6000:2dc9:b0:430:fced:902 with SMTP id ffacd0b85a97d-432c36436fbmr29258778f8f.26.1768325840268;
        Tue, 13 Jan 2026 09:37:20 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432d9610671sm28342147f8f.34.2026.01.13.09.37.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 09:37:19 -0800 (PST)
Date: Tue, 13 Jan 2026 18:37:17 +0100
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
Subject: Re: [PATCH 02/19] printk: Introduce console_is_nbcon
Message-ID: <aWaCzZ8_UuyAa6xp@pathway.suse.cz>
References: <20251227-printk-cleanup-part3-v1-0-21a291bcf197@suse.com>
 <20251227-printk-cleanup-part3-v1-2-21a291bcf197@suse.com>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251227-printk-cleanup-part3-v1-2-21a291bcf197@suse.com>

On Sat 2025-12-27 09:16:09, Marcos Paulo de Souza wrote:
> Besides checking if the current console is NBCON or not, console->flags
> is also being read in order to serve as argument of the console_is_usable
> function.
> 
> But CON_NBCON flag is unique: it's set just once in the console
> registration and never cleared. In this case it can be possible to read
> the flag when console_srcu_lock is held (which is the case when using
> for_each_console).
> 
> This change makes possible to remove the flags argument from
> console_is_usable in the next patches.
> 
> Signed-off-by: Petr Mladek <pmladek@suse.com>
> Signed-off-by: Marcos Paulo de Souza <mpdesouza@suse.com>
> ---
>  include/linux/console.h   | 27 +++++++++++++++++++++++++++
>  kernel/debug/kdb/kdb_io.c |  2 +-
>  kernel/printk/nbcon.c     |  2 +-
>  kernel/printk/printk.c    | 15 ++++++---------
>  4 files changed, 35 insertions(+), 11 deletions(-)
> 
> diff --git a/include/linux/console.h b/include/linux/console.h
> index 35c03fc4ed51..dd4ec7a5bff9 100644
> --- a/include/linux/console.h
> +++ b/include/linux/console.h
> @@ -561,6 +561,33 @@ static inline void console_srcu_write_flags(struct console *con, short flags)
>  	WRITE_ONCE(con->flags, flags);
>  }
>  
> +/**
> + * console_srcu_is_nbcon - Locklessly check whether the console is nbcon

There is _srcu in the function name, see below.

> + * @con:	struct console pointer of console to check
> + *
> + * Requires console_srcu_read_lock to be held, which implies that @con might
> + * be a registered console. The purpose of holding console_srcu_read_lock is
> + * to guarantee that no exit/cleanup routines will run if the console
> + * is currently undergoing unregistration.
> + *
> + * If the caller is holding the console_list_lock or it is _certain_ that
> + * @con is not and will not become registered, the caller may read
> + * @con->flags directly instead.
> + *
> + * Context: Any context.
> + * Return: True when CON_NBCON flag is set.
> + */
> +static inline bool console_is_nbcon(const struct console *con)

And here it is without _srcu.

I would prefer the variant with _srcu to make it clear that it
can be called only under _srcu. Similar to console_srcu_read_flags(con).

> +{
> +	WARN_ON_ONCE(!console_srcu_read_lock_is_held());
> +
> +	/*
> +	 * The CON_NBCON flag is statically initialized and is never
> +	 * set or cleared at runtime.
> +	 */
> +	return data_race(con->flags & CON_NBCON);
> +}
> +
>  /* Variant of console_is_registered() when the console_list_lock is held. */
>  static inline bool console_is_registered_locked(const struct console *con)
>  {

Otherwise, it looks good to me.

With a consistent name, feel free to use:

Reviewed-by: Petr Mladek <pmladek@suse.com>

Best Regards,
Petr
