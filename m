Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com [209.85.221.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0235636E49A
	for <linux-m68k@lists.linux-m68k.org>; Thu, 15 Jan 2026 11:05:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768475161; cv=none; b=Ub0ePYHvXUboUcg5gUKgSAfftcWT0IUjujVBJ24WcnSXeYs1beINZi3YbS8Gm45pf/IfL3bX2wZl/D5zLvEDGvNA5AYiiXO2eqaosq5kYe8gAk0SdTShCA8xC9nAp81MZx2MxVDBAWnhVb9ESfCmESVA0CHt0sWcfe/zjn38HS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768475161; c=relaxed/simple;
	bh=5pJaxN7hZxh6H+l9RH7y9R9O3ys4FH/dz9mNWCjHNb8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HkZHp7SHzYiv6pagJpia00oySy3eFzhJzRLIv4yW8JRpTtO4Mj49mZ91mKl/3PJnZvz6hlSRwG0KDJEkNGSnDT+sIknobveEf4Lfag1iuO/c6V0ZsW/R5Fk7Y7oCFkUGZ2XCPYqOh68tsgeKmwGOfEU5FDuO7RlnJ3iNMBSA7jk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=eqoJI59i; arc=none smtp.client-ip=209.85.221.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="eqoJI59i"
Received: by mail-wr1-f66.google.com with SMTP id ffacd0b85a97d-432d2c96215so635037f8f.3
        for <linux-m68k@lists.linux-m68k.org>; Thu, 15 Jan 2026 03:05:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1768475155; x=1769079955; darn=lists.linux-m68k.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=AuZzUvIQYamq4W1YoLrzX7y0En5/TpcBTyFE7gx3A0A=;
        b=eqoJI59iXJNQ7U1UrGR+Id0tqLYULmP0Zc7s0swOv5lKFj1TRmgVgfKjZnf5VCkqh1
         HtDLxuPER8Ol/ALHYvNyTMCgKaFzgGqAWTE+V0Lvcojx3omuH8rCMnltDk49uJgtPdY+
         oNhQWwcM5rgx1fHXd40/ukFf5LzhPWyhiyuSvxxw69As36xqQDCZRxAqDD5+yRj/jZYU
         GJQRI+ZWgQv0vitQf1FusB0fCSSwnlMjHi57hQ+6OKprcHtUB1PaVCKUpbjP7/Om6GjN
         DtYG8KqD6mQjO+LlM5BIMdxwJRvKg3CmCgg0hQ2F+fz0eRim87b2lQ/BIjYG19Pj5ztb
         68YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768475155; x=1769079955;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AuZzUvIQYamq4W1YoLrzX7y0En5/TpcBTyFE7gx3A0A=;
        b=mJYFLe9ip9oaU4QY156f4OnX7/69taIKW8IxSy0Jutv5UyEIZQTMgeViUl9EREG6AG
         cLMmMv5aDDhbVHkEjKkoBIulzJJzaK89wyDVp85cJM6Ym/D1IPUF8QFwqa0pAL6N44Vi
         YMdphsBPALmzx1SnXObEDYfMQgKXyQWkutYFNTlzzamK3BhAhvF3hvKAs3zst5Q9suyQ
         /MN4C4DjB1hkK0DIp/Bg2v4z07i/F3LlUV45yREpWrlfWAu4JqcmDX93XYCpDv8dlXwt
         4YEtKkx+5rkoU5B0J9QmFOYYzGI6gyOmbP7fDZsOLyjLsZN9qmdjC1YbZ0PL3xk2BQd9
         b0WQ==
X-Forwarded-Encrypted: i=1; AJvYcCVppTy5i50RN0eGKAthjp0v0jmOzVRuqOd5uJ+AryryChM+9tl3yplMTGsCQrTSujtQrFSYIhztKCVi@lists.linux-m68k.org
X-Gm-Message-State: AOJu0Yybf+1W6XqYbCn7pacxZOed0fifW5ywKsGGsyMLk+bYRPUWyw16
	lYqoep4LeVOThAxGI0qrIbrixKHhQDGIDz7OLP7mTRk43wPOw0A16+rr+XjOe7watBE=
X-Gm-Gg: AY/fxX6kQytYCKwp8hOccTITyhV5J1vEAmGi8/mNs2zshUiy0Zr2z/7zvi8TqZW+Nth
	ukKe5q31cuR/mdvisafpAG/aC/0isPb1mRc5su9cerjAzIzit1Op9T7wGlyMqM6f+PvtftvjOl4
	2z5ymdqPOjJssxt5XRXznwvtT6J3+pvz6AGIKUixDFTLJQfMM3Nzmg2se2tYYqcsyeRaXTSDqHv
	ZFextPaTSct4KctdKibEKQYVVrs/JHMnUzqIhCCAC/Z/L63tUmeIlV30w/OoKLELIzSDKl+2+ZC
	BYXd0PBV8Rzo5CI3h7btSJPqgzRVoNUJWPKYFitqP5L1XwaSDnRbhXba3x8oXKZQF3rl7Gqcl5e
	0MbRo0al3rZgGsaWLz2++1PsX1lyPm2mURlfwP9jHzDCh/dco0s8Iuyk/KOgAef53G7Kr9wuE8R
	MdKPsfEZzS71V/fQ==
X-Received: by 2002:a05:6000:2f84:b0:430:fa9a:74d with SMTP id ffacd0b85a97d-4342d3912bcmr7103110f8f.24.1768475154515;
        Thu, 15 Jan 2026 03:05:54 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-434af6d909fsm5297949f8f.31.2026.01.15.03.05.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 03:05:53 -0800 (PST)
Date: Thu, 15 Jan 2026 12:05:51 +0100
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
Subject: Re: [PATCH 10/19] fs: pstore: platform: Migrate to
 register_console_force helper
Message-ID: <aWjKD4jv8CySV0Rj@pathway.suse.cz>
References: <20251227-printk-cleanup-part3-v1-0-21a291bcf197@suse.com>
 <20251227-printk-cleanup-part3-v1-10-21a291bcf197@suse.com>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251227-printk-cleanup-part3-v1-10-21a291bcf197@suse.com>

On Sat 2025-12-27 09:16:17, Marcos Paulo de Souza wrote:
> The register_console_force function was introduced to register consoles
> even on the presence of default consoles, replacing the CON_ENABLE flag
> that was forcing the same behavior.
> 
> No functional changes.

> --- a/fs/pstore/platform.c
> +++ b/fs/pstore/platform.c
> @@ -418,10 +418,10 @@ static void pstore_register_console(void)
>  		sizeof(pstore_console.name));
>  	/*
>  	 * Always initialize flags here since prior unregister_console()
> -	 * calls may have changed settings (specifically CON_ENABLED).
> +	 * calls may have changed settings.
>  	 */
> -	pstore_console.flags = CON_PRINTBUFFER | CON_ENABLED | CON_ANYTIME;
> -	register_console(&pstore_console);
> +	pstore_console.flags = CON_PRINTBUFFER | CON_ANYTIME;

As the original comment suggests, this was done primary because
of CON_ENABLED flag. Otherwise, the console was not registered again.

register_console() might remove CON_PRINTBUFFER when there was
a boot console and the newly registered console will get associated
with /dev/console. But I consider this a corner case. Other console
drivers ignore this scenario.

I suggest to define the two flags statically in
struct console pstore_console definition as it is done by
other console drivers. Remove this explicit dynamic assigment.
And add the following into the commit message:

<proposal>
Define the remaining console flags statically in the structure definition
as it is done by other console drivers.

The flags were re-defined primary because of the CON_ENABLED flag.
Otherwise, the re-registration failed.

The CON_PRINTBUFFER might get cleared when a boot console was registered
and the pstrore console got associated with /dev/console. In this
case, the pstore console would not re-play the entire ring buffer
on re-registration. But it is a corner case. And it actually might
be a desired behavior.
</proposal>

Otherwise, the next generations of kernel developers might think that
the re-assigment was there because of CON_PRINTBUFFER flag.
And it might cause non-necessary headaches ;-)


> +	register_console_force(&pstore_console);
>  }
>  
>  static void pstore_unregister_console(void)

Best Regards,
Petr
