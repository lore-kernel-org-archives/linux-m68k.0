Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55B56397AAA
	for <linux-m68k@lists.linux-m68k.org>; Thu, 15 Jan 2026 12:29:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768480184; cv=none; b=RXGhOak90FwOUCDC3VYCnUAiQfXPhYiTstF58s0YAT5CICbdykscb/IgBE6MmTpP3xXPzeUoubULXQw96xCmIQl0JM5E2jjZQK15Bq/TMUk2qxVnbZXI/t5RMVmtdzzzxpsGVmzupDEulBcm5i7O/FU97FzIbuczPJ2aXGLO+Z8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768480184; c=relaxed/simple;
	bh=vYsdvT7Esg+O4+yVXNphLK0YKxhLuEHhcRTW8Mb/9K8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=docbcg4ta2Qa9/231+L5kLLqHd51v43aSfmfpiE9ZXqCRvgpvTjiIUW1xmc2we8o6eC85ACmWveKZYr7PvKOrE1l2dRZs/jsMDvarianfQBQpGy14qsRMAcLnW2dA2YLjxu20bHoVZaFC0W2CKbH66PNG3YC0YBEydXjnLUO9hc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=bAdE4Qvl; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="bAdE4Qvl"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-43246af170aso453535f8f.0
        for <linux-m68k@lists.linux-m68k.org>; Thu, 15 Jan 2026 04:29:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1768480181; x=1769084981; darn=lists.linux-m68k.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ld+As4KXLNBvjLuNePKBkF4h3CZ3gGNkmAsVzP6KebE=;
        b=bAdE4Qvl6ohWopu/ZVcA4J9UZmcQ3VJtjOhEXLB5G8L8MLxfIHSqkgDrazb6wx0tod
         1uHJtF3uRhwf32o783sTXVjHdZN//USyDLEBVFjTv5nDTab7eh8C1toUWyi4JzFFPqna
         MkeUxDouRf8T0pEFWt426Ju7hon7xDAU0e+idV69Q2RzP/xfWQJE7q4Pc15xY536nbJ1
         peVJBmmInWM52jLphJAL4DgfQ1cEDaQFiT1n/gxpGTn1g7yKCbIxoL+SBY4mCZZjrilJ
         KVPlYBXquoe2ZTG4OZAyLHwTHC3UvOm2jU/4cdsi/5h5dVfs8ppxaMZxIfm0US+Db5tR
         AeHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768480181; x=1769084981;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ld+As4KXLNBvjLuNePKBkF4h3CZ3gGNkmAsVzP6KebE=;
        b=CtK/FVVtJDjSwqp+1lD4P2UPDEDV5vPCRVSK3lRp3emzAooB5MtLnhbuFKYsc06O9f
         +APtmdpSMUzjPOkLYpt8uoeQthnanqXxVHbFdFbNK5YgpdWQD5+JvyNxhDax+6hfNYo0
         gN+zHFQ2RyICsbC9Hb586n0Glr/DVDsko6N7R4SRYOelCxyRPN5KnsbXc0ySVhQ++6v3
         Ig6I66SUpbx3SldYA+c/y01eNhHwT29gHtUHogo5moWE4Z0zMi2dSCRjDkUCRTyEn+jR
         /6ICT2GHOe9vJwg73BtIEqAB70Tsv2wfJvnjces0YsL1lTbDiQkUy9gO4qXChgNU6m5u
         hXAw==
X-Forwarded-Encrypted: i=1; AJvYcCWxcOE6inLBh1N0930yNA6kuONsvMGvl/Mysz75x28JzXp9byQEe+TRocUtvwtnC86uaK6VhMattaA4@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YznJozM8Mx5JJcS8VqNLfm0hmbV/c1/fj4ex+vbjGUAPQt3wuJk
	/a85l1j9kvfzzDuo3BGZ+0E3cpTdagek9kd3aP+WvrXn7cFVT8ZqFFqS2/xAWISaz58=
X-Gm-Gg: AY/fxX6wIeagz8JXo6ljJgQD1iHirA1NMkPIPw3Xt2M4g/sAj+iT2imRUcrRW0tFZFF
	b8SxF0OfKClGwLv1YOmlW4IZ/LdSvp0Un/ummlOJe4L4Z53s9LH5TqRvNgRliP2Xt1lMd1UxTdK
	UFVdH6dpmbFFUlOaigS/E+yWmI2A60bTm7Uvsk01KBcPncCaJGw/71IaK2IwI2mVI93ond4Cma/
	W9hFa24O6d7sQZXTHf0FtUcyGcuBbML+BmJUuqQ64nbfEGioCvnU0LA03l+jk/gj40/ItjqeKXm
	WJUUsc4Ohaa7eHIIWOW1arX6AWcMptQsMzpfonlUZA0fT7oNL2Sd8S/PM238itNHy5ebnddDZ6i
	RLRyDn6A2Phs1TxcHOXr0U3wu1Od2jEb+H+ta4Ma2HnwgMOLrxX+8VZIHa0/QMdJRwXSWRK1YKs
	RicqCVLwLAiEnEXQ==
X-Received: by 2002:a05:6000:420a:b0:42f:f627:3a88 with SMTP id ffacd0b85a97d-434ce7324b4mr3823468f8f.4.1768480180633;
        Thu, 15 Jan 2026 04:29:40 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-434af653576sm5965022f8f.17.2026.01.15.04.29.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 04:29:40 -0800 (PST)
Date: Thu, 15 Jan 2026 13:29:37 +0100
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
Subject: Re: [PATCH 14/19] drivers: hwtracing: stm: console.c: Migrate to
 register_console_force helper
Message-ID: <aWjdsbYev_5zfKEC@pathway.suse.cz>
References: <20251227-printk-cleanup-part3-v1-0-21a291bcf197@suse.com>
 <20251227-printk-cleanup-part3-v1-14-21a291bcf197@suse.com>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251227-printk-cleanup-part3-v1-14-21a291bcf197@suse.com>

On Sat 2025-12-27 09:16:21, Marcos Paulo de Souza wrote:
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
