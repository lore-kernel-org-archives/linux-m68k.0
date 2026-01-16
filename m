Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D41B527FD4A
	for <linux-m68k@lists.linux-m68k.org>; Fri, 16 Jan 2026 13:54:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768571670; cv=none; b=P48OCE+5tr/aitc6wtkwl5FEQ7KpHRC1Llykumcayem/1mhwq0QzY8pSy49/v+ltfQgvuJUv/GClAy4nFtIHH3wZJQ1wT/ApiMYUqXojaXE/4SqZc2PqScD4pNe0lsWufUPTy7IoZHk9C4W4yf4qQ0WDL/vvBuLd8nVe/XzHYM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768571670; c=relaxed/simple;
	bh=2Jyc4vjPWHQ8N29GFPPd4QPUxfDxmdAZddY3K56YrUM=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ZcJLsmF6785zCEs/sUYt2S8MGxJw3y9k86n55A5xalymGE6NWINa84svYZRfHLuf1oTrDd6VRWMc2VPFklxyIKnZP1xuCzVNzB5BQXONhfprtDKUXG42eFA7kGP6grB9IykE+l7pQ4Hgz+LPMgbhnzNUBG5gwN36nXU78YXowCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=fH0c1/Y/; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="fH0c1/Y/"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-430f3ef2d37so1532535f8f.3
        for <linux-m68k@lists.linux-m68k.org>; Fri, 16 Jan 2026 05:54:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1768571667; x=1769176467; darn=lists.linux-m68k.org;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2Jyc4vjPWHQ8N29GFPPd4QPUxfDxmdAZddY3K56YrUM=;
        b=fH0c1/Y//+ewiMSaNplHhs0FZWXqBwjXivy6uQzarO152widSMqsJKKzt44+7gOVjI
         3jn+VO3/LNxpvt6nqDbgVW9CHsE5iN3Nw7eBUbDKsCA3Z+WVsUM3wzuqHM2ZfEubZ8NH
         3HZKmASUMtp3j2ovJWiGawInY/wPwbeAgFi+4N5f19bi5tIIrehpuHib1XOaZlaWlNEY
         QwxqxX2lbv7plzyEUOX8kQvXQVVJ00Jvacs7tttIuxMso2fZyMXvTm0zL2nEE+vNFTOn
         Di0Q3RrFCNE4nveAKVreDA/KTvOEzE6iLgr6S5CeZSIHzC3M3mckyLSlIoVtzXwlD0CO
         MboA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768571667; x=1769176467;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2Jyc4vjPWHQ8N29GFPPd4QPUxfDxmdAZddY3K56YrUM=;
        b=VSIt3fD5RKQ3PHuB3BQCDYhLUZcpegqrZ9nkt8OpALlMWCKUkLAei/+gKR9tgxCnr6
         HKKf/SZdRQh+4Rc7r0eYiSBP3CtHi83ToMzG0KhfnOqhMM5dOJA0qRLnuZ9XXd4zZJBM
         CHlhssMzaS2SzFWk94OGcAct+PLdmu1I+D8fNtoLbsqzvKUI/6xhTQw8FRrPcIQgosi6
         MTI6wPa5i0bEmGVLBXQ7HYE34XlN1clAq8h+ti7c+y/BELTy++T+oZb2EBUX9xdvTMUK
         Q5aQN+Bwgt3gbNeJys01DuX/nN5VR9MVWinNulrAoRSc0XxZHp9+kXMGJ4nXLAsy3KHM
         JJ6g==
X-Forwarded-Encrypted: i=1; AJvYcCUt4ONyOYagN2V6wdGfBVTzVUY3m3QUJ/Bh1qYuzHbp9kt/HmsMnF9dfGGWnM3FwIvA05zeD0db8krg@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YyzYydJtcL9egATXRSovF9uXuWP9FHW5wsHbQjJqn4Rl07BaPvy
	paLXey2MV9wSeJUnviVTRZHwG8lDZ99oPbfT4ViifU47XkYMWqucoQm8ie5HAG6cqis=
X-Gm-Gg: AY/fxX4BRIKsONK+oFHZfCXPqF7q1Obtrlp0DlYAN1cnn+LeJPUy4qgYIe7j1/c6k2n
	/8iqQlcn6cDQHNBVEckmMgv6oawn7NOc4SQvYzmkaKIQsmMAMWRsr9xvudSCIQoaq7qR6lncaiv
	pjvFJxB2xdNXnFc0L/tHjsvC/nhS3+wp1z9z5UCIPaPcbndYf+xLpJ35qe6CIxVQf1XEUIVwqx7
	M9gO2xbtWvSx4jkeBjveGw4vtGiepN2ADeTTBhPX7BxtkW3pDNomh0sOM4a1YTW4GNJbs8b41iN
	w/7qCy47mLZ3Np7WCdXp0BezSfcOaDaKZXrp6fuwjIe4FFDrXFQiq/Y5X/ms/yAJ7cv/lWsIRWz
	sG09s3dguJ49wJfo5IPYMRqkyLs1gk5OxsI1AwdRcQkPPz9eRtM3zTEcjUVxrqn/tu+gj7J/0Oe
	/HRytZ84R6BTxWtbUxJn4gZ8INCPM0AAWWrTFSu5Q=
X-Received: by 2002:a05:6000:4387:b0:431:1ae:a3d0 with SMTP id ffacd0b85a97d-435699810a1mr3695386f8f.25.1768571667158;
        Fri, 16 Jan 2026 05:54:27 -0800 (PST)
Received: from [192.168.3.33] (97.36.160.45.gramnet.com.br. [45.160.36.97])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435696fbea8sm5433542f8f.0.2026.01.16.05.54.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jan 2026 05:54:26 -0800 (PST)
Message-ID: <6168099632390068c8544b48f2e81bf737aa10d7.camel@suse.com>
Subject: Re: [PATCH 14/19] drivers: hwtracing: stm: console.c: Migrate to
 register_console_force helper
From: Marcos Paulo de Souza <mpdesouza@suse.com>
To: Alexander Shishkin <alexander.shishkin@linux.intel.com>, Richard
 Weinberger <richard@nod.at>, Anton Ivanov
 <anton.ivanov@cambridgegreys.com>, Johannes Berg	
 <johannes@sipsolutions.net>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>,  Jason Wessel <jason.wessel@windriver.com>,
 Daniel Thompson <danielt@kernel.org>, Douglas Anderson	
 <dianders@chromium.org>, Petr Mladek <pmladek@suse.com>, Steven Rostedt	
 <rostedt@goodmis.org>, John Ogness <john.ogness@linutronix.de>, Sergey
 Senozhatsky <senozhatsky@chromium.org>, Jiri Slaby <jirislaby@kernel.org>,
 Breno Leitao <leitao@debian.org>,  Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet	
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni	
 <pabeni@redhat.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Kees Cook	
 <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, "Guilherme G. Piccoli"	
 <gpiccoli@igalia.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, Michael
 Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy	 <christophe.leroy@csgroup.eu>, Andreas Larsson
 <andreas@gaisler.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Jacky Huang	
 <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>, Laurentiu
 Tudor	 <laurentiu.tudor@nxp.com>
Cc: linux-um@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kgdb-bugreport@lists.sourceforge.net, linux-serial@vger.kernel.org, 
	netdev@vger.kernel.org, linux-m68k@lists.linux-m68k.org, 
	linux-hardening@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	sparclinux@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-fsdevel@vger.kernel.org
Date: Fri, 16 Jan 2026 10:54:14 -0300
In-Reply-To: <83zf6daetu.fsf@black.igk.intel.com>
References: <20251227-printk-cleanup-part3-v1-0-21a291bcf197@suse.com>
	 <20251227-printk-cleanup-part3-v1-14-21a291bcf197@suse.com>
	 <83zf6daetu.fsf@black.igk.intel.com>
Autocrypt: addr=mpdesouza@suse.com; prefer-encrypt=mutual;
 keydata=mDMEZ/0YqhYJKwYBBAHaRw8BAQdA4JZz0FED+JD5eKlhkNyjDrp6lAGmgR3LPTduPYGPT
 Km0Kk1hcmNvcyBQYXVsbyBkZSBTb3V6YSA8bXBkZXNvdXphQHN1c2UuY29tPoiTBBMWCgA7FiEE2g
 gC66iLbhUsCBoBemssEuRpLLUFAmf9GKoCGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgk
 QemssEuRpLLWGxwD/S1I0bjp462FlKb81DikrOfWbeJ0FOJP44eRzmn20HmEBALBZIMrfIH2dJ5eM
 GO8seNG8sYiP6JfRjl7Hyqca6YsE
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.2 (by Flathub.org) 
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Fri, 2026-01-16 at 14:04 +0100, Alexander Shishkin wrote:
> Marcos Paulo de Souza <mpdesouza@suse.com> writes:
>=20
> > The register_console_force function was introduced to register
> > consoles
> > even on the presence of default consoles, replacing the CON_ENABLE
> > flag
> > that was forcing the same behavior.
> >=20
> > No functional changes.
> >=20
> > Signed-off-by: Marcos Paulo de Souza <mpdesouza@suse.com>
>=20
> Acked-by: Alexander Shishkin <alexander.shishkin@linux.intel.com>

Thanks Alexander!

>=20
> Should I pick this up or will you send this with the rest of the
> series?

I'll need a v2, since some things will also change in other parts of
the patchset, so I would wait for the next version.

>=20
> Cheers,
> --
> Alex
