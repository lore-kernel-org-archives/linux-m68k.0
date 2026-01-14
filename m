Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39C7B39A7E8
	for <linux-m68k@lists.linux-m68k.org>; Wed, 14 Jan 2026 13:20:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768396821; cv=none; b=gaEuunfGdNnRyGseX2R6tljKDVFu3r6c1B8Usffn2nUPmWQEcWSXHTjQ8OCW8d6cFIZ3ruKO8ahYtvmJZ2CHlu9vn392vkdrzxypKkykFBMnoP6Junz69kDoy2EPAlD4mvmeRrAZueQ4314EOUTnpKwk1K+RhYKRqvzOV+bImHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768396821; c=relaxed/simple;
	bh=tXOp5Q+91Ev71kEJDwNUHqTl/QTwmM0CMtRXuMN58II=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=es4PXDKi1uNty+1pc6M438JxMnvh1pWVZ1Ud4LvtJlEokgVqdapPrYaUcKtoa2NKZV2c1p7wV0RDqhbtd01ntIi2LxSOLfaaEualLIVgqoTNov+inUxSHkkAiuwFNV/SvTinfKiMk/B0U6JjweZdakLZNLZnWW8/gnB8Mp6gB2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=EAbSOOO6; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="EAbSOOO6"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-4327790c4e9so4608545f8f.2
        for <linux-m68k@lists.linux-m68k.org>; Wed, 14 Jan 2026 05:20:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1768396817; x=1769001617; darn=lists.linux-m68k.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=sWiGwjTB0ZEpbDkwRFO+MVJzM9uZpDrSFPQIlzRZfsU=;
        b=EAbSOOO6cKk2Re4TUAzVFQtBocft6PBYcGKGD5reLV0RejzwZKB0cJVkR2UdEVLbo4
         AbgSTdUupw6waULfh/jjoMe/7v5WQvz6uKp+bgBQfxnqOUCtzK9GI6jSIheyyqZqZ/y4
         DbOjLC0Lc/ovt4aN24mRhdaql1aKEuEKhyDmV6DLALbMLrNb37/qhmvxMGckEWQ7xkqR
         06mDmDdYF2fzpznHpnkInA6Hi6SCD0U0RH0aIvzgkwbvkvFAaRjs7gBnaVkMQRo2ETgm
         900WB7MOT5KB0fAJkE5ssg8j8ukgAOIkjn7Ehpoyof0ZCpJkNs0GDQpXCNHANjjaZdlC
         g9Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768396817; x=1769001617;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sWiGwjTB0ZEpbDkwRFO+MVJzM9uZpDrSFPQIlzRZfsU=;
        b=V2gG01k2SiRSTt/EkCpjb/foEfA+qWqbt8vIxkDj2ro53TZ7OzSRzQcMDI+AJt0VSY
         9Kw8en5Bni+mL3X0m06PMTu+q+DlkjqrqL7uvBm+6JkveSbumbLPwg0r1y8DCvN5IVBp
         KJpYm8iW35rdnesxVNb/8Tra+AqXzC4Lm50hPv7R3MF5q6pjrKx0/1szh6JXrYZZQyiK
         3Pl5/44neZeZtp0MdbpfOB4fQiDy3Tbf6fDoB5vnVQ2gcrU42yu2C6QOT0k745VtL/AO
         EylPUvIK5+5qGAj4RbjhZgzsDryDbOikWPTwhuHmyMGCKV/gy0jIhd9qjBFLyIragpUq
         clHA==
X-Forwarded-Encrypted: i=1; AJvYcCUb7vNRdp1meaMVWMFqFesEkWqi1SEHP0oKyUeIEFW1XCrcrcTwGxzLAzJLOp9OaQ7Ya2NiYPNc1dtR@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YzCcJ/6TKID/xp8HZrNxoiHnZGtUUignxxYiHQWdCJEghmpLu4/
	QAG6zfb7L4Uep3WUoq4Xm5zk6KT0bJx4p933JyTDe83oPW9voQcRrzvUmt4bmq0xGXI=
X-Gm-Gg: AY/fxX5ZGSJf7LiSxqTNqj0bJLu4c7RmdzKbOTME32lEuqggaU8x+yOrKDybRhLvw0N
	ZQtVV1ejbYgBfKlQkqAei/18ikSwcXPlL/eOL9FEsnoCwBj7uUdbCvkPNNYNkF2OhbAHnC03tTq
	ugL+WX6TjZrcBnbiTe6csLv3oJq0QBlaIZjx1NcvjHeX77RDmJiBbssD6gy2lns7NE1VaC++AZp
	dWXOM38StroNG1JjYI7pmu2XQjf2MdpAka4lcfPJq1VSQ9NxdaCX3q0LkbC2U9v6vvR6PZsBrTd
	e7a97adw9imPw5MvZ1GbanEihMypU6wNCIAtrEaEfuu3HduqRazlUe38HMjuqWIzbmtceUJ9+iU
	T9i1mRW/PiBcFALqBlYNe352NlcJrOOoPvvDs2plo14IW9J2nMKsWjjYyHAhKPDZSHDEDs+N2YM
	rwbxeXm67KeYqzbg==
X-Received: by 2002:a05:6000:2511:b0:431:9b2:61c0 with SMTP id ffacd0b85a97d-4342d5b2ab9mr2581603f8f.24.1768396817421;
        Wed, 14 Jan 2026 05:20:17 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd0dacd1sm49153435f8f.4.2026.01.14.05.20.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 05:20:16 -0800 (PST)
Date: Wed, 14 Jan 2026 14:20:14 +0100
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
Subject: Re: [PATCH 05/19] printk: Add more context to suspend/resume
 functions
Message-ID: <aWeYDoMsdBNkJEqO@pathway.suse.cz>
References: <20251227-printk-cleanup-part3-v1-0-21a291bcf197@suse.com>
 <20251227-printk-cleanup-part3-v1-5-21a291bcf197@suse.com>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251227-printk-cleanup-part3-v1-5-21a291bcf197@suse.com>

On Sat 2025-12-27 09:16:12, Marcos Paulo de Souza wrote:
> The new comments clarifies from where the functions are supposed to be
> called.
> 
> Signed-off-by: Marcos Paulo de Souza <mpdesouza@suse.com>

The improved comments would have helped to understand the previous patch.
I would either merge it into the previous patch or switch the
ordering.

If this stays as a separate patch, feel free to use:

Reviewed-by: Petr Mladek <pmladek@suse.com>

Best Regards,
Petr
