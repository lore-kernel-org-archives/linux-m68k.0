Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ED62394497
	for <linux-m68k@lists.linux-m68k.org>; Thu, 15 Jan 2026 12:14:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768479285; cv=none; b=RMWxKPLcpJy75H1OiRzWPpeyhBjRzWhYAaYMNUd8VcFiLskt6oPBzsYH2EnQwEheBYJNBTL9JlRyDYdgt6ilMF1Y48/Qbo0HJfuDcCRI+nuWLYYbxh1HIFceK6XTONi0e2QgiENB+SQ8ZDNavJb3RUazfiDSglbCzdS+O7rfqWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768479285; c=relaxed/simple;
	bh=BMtROxTlhcEjGTvjLejFDk2Vbg7ExK2i/Mb0lDmT8j4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aJ6yYiIlLD4Oq/JMuDsZqB9qjUdln3WbVlO6Kl88P9DzIxHj5cEQsUW36KaQFnJuzFhcolZxMaf6UcIc8ebjz6sK7JciprWp8i1N8NvtFal5RoiLU0CtfHdgrCFXjVcEg86IqSIg0Ljf18pbVdb/lNynrnT4/G2ke5yqaIMnr/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=ExTTM5Y0; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="ExTTM5Y0"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-42fb0fc5aa4so659159f8f.1
        for <linux-m68k@lists.linux-m68k.org>; Thu, 15 Jan 2026 04:14:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1768479281; x=1769084081; darn=lists.linux-m68k.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zx4s5ogULMWiwAg3H50k8gmoVyZOh2DwfMGC+/dY5Co=;
        b=ExTTM5Y0W+V3IQXwQz8A7E09gwgiokOGz6r0w2/I6WVtqJLnqEwxeJNLbPIVvimC0O
         P6ZX9jzlfrFkROyeO7NgjmkthS5B+CX2UOqIjLkfUBU9kyfPqnAuB0cUEvL82XugNBZ5
         D1xSicWP6M5JN/hMt+oj9TVO0hwJAn/VsiyBTncihooNso5Y3GisQJeKG70ciPnTj7OV
         MK02teICEN18N+YDEWrHXt/xHhL4AFRMUXoLLMyOYv/ZBN1dupHAwHQoRYOc16K1gDjt
         OxWhY8YdYxfnPd6+9b3V+hxlUexrMY4/pGC/hbEeAFrUR1ixN9kU6yo4L0QyRXwIMzbR
         F0AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768479281; x=1769084081;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zx4s5ogULMWiwAg3H50k8gmoVyZOh2DwfMGC+/dY5Co=;
        b=BnC+Fdx+wLATDZyOuohy6cZDWXDeTQoIYlVUcNPng4WvIic8zu3RGpl/S+sAJCw8Zk
         Nb1UKOZO4OkGvUXf1S+SqBU2xaPLKhVtLtynOraF1Wt2nYQKEBs1IIqY9c4o+u3VzxCv
         jpAYxcW/I0jlTHDHUmEUyZfj/QPwibdtW0yYnj9y2mJjEBqbk9KTx6NiNm9d8YoQkf6E
         tunr0IOffEfx2+aGx9KDy11I7dKPX9+IC4waRUVbtRvZNtte5PcHaZ/i18evoi4ysTKu
         26wBZ8hcfcpOuvWoIylPouYgIIkC7+X/3f5tM8Z/gkQ0nsNaAKPAiygkUNW+F9cCVj1T
         mWNQ==
X-Forwarded-Encrypted: i=1; AJvYcCWQIl7XbBfHMSvc2tuDUGvaOF50jZ7r26gr4O6wT+A/+bB3wEXpTXqTEw05AcDnX1L3WeHpdzrZaqQg@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YxSqdOnpgBgbvrjmX55BfLSjfqb2phbXkd0w1L6+dIE0OdIQrsI
	SXWPjOxvdGaG1jjRweieWmsYrwgzQxPiwbXFsU/CuQW0qylkQtoq2ba0M9FlUdRXXhI=
X-Gm-Gg: AY/fxX4AE3Od8hmLengAq8HYAfZb5dSxyv1Zax+O4VgT1RTDNrfPRwpxETF7hH9FyRy
	1kOKNcmy6sIqC62rcdGImJJghCk3NeDWvl4J+V+yanG8/SCPTjdDq7iL/OF7YG0T+/r/wBcA8Nc
	yHw30kSpKz4k/LdF2J1iuYFDbOWzLhq4zy7B4ZAOrIb9cQ0uEZJTf1EPoiqj4b8a1cieWUwMD7q
	2ypbua0qq4RjZi4bqB59aQL8AyYFHw8Qni1NsUuPoP8Cx/EwycaLqE2YqF235mQ6FV1IJCnwznX
	/FI9/RI1c8zARZnwqXcsiVZJKjQihqETJ0tcTAVyjpiE/2QhCcmDoHD+kZkIWlAlnymcBGitEes
	ZHWYdCN6D2+NVf+pTRs9FCG/uTchriu5kAKF2G+8ZqG26LcmY78tTualQQr8SsGewB7ljBXX79e
	XfrCNeKA/nHM7nHg==
X-Received: by 2002:a05:6000:3101:b0:431:abb:942f with SMTP id ffacd0b85a97d-4342c557b93mr7715812f8f.54.1768479281353;
        Thu, 15 Jan 2026 04:14:41 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-434af64a778sm5591185f8f.3.2026.01.15.04.14.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 04:14:40 -0800 (PST)
Date: Thu, 15 Jan 2026 13:14:38 +0100
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
Subject: Re: [PATCH 12/19] sparc: kernel: btext: Migrate to
 register_console_force helper
Message-ID: <aWjaLhzRoTLalIrM@pathway.suse.cz>
References: <20251227-printk-cleanup-part3-v1-0-21a291bcf197@suse.com>
 <20251227-printk-cleanup-part3-v1-12-21a291bcf197@suse.com>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251227-printk-cleanup-part3-v1-12-21a291bcf197@suse.com>

On Sat 2025-12-27 09:16:19, Marcos Paulo de Souza wrote:
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
