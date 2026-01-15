Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CF2835FF52
	for <linux-m68k@lists.linux-m68k.org>; Thu, 15 Jan 2026 10:20:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768472407; cv=none; b=d8AYMa7pLpBgDRJ2g3RJCPTSdiGNoA6cWvWtLAZWGNlrUnkWgC79BV2/w+Xf4a0C6CdUdY5WB4lfcqo7+yXU4sEL5QO+hOfAF9sajT26ZGfbtx3FJDP+CM14LYNNUzZe279oyRxXKI3k4tNv52/5KRnogm5tflCZoEnAM5lmfBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768472407; c=relaxed/simple;
	bh=mwoYamMX+C4LOG3qk2bHenfle0rpDp5AHcC+7a69BvQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O5gTMo30B/qOJ3mIcMH2RHYl/ymQh15wTwabFEPQkrni/vEe4hLamoB7qDVeUY4odCKlLdI3utnm5UR5dt8WCHCJP/m2IJocK+Jelcw7SEKXdXZMqQ+/+TbG8fVnqNzvH32VK+YBxpOXDlm8CnhvtHYVbMMzs9AKqxuslyhFOrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=T1UFZtdE; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="T1UFZtdE"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-42fb2314f52so347531f8f.0
        for <linux-m68k@lists.linux-m68k.org>; Thu, 15 Jan 2026 02:20:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1768472404; x=1769077204; darn=lists.linux-m68k.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Blw9ol92Adxv0ebGIyoRpKSiGhl8JOSAW1An3S4C+Hw=;
        b=T1UFZtdEd8Yyr06TpaL+dRYyp74ZciQpwiRIW9wC7tpSxLc2SFBYQyguv5Yot3AhAD
         KqOih69MMWsdIpS0rNuORNqlVvjLaMNA3YwHFU3ngJD0H/lEi8FgeSP/sLPCdMnFBq5O
         qzGpYN3WkW6qggqJW6mHxt8FugWYXjtp+clF7qnxY8n/2ACWdGVoNYuQa8ZnlsLlbn64
         9K9juIWeLNTHqsnc59vp1syTMxfLC7pV3tWV6Mm0X9PWaC/TxreL+7+V8QbcOToBHec5
         KYm+qccZh34/zImK96JXcZLzPBYVNiec6weBITxj3e0mH2RQFyy1Mhx9ruk8I8pM82NZ
         NrdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768472404; x=1769077204;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Blw9ol92Adxv0ebGIyoRpKSiGhl8JOSAW1An3S4C+Hw=;
        b=PZ72bsvI/iUcMUoMtMe0h31MVgOOExrbVg1aArdAta9iLwNJa+BEP5rzDlXEiAek2d
         Wihty7GpOwb7NGcYCJqUhuXL1aga02oJ8cN7jm3UkMIJuV8sOSltvUgutXBsWmAoibKZ
         BqhcOxlUjfSliBWMaPI1bQx995LVGHZV+lfk55sg3JF8kpQNOm4jxJm8wx9DZydHsdj+
         N55fteEAVCch0B+ObPc4n90sHjWbmbAO3FfIq8NDg1AYp2jJ8YfzOlgl59CcLUeC22Bd
         fLoBmygagyhQ2/6cgmDLew4L4wKFaiOXB5grSaYVIckMWGsp69zNB5TChlsOvsbmEF4/
         utbw==
X-Forwarded-Encrypted: i=1; AJvYcCVpJYuRDUlP8OF+BFzkFfOqmxuToZhAENmEWCvlETx3BNIYDMLQDFjNmdxMTp71jRoT+Gy4Deg3i5Jc@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YzDxEGuzXXMvoy2XhT8eY4VD0q9ikNyxkgQYYAkM7frJbV/73yQ
	xt3ZiGIgh5SuUMzTGytpN/lpCmtA/nYvuyWFoVnXOvwAyl8cD6gj4upoy8+hsKAsACw=
X-Gm-Gg: AY/fxX6mC3tS4O++hLay7JHnBT3Tpo6HKBR5kclEOLVXhiRKt1ffKEAW9XVBnAdZRio
	AqYF8DRCkG1h2H1GVWqMIzix13eJ3mwcCcEXnRxXwQ8PgbCfOjT40E58flUQSOtDjowURicXVYV
	0b4kSos+wGH7S3kY5mulrsyqgkws2ibeguyHo5PxTHUj4QVE9FgZICEFDEXTZkKKVgozgNbh6NS
	2xVeIQG71kdESjPydZGtQB8XokkToRuIspzNqwJaCM0S52VCPKTjsnZd6cIoVsGJWWgxkdUdFGq
	Kombw89zFrPFA+dMMm7HpVHZaCVupa5HMum7COi3pnpxsb7OLVA/vGwjS/QqSC2UqgOhYy30W8M
	qM2cFOEwiOxM8Io8obcfotNbZhnAfXxL19GuhNtGE9H0TmtzrhYsTkK4DbGeJq0d+606OgGPlZ0
	Xp878ChiI3aTF+DQ==
X-Received: by 2002:a5d:6b41:0:b0:432:a9db:f99d with SMTP id ffacd0b85a97d-4342c535db3mr5505744f8f.36.1768472403629;
        Thu, 15 Jan 2026 02:20:03 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-434af653632sm5139931f8f.11.2026.01.15.02.20.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 02:20:02 -0800 (PST)
Date: Thu, 15 Jan 2026 11:20:00 +0100
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
Subject: Re: [PATCH 08/19] debug: debug_core: Migrate to
 register_console_force helper
Message-ID: <aWi_UJcrphO9Esxw@pathway.suse.cz>
References: <20251227-printk-cleanup-part3-v1-0-21a291bcf197@suse.com>
 <20251227-printk-cleanup-part3-v1-8-21a291bcf197@suse.com>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251227-printk-cleanup-part3-v1-8-21a291bcf197@suse.com>

On Sat 2025-12-27 09:16:15, Marcos Paulo de Souza wrote:
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
